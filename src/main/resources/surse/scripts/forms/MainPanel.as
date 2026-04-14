package forms
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.servers.ServersDropDownList;
   import controls.PlayerInfo;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.events.MainButtonBarEvents;
   import forms.ranks.BigRankIcon;
   import forms.ranks.RankIcon;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.reconnect.ReconnectService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.UserPropertiesServiceEvent;
   
   public class MainPanel extends Sprite
   {
      
      [Inject]
      public static var reconnectService:ReconnectService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var premiumService:PremiumService;
      
      [Inject]
      public static var display:IDisplay;
      
      public var playerInfo:PlayerInfo = new PlayerInfo();
      
      public var buttonBar:ButtonBar = new ButtonBar();
      
      private var _rang:int;
      
      public var rankIcon:RankIcon = new BigRankIcon();
      
      public var serversDropDownList:ServersDropDownList = new ServersDropDownList();
      
      public function MainPanel()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.configUI);
         userPropertiesService.addEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
         premiumService.addEventListener(Event.CHANGE,this.onPremiumChanged);
      }
      
      public function set rang(_arg_1:int) : void
      {
         this.playerInfo.rang = _arg_1;
         this.rankIcon.init(premiumService.hasPremium(),_arg_1);
         this.alignRankIcon();
      }
      
      public function get rang() : int
      {
         return this._rang;
      }
      
      private function configUI(_arg_1:Event) : void
      {
         this.y = 3;
         addChild(this.rankIcon);
         addChild(this.playerInfo);
         addChild(this.buttonBar);
         if(reconnectService.isEnabled())
         {
            addChild(this.serversDropDownList);
         }
         this.serversDropDownList.y = -2;
         removeEventListener(Event.ADDED_TO_STAGE,this.configUI);
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      private function listClick(_arg_1:MouseEvent) : void
      {
         this.buttonBar.dispatchEvent(new MainButtonBarEvents(1));
      }
      
      private function onResize(_arg_1:Event = null) : void
      {
         this.resize();
      }
      
      public function resize() : void
      {
         var minWidth:int = int(Math.max(970,stage.stageWidth));
         this.playerInfo.x = 15;
         this.playerInfo.width = minWidth - this.buttonBar.width + 13 - this.playerInfo.x - 6;
         this.buttonBar.x = minWidth - this.buttonBar.width;
         this.serversDropDownList.x = this.buttonBar.x + this.buttonBar.garageButton.x + this.buttonBar.garageButton.width;
         this.buttonBar.draw();
      }
      
      private function onUpdateRank(_arg_1:UserPropertiesServiceEvent) : void
      {
         if(this.buttonBar.isDailyQuestButtonVisible())
         {
            this.buttonBar.draw();
            this.onResize();
            userPropertiesService.removeEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
         }
      }
      
      public function set hasDoubleCrystal(_arg_1:Boolean) : void
      {
      }
      
      public function hide() : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onPremiumChanged(_arg_1:Event) : void
      {
         var minWidth:int = 0;
         minWidth = int(Math.max(970,stage.stageWidth));
         this.playerInfo.x = 15;
         this.playerInfo.width = minWidth - this.buttonBar.width + 13 - this.playerInfo.x - 6;
         this.buttonBar.x = minWidth - this.buttonBar.width;
         this.rankIcon.init(premiumService.hasPremium(),userPropertiesService.rank);
         this.alignRankIcon();
      }
      
      private function alignRankIcon() : void
      {
         this.rankIcon.y = 29 - (this.rankIcon.height >> 1);
         this.rankIcon.x = 38 - (this.rankIcon.width >> 1);
      }
   }
}

