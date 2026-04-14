package alternativa.tanks.controller.events
{
   import flash.events.Event;
   
   public class Degagi extends Event
   {
      
      public static const INVITE_ENTERED:String = "INVITE_ENTERED";
      
      private var wubefas:String;
      
      public function Degagi(_arg_1:String)
      {
         this.wubefas = _arg_1;
         super(INVITE_ENTERED);
      }
      
      public function get vody() : String
      {
         return this.wubefas;
      }
   }
}

