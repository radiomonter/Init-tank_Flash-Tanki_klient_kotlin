package alternativa.tanks.models.service
{
   import flash.events.Event;
   
   public class ClanNotificationEvent extends Event
   {
      
      public static const REMOVE_ACCEPTED_NOTIFICATION:String = "ClanNotificationEvent.REMOVE_ACCEPTED_NOTIFICATION";
      
      public static const REMOVE_INCOMING_NOTIFICATION:String = "ClanNotificationEvent.REMOVE_INCOMING_NOTIFICATION";
      
      public var id:String;
      
      public function ClanNotificationEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         this.id = _arg_2;
         super(_arg_1,_arg_3,_arg_4);
      }
   }
}

