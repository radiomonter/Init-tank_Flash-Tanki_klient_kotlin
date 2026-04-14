package alternativa.tanks.model.panel
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.startup.StartupSettings;
   import alternativa.tanks.gui.ReferalWindowEvent;
   import alternativa.tanks.gui.SettingsWindow;
   import alternativa.tanks.gui.SettingsWindowEvent;
   import alternativa.tanks.help.ButtonBarHelper;
   import alternativa.tanks.help.FriendsHelper;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.help.MainMenuHelper;
   import alternativa.tanks.help.MoneyHelper;
   import alternativa.tanks.help.RankBarHelper;
   import alternativa.tanks.help.RankHelper;
   import alternativa.tanks.help.RatingIndicatorHelper;
   import alternativa.tanks.help.ScoreHelper;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.model.shop.ShopModel;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.service.fps.FPSService;
   import alternativa.tanks.service.fps.Qyficequ;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.panel.IPanelView;
   import controls.RedButton;
   import controls.base.DefaultButtonBase;
   import controls.buttons.h30px.GreenMediumButton;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.StageDisplayState;
   import flash.events.Event;
   import flash.events.FullScreenEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.net.SharedObject;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.Capabilities;
   import flash.utils.Timer;
   import fominskiy.gui.ConfirmEmailCode;
   import fominskiy.gui.RecoveryWindow;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import forms.MainPanel;
   import forms.ServerRedirectAlert;
   import forms.ServerStopAlert;
   import forms.events.AlertEvent;
   import forms.events.MainButtonBarEvents;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.client.panel.model.IPanelModelBase;
   import projects.tanks.client.panel.model.PanelModelBase;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.BattleInfoServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.AlertUtils;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.KeyUpListenerPriority;
   import services.alertservice.Alert;
   import services.alertservice.AlertAnswer;
   
   public class PanelModel extends PanelModelBase implements IPanelModelBase, IPanel
   {
      
      [Inject]
      public static var panelView:IPanelView;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var helpService:IHelpService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var achievementService:IAchievementService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const HELPER_GROUP_KEY:String = "PanelModel";
      
      public static const KEYCODE_F11:uint = 122;
      
      public static const DISPLAY_STATE_FULL_SCREEN_INTERACTIVE:String = "fullScreenInteractive";
      
      public static const DISPLAY_STATE_NORMAL:String = "normal";
      
      private static const GA_CATEGORY:String = "lobby";
      
      private const HELPER_RANK:int = 1;
      
      private const HELPER_RANK_BAR:int = 2;
      
      private const HELPER_RATING_INDICATOR:int = 3;
      
      private const HELPER_MAIN_MENU:int = 5;
      
      private const HELPER_BUTTON_BAR:int = 6;
      
      private const HELPER_MONEY:int = 7;
      
      private const HELPER_SCORE:int = 10;
      
      private const HELPER_FRIENDS:int = 11;
      
      private var storage:SharedObject;
      
      private var clientObject:ClientObject;
      
      private var panel:MainPanel;
      
      private var giv:String;
      
      private var settingsWindow:SettingsWindow;
      
      private var shopModel:ShopModel = new ShopModel();
      
      private var emailConfirmed:Boolean;
      
      private var stopAlert:ServerStopAlert;
      
      private var email:String;
      
      private var showRedirectAlertTimer:Timer;
      
      private var redirectAlert:ServerRedirectAlert;
      
      private var serverToRedirectTo:String;
      
      private var networker:Network;
      
      public function PanelModel()
      {
         super();
      }
      
      private static function closeButtonPressed() : void
      {
         var _local_1:LayoutState = null;
         if(lobbyLayoutService.inBattle())
         {
            _local_1 = lobbyLayoutService.getCurrentState();
            if(_local_1 == LayoutState.BATTLE_SELECT)
            {
               lobbyLayoutService.showBattleSelect();
            }
            else if(_local_1 == LayoutState.GARAGE)
            {
               lobbyLayoutService.showGarage();
            }
            else if(_local_1 != LayoutState.PAYMENT)
            {
               lobbyLayoutService.exitFromBattle();
            }
         }
         else
         {
            lobbyLayoutService.exitFromGame();
         }
      }
      
      private static function onKeyUp(_arg_1:KeyboardEvent) : void
      {
         if(AlertUtils.isCancelKey(_arg_1.keyCode) && !lobbyLayoutService.isSwitchInProgress())
         {
            _arg_1.stopImmediatePropagation();
            closeButtonPressed();
         }
      }
      
      public static function switchPayment() : void
      {
         lobbyLayoutService.showPayment();
      }
      
      public function objectLoaded() : void
      {
         this.networker = Network(OSGi.getInstance().getService(INetworker));
         panelView = OSGi.getInstance().getService(IPanelView) as IPanelView;
         panelView.qaboqu(true,false,false,false,true);
         this.panel = panelView.getPanel();
         this.showPanel();
         this.addListeners();
         this.updateNavigationLock(null);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.updateNavigationLock);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.updateNavigationLock);
         Qyficequ(OSGi.getInstance().getService(FPSService)).start();
      }
      
      public function clantag(_arg_1:String) : void
      {
         this.panel.playerInfo.clantag(_arg_1);
      }
      
      public function updateScoreRating(_arg_1:int) : void
      {
         this.panel.playerInfo.updateScoreRating(_arg_1);
      }
      
      public function updateGoldsTakenRating(_arg_1:int) : void
      {
         this.panel.playerInfo.updateGoldsTakenRating(_arg_1);
      }
      
      public function updateCrystalsRating(_arg_1:int) : void
      {
         this.panel.playerInfo.updateCrystalsRating(_arg_1);
      }
      
      public function objectLoadedPost() : void
      {
         achievementService.setGarageBuyButtonTargetPoint(new Point(0,0));
         this.dasupa();
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
      }
      
      private function dasupa() : void
      {
         var _local_1:Boolean = Boolean(this.panel.buttonBar.isDailyQuestButtonVisible());
         var _local_2:int = 465 + 13 * 2 + 110 + 60;
         var _local_3:RankBarHelper = new RankBarHelper(0.5,_local_2,60);
         var _local_4:RatingIndicatorHelper = new RatingIndicatorHelper(1,_local_2,75 - (_local_1 ? 180 : 90));
         var _local_5:MainMenuHelper = new MainMenuHelper(1,_local_2,60 + 110 + 13 * 2 + 140 - 160);
         var _local_6:MoneyHelper = new MoneyHelper(1,_local_2,_local_1 ? 100 : 165);
         var _local_7:ScoreHelper = new ScoreHelper();
         var _local_8:RankHelper = new RankHelper();
         var _local_9:FriendsHelper = new FriendsHelper(1,_local_2,60 + 110 + 13 * 2 + 140 + 130);
         var _local_10:Boolean = true;
         var _local_11:Boolean = _local_10;
         var _local_12:Boolean = _local_10;
         var _local_13:ButtonBarHelper = new ButtonBarHelper(1,45,-4,_local_12);
         helpService.registerHelper(HELPER_GROUP_KEY,this.HELPER_RANK,_local_8,true);
         helpService.registerHelper(HELPER_GROUP_KEY,this.HELPER_RANK_BAR,_local_3,true);
         helpService.registerHelper(HELPER_GROUP_KEY,this.HELPER_SCORE,_local_7,true);
         helpService.registerHelper(HELPER_GROUP_KEY,this.HELPER_RATING_INDICATOR,_local_4,true);
         helpService.registerHelper(HELPER_GROUP_KEY,this.HELPER_MAIN_MENU,_local_5,true);
         helpService.registerHelper(HELPER_GROUP_KEY,this.HELPER_BUTTON_BAR,_local_13,true);
         helpService.registerHelper(HELPER_GROUP_KEY,this.HELPER_MONEY,_local_6,true);
         helpService.registerHelper(HELPER_GROUP_KEY,this.HELPER_FRIENDS,_local_9,true);
      }
      
      private function addListeners() : void
      {
         this.panel.buttonBar.addEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
         battleInfoService.addEventListener(BattleInfoServiceEvent.BATTLE_UNLOAD,this.onBattleUnload);
         battleInfoService.addEventListener(BattleInfoServiceEvent.BATTLE_LOAD,this.onBattleLoad);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp,false,KeyUpListenerPriority.PANEL);
         display.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.onFullscreen);
         display.stage.addEventListener(FullScreenEvent.FULL_SCREEN_INTERACTIVE_ACCEPTED,this.onFullscreen);
      }
      
      private function onKey(_arg_1:KeyboardEvent) : void
      {
         var _local_2:Array = null;
         if(_arg_1.keyCode == KEYCODE_F11)
         {
            _local_2 = Capabilities.version.substr(Capabilities.version.indexOf(" ") + 1).split(",");
            if(int(_local_2[0]) == 11 && int(_local_2[1]) >= 3 || int(_local_2[0]) > 11)
            {
               if(display.stage.displayState == DISPLAY_STATE_NORMAL)
               {
                  display.stage.displayState = DISPLAY_STATE_FULL_SCREEN_INTERACTIVE;
               }
               else
               {
                  display.stage.displayState = DISPLAY_STATE_NORMAL;
               }
            }
         }
      }
      
      private function updateNavigationLock(_arg_1:LobbyLayoutServiceEvent) : void
      {
         if(lobbyLayoutService.isSwitchInProgress())
         {
            this.lockMainPanel();
         }
         else
         {
            this.unlockMainPanel();
         }
         var _local_2:LayoutState = lobbyLayoutService.getCurrentState();
         this.setButtonState(_local_2);
      }
      
      private function onBattleLoad(_arg_1:BattleInfoServiceEvent) : void
      {
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitchInBattle);
         this.panel.buttonBar.closeButton.show();
      }
      
      private function onBattleUnload(_arg_1:BattleInfoServiceEvent) : void
      {
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitchInBattle);
         this.panel.buttonBar.closeButton.changeOnCloseButton();
      }
      
      private function onEndLayoutSwitchInBattle(_arg_1:LobbyLayoutServiceEvent) : void
      {
         if(_arg_1.state == LayoutState.BATTLE)
         {
            this.panel.buttonBar.closeButton.changeOnCloseButton();
         }
         else
         {
            this.panel.buttonBar.closeButton.changeOnBackButton();
         }
      }
      
      private function lockMainPanel() : void
      {
         this.panel.mouseEnabled = false;
         this.panel.mouseChildren = false;
      }
      
      private function unlockMainPanel() : void
      {
         this.panel.mouseEnabled = true;
         this.panel.mouseChildren = true;
      }
      
      private function setButtonState(_arg_1:LayoutState, _arg_2:Boolean = true) : void
      {
         switch(_arg_1)
         {
            case LayoutState.BATTLE:
               this.panel.buttonBar.battlesButton.enable = true;
               this.panel.buttonBar.garageButton.enable = true;
               return;
            case LayoutState.BATTLE_SELECT:
               this.panel.buttonBar.battlesButton.enable = false;
               this.panel.buttonBar.garageButton.enable = true;
               return;
            case LayoutState.GARAGE:
               this.panel.buttonBar.garageButton.enable = false;
               this.panel.buttonBar.battlesButton.enable = true;
               return;
            default:
               return;
         }
      }
      
      private function removeDisplayObject(_arg_1:DisplayObject) : void
      {
         if(_arg_1 != null && _arg_1.parent != null)
         {
            _arg_1.parent.removeChild(_arg_1);
         }
      }
      
      public function objectUnloaded() : void
      {
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.updateNavigationLock);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.updateNavigationLock);
         achievementService.hideAllBubbles(false);
         this.hidePanel();
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,onKeyUp);
         var _local_1:IHelpService = OSGi.getInstance().getService(IHelpService) as IHelpService;
         _local_1.hideHelp();
         _local_1.unregisterHelper(HELPER_GROUP_KEY,this.HELPER_RANK);
         _local_1.unregisterHelper(HELPER_GROUP_KEY,this.HELPER_RANK_BAR);
         _local_1.unregisterHelper(HELPER_GROUP_KEY,this.HELPER_RATING_INDICATOR);
         _local_1.unregisterHelper(HELPER_GROUP_KEY,this.HELPER_MAIN_MENU);
         _local_1.unregisterHelper(HELPER_GROUP_KEY,this.HELPER_BUTTON_BAR);
         _local_1.unregisterHelper(HELPER_GROUP_KEY,this.HELPER_SCORE);
         OSGi.getInstance().unregisterService(IMoneyService);
      }
      
      public function serverHalt(_arg_1:ClientObject, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String) : void
      {
         if(_arg_5 != null && _arg_5 != "null")
         {
            this.serverToRedirectTo = _arg_5;
            this.redirectAlert = new ServerRedirectAlert(_arg_4);
            display.dialogsLayer.addChild(this.redirectAlert);
            this.showRedirectAlertTimer = new Timer(_arg_4 * 1000,1);
            this.showRedirectAlertTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.hideRedirectAlert);
            this.showRedirectAlertTimer.start();
            this.alignRedirectAlert();
            display.stage.addEventListener(Event.RESIZE,this.alignRedirectAlert);
         }
         else
         {
            this.stopAlert = new ServerStopAlert(_arg_2);
            display.dialogsLayer.addChild(this.stopAlert);
            this.alignStopAlert();
            display.stage.addEventListener(Event.RESIZE,this.alignStopAlert);
         }
      }
      
      private function hideRedirectAlert(_arg_1:TimerEvent) : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.alignRedirectAlert);
         display.dialogsLayer.removeChild(this.redirectAlert);
         var _local_2:String = (OSGi.getInstance().getService(ILocaleService) as ILocaleService).language;
         if(_local_2 == null)
         {
            _local_2 = "en";
         }
         navigateToURL(new URLRequest("http://tankionline.com/battle-" + _local_2 + this.serverToRedirectTo.toString() + ".html"),"_self");
      }
      
      private function alignRedirectAlert(_arg_1:Event = null) : void
      {
         this.redirectAlert.x = Math.round((display.stage.stageWidth - this.redirectAlert.width) * 0.5);
         this.redirectAlert.y = Math.round((display.stage.stageHeight - this.redirectAlert.height) * 0.5);
      }
      
      private function alignStopAlert(_arg_1:Event = null) : void
      {
         this.stopAlert.x = Math.round((display.stage.stageWidth - this.stopAlert.width) * 0.5);
         this.stopAlert.y = Math.round((display.stage.stageHeight - this.stopAlert.height) * 0.5);
      }
      
      public function showMessage(_arg_1:ClientObject, _arg_2:String) : void
      {
         this._showMessage(_arg_2);
      }
      
      public function _showMessage(_arg_1:String) : void
      {
         var _local_2:Alert = new Alert();
         _local_2.showAlert(_arg_1,Vector.<String>([AlertAnswer.OK]));
      }
      
      private function onChangePassword(_arg_1:SettingsWindowEvent) : void
      {
         if(this.settingsWindow.isPasswordChangeDisabled)
         {
            Network(OSGi.getInstance().getService(INetworker)).send("lobby;generate_key_email");
            display.cursorLayer.addChild(new ConfirmEmailCode(localeService.getText(TextConst.ACCOUNT_RECOVERY_FORM_ENTER_CODE),this.onEnterRecoveryCode));
         }
      }
      
      private function onEnterRecoveryCode(_arg_1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;confirm_email_code_recovery;" + _arg_1);
      }
      
      public function updatePasswordError(_arg_1:ClientObject) : void
      {
         display.dialogsLayer.addChild(new Alert(Alert.ERROR_PASSWORD_CHANGE));
      }
      
      private function showPanel() : void
      {
         display.systemUILayer.addChild(this.panel);
      }
      
      private function hidePanel() : void
      {
         this.panel.hide();
         if(display.systemUILayer.contains(this.panel))
         {
            display.systemUILayer.removeChild(this.panel);
         }
         this.panel.buttonBar.removeEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
      }
      
      private function onButtonBarButtonClick(_arg_1:MainButtonBarEvents) : void
      {
         achievementService.hideAllBubbles(false);
         this.giv = _arg_1.typeButton;
         if(Boolean(lobbyLayoutService.inBattle()) && this.nulokamik(_arg_1.typeButton) && !lobbyLayoutService.isWindowOpenOverBattle())
         {
            this.fipim();
         }
         else
         {
            this.changeState();
         }
      }
      
      private function nulokamik(_arg_1:String) : Boolean
      {
         return [MainButtonBarEvents.BATTLE,MainButtonBarEvents.GARAGE].indexOf(_arg_1) >= 0;
      }
      
      private function fipim() : void
      {
         var _local_1:String = this.wisy();
         var _local_2:Vector.<Sprite> = new Vector.<Sprite>();
         var _local_3:* = new GreenMediumButton();
         _local_3.label = AlertAnswer.YES;
         _local_2.push(_local_3);
         var _local_4:* = new RedButton();
         _local_4.label = AlertAnswer.NO;
         _local_2.push(_local_4);
         var _local_5:* = new DefaultButtonBase();
         _local_5.label = AlertAnswer.CANCEL;
         _local_2.push(_local_5);
         alertService.hiby(_local_1,Vector.<String>([AlertAnswer.YES,AlertAnswer.NO,AlertAnswer.CANCEL]),_local_2);
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onQuitBattleDialogButtonPressed);
      }
      
      private function wisy() : String
      {
         return localeService.getText(TanksLocale.TEXT_ALERT_STAY_IN_BATTLE);
      }
      
      private function onQuitBattleDialogButtonPressed(_arg_1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onQuitBattleDialogButtonPressed);
         switch(_arg_1.typeButton)
         {
            case AlertAnswer.CANCEL:
               this.setButtonState(LayoutState.BATTLE);
               return;
            case AlertAnswer.NO:
               lobbyLayoutService.exitFromBattleToState(this.pepi());
               return;
            case AlertAnswer.YES:
               this.changeState();
         }
      }
      
      private function pepi() : LayoutState
      {
         switch(this.giv)
         {
            case MainButtonBarEvents.GARAGE:
               return LayoutState.GARAGE;
            default:
               return LayoutState.BATTLE_SELECT;
         }
      }
      
      private function changeState() : void
      {
         switch(this.giv)
         {
            case MainButtonBarEvents.BATTLE:
               lobbyLayoutService.showBattleSelect();
               return;
            case MainButtonBarEvents.CLOSE:
               closeButtonPressed();
               return;
            case MainButtonBarEvents.GARAGE:
               lobbyLayoutService.showGarage();
               return;
            case MainButtonBarEvents.HELP:
               this.showHelpers();
               return;
            case MainButtonBarEvents.ADDMONEY:
               switchPayment();
               return;
            case MainButtonBarEvents.FULL_SCREEN:
               this.switchFullScreen();
               return;
            default:
               return;
         }
      }
      
      public function onShowPayment(_arg_1:Object) : void
      {
         this.shopModel.init(_arg_1);
      }
      
      private function showHelpers() : void
      {
         helpService.showHelp();
         panelView.unlock();
      }
      
      private function onFullscreen(_arg_1:FullScreenEvent) : void
      {
         this.panel.buttonBar.fullscreenButton.isActivateFullscreen = !_arg_1.fullScreen;
      }
      
      private function switchFullScreen() : void
      {
         if(display.stage.displayState == StageDisplayState.FULL_SCREEN || display.stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE)
         {
            display.stage.displayState = StageDisplayState.NORMAL;
         }
         else
         {
            display.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
         }
      }
      
      private function showQuitDialog() : void
      {
         var _local_1:Alert = new Alert(Alert.ALERT_QUIT);
         display.dialogsLayer.addChild(_local_1);
         _local_1.addEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.onAlertButtonPressed);
      }
      
      public function showQuitBattleDialog() : void
      {
      }
      
      private function hideHelp(_arg_1:MouseEvent) : void
      {
         display.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.hideHelp);
      }
      
      private function updatePassword(_arg_1:ClientObject, _arg_2:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;change_password;" + _arg_2);
      }
      
      private function updateProfile(_arg_1:ClientObject, _arg_2:String, _arg_3:Boolean) : void
      {
         var _local_4:RegExp = null;
         var _local_5:Object = null;
         if(_arg_2 != null && _arg_2 != "")
         {
            _local_4 = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;
            _local_5 = _local_4.exec(_arg_2);
            if(_arg_2.length > 0 && _local_5 != null)
            {
               Network(OSGi.getInstance().getService(INetworker)).send("lobby;update_profile;" + _arg_2);
               this.postUpdateProfile();
            }
         }
      }
      
      private function postUpdateProfile() : void
      {
         display.cursorLayer.addChild(new ConfirmEmailCode(localeService.getText(TextConst.ACCOUNT_RECOVERY_FORM_ENTER_CODE),this.onEnterConfirmCode));
      }
      
      private function onEnterConfirmCode(_arg_1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;confirm_email_code;" + _arg_1);
      }
      
      public function openRecoveryWindow(_arg_1:String) : void
      {
         new RecoveryWindow(this.onSavedRecovery,_arg_1);
      }
      
      private function onSavedRecovery(_arg_1:String, _arg_2:String) : void
      {
         if(_arg_1 == null || _arg_1 == "")
         {
            _arg_1 = " ";
         }
         if(_arg_2 == null || _arg_2 == "")
         {
            _arg_2 = " ";
         }
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;change_pass_email;" + _arg_1 + ";" + _arg_2);
      }
      
      private function sendInvitation(_arg_1:ReferalWindowEvent) : void
      {
         var _local_6:Object = null;
         var _local_5:int = 0;
         var _local_2:Array = _arg_1.adresses.split(",");
         var _local_3:RegExp = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;
         var _local_4:Array = new Array();
         while(_local_5 < _local_2.length)
         {
            _local_6 = _local_3.exec(_local_2[_local_5]);
            if(_local_6 == null)
            {
               _local_4.push(_local_2[_local_5]);
            }
            _local_5++;
         }
         if(_local_4.length > 0)
         {
            if(_local_4.length == 1)
            {
               this._showMessage(localeService.getText(TextConst.REFERAL_WINDOW_ADDRESS_NOT_VALID_ALERT_TEXT,_local_4[0]));
            }
            else
            {
               this._showMessage(localeService.getText(TextConst.REFERAL_WINDOW_ADDRESSES_NOT_VALID_ALERT_TEXT,_local_4.join(", ")));
            }
         }
      }
      
      private function onAlertButtonPressed(_arg_1:AlertEvent) : void
      {
         if(_arg_1.typeButton == AlertAnswer.YES)
         {
            StartupSettings.closeApplication();
            IStorageService(OSGi.getInstance().getService(IStorageService)).getStorage().data.userHash = null;
            IStorageService(OSGi.getInstance().getService(IStorageService)).getStorage().flush();
         }
      }
   }
}

