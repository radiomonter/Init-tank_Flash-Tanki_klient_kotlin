package alternativa.tanks.model
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.LobbyChat;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.utils.Antiflood;
   import alternativa.tanks.utils.LinksInterceptor;
   import flash.display.DisplayObjectContainer;
   import flash.events.TextEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import forms.events.ChatFormEvent;
   import projects.tanks.client.chat.models.chat.chat.ChatModelBase;
   import projects.tanks.client.chat.models.chat.chat.IChatModelBase;
   import projects.tanks.client.chat.models.news.showing.NewsItemData;
   import projects.tanks.client.chat.types.ChatMessage;
   import projects.tanks.client.chat.types.UserStatus;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.IBattleLinkActivatorService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class ChatModel extends ChatModelBase implements IChatModelBase
   {
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var userPropertyService:IUserPropertiesService;
      
      [Inject]
      public static var battleLinkActivatorService:IBattleLinkActivatorService;
      
      [Inject]
      public static var clientLog:IClientLog;
      
      private static const LOG_CHANNEL_NAME:String = "chat";
      
      private var layer:DisplayObjectContainer;
      
      public var chatPanel:LobbyChat;
      
      private var selfName:String;
      
      private var showLinks:Boolean;
      
      private var linksInterceptor:LinksInterceptor;
      
      private var htmlFlag:Boolean = false;
      
      private var sharpLinks:Array;
      
      private var isAdmin:Boolean;
      
      private var antiFloodEnabled:Boolean;
      
      private var tracker:ChatSettingsTracker;
      
      private var chatModeratorLevel:ChatModeratorLevel;
      
      public function ChatModel()
      {
         super();
         this.layer = display.contentUILayer;
      }
      
      public function objectLoaded() : void
      {
         this.selfName = getInitParam().selfName;
         this.showLinks = getInitParam().showLinks;
         this.isAdmin = getInitParam().admin;
         this.antiFloodEnabled = getInitParam().antifloodEnabled;
         this.chatModeratorLevel = getInitParam().chatModeratorLevel;
         this.linksInterceptor = new LinksInterceptor(getInitParam().linksWhiteList);
         this.chatPanel = new LobbyChat();
         this.chatPanel.selfName = this.selfName;
         this.chatPanel.typingAntifloodEnabled = getInitParam().typingSpeedAntifloodEnabled;
         if(this.antiFloodEnabled)
         {
            Antiflood.init(getInitParam().linksWhiteList,getInitParam().minChar,getInitParam().minWord,getInitParam().bufferSize);
         }
         this.tracker = new ChatSettingsTracker(this.chatPanel);
         this.showPanel();
         trackerService.trackEvent(LOG_CHANNEL_NAME,"ChatStart","");
         this.prepareSharpLink();
         this.updateTypingSpeedAntifloodParams(getInitParam().symbolCost,getInitParam().enterCost);
      }
      
      public function objectUnloaded() : void
      {
         this.chatPanel.hide();
         this.hidePanel();
      }
      
      private function onSendChatMessage(_arg_1:ChatFormEvent) : void
      {
         var _local_2:UserStatus = null;
         var _local_3:String = this.chatPanel.inputText.replace(/\s{2,}/g," ");
         if(!this.antiFloodEnabled || this.isAdmin || Antiflood.isNotFlood(_local_3))
         {
            server.sendMessage(_arg_1.nameTo,_local_3);
            if(this.antiFloodEnabled)
            {
               Antiflood.getMessageKeys(_local_3,true);
            }
            this.chatPanel.lastMessageTime = new Date().getTime();
         }
         else
         {
            _local_2 = new UserStatus(this.chatModeratorLevel,"",userPropertyService.rank,this.selfName,userPropertyService.userId);
            this.chatPanel.addMessage(_local_2,null,_local_3);
            clientLog.log(LOG_CHANNEL_NAME,"onSendChatMessage : antiFlood : %1",_local_3);
         }
      }
      
      public function initNews(news:Vector.<NewsItemData>) : void
      {
         this.chatPanel.initNews(news);
      }
      
      public function showMessages(_arg_1:Vector.<ChatMessage>) : void
      {
         var _local_2:Boolean = false;
         var _local_3:String = null;
         var _local_4:ChatMessage = null;
         var _local_5:RegExp = null;
         var _local_6:RegExp = null;
         var _local_7:int = 0;
         var _local_8:int = 0;
         if(this.chatPanel != null)
         {
            _local_2 = false;
            _local_3 = null;
            _local_4 = null;
            _local_5 = /(<)(.*?)(>)/gi;
            _local_6 = /#battle\|(.*?)\|([0-9a-f]{16})/gi;
            _local_7 = 0;
            this.htmlFlag = false;
            _local_8 = 0;
            while(_local_8 < _arg_1.length)
            {
               _local_4 = _arg_1[_local_8];
               if(_local_4.warning)
               {
                  _local_3 = "<font color=\"#f4e000\">" + _local_4.text + "</font>";
               }
               else
               {
                  _local_3 = _local_4.text;
                  if(this.antiFloodEnabled)
                  {
                     Antiflood.getMessageKeys(_local_3,true);
                  }
                  clientLog.log(LOG_CHANNEL_NAME,"showMessages : %1",_local_4.text);
               }
               _local_2 = _local_4.system;
               this.htmlFlag = false;
               _local_7 = _local_3.search(_local_5);
               if(_local_7 > -1)
               {
                  if(!_local_2)
                  {
                     _local_3 = _local_3.replace(_local_5,"&lt;$2&gt;");
                  }
                  this.htmlFlag = true;
               }
               _local_3 += " ";
               if(this.showLinks && !_local_2)
               {
                  _local_3 = this.linksInterceptor.checkLinks(_local_3);
                  this.htmlFlag = this.linksInterceptor.htmlFlag;
               }
               _local_7 = _local_3.search(_local_6);
               if(_local_7 > -1)
               {
                  _local_3 = _local_3.replace(_local_6,"<u><a href=\'event:$2\'>$1</a></u>");
                  this.htmlFlag = true;
               }
               _local_3 = this.replaceSharpLinks(_local_3);
               this.chatPanel.addMessage(_local_4.sourceUserStatus,_local_4.targetUserStatus,_local_3,_local_2,this.htmlFlag);
               _local_8++;
            }
            if(_local_8 > 25)
            {
               this.chatPanel.output.scrollDown();
            }
         }
      }
      
      private function showPanel() : void
      {
         if(!this.layer.contains(this.chatPanel))
         {
            this.layer.addChild(this.chatPanel);
            this.chatPanel.addEventListener(ChatFormEvent.SEND_MESSAGE,this.onSendChatMessage);
            this.chatPanel.addEventListener(TextEvent.LINK,this.onTextLink);
         }
      }
      
      private function hidePanel() : void
      {
         if(this.layer.contains(this.chatPanel))
         {
            this.layer.removeChild(this.chatPanel);
            this.chatPanel.removeEventListener(ChatFormEvent.SEND_MESSAGE,this.onSendChatMessage);
            this.chatPanel.removeEventListener(TextEvent.LINK,this.onTextLink);
         }
      }
      
      private function onTextLink(_arg_1:TextEvent) : void
      {
         var _local_2:RegExp = /^([0-9a-f]{16})$/gi;
         var _local_3:String = _arg_1.text;
         if(_local_3.search(_local_2) > -1)
         {
            battleLinkActivatorService.activateLink(_local_3);
         }
         else
         {
            navigateToURL(new URLRequest(_local_3),"_blank");
         }
      }
      
      public function cleanUsersMessages(_arg_1:String) : void
      {
         this.chatPanel.cleanOutUsersMessages(_arg_1);
      }
      
      public function clearAllMessages() : void
      {
         this.chatPanel.clearAll();
      }
      
      private function prepareSharpLink() : void
      {
         var _local_1:int = 0;
         this.sharpLinks = new Array();
         while(_local_1 < this.sharpLinks.length)
         {
            this.sharpLinks[_local_1][0] = new RegExp("#" + this.sharpLinks[_local_1][0],"gi");
            _local_1++;
         }
      }
      
      private function replaceSharpLinks(_arg_1:String) : String
      {
         var _local_2:RegExp = null;
         var _local_3:int = 0;
         var _local_5:int = 0;
         var _local_4:String = _arg_1;
         while(_local_5 < this.sharpLinks.length)
         {
            _local_2 = this.sharpLinks[_local_5][0];
            _local_3 = _local_4.search(_local_2);
            if(_local_3 > -1)
            {
               _local_4 = _local_4.replace(_local_2,"<u><a href=\'" + this.sharpLinks[_local_5][2] + "\' target=\'_blank\'>" + this.sharpLinks[_local_5][1] + "</a></u>");
               this.htmlFlag = true;
            }
            _local_5++;
         }
         return _local_4;
      }
      
      public function updateTypingSpeedAntifloodParams(_arg_1:int, _arg_2:int) : void
      {
         this.chatPanel.updateTypingAntifloodParams(_arg_1,_arg_2);
      }
   }
}

