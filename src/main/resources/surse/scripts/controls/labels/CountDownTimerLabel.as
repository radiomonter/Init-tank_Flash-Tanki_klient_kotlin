package controls.labels
{
   import controls.timer.CountDownTimer;
   import controls.timer.CountDownTimerOnCompleteBefore;
   import controls.timer.CountDownTimerOnTick;
   import flash.events.Event;
   import utils.TimeFormatter;
   
   public class CountDownTimerLabel extends MouseDisabledLabel implements CountDownTimerOnTick, CountDownTimerOnCompleteBefore
   {
      
      private var timer:CountDownTimer = null;
      
      public function CountDownTimerLabel()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAdded);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoved);
      }
      
      private static function formatTime(_arg_1:int) : String
      {
         if(_arg_1 <= 0)
         {
            return "";
         }
         return TimeFormatter.format(_arg_1);
      }
      
      public function start(_arg_1:CountDownTimer) : void
      {
         this.stop();
         this.timer = _arg_1;
         if(stage != null)
         {
            this.addListeners();
         }
         this.onTick(_arg_1);
      }
      
      public function stop() : void
      {
         if(this.timer != null)
         {
            if(stage != null)
            {
               this.removeListeners();
            }
            this.timer = null;
            text = "";
         }
      }
      
      public function onTick(_arg_1:CountDownTimer) : void
      {
         text = formatTime(_arg_1.getRemainingSeconds());
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function onCompleteBefore(_arg_1:CountDownTimer, _arg_2:Boolean) : void
      {
         if(_arg_1 == this.timer)
         {
            this.timer = null;
            text = "";
         }
      }
      
      public function getCountDownTimer() : CountDownTimer
      {
         return this.timer;
      }
      
      private function addListeners() : void
      {
         this.timer.addListener(CountDownTimerOnTick,this);
         this.timer.addListener(CountDownTimerOnCompleteBefore,this);
      }
      
      private function removeListeners() : void
      {
         this.timer.removeListener(CountDownTimerOnTick,this);
         this.timer.removeListener(CountDownTimerOnCompleteBefore,this);
      }
      
      private function onRemoved(_arg_1:Event) : void
      {
         if(this.timer != null)
         {
            this.removeListeners();
         }
      }
      
      private function onAdded(_arg_1:Event) : void
      {
         if(this.timer != null)
         {
            this.addListeners();
            this.onTick(this.timer);
         }
      }
   }
}

