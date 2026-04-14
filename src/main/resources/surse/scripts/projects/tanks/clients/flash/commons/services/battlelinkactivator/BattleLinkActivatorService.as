package projects.tanks.clients.flash.commons.services.battlelinkactivator
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.blur.IBlurService;
   import alternativa.tanks.locale.constants.TextConst;
   import flash.events.EventDispatcher;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class BattleLinkActivatorService extends EventDispatcher implements IBattleLinkActivatorService
   {
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var userPropertyService:IUserPropertiesService;
      
      private var _url:String;
      
      private var _remote:Boolean;
      
      public function BattleLinkActivatorService()
      {
         super();
      }
      
      public function navigateToBattleUrlWithoutAvailableBattle(_arg_1:String, _arg_2:Boolean) : void
      {
         this.navigateToBattleUrl(_arg_1,_arg_2,true);
      }
      
      public function navigateToBattleUrl(_arg_1:String, _arg_2:Boolean, _arg_3:Boolean) : void
      {
         this._url = _arg_1;
         this._remote = _arg_2;
         if(battleInfoService.spectator)
         {
            this.navigate(this._url,this._remote);
            return;
         }
         if(lobbyLayoutService.getCurrentState() == LayoutState.BATTLE)
         {
            this.navigateOfBattle(_arg_3);
         }
         else
         {
            this.navigateToBattle(_arg_3);
         }
      }
      
      private function navigateToBattle(_arg_1:Boolean) : void
      {
         var _local_2:String = null;
         if(!_arg_1)
         {
            _local_2 = localeService.getText(TextConst.STRING_ALERT_GOT_TO_BATTLE_IS_UNAVAILABLE_RANK);
            alertService.showAlert(_local_2,Vector.<String>([localeService.getText(TextConst.STRING_GO_TO_BATTLE_LABEL),localeService.getText(TextConst.STRING_DECLINE_LABEL)]));
            alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onConfirmGoToNavigateToBattleUrl);
         }
         else
         {
            this.navigate(this._url,this._remote);
         }
      }
      
      private function navigateOfBattle(_arg_1:Boolean) : String
      {
         var _local_2:String = null;
         if(_arg_1)
         {
            _local_2 = localeService.getText(TanksLocale.TEXT_FRIENDS_EXIT_FROM_BATTLE_ALERT);
         }
         else
         {
            _local_2 = localeService.getText(TextConst.STRING_ALERT_GO_TO_BATTLE_IS_UNAVAILABLE_RANK_FUND);
         }
         alertService.showAlert(_local_2,Vector.<String>([localeService.getText(TextConst.ALERT_ANSWER_YES),localeService.getText(TextConst.ALERT_ANSWER_NO)]));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onConfirmYesNavigateToBattleUrl);
         return _local_2;
      }
      
      private function navigate(_arg_1:String, _arg_2:Boolean) : void
      {
         if(_arg_2)
         {
            this.rememberShowAlertDeadBattle();
            navigateToURL(new URLRequest(_arg_1),"_self");
         }
         else
         {
            this.activateLink(_arg_1);
         }
      }
      
      private function onConfirmYesNavigateToBattleUrl(_arg_1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onConfirmYesNavigateToBattleUrl);
         this.confirmNavigateToBattleUrl(_arg_1,localeService.getText(TextConst.ALERT_ANSWER_YES),localeService.getText(TextConst.ALERT_ANSWER_NO));
      }
      
      private function onConfirmGoToNavigateToBattleUrl(_arg_1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onConfirmGoToNavigateToBattleUrl);
         this.confirmNavigateToBattleUrl(_arg_1,localeService.getText(TextConst.STRING_GO_TO_BATTLE_LABEL),localeService.getText(TextConst.STRING_DECLINE_LABEL));
      }
      
      private function confirmNavigateToBattleUrl(_arg_1:AlertServiceEvent, _arg_2:String, _arg_3:String) : void
      {
         if(_arg_1.typeButton == _arg_2)
         {
            dispatchEvent(new BattleLinkActivatorServiceEvent(BattleLinkActivatorServiceEvent.CONFIRMED_NAVIGATE,this._url));
            this.navigate(this._url,this._remote);
         }
         else if(_arg_1.typeButton == _arg_3)
         {
            dispatchEvent(new BattleLinkActivatorServiceEvent(BattleLinkActivatorServiceEvent.NOT_CONFIRMED_NAVIGATE,this._url));
            if(dialogWindowsDispatcherService.isOpen())
            {
               blurService.blur();
            }
         }
      }
      
      private function rememberShowAlertDeadBattle() : void
      {
         var _local_1:String = userPropertyService.userName;
         storageService.getStorage().data.showAlertDeadBattle = _local_1 + "_true";
      }
      
      public function activateLink(_arg_1:String) : void
      {
         this.rememberShowAlertDeadBattle();
         dispatchEvent(new BattleLinkActivatorServiceEvent(BattleLinkActivatorServiceEvent.ACTIVATE_LINK,_arg_1));
      }
      
      public function isAlive(_arg_1:String) : void
      {
         dispatchEvent(new BattleLinkAliveEvent(BattleLinkAliveEvent.IS_ALIVE,_arg_1));
      }
      
      public function alive(_arg_1:String) : void
      {
         dispatchEvent(new BattleLinkAliveEvent(BattleLinkAliveEvent.ALIVE,_arg_1));
      }
      
      public function dead(_arg_1:String) : void
      {
         dispatchEvent(new BattleLinkAliveEvent(BattleLinkAliveEvent.DEAD,_arg_1));
      }
   }
}

