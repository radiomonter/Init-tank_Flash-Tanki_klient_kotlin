package alternativa.tanks.controller.events
{
   import flash.events.Event;
   
   public class CheckCallsignEvent extends Event
   {
      
      public static const CHECK_CALLSIGN:String = "CheckCallsignEvent.CHECK_CALLSIGN";
      
      private var _uid:String;
      
      public function CheckCallsignEvent(_arg_1:String)
      {
         super(CHECK_CALLSIGN);
         this._uid = _arg_1;
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      override public function clone() : Event
      {
         return new CheckCallsignEvent(this.uid);
      }
   }
}

