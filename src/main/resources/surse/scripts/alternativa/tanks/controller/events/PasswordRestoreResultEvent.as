package alternativa.tanks.controller.events
{
   import flash.events.Event;
   
   public class PasswordRestoreResultEvent extends Event
   {
      
      public static const RESTORE_MESSAGE_HAVE_BEEN_SENT:String = "RESTORE_MESSAGE_HAVE_BEEN_SENT";
      
      public static const EMAIL_DOES_NOT_EXISTS:String = "EMAIL_DOES_NOT_EXISTS";
      
      public function PasswordRestoreResultEvent(_arg_1:String)
      {
         super(_arg_1);
      }
   }
}

