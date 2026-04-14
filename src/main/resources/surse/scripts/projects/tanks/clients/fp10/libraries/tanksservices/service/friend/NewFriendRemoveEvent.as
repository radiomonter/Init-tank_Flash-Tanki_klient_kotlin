package projects.tanks.clients.fp10.libraries.tanksservices.service.friend
{
   import flash.events.Event;
   
   public class NewFriendRemoveEvent extends Event
   {
      
      public static const ACCEPTED:String = "NewFriendRemoveEvent.ACCEPTED";
      
      public static const INCOMING:String = "NewFriendRemoveEvent.INCOMING";
      
      public var userId:String;
      
      public function NewFriendRemoveEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         this.userId = _arg_2;
         super(_arg_1,_arg_3,_arg_4);
      }
   }
}

