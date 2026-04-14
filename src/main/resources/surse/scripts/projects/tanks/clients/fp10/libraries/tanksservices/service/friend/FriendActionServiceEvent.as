package projects.tanks.clients.fp10.libraries.tanksservices.service.friend
{
   import flash.events.Event;
   
   public class FriendActionServiceEvent extends Event
   {
      
      public static const ADD:String = "FriendsActionServiceEvent.ADD";
      
      public static const ACCEPT:String = "FriendsActionServiceEvent.ACCEPT";
      
      public static const BREAK_OFF:String = "FriendsActionServiceEvent.BREAK_OFF";
      
      public static const REJECT:String = "FriendsActionServiceEvent.REJECT";
      
      public static const REJECT_ALL_INCOMING:String = "FriendsActionServiceEvent.REJECT_ALL_INCOMING";
      
      public static const REVOKE:String = "FriendsActionServiceEvent.REVOKE";
      
      public var userId:String;
      
      public function FriendActionServiceEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         super(_arg_1,_arg_3,_arg_4);
         this.userId = _arg_2;
      }
   }
}

