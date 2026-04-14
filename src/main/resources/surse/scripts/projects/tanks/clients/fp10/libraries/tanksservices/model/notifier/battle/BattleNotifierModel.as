package projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle
{
   import alternativa.osgi.OSGi;
   import flash.utils.Dictionary;
   import projects.tanks.client.tanksservices.model.notifier.battle.BattleNotifierData;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.UserRefresh;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifier;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle.IBattleNotifierService;
   
   public class BattleNotifierModel implements UserRefresh
   {
      
      [Inject]
      public static var battleNotifierService:IBattleNotifierService;
      
      private var battleLinkData:Dictionary;
      
      public function BattleNotifierModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         this.battleLinkData = new Dictionary();
      }
      
      public function objectUnloaded() : void
      {
         this.battleLinkData = null;
      }
      
      public function setBattle(_arg_1:Vector.<BattleNotifierData>) : void
      {
         var _local_2:BattleNotifierData = null;
         var _local_5:int = 0;
         var _local_3:Vector.<BattleLinkData> = new Vector.<BattleLinkData>(_arg_1.length);
         var _local_4:int = int(_arg_1.length);
         while(_local_5 < _local_4)
         {
            _local_2 = _arg_1[_local_5];
            _local_3[_local_5] = this.setAndUpdateConsumer(_local_2);
            _local_5++;
         }
         battleNotifierService.setBattle(_local_3);
      }
      
      private function setAndUpdateConsumer(_arg_1:BattleNotifierData) : BattleLinkData
      {
         var _local_2:String = _arg_1.userId;
         var _local_3:BattleLinkData = new BattleLinkData(_local_2,_arg_1);
         this.battleLinkData[_local_2] = _local_3;
         this.setBattleLinkForConsumer(_local_2,_local_3);
         return _local_3;
      }
      
      private function setBattleLinkForConsumer(_arg_1:String, _arg_2:BattleLinkData) : void
      {
         var _local_3:UserInfoConsumer = null;
         var _local_4:UserNotifier = UserNotifier(OSGi.getInstance().getService(UserNotifier));
         if(_local_4.hasDataConsumer(_arg_1))
         {
            _local_3 = _local_4.getDataConsumer(_arg_1);
            _local_3.setBattleUrl(_arg_2);
         }
      }
      
      public function refresh(_arg_1:String, _arg_2:UserInfoConsumer) : void
      {
         if(_arg_1 in this.battleLinkData)
         {
            _arg_2.setBattleUrl(this.battleLinkData[_arg_1]);
         }
      }
      
      public function remove(_arg_1:String) : void
      {
         delete this.battleLinkData[_arg_1];
         this.setBattleLinkForConsumer(_arg_1,null);
      }
      
      public function leaveBattle(_arg_1:String) : void
      {
         battleNotifierService.leaveBattle(_arg_1);
         this.remove(_arg_1);
      }
   }
}

