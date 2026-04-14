package forms.events
{
   import flash.events.Event;
   
   public class ChatFormEvent extends Event
   {
      
      public static const SEND_MESSAGE:String = "SendMessage";
      
      public var rangTo:int;
      
      public var nameTo:String;
      
      public function ChatFormEvent(_arg_1:int = 0, _arg_2:String = "")
      {
         this.rangTo = _arg_1;
         this.nameTo = _arg_2;
         super(SEND_MESSAGE,true,false);
      }
   }
}

