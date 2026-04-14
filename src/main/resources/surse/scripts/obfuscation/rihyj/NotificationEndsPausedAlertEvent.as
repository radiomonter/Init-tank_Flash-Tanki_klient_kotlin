package obfuscation.rihyj
{
   import flash.events.Event;
   
   public class NotificationEndsPausedAlertEvent extends Event
   {
      
      public static const RETURN_TO_BATTLE:String = "NotificationEndsPausedAlertEvent.RETURN_TO_BATTLE";
      
      public static const CLOSE_ALERT:String = "NotificationEndsPausedAlertEvent.CLOSE_ALERT";
      
      public function NotificationEndsPausedAlertEvent(_arg_1:String)
      {
         super(_arg_1);
      }
   }
}

