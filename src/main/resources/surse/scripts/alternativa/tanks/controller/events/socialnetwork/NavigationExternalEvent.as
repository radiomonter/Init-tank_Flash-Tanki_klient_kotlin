package alternativa.tanks.controller.events.socialnetwork
{
   import flash.events.Event;
   
   public class NavigationExternalEvent extends Event
   {
      
      public static const GO_TO_EXTERNAL_REGISTRATION_FORM:String = "NavigationExternalEvent.GO_TO_EXTERNAL_REGISTRATION_FORM";
      
      public static const GO_TO_EXTERNAL_LOGIN_FORM:String = "NavigationExternalEvent.GO_TO_EXTERNAL_LOGIN_FORM";
      
      public var socialNetworkId:String;
      
      public function NavigationExternalEvent(_arg_1:String, _arg_2:String)
      {
         this.socialNetworkId = _arg_2;
         super(_arg_1);
      }
      
      override public function clone() : Event
      {
         return new NavigationExternalEvent(type,this.socialNetworkId);
      }
   }
}

