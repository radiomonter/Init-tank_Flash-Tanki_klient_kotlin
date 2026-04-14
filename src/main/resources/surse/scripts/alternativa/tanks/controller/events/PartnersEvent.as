package alternativa.tanks.controller.events
{
   import flash.events.Event;
   
   public class PartnersEvent extends Event
   {
      
      public static const START_REGISTRATION:String = "PartnersEvent.START_REGISTRATION";
      
      public static const START_LOGIN:String = "PartnersEvent.START_LOGIN";
      
      public function PartnersEvent(_arg_1:String)
      {
         super(_arg_1);
      }
      
      override public function clone() : Event
      {
         return new PartnersEvent(this.type);
      }
   }
}

