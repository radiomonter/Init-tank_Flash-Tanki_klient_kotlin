package alternativa.tanks.gui
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.gui.communication.button.CommunicationPanelTabButton;
   import alternativa.tanks.gui.communication.button.TabButtonTypes;
   import alternativa.tanks.gui.communication.button.TabIcons;
   import alternativa.tanks.gui.communication.tabs.news.NewsTab;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.model.ShowChat;
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import fl.controls.LabelButton;
   import fl.controls.ScrollBar;
   import fl.events.ScrollEvent;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.net.SharedObject;
   import flash.text.GridFitType;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import forms.TankWindowWithHeader;
   import forms.events.ChatFormEvent;
   import forms.events.LoginFormEvent;
   import forms.userlabel.UserLabelEvent;
   import projects.tanks.client.chat.models.news.showing.NewsItemData;
   import projects.tanks.client.chat.types.UserStatus;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import services.contextmenu.ContextMenuServiceEvent;
   import services.contextmenu.IContextMenuService;
   import titanomachina.headers.Headers;
   
   public class LobbyChat extends Sprite implements ShowChat
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var contextMenuService:IContextMenuService;
      
      private static var so:SharedObject;
      
      private static const LAST_MESSAGE_SHARED_KEY:String = "lobbyChatLastMessageKey";
      
      private static const ADDITIONAL_SCROLL_AREA_HEIGHT:Number = 7;
      
      private static const GRAY_COLOR:uint = 10987948;
      
      private static const UNAVAILABLE_TIMER_PERIOD:int = 1000;
      
      private var mainBackground:TankWindowWithHeader = new TankWindowWithHeader(Headers.getHeaderById("CHAT"));
      
      private var inner:TankWindowInner = new TankWindowInner(100,100,TankWindowInner.GREEN);
      
      private var inputControl:TankInputBase = new TankInputBase();
      
      private var input:TextField;
      
      private var disabledChatLabel:LabelBase = new LabelBase();
      
      private var addressed:Boolean;
      
      private var isChatEnabled:Boolean = false;
      
      private var isChatAvailable:Boolean = true;
      
      private var _rangTo:int;
      
      private var _nameTo:String;
      
      private var _oldNameTo:String;
      
      private var delayTimer:Timer;
      
      private var CtrlPressed:Boolean = false;
      
      public var output:ChatOutput = new ChatOutput();
      
      public var sendButton:DefaultButtonBase = new DefaultButtonBase();
      
      private var _selfName:String;
      
      private var _lastRespondent:String = "";
      
      private var newsOutput:NewsTab;
      
      private var newsButton:CommunicationPanelTabButton;
      
      private var chatButton:CommunicationPanelTabButton;
      
      public var systemUserStatus:UserStatus = new UserStatus(ChatModeratorLevel.NONE,"",0,"System",null);
      
      public var emptyUserStatus:UserStatus = new UserStatus(ChatModeratorLevel.NONE,"",0,"",null);
      
      private var unavailableTimer:Timer;
      
      private var _lastMessageTime:Number = 0;
      
      private var _symbolCost:int = 176;
      
      private var _messageCost:int = 880;
      
      private var coloredTextFormat:TextFormat;
      
      private var standartTextFormat:TextFormat;
      
      private var _typingAntifloodEnabled:Boolean;
      
      public function LobbyChat()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.configUI);
         addEventListener(Event.ADDED_TO_STAGE,this.addResizeListener);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      public static function get blockList() : Array
      {
         var _local_1:Array = null;
         if(so == null)
         {
            so = storageService.getStorage();
         }
         _local_1 = so.data.blocklist;
         if(_local_1 == null)
         {
            _local_1 = new Array();
         }
         return _local_1;
      }
      
      public static function blockUser(_arg_1:String) : Boolean
      {
         var _local_2:Array = null;
         so = storageService.getStorage();
         _local_2 = so.data.blocklist;
         if(_local_2 == null)
         {
            _local_2 = new Array();
         }
         var _local_3:int = _local_2.indexOf(_arg_1);
         if(_local_3 > -1)
         {
            _local_2.splice(_local_3,1);
         }
         _local_2.push(_arg_1);
         so.data.blocklist = _local_2;
         so.flush();
         return true;
      }
      
      public static function unblockUser(_arg_1:String) : Boolean
      {
         var _local_2:Array = null;
         so = storageService.getStorage();
         _local_2 = so.data.blocklist;
         if(_local_2 == null)
         {
            _local_2 = new Array();
         }
         var _local_3:int = _local_2.indexOf(_arg_1);
         if(_local_3 > -1)
         {
            _local_2.splice(_local_3,1);
         }
         so.data.blocklist = _local_2;
         so.flush();
         return true;
      }
      
      public static function unblockall() : Boolean
      {
         so = storageService.getStorage();
         so.data.blocklist = new Array();
         so.flush();
         return true;
      }
      
      public static function blocked(_arg_1:String) : Boolean
      {
         var _local_2:Array = null;
         var _local_3:int = 0;
         so = storageService.getStorage();
         _local_2 = so.data.blocklist;
         if(_local_2 == null)
         {
            _local_2 = new Array();
            so.data.blocklist = _local_2;
            so.flush();
         }
         _local_3 = _local_2.indexOf(_arg_1);
         return _local_3 > -1;
      }
      
      public function set selfName(_arg_1:String) : void
      {
         this._selfName = _arg_1;
         this.output.selfName = this._selfName;
      }
      
      public function get inputText() : String
      {
         return this.input.text;
      }
      
      private function addResizeListener(_arg_1:Event) : void
      {
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      private function onRemoveFromStage(_arg_1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      public function configUI(_arg_1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.configUI);
         this.input = this.inputControl.textField;
         this.input.maxChars = 299;
         addChild(this.mainBackground);
         addChild(this.inner);
         this.inner.y = 45;
         this.inner.x = 11;
         this.inner.showBlink = true;
         this.input.addEventListener(KeyboardEvent.KEY_DOWN,this.sendMessageKey);
         this.input.addEventListener(KeyboardEvent.KEY_UP,this.clearCtrlPressed);
         this.input.addEventListener(MouseEvent.CLICK,this.onInputClick);
         this.sendButton.addEventListener(MouseEvent.CLICK,this.sendMessage);
         addChild(this.inputControl);
         addChild(this.disabledChatLabel);
         this.disabledChatLabel.mouseEnabled = false;
         this.disabledChatLabel.color = GRAY_COLOR;
         this.disabledChatLabel.text = localeService.getText(TextConst.STRING_DISABLED_CHAT_LABEL_TEXT);
         addChild(this.output);
         this.output.move(15,this.inner.y + 4);
         this.confScroll();
         this.output.addEventListener(UserLabelEvent.CLICK_WITH_CTRL,this.onClickWithCtrlUserLabel);
         this.output.addEventListener(ScrollEvent.SCROLL,this.onScroll);
         this.output.verticalScrollBar.addEventListener(Event.ENTER_FRAME,this.updateScrollOnEnterFrame);
         this.inputControl.addEventListener(LoginFormEvent.TEXT_CHANGED,this.checkName);
         contextMenuService.addEventListener(ContextMenuServiceEvent.WRITE_IN_CHAT,this.onClickWriteInChatContextMenu);
         this.sendButton.x = 272;
         this.sendButton.width = 80;
         this.sendButton.label = localeService.getText(TextConst.CHAT_PANEL_BUTTON_SEND);
         addChild(this.sendButton);
         this.newsButton = new CommunicationPanelTabButton(TabButtonTypes.NEWS_TAB,localeService.getText(TextConst.LOBBY_NEWS_BUTTON),TabIcons.newsIconClass);
         this.newsButton.width = 102;
         addChild(this.newsButton);
         this.newsButton.x = this.newsButton.y = 11;
         this.chatButton = new CommunicationPanelTabButton(TabButtonTypes.CHAT_TAB,localeService.getText(TextConst.LOBBY_CHAT_BUTTON),TabIcons.chatIconClass);
         this.chatButton.width = 102;
         addChild(this.chatButton);
         this.chatButton.x = this.newsButton.width + this.newsButton.x + 5;
         this.chatButton.y = 11;
         this.newsButton.addEventListener(MouseEvent.CLICK,this.onNewsButtonClick);
         this.chatButton.addEventListener(MouseEvent.CLICK,this.onChatButtonClick);
         this.unavailableTimer = new Timer(UNAVAILABLE_TIMER_PERIOD);
         this.unavailableTimer.addEventListener(TimerEvent.TIMER,this.onAntifloodTimer);
         this.unavailableTimer.start();
         this.input.gridFitType = GridFitType.SUBPIXEL;
         this.coloredTextFormat = new TextFormat();
         this.coloredTextFormat.color = 16728642;
         this.standartTextFormat = new TextFormat();
         this.standartTextFormat.color = 16777215;
         if(Boolean(storageService.getStorage().data[LAST_MESSAGE_SHARED_KEY]))
         {
            this._lastMessageTime = storageService.getStorage().data[LAST_MESSAGE_SHARED_KEY];
         }
         else
         {
            this._lastMessageTime = 0;
         }
         this.newsOutput = new NewsTab();
         this.newsOutput.x = 11;
         this.newsOutput.y = this.inner.y + 0;
         this.newsOutput.visible = false;
         addChild(this.newsOutput);
         this.onNewsButtonClick(null);
      }
      
      public function initNews(news:Vector.<NewsItemData>) : void
      {
         this.newsOutput.addNewsItems(news);
      }
      
      private function onNewsButtonClick(e:MouseEvent) : void
      {
         this.newsButton.enabled = false;
         this.chatButton.enabled = true;
         this.output.visible = false;
         this.sendButton.visible = false;
         this.inputControl.visible = false;
         this.newsOutput.visible = true;
         this.onResize(null);
      }
      
      private function onChatButtonClick(e:MouseEvent) : void
      {
         this.sendButton.visible = true;
         this.newsButton.enabled = true;
         this.chatButton.enabled = false;
         this.inputControl.visible = true;
         this.output.visible = true;
         this.newsOutput.visible = false;
         this.onResize(null);
      }
      
      private function onClickWithCtrlUserLabel(_arg_1:UserLabelEvent) : void
      {
         this.addUidInOutput(_arg_1.uid);
      }
      
      private function onClickWriteInChatContextMenu(_arg_1:ContextMenuServiceEvent) : void
      {
         this.addUidInOutput(_arg_1.uid);
      }
      
      private function onAntifloodTimer(_arg_1:TimerEvent) : void
      {
         this.updateTypingAntiflood();
      }
      
      private function updateScrollOnEnterFrame(_arg_1:Event) : void
      {
         var _local_2:Sprite = null;
         var _local_3:Sprite = null;
         var _local_5:int = 0;
         var _local_4:ScrollBar = this.output.verticalScrollBar;
         while(_local_5 < _local_4.numChildren)
         {
            _local_2 = Sprite(_local_4.getChildAt(_local_5));
            if(_local_2.hitArea != null)
            {
               _local_3 = _local_2.hitArea;
               _local_3.graphics.clear();
            }
            else
            {
               _local_3 = new Sprite();
               _local_3.mouseEnabled = false;
               _local_2.hitArea = _local_3;
               this.output.addChild(_local_3);
            }
            _local_3.graphics.beginFill(0,0);
            if(_local_2 is LabelButton)
            {
               _local_3.graphics.drawRect(_local_4.x - ADDITIONAL_SCROLL_AREA_HEIGHT,_local_2.y - 14,_local_2.width + ADDITIONAL_SCROLL_AREA_HEIGHT,_local_2.height + 28);
            }
            else
            {
               _local_3.graphics.drawRect(_local_4.x - ADDITIONAL_SCROLL_AREA_HEIGHT,_local_2.y,_local_2.width + ADDITIONAL_SCROLL_AREA_HEIGHT,_local_2.height);
            }
            _local_3.graphics.endFill();
            _local_5++;
         }
      }
      
      private function onInputClick(_arg_1:MouseEvent) : void
      {
         if(stage.focus == null)
         {
            stage.focus = this.input;
         }
      }
      
      private function clearCtrlPressed(_arg_1:KeyboardEvent) : void
      {
         this.CtrlPressed = false;
      }
      
      private function onScroll(_arg_1:ScrollEvent) : void
      {
         this.output.deltaWidth = 18;
         this.output.setSize(this.inner.width + 1,this.inner.height - 8);
         this.output.removeEventListener(ScrollEvent.SCROLL,this.onScroll);
         this.output.firstFill = false;
      }
      
      private function checkName(_arg_1:Event) : void
      {
         var _local_2:RegExp = /^[a-z0-9](([\.\-\w](?!(-|_|\.){2,}))*[a-z0-9])\: /i;
         var _local_3:int = this.input.text.search(_local_2);
         var _local_4:String = this.input.text.slice(0,this.input.text.indexOf(": "));
         if(_local_3 == 0)
         {
            if(_local_4.toLocaleLowerCase() == "re" && this._lastRespondent != "")
            {
               _local_4 = this._lastRespondent;
               this.input.text = _local_4 + ": ";
               this.input.setSelection(this.input.length,this.input.length);
            }
            else if(_local_4.toLocaleLowerCase() == "re" && this._lastRespondent == "")
            {
               this.input.text = "";
            }
            if(!this.addressed || _local_4 != this._oldNameTo)
            {
               this._oldNameTo = this._nameTo = _local_4;
               this.addressed = true;
               this.output.selectUser(this._nameTo);
            }
         }
         else if(this.addressed)
         {
            this.addressed = false;
            this.output.selectUser("");
         }
         this.updateTypingAntiflood();
      }
      
      private function confScroll() : void
      {
         this.output.setStyle("downArrowUpSkin",ScrollArrowDownGreen);
         this.output.setStyle("downArrowDownSkin",ScrollArrowDownGreen);
         this.output.setStyle("downArrowOverSkin",ScrollArrowDownGreen);
         this.output.setStyle("downArrowDisabledSkin",ScrollArrowDownGreen);
         this.output.setStyle("upArrowUpSkin",ScrollArrowUpGreen);
         this.output.setStyle("upArrowDownSkin",ScrollArrowUpGreen);
         this.output.setStyle("upArrowOverSkin",ScrollArrowUpGreen);
         this.output.setStyle("upArrowDisabledSkin",ScrollArrowUpGreen);
         this.output.setStyle("trackUpSkin",ScrollTrackGreen);
         this.output.setStyle("trackDownSkin",ScrollTrackGreen);
         this.output.setStyle("trackOverSkin",ScrollTrackGreen);
         this.output.setStyle("trackDisabledSkin",ScrollTrackGreen);
         this.output.setStyle("thumbUpSkin",ScrollThumbSkinGreen);
         this.output.setStyle("thumbDownSkin",ScrollThumbSkinGreen);
         this.output.setStyle("thumbOverSkin",ScrollThumbSkinGreen);
         this.output.setStyle("thumbDisabledSkin",ScrollThumbSkinGreen);
      }
      
      private function addUidInOutput(_arg_1:String) : void
      {
         this.output.selectUser(_arg_1);
         var _local_2:String = this.input.text;
         if(_local_2.indexOf(": ") > 0)
         {
            _local_2 = _arg_1 + ": " + _local_2.slice(_local_2.indexOf(": ") + 2,_local_2.length);
         }
         else
         {
            _local_2 = _arg_1 + ": " + _local_2.slice(_local_2.indexOf(": ") + 1,_local_2.length);
         }
         this.input.text = _local_2;
         stage.focus = this.input;
         this.input.setSelection(this.input.length,this.input.length);
         this.addressed = true;
         this._nameTo = _arg_1;
         if(this.CtrlPressed)
         {
            _local_2 = "/ban " + _arg_1 + " ";
            this.input.text = _local_2;
            stage.focus = this.input;
            this.input.setSelection(this.input.length,this.input.length);
            this.addressed = true;
            this._nameTo = _arg_1;
         }
         this.updateTypingAntiflood();
      }
      
      private function sendMessageKey(_arg_1:KeyboardEvent) : void
      {
         if(_arg_1.keyCode == Keyboard.ENTER)
         {
            this.send();
         }
         this.CtrlPressed = _arg_1.ctrlKey && _arg_1.shiftKey;
      }
      
      private function sendMessage(_arg_1:MouseEvent) : void
      {
         this.send();
      }
      
      private function send() : void
      {
         var _local_1:String = null;
         var _local_2:String = null;
         var _local_3:String = null;
         var _local_4:Array = null;
         var _local_5:int = 0;
         if(!this.isChatAvailable)
         {
            return;
         }
         var _local_6:String = this.input.text;
         var _local_7:String = _local_6;
         var _local_8:RegExp = /(^(\/block|\/unblock) ([a-z0-9](([\.\-\w](?!(-|_|\.){2,}))*[a-z0-9])))$/i;
         var _local_9:RegExp = /^(\/unblockall|\/blocklist)$/;
         var _local_10:RegExp = /^(\/showip|\/hideip)$/;
         var _local_11:int = _local_7.search(_local_8);
         var _local_12:int = _local_7.search(_local_9);
         var _local_13:int = _local_7.search(_local_10);
         if(_local_11 > -1)
         {
            _local_1 = _local_7.replace(_local_8,"$2");
            _local_2 = _local_7.replace(_local_8,"$3");
            if(_local_1 == "/block")
            {
               LobbyChat.blockUser(_local_2);
               _local_3 = localeService.getText(TextConst.CHAT_PANEL_COMMAND_BLOCK,_local_2);
            }
            else
            {
               LobbyChat.unblockUser(_local_2);
               _local_3 = localeService.getText(TextConst.CHAT_PANEL_COMMAND_UNBLOCK,_local_2);
            }
            this.addMessage(this.systemUserStatus,this.emptyUserStatus,_local_3,true);
            this.input.text = _local_1 + " ";
            return;
         }
         if(_local_12 > -1)
         {
            _local_1 = _local_7.replace(_local_8,"$1");
            if(_local_1 == "/unblockall")
            {
               LobbyChat.unblockall();
               _local_3 = localeService.getText(TextConst.CHAT_PANEL_COMMAND_UNBLOCK_ALL);
               this.addMessage(this.systemUserStatus,this.emptyUserStatus,_local_3);
            }
            else
            {
               _local_4 = LobbyChat.blockList;
               if(_local_4.length > 0)
               {
                  _local_3 = localeService.getText(TextConst.CHAT_PANEL_COMMAND_BLOCK_LIST);
                  _local_6 = "\n" + _local_3 + "\n—————————————\n";
                  while(_local_5 < _local_4.length)
                  {
                     _local_6 += String(_local_5 + 1) + ": " + _local_4[_local_5] + "\n";
                     _local_5++;
                  }
               }
               else
               {
                  _local_6 = "...";
               }
               this.addMessage(this.systemUserStatus,this.emptyUserStatus,_local_6);
            }
            this.input.text = "";
            return;
         }
         if(_local_13 > -1)
         {
            _local_1 = _local_7.replace(_local_10,"$1");
            if(_local_1 == "/showip")
            {
               this.output.showIPMode = true;
               this.addMessage(this.systemUserStatus,this.emptyUserStatus,"show IP",true);
            }
            else
            {
               this.output.showIPMode = false;
               this.addMessage(this.systemUserStatus,this.emptyUserStatus,"hide IP",true);
            }
            return;
         }
         if(_local_6 != "")
         {
            if(this.addressed)
            {
               _local_6 = _local_6.slice(_local_6.indexOf(": ") + 2,_local_6.length);
               this.input.text = _local_6;
               dispatchEvent(new ChatFormEvent(this._rangTo,this._nameTo));
               this.input.text = this._nameTo + ": ";
            }
            else
            {
               dispatchEvent(new ChatFormEvent());
               this.input.text = "";
            }
            this.input.setSelection(0,0);
            this.input.setSelection(this.input.length,this.input.length);
            this.output.scrollDown();
         }
      }
      
      private function onResize(_arg_1:Event) : void
      {
         var _local_2:int = int(Math.max(970,stage.stageWidth));
         this.mainBackground.width = _local_2 / 3;
         this.mainBackground.height = Math.max(stage.stageHeight - 60,530);
         x = 0;
         y = 60;
         this.inner.width = this.mainBackground.width - 22;
         this.inner.height = this.mainBackground.height - 90;
         this.sendButton.y = this.mainBackground.height - 42;
         this.sendButton.x = this.mainBackground.width - this.sendButton.width - 11;
         this.inputControl.x = 11;
         this.inputControl.y = this.mainBackground.height - 42;
         this.inputControl.width = this.sendButton.x - 16;
         this.disabledChatLabel.x = this.inputControl.x + 3;
         this.disabledChatLabel.y = this.inputControl.y + 7;
         this.output.setSize(this.inner.width + 1,this.inner.height - 8);
         this.newsOutput.resize(this.inner.width,this.inner.height + 33);
         if(this.delayTimer == null)
         {
            this.delayTimer = new Timer(200,1);
            this.delayTimer.addEventListener(TimerEvent.TIMER,this.correctResize);
         }
         this.delayTimer.reset();
         this.delayTimer.start();
      }
      
      private function correctResize(_arg_1:TimerEvent = null) : void
      {
         this.output.setSize(this.inner.width + 1,this.inner.height - 8);
         this.newsOutput.resize(this.inner.width,this.inner.height + 33);
         this.delayTimer.removeEventListener(TimerEvent.TIMER,this.correctResize);
         this.delayTimer = null;
      }
      
      public function addMessage(_arg_1:UserStatus, _arg_2:UserStatus, _arg_3:String, _arg_4:Boolean = false, _arg_5:Boolean = false) : void
      {
         if(_arg_1 == null)
         {
            _arg_1 = this.emptyUserStatus;
         }
         if(_arg_2 == null)
         {
            _arg_2 = this.emptyUserStatus;
         }
         if(!blocked(_arg_1.uid))
         {
            this.output.addLine(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
            if(this.addressed)
            {
               this.output.selectUser(this._nameTo,true);
            }
            if(_arg_2.uid == this._selfName)
            {
               this._lastRespondent = _arg_1.uid;
            }
         }
      }
      
      public function hide() : void
      {
         if(this.delayTimer != null)
         {
            this.delayTimer.stop();
            this.delayTimer.removeEventListener(TimerEvent.TIMER,this.correctResize);
         }
         if(this.input != null)
         {
            this.input.removeEventListener(KeyboardEvent.KEY_DOWN,this.sendMessageKey);
            this.input.removeEventListener(KeyboardEvent.KEY_UP,this.clearCtrlPressed);
            this.input.removeEventListener(MouseEvent.CLICK,this.onInputClick);
         }
         if(this.sendButton != null)
         {
            this.sendButton.removeEventListener(MouseEvent.CLICK,this.sendMessage);
         }
         if(this.output != null)
         {
            this.output.verticalScrollBar.removeEventListener(Event.ENTER_FRAME,this.updateScrollOnEnterFrame);
            this.output.removeEventListener(ScrollEvent.SCROLL,this.onScroll);
            this.output.removeEventListener(UserLabelEvent.CLICK_WITH_CTRL,this.onClickWithCtrlUserLabel);
         }
         if(this.inputControl != null)
         {
            this.inputControl.removeEventListener(LoginFormEvent.TEXT_CHANGED,this.checkName);
         }
         contextMenuService.removeEventListener(ContextMenuServiceEvent.WRITE_IN_CHAT,this.onClickWriteInChatContextMenu);
      }
      
      public function cleanOutUsersMessages(_arg_1:String) : void
      {
         this.output.cleanOutUsersMessages(_arg_1);
      }
      
      public function clearAll() : void
      {
         this.output.clear();
      }
      
      public function setShowChat(_arg_1:Boolean) : void
      {
         this.output.visible = _arg_1;
         if(!_arg_1)
         {
            this.inputControl.value = "";
         }
         this.isChatEnabled = _arg_1;
         this.updateSendButtonLabel();
         this.updateDisabledChatLabel();
      }
      
      private function updateSendButtonLabel() : void
      {
         if(this.isChatEnabled && !this.isChatAvailable)
         {
            this.sendButton.enable = false;
         }
         else
         {
            this.sendButton.label = localeService.getText(TextConst.CHAT_PANEL_BUTTON_SEND);
            this.sendButton.enable = this.isChatEnabled;
         }
      }
      
      private function updateDisabledChatLabel() : void
      {
         if(this.isChatEnabled && !this.isChatAvailable)
         {
            this.disabledChatLabel.text = localeService.getText(TextConst.STRING_TYPING_SPEED_BANNED);
            this.disabledChatLabel.visible = true;
            this.inputControl.enable = false;
         }
         else
         {
            this.disabledChatLabel.text = localeService.getText(TextConst.STRING_DISABLED_CHAT_LABEL_TEXT);
            this.inputControl.enable = this.isChatEnabled;
            this.disabledChatLabel.visible = !this.isChatEnabled;
         }
      }
      
      private function updateTypingAntiflood() : void
      {
         var _local_2:int = 0;
         var _local_1:Number = NaN;
         if(!this._typingAntifloodEnabled)
         {
            return;
         }
         var _local_3:String = this.input.text;
         var _local_4:int = _local_3.length * this._symbolCost + this._messageCost;
         var _local_5:Number = new Date().getTime();
         var _local_6:Number = this._lastMessageTime + _local_4;
         if(!this.isCommand(_local_3) && _local_5 < _local_6)
         {
            _local_1 = _local_6 - _local_5;
            this.sendButton.label = this.getUnbanTime(_local_1);
            this.sendButton.enable = false;
            _local_2 = int(_local_1 / this._symbolCost);
            if(_local_2 >= _local_3.length)
            {
               this.input.setTextFormat(this.coloredTextFormat);
            }
            else if(_local_2 != 0)
            {
               this.input.setTextFormat(this.standartTextFormat);
               this.input.setTextFormat(this.coloredTextFormat,_local_3.length - _local_2,_local_3.length);
            }
            this.isChatAvailable = false;
         }
         else
         {
            this.input.setTextFormat(this.standartTextFormat);
            this.isChatAvailable = true;
         }
         this.updateSendButtonLabel();
      }
      
      private function getUnbanTime(_arg_1:Number) : String
      {
         var _local_2:Number = int(_arg_1 / 1000);
         var _local_3:Number = int(_local_2 / 60);
         var _local_4:Number = _local_2 % 60;
         var _local_5:String = _local_4.toString();
         if(_local_5.length < 2)
         {
            _local_5 = "0" + _local_5;
         }
         return _local_3.toString() + ":" + _local_5;
      }
      
      private function isCommand(_arg_1:String) : Boolean
      {
         var _local_2:RegExp = /^\s*\//i;
         var _local_3:int = _arg_1.search(_local_2);
         return _local_3 > -1;
      }
      
      public function set lastMessageTime(_arg_1:Number) : void
      {
         this._lastMessageTime = _arg_1;
         storageService.getStorage().data[LAST_MESSAGE_SHARED_KEY] = _arg_1;
         this.updateTypingAntiflood();
      }
      
      public function updateTypingAntifloodParams(_arg_1:int, _arg_2:int) : void
      {
         this._symbolCost = _arg_1;
         this._messageCost = _arg_2;
         this.updateTypingAntiflood();
      }
      
      public function set typingAntifloodEnabled(_arg_1:Boolean) : *
      {
         this._typingAntifloodEnabled = _arg_1;
      }
   }
}

