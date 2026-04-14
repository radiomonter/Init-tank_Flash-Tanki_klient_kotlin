package alternativa.tanks.service.notificationcategories
{
   import flash.events.Event;
   
   public class NotificationGarageCategoriesEvent extends Event
   {
      
      public static const NOTIFICATION_CHANGE:String = "NotificationGarageCategoriesEvent.NOTIFICATION_CHANGE";
      
      public function NotificationGarageCategoriesEvent(_arg_1:String)
      {
         super(_arg_1);
      }
   }
}

