package forms
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.panel.buttons.ClanButton;
   import alternativa.tanks.gui.panel.buttons.DailyQuestsButton;
   import alternativa.tanks.gui.panel.buttons.FriendsButton;
   import alternativa.tanks.gui.panel.buttons.MainPanelFullscreenButton;
   import alternativa.tanks.gui.panel.buttons.ShopBarButton;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.service.clan.ClanPanelNotificationService;
   import controls.base.MainPanelBattlesButtonBase;
   import controls.base.MainPanelGarageButtonBase;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import forms.events.MainButtonBarEvents;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.reconnect.ReconnectService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import services.buttonbar.IButtonBarService;
   
   public class ButtonBar extends Sprite
   {
      
      [Inject]
      public static var reconnectService:ReconnectService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var clientLog:IClientLog;
      
      [Inject]
      public static var buttonBarService:IButtonBarService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var clanPanelNotificationService:ClanPanelNotificationService = ClanPanelNotificationService(OSGi.getInstance().getService(ClanPanelNotificationService));
      
      private static const SECTION_BUTTON_GAP:int = 8;
      
      private static const PREMIUM_BUTTON_TYPE:int = 16;
      
      public var battlesButton:MainPanelBattlesButton = new MainPanelBattlesButtonBase();
      
      public var garageButton:MainPanelGarageButton = new MainPanelGarageButtonBase();
      
      public var clanButton:ClanButton = new ClanButton();
      
      public var friendsButton:FriendsButton = new FriendsButton();
      
      public var referalsButton:MainPanelReferalButton = new MainPanelReferalButton();
      
      public var settingsButton:MainPanelConfigButton = new MainPanelConfigButton();
      
      public var soundButton:MainPanelSoundButton = new MainPanelSoundButton();
      
      public var fullscreenButton:MainPanelFullscreenButton = new MainPanelFullscreenButton();
      
      public var helpButton:MainPanelHelpButton = new MainPanelHelpButton();
      
      public var closeButton:CloseOrBackButton = new CloseOrBackButton();
      
      private var shopButton:ShopBarButton = new ShopBarButton();
      
      private var dailyQuestsButton:DailyQuestsButton = new DailyQuestsButton();
      
      private var _soundOn:Boolean = true;
      
      private var soundIcon:MovieClip;
      
      public function ButtonBar()
      {
         super();
         addChild(this.battlesButton);
         this.battlesButton.type = 4;
         this.battlesButton.label = localeService.getText(TextConst.MAIN_PANEL_BUTTON_BATTLES);
         this.battlesButton.enable = false;
         this.battlesButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.garageButton);
         this.garageButton.type = 5;
         this.garageButton.label = localeService.getText(TextConst.MAIN_PANEL_BUTTON_GARAGE);
         this.garageButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.clanButton);
         this.clanButton.type = 17;
         this.clanButton.label = localeService.getText(TanksLocale.TEXT_CLAN);
         this.clanButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.friendsButton);
         this.dailyQuestsButton.type = 15;
         this.dailyQuestsButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.dailyQuestsButton);
         this.friendsButton.type = 14;
         this.friendsButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.referalsButton);
         this.referalsButton.type = 13;
         this.referalsButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.settingsButton);
         this.settingsButton.type = 7;
         this.settingsButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.fullscreenButton);
         this.fullscreenButton.type = 16;
         this.fullscreenButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.soundButton);
         this.soundButton.type = 8;
         this.soundButton.addEventListener(MouseEvent.CLICK,this.listClick);
         this.soundIcon = this.soundButton.getChildByName("icon") as MovieClip;
         addChild(this.helpButton);
         this.helpButton.type = 9;
         this.helpButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.closeButton);
         this.closeButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.shopButton);
         this.shopButton.type = 1;
         this.shopButton.label = localeService.getText(TanksLocale.TEXT_MAIN_PANEL_BUTTON_SHOP);
         this.shopButton.addEventListener(MouseEvent.CLICK,this.listClick);
         this.draw();
      }
      
      public function draw() : void
      {
         this.dailyQuestsButton.visible = this.isDailyQuestButtonVisible();
         this.battlesButton.x = this.shopButton.x + this.shopButton.width + 8;
         this.garageButton.x = this.battlesButton.x + this.battlesButton.width;
         this.clanButton.x = this.garageButton.x + this.garageButton.width;
         var _local_1:Number = SECTION_BUTTON_GAP;
         if(this.clanButton.visible)
         {
            _local_1 += this.clanButton.x + this.clanButton.width;
         }
         else
         {
            _local_1 += this.garageButton.x + this.garageButton.width;
         }
         this.dailyQuestsButton.x = _local_1;
         this.friendsButton.x = this.dailyQuestsButton.x + (this.dailyQuestsButton.visible ? this.dailyQuestsButton.width : 0);
         this.referalsButton.x = this.friendsButton.x + this.friendsButton.width;
         this.settingsButton.x = this.referalsButton.x + (this.referalsButton.visible ? this.referalsButton.width : 0);
         this.soundButton.x = this.settingsButton.x + this.settingsButton.width;
         this.fullscreenButton.x = this.soundButton.x + this.soundButton.width;
         this.helpButton.x = this.fullscreenButton.x + this.fullscreenButton.width;
         this.closeButton.x = this.helpButton.x + this.helpButton.width + 6;
         this.soundIcon.gotoAndStop(!this.soundOn ? 2 : 1);
      }
      
      public function isDailyQuestButtonVisible() : Boolean
      {
         return userPropertiesService.rank >= 4;
      }
      
      public function hidePaymentButton() : void
      {
         this.shopButton.width = 0;
         this.shopButton.visible = false;
         this.draw();
         MainPanel(parent).resize();
      }
      
      public function hideClanButton() : void
      {
         this.clanButton.visible = false;
         this.draw();
         MainPanel(parent).resize();
      }
      
      public function showClanButton() : void
      {
         this.clanButton.visible = true;
         this.draw();
         MainPanel(parent).resize();
      }
      
      public function set soundOn(_arg_1:Boolean) : void
      {
         this._soundOn = _arg_1;
         this.draw();
      }
      
      public function get soundOn() : Boolean
      {
         return this._soundOn;
      }
      
      private function listClick(_arg_1:MouseEvent) : void
      {
         var _local_2:Object = null;
         var _local_3:Object = null;
         var _local_4:int = 0;
         _local_2 = _arg_1.currentTarget;
         if(Boolean(_local_2.enable))
         {
            dispatchEvent(new MainButtonBarEvents(_local_2.type));
            buttonBarService.change(_local_2.type);
         }
         if(_local_2 == this.soundButton)
         {
            this.soundOn = !this.soundOn;
         }
      }
   }
}

