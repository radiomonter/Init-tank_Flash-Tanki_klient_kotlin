package alternativa.tanks.service.temporaryitem
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Calytyza extends EventDispatcher
   {
      
      private var _item:IGameObject;
      
      private var _timer:Timer;
      
      private var cegu:Number;
      
      private var _remainingTimeInSec:int;
      
      public function Calytyza(_arg_1:IGameObject, _arg_2:int)
      {
         super();
         this._item = _arg_1;
         this._remainingTimeInSec = _arg_2;
         this.cegu = getTimer();
         this._timer = new Timer(1000);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._timer.start();
      }
      
      private function onTimer(_arg_1:TimerEvent) : void
      {
         var _local_2:int = int((getTimer() - this.cegu) / 1000);
         if(_local_2 > this._remainingTimeInSec)
         {
            dispatchEvent(new Event(Event.COMPLETE));
            this._timer.stop();
            this.destroy();
         }
      }
      
      public function destroy() : void
      {
         if(this._timer != null)
         {
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer.stop();
            this._timer = null;
         }
      }
      
      public function get item() : IGameObject
      {
         return this._item;
      }
      
      public function get dacok() : Number
      {
         return this._remainingTimeInSec * 1000 - (getTimer() - this.cegu);
      }
   }
}

