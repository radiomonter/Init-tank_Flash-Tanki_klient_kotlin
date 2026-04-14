package projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle
{
   import flash.events.Event;
   
   public class LeaveBattleNotifierServiceEvent extends Event
   {
      
      public static const LEAVE:String = "LeaveBattleNotifierServiceEvent.LEAVE_BATTLE";
      
      public var userId:String;
      
      public function LeaveBattleNotifierServiceEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         this.userId = _arg_2;
         super(_arg_1,_arg_3,_arg_4);
      }
   }
}

