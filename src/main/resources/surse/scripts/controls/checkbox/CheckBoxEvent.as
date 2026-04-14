package controls.checkbox
{
   import flash.events.Event;
   
   public class CheckBoxEvent extends Event
   {
      
      public static const STATE_CHANGED:String = "CheckBoxStateChangeEvent";
      
      public function CheckBoxEvent(_arg_1:String)
      {
         super(_arg_1);
      }
   }
}

