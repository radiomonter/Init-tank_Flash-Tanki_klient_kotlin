package alternativa.tanks.model.battleselect
{
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.controllers.battlelist.BattleByURLNotFoundEvent;
   import alternativa.tanks.service.battle.Fahy;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.service.battlelist.BattleListFormServiceEvent;
   import alternativa.tanks.service.battlelist.IBattleListFormService;
   import alternativa.tanks.tracker.ITrackerService;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.battleselect.model.battleselect.BattleSelectModelBase;
   import projects.tanks.client.battleselect.model.battleselect.IBattleSelectModelBase;
   
   public class BattleSelectModel extends BattleSelectModelBase implements IBattleSelectModelBase, ObjectLoadPostListener, ObjectUnloadListener
   {
      
      [Inject]
      public static var battleListFormService:IBattleListFormService;
      
      [Inject]
      public static var battleInfoFormService:IBattleInfoFormService;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      [Inject]
      public static var logService:LogService;
      
      public static const CHANNEL:String = "BattleSelectModel";
      
      private var battleFriendNotificator:Fahy;
      
      public function BattleSelectModel()
      {
         super();
      }
      
      public function objectLoadedPost() : void
      {
         this.battleFriendNotificator = new Fahy();
         battleListFormService.sevop();
         battleListFormService.addEventListener(BattleListFormServiceEvent.BATTLE_SELECTED,this.onBattleSelected);
         battleListFormService.addEventListener(BattleByURLNotFoundEvent.BATTLE_BY_URL_NOT_FOUND,this.onBattleByURLNotFound);
         trackerService.trackEvent("battleList","init","");
      }
      
      public function objectUnloaded() : void
      {
         this.battleFriendNotificator.destroy();
         this.battleFriendNotificator = null;
         battleInfoFormService.destroy();
         battleListFormService.removeEventListener(BattleListFormServiceEvent.BATTLE_SELECTED,this.onBattleSelected);
         battleListFormService.removeEventListener(BattleByURLNotFoundEvent.BATTLE_BY_URL_NOT_FOUND,this.onBattleByURLNotFound);
         battleListFormService.kaso();
      }
      
      private function onBattleSelected(_arg_1:BattleListFormServiceEvent) : void
      {
         server.onSelect(_arg_1.selectedItem);
      }
      
      private function onBattleByURLNotFound(_arg_1:BattleByURLNotFoundEvent) : void
      {
         server.search(_arg_1.battleId);
      }
      
      public function select(_arg_1:String) : void
      {
         battleListFormService.selectBattleItemFromServer(_arg_1);
      }
      
      public function battleItemsPacketJoinSuccess() : void
      {
         battleListFormService.battleItemsPacketJoinSuccess();
      }
   }
}

