package projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle
{
   import flash.events.Event;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle.BattleLinkData;
   
   public class SetBattleNotifierServiceEvent extends Event
   {
      
      public static const SET_BATTLE:String = "SetBattleNotifierServiceEvent.SET_BATTLE";
      
      public var users:Vector.<BattleLinkData>;
      
      public function SetBattleNotifierServiceEvent(_arg_1:String, _arg_2:Vector.<BattleLinkData>, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         this.users = _arg_2;
         super(_arg_1,_arg_3,_arg_4);
      }
   }
}

