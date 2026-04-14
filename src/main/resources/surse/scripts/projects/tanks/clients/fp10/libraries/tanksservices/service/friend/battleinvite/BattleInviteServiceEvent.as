package projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite
{
   import flash.events.Event;
   
   public class BattleInviteServiceEvent extends Event
   {
      
      public static const INVITE:String = "BattleInviteServiceEvent.INVITE";
      
      public static const ACCEPT:String = "BattleInviteServiceEvent.ACCEPT";
      
      public static const REJECT:String = "BattleInviteServiceEvent.REJECT";
      
      public static const REMOVE_INVITE:String = "BattleInviteServiceEvent.REMOVE_INVITE";
      
      public var userId:String;
      
      public var battleId:String;
      
      public var battleUrl:String;
      
      public var isRemoteBattleUrl:Boolean;
      
      public function BattleInviteServiceEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         super(_arg_1,_arg_3,_arg_4);
         this.userId = _arg_2;
      }
   }
}

