package alternativa.tanks.controller.events
{
   import flash.events.Event;
   
   public class RegistrationFailedEvent extends Event
   {
      
      public static const PASSWORD_IS_INCORRECT:String = "RegistrationFailedEvent.PASSWORD_IS_INCORRECT";
      
      public function RegistrationFailedEvent(_arg_1:String)
      {
         super(_arg_1);
      }
   }
}

