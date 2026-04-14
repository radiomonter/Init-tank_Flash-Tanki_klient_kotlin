package projects.tanks.clients.flash.commons.models.battlelinkactivator
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.BattleLinkActivatorServiceEvent;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.BattleLinkAliveEvent;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.IBattleLinkActivatorService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import services.alertservice.AlertAnswer;
   
   public class BattleLinkActivatorModel
   {
      
      [Inject]
      public static var battleLinkActivatorService:IBattleLinkActivatorService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var userPropertyService:IUserPropertiesService;
      
      public function BattleLinkActivatorModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         battleLinkActivatorService.addEventListener(BattleLinkActivatorServiceEvent.ACTIVATE_LINK,this.onActivateLink);
         battleLinkActivatorService.addEventListener(BattleLinkAliveEvent.IS_ALIVE,this.onIsAlive);
      }
      
      private function onActivateLink(_arg_1:BattleLinkActivatorServiceEvent) : void
      {
         if(!lobbyLayoutService.isSwitchInProgress())
         {
            Network(OSGi.getInstance().getService(INetworker)).send("battle_select;select;" + _arg_1.link);
         }
      }
      
      private function onIsAlive(_arg_1:BattleLinkAliveEvent) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;is_battle_alive;" + _arg_1.battleId);
      }
      
      public function objectUnloaded() : void
      {
         battleLinkActivatorService.removeEventListener(BattleLinkActivatorServiceEvent.ACTIVATE_LINK,this.onActivateLink);
         battleLinkActivatorService.removeEventListener(BattleLinkAliveEvent.IS_ALIVE,this.onIsAlive);
      }
      
      public function battleNotFound() : void
      {
         var _local_1:String = userPropertyService.userName;
         if(storageService.getStorage().data.showAlertDeadBattle == _local_1 + "_true")
         {
            alertService.showAlert(localeService.getText(TextConst.STRING_BATTLE_CANNOT_BE_FOUND_ALERT),Vector.<String>([localeService.getText(AlertAnswer.OK)]));
            storageService.getStorage().data.showAlertDeadBattle = _local_1 + "_false";
         }
      }
      
      public function alive(_arg_1:String) : void
      {
         battleLinkActivatorService.alive(_arg_1);
      }
      
      public function dead(_arg_1:String) : void
      {
         battleLinkActivatorService.dead(_arg_1);
      }
   }
}

