package projects.tanks.clients.fp10.libraries.tanksservices.service.friend
{
   import flash.events.Event;
   
   public class NewFriendEvent extends Event
   {
      
      public static const ACCEPTED_CHANGE:String = "NewFriendEvent.ACCEPTED_CHANGE";
      
      public static const INCOMING_CHANGE:String = "NewFriendEvent.INCOMING_CHANGE";
      
      public var userId:String;
      
      public function NewFriendEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         this.userId = _arg_2;
         super(_arg_1,_arg_3,_arg_4);
      }
   }
}

