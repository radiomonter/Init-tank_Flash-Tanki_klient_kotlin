package projects.tanks.clients.fp10.libraries.tanksservices.service.friend
{
   import flash.events.Event;
   
   public class FriendInfoLabelUpdaterEvent extends Event
   {
      
      public static const CHANGE_STATE:String = "FriendInfoLabelUpdaterEvent.CHANGE_STATE";
      
      public function FriendInfoLabelUpdaterEvent(_arg_1:String, _arg_2:Boolean = false, _arg_3:Boolean = false)
      {
         super(_arg_1,_arg_2,_arg_3);
      }
   }
}

