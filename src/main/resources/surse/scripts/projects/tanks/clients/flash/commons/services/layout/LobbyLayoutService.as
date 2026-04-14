package projects.tanks.clients.flash.commons.services.layout
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.startup.StartupSettings;
   import alternativa.tanks.locale.constants.TextConst;
   import flash.events.EventDispatcher;
   import flash.external.ExternalInterface;
   import flash.net.SharedObject;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.flash.commons.models.layout.ILobbyLayout;
   import projects.tanks.clients.flash.commons.models.layout.notify.ILobbyLayoutNotify;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import services.alertservice.Alert;
   import services.alertservice.AlertAnswer;
   
   public class LobbyLayoutService extends EventDispatcher implements ILobbyLayoutService
   {
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var partnersService:IPartnerService;
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      private var _disablePayment:Boolean;
      
      private var battleReady:Boolean;
      
      public function LobbyLayoutService()
      {
         super();
      }
      
      private static function showExitFromGameAlert() : void
      {
         alertService.showAlertById(Alert.ALERT_QUIT);
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,onQuitGameDialogButtonPressed);
      }
      
      private static function onQuitGameDialogButtonPressed(_arg_1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,onQuitGameDialogButtonPressed);
         if(_arg_1.typeButton == AlertAnswer.YES)
         {
            clearHash();
            if(ExternalInterface.available)
            {
               ExternalInterface.call("goToMainPage");
            }
            StartupSettings.closeApplication();
         }
      }
      
      private static function clearHash() : void
      {
         var _local_1:SharedObject = storageService.getStorage();
         _local_1.data.userHash = null;
         _local_1.flush();
      }
      
      public function showGarage() : void
      {
         this.layoutSwitchPredicted();
         ILobbyLayout(OSGi.getInstance().getService(ILobbyLayout)).switchGarage();
      }
      
      public function showBattleSelect() : void
      {
         this.layoutSwitchPredicted();
         ILobbyLayout(OSGi.getInstance().getService(ILobbyLayout)).switchBattleSelect();
      }
      
      public function showPayment() : void
      {
         ILobbyLayout(OSGi.getInstance().getService(ILobbyLayout)).switchPayment();
      }
      
      public function isSwitchInProgress() : Boolean
      {
         return ILobbyLayoutNotify(OSGi.getInstance().getService(ILobbyLayoutNotify)).isSwitchInProgress();
      }
      
      public function getCurrentState() : LayoutState
      {
         return ILobbyLayoutNotify(OSGi.getInstance().getService(ILobbyLayoutNotify)).getCurrentState();
      }
      
      public function nyq() : void
      {
         if(this.getCurrentState() == LayoutState.BATTLE_SELECT)
         {
            this.showBattleSelect();
         }
         else if(this.getCurrentState() == LayoutState.GARAGE)
         {
            this.showGarage();
         }
      }
      
      public function exitFromBattle() : void
      {
         if(battleInfoService.isSpectatorMode())
         {
            this.exitFromBattleWithoutNotify();
         }
         else
         {
            this.showExitFromBattleAlert();
         }
      }
      
      private function showExitFromBattleAlert() : void
      {
         var _local_1:String = this.getTextForExitFromBattleAlert();
         alertService.showAlert(_local_1,Vector.<String>([localeService.getText(TextConst.ALERT_ANSWER_YES),localeService.getText(TextConst.ALERT_ANSWER_NO)]));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onQuitBattleDialogButtonPressed);
      }
      
      private function getTextForExitFromBattleAlert() : String
      {
         return localeService.getText(TanksLocale.TEXT_FRIENDS_EXIT_FROM_BATTLE_ALERT);
      }
      
      private function onQuitBattleDialogButtonPressed(_arg_1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onQuitBattleDialogButtonPressed);
         if(_arg_1.typeButton == localeService.getText(TextConst.ALERT_ANSWER_YES))
         {
            this.exitFromBattleWithoutNotify();
         }
      }
      
      public function exitFromBattleWithoutNotify() : void
      {
         ILobbyLayout(OSGi.getInstance().getService(ILobbyLayout)).exitFromBattle();
      }
      
      public function exitFromBattleToState(_arg_1:LayoutState) : void
      {
         this.layoutSwitchPredicted();
         ILobbyLayout(OSGi.getInstance().getService(ILobbyLayout)).exitFromBattleToState(_arg_1);
      }
      
      public function exitFromGame() : void
      {
         showExitFromGameAlert();
      }
      
      public function get paymentDisabled() : Boolean
      {
         return this._disablePayment;
      }
      
      public function set disablePayment(_arg_1:Boolean) : void
      {
         this._disablePayment = _arg_1;
      }
      
      public function layoutSwitchPredicted() : void
      {
         ILobbyLayoutNotify(OSGi.getInstance().getService(ILobbyLayoutNotify)).layoutSwitchPredicted();
      }
      
      public function inBattle() : Boolean
      {
         return ILobbyLayoutNotify(OSGi.getInstance().getService(ILobbyLayoutNotify)).inBattle();
      }
      
      public function isWindowOpenOverBattle() : Boolean
      {
         return this.inBattle() && (this.getCurrentState() != LayoutState.BATTLE || dialogWindowsDispatcherService.isOpen());
      }
      
      private function isOpenPopupOverBattle() : Boolean
      {
         return this.inBattle() && this.getCurrentState() != LayoutState.BATTLE;
      }
      
      public function closePopupOverBattle() : void
      {
         var _local_1:LayoutState = null;
         if(!this.isSwitchInProgress() && this.isOpenPopupOverBattle())
         {
            _local_1 = this.getCurrentState();
            if(_local_1 == LayoutState.BATTLE_SELECT)
            {
               this.showBattleSelect();
            }
            else if(_local_1 == LayoutState.GARAGE)
            {
               this.showGarage();
            }
            else if(_local_1 == LayoutState.PAYMENT)
            {
            }
         }
      }
      
      public function setBattleReady(_arg_1:Boolean) : void
      {
         this.battleReady = _arg_1;
      }
      
      public function isBattleReady() : Boolean
      {
         return this.battleReady;
      }
   }
}

