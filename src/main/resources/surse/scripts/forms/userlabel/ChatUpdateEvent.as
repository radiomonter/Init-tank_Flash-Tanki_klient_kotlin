package forms.userlabel
{
   import flash.events.Event;
   
   public class ChatUpdateEvent extends Event
   {
      
      public static const UPDATE:String = "ChatUpdateEvent.UPDATE";
      
      public function ChatUpdateEvent(_arg_1:String, _arg_2:Boolean = false, _arg_3:Boolean = false)
      {
         super(_arg_1,_arg_2,_arg_3);
      }
   }
}

