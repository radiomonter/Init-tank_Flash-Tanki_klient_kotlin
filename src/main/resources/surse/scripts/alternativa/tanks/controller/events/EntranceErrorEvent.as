package alternativa.tanks.controller.events
{
   import flash.events.Event;
   
   public class EntranceErrorEvent extends Event
   {
      
      public static const SERVER_FROZEN:String = "EntranceErrorEvent.SERVER_FROZEN";
      
      public static const SERVER_HALT:String = "EntranceErrorEvent.SERVER_HALT";
      
      public function EntranceErrorEvent(_arg_1:String)
      {
         super(_arg_1);
      }
   }
}

