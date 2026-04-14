package projects.tanks.clients.fp10.libraries.tanksservices.service.friend
{
   import flash.events.Event;
   
   public class FriendActionServiceUidEvent extends Event
   {
      
      public static const ADD:String = "FriendActionServiceUidEvent.ADD";
      
      public static const CHECK:String = "FriendActionServiceUidEvent.CHECK";
      
      public static const UID_EXIST:String = "FriendActionServiceUidEvent.UID_EXIST";
      
      public static const UID_NOT_EXIST:String = "FriendActionServiceUidEvent.UID_NOT_EXIST";
      
      public static const ALREADY_IN_INCOMING_FRIENDS:String = "FriendActionServiceUidEvent.ALREADY_IN_INCOMING_FRIENDS";
      
      public static const ALREADY_IN_ACCEPTED_FRIENDS:String = "FriendActionServiceUidEvent.ALREADY_IN_ACCEPTED_FRIENDS";
      
      public static const ALREADY_IN_OUTGOING_FRIENDS:String = "FriendActionServiceUidEvent.ALREADY_IN_OUTGOING_FRIENDS";
      
      public var uid:String;
      
      public var userId:String;
      
      public function FriendActionServiceUidEvent(_arg_1:String, _arg_2:String, _arg_3:String = null, _arg_4:Boolean = false, _arg_5:Boolean = false)
      {
         this.uid = _arg_2;
         this.userId = _arg_3;
         super(_arg_1,_arg_4,_arg_5);
      }
   }
}

