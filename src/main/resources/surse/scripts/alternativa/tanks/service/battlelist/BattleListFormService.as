package alternativa.tanks.service.battlelist
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.controllers.battlelist.BattleByURLNotFoundEvent;
   import alternativa.tanks.controllers.battlelist.BattleListController;
   import alternativa.tanks.controllers.battlelist.BattleSelectedEvent;
   import alternativa.tanks.controllers.battlelist.CreateBattleClickEvent;
   import alternativa.tanks.model.item.IBattleItem;
   import alternativa.tanks.service.battlecreate.IBattleCreateFormService;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.view.battlelist.BattleListView;
   import alternativa.tanks.view.battlelist.LocaleBattleList;
   import flash.events.EventDispatcher;
   import obfuscation.fubyt.Batopa;
   import obfuscation.fusirykes.Hyv;
   import obfuscation.hifoped.Nywehohal;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleselect.model.item.BattleItemCC;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   
   public class BattleListFormService extends EventDispatcher implements IBattleListFormService
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleCreateFormService:IBattleCreateFormService;
      
      [Inject]
      public static var battleInfoFormService:IBattleInfoFormService;
      
      [Inject]
      public static var doqa:BattleFormatUtil;
      
      public var teqew:BattleListController;
      
      public function BattleListFormService()
      {
         super();
      }
      
      public function sevop() : void
      {
         this.teqew = new BattleListController(new BattleListView(display.stage,display.systemLayer,new LocaleBattleList(),battleCreateFormService.battleCreationDisabled));
         this.teqew.showForm();
         this.teqew.addEventListener(CreateBattleClickEvent.CREATE_BATTLE_CLICK,this.naman);
         this.teqew.addEventListener(BattleSelectedEvent.BATTLE_SELECTED,this.onBattleSelected);
         this.teqew.addEventListener(BattleByURLNotFoundEvent.BATTLE_BY_URL_NOT_FOUND,this.onBattleByURLNotFound);
      }
      
      public function kaso() : void
      {
         this.teqew.removeEventListener(CreateBattleClickEvent.CREATE_BATTLE_CLICK,this.naman);
         this.teqew.removeEventListener(BattleSelectedEvent.BATTLE_SELECTED,this.onBattleSelected);
         this.teqew.removeEventListener(BattleByURLNotFoundEvent.BATTLE_BY_URL_NOT_FOUND,this.onBattleByURLNotFound);
         this.teqew.hideForm();
         this.teqew.destroy();
         this.teqew = null;
      }
      
      public function battleItemRecord(_arg_1:IGameObject) : void
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_5:int = 0;
         var _local_6:int = 0;
         var _local_7:int = 0;
         var _local_8:BattleItemCC = IBattleItem(_arg_1.adapt(IBattleItem)).getConstructor();
         if(_arg_1.hasModel(Batopa) && _arg_1.adapt(Batopa) != null)
         {
            _local_2 = Batopa(_arg_1.adapt(Batopa)).getUsersCountBlue();
            _local_3 = Batopa(_arg_1.adapt(Batopa)).getUsersCountRed();
            _local_4 = Batopa(_arg_1.adapt(Batopa)).getFriendsCountBlue();
            _local_5 = Batopa(_arg_1.adapt(Batopa)).getFriendsCountRed();
            this.teqew.battleItemRecord(_arg_1,_local_8.battleMode,_local_8.name,false,_local_3,_local_2,_local_5,_local_4,0,0,_local_8.maxPeople,Nywehohal(_local_8.map.adapt(Nywehohal)).getName(),_local_8.rankRange,_local_8.noSuppliesBattle,_local_8.privateBattle,_local_8.suspicious,_local_8.proBattle,doqa.suvo(_local_8.equipmentConstraintsMode,_local_8.parkourMode),doqa.vuqud(_local_8.equipmentConstraintsMode,_local_8.parkourMode),_local_8.timeLeft);
         }
         else
         {
            if(!_arg_1.hasModel(Hyv) && _arg_1.adapt(Hyv) == null)
            {
               throw new ArgumentError("Invalid battle item model" + _arg_1);
            }
            _local_6 = Hyv(_arg_1.adapt(Hyv)).getUsersCount();
            _local_7 = Hyv(_arg_1.adapt(Hyv)).getFriendsCount();
            this.teqew.battleItemRecord(_arg_1,_local_8.battleMode,_local_8.name,true,0,0,0,0,_local_6,_local_7,_local_8.maxPeople,Nywehohal(_local_8.map.adapt(Nywehohal)).getName(),_local_8.rankRange,_local_8.noSuppliesBattle,_local_8.privateBattle,_local_8.suspicious,_local_8.proBattle,doqa.suvo(_local_8.equipmentConstraintsMode,_local_8.parkourMode),doqa.vuqud(_local_8.equipmentConstraintsMode,_local_8.parkourMode),_local_8.timeLeft);
         }
      }
      
      public function selectBattleItemFromServer(_arg_1:String) : void
      {
         this.teqew.selectBattleItemFromServer(_arg_1);
      }
      
      public function updateName(_arg_1:String, _arg_2:String) : void
      {
         this.teqew.updateName(_arg_1,_arg_2);
      }
      
      public function madePrivate(_arg_1:String, _arg_2:String) : void
      {
         this.teqew.madePrivate(_arg_1,_arg_2);
      }
      
      public function updateSuspicious(_arg_1:String, _arg_2:Boolean) : void
      {
         this.teqew.updateSuspicious(_arg_1,_arg_2);
      }
      
      public function weqogos(_arg_1:String) : void
      {
         this.teqew.removeBattle(_arg_1);
      }
      
      public function updateUsersCountTeam(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int) : void
      {
         this.teqew.updateUsersCountTeam(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
      }
      
      public function updateUsersCountDm(_arg_1:String, _arg_2:int, _arg_3:int) : void
      {
         this.teqew.updateUsersCountDm(_arg_1,_arg_2,_arg_3);
      }
      
      private function onBattleSelected(_arg_1:BattleSelectedEvent) : void
      {
         dispatchEvent(new BattleListFormServiceEvent(BattleListFormServiceEvent.BATTLE_SELECTED,_arg_1.selectedItem));
         battleCreateFormService.hideForm();
      }
      
      private function onBattleByURLNotFound(_arg_1:BattleByURLNotFoundEvent) : void
      {
         dispatchEvent(new BattleByURLNotFoundEvent(BattleByURLNotFoundEvent.BATTLE_BY_URL_NOT_FOUND,_arg_1.battleId));
      }
      
      public function swapTeams(_arg_1:String) : void
      {
         this.teqew.swapTeams(_arg_1);
      }
      
      public function battleItemsPacketJoinSuccess() : void
      {
         this.teqew.battleItemsPacketJoinSuccess();
      }
      
      private function naman(_arg_1:CreateBattleClickEvent) : void
      {
         battleCreateFormService.showForm();
         battleInfoFormService.removeFormFromStage();
      }
   }
}

