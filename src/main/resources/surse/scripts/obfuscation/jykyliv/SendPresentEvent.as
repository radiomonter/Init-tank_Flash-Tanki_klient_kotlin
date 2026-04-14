package obfuscation.jykyliv
{
   import flash.events.Event;
   
   public class SendPresentEvent extends Event
   {
      
      public static var SEND_PRESENT:String = "SendPresentEvent.SEND_PRESENT";
      
      public var uid:String;
      
      public var text:String;
      
      public function SendPresentEvent(_arg_1:String, _arg_2:String, _arg_3:String)
      {
         super(_arg_1);
         this.uid = _arg_2;
         this.text = _arg_3;
      }
   }
}

