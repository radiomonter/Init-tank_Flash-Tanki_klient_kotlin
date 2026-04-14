package alternativa.tanks.gui.buttons
{
   import flash.events.Event;
   
   public class TimerButtonEvent extends Event
   {
      
      public static const wopim:String = "TimerButtonEventTimeOnCompleteTimerButton";
      
      public function TimerButtonEvent(_arg_1:String, _arg_2:Boolean = false, _arg_3:Boolean = false)
      {
         super(_arg_1,_arg_2,_arg_3);
      }
   }
}

