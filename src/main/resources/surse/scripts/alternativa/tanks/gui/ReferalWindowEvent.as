package alternativa.tanks.gui
{
   import flash.events.Event;
   
   public class ReferalWindowEvent extends Event
   {
      
      public static const SEND_MAIL:String = "ReferalWindowEventSendMail";
      
      public var adresses:String;
      
      public var letterText:String;
      
      public function ReferalWindowEvent(_arg_1:String, _arg_2:String = "", _arg_3:String = "")
      {
         super(_arg_1);
         this.adresses = _arg_2;
         this.letterText = _arg_3;
      }
   }
}

