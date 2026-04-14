package projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle
{
   import flash.events.EventDispatcher;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle.BattleLinkData;
   
   public class BattleNotifierService extends EventDispatcher implements IBattleNotifierService
   {
      
      public function BattleNotifierService()
      {
         super();
      }
      
      public function setBattle(_arg_1:Vector.<BattleLinkData>) : void
      {
         dispatchEvent(new SetBattleNotifierServiceEvent(SetBattleNotifierServiceEvent.SET_BATTLE,_arg_1));
      }
      
      public function leaveBattle(_arg_1:String) : void
      {
         dispatchEvent(new LeaveBattleNotifierServiceEvent(LeaveBattleNotifierServiceEvent.LEAVE,_arg_1));
      }
   }
}

