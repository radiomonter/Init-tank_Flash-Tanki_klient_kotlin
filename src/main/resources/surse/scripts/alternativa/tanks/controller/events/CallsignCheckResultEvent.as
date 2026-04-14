package alternativa.tanks.controller.events
{
   import flash.events.Event;
   
   public class CallsignCheckResultEvent extends Event
   {
      
      public static const CALLSIGN_IS_BUSY:String = "CallsignCheckResultEvent.CALLSIGN_IS_BUSY";
      
      public static const CALLSIGN_IS_FREE:String = "CallsignCheckResultEvent.CALLSIGN_IS_FREE";
      
      public static const CALLSIGN_IS_INCORRECT:String = "CallsignCheckResultEvent.CALLSIGN_IS_INCORRECT";
      
      private var _freeUids:Vector.<String>;
      
      public function CallsignCheckResultEvent(_arg_1:String)
      {
         super(_arg_1);
      }
      
      public function get freeUids() : Vector.<String>
      {
         return this._freeUids;
      }
      
      public function set freeUids(_arg_1:Vector.<String>) : void
      {
         this._freeUids = _arg_1;
      }
   }
}

