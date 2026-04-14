package alternativa.tanks.controller.events
{
   import flash.events.Event;
   
   public class NavigationEvent extends Event
   {
      
      public static const GO_TO_REGISTRATION_FORM:String = "NavigationEvent.GO_TO_REGISTRATION";
      
      public static const GO_TO_LOGIN_FORM:String = "NavigationEvent.GO_TO_LOGIN_FORM";
      
      public static const GO_TO_RESTORE_PASSWORD_FORM:String = "NavigationEvent.GO_TO_RESTORE_PASSWORD_FORM";
      
      public static const GO_TO_INVITE_FORM:String = "NavigationEvent.GO_TO_INVITE_FORM";
      
      public static const GO_TO_STAND_ALONE_CAPTCHA:String = "NavigationEvent.GO_TO_STAND_ALONE_CAPTCHA";
      
      public static const GO_TO_CHANGE_EMAIL_AND_PASSWORD_FORM:String = "NavigationEvent.GO_TO_CHANGE_EMAIL_AND_PASSWORD_FORM";
      
      public function NavigationEvent(_arg_1:String)
      {
         super(_arg_1);
      }
      
      override public function clone() : Event
      {
         return new NavigationEvent(type);
      }
   }
}

