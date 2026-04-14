package alternativa.tanks.loader.stylishdishonestprogressbar
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   
   public class StylishDishonestProgressBar extends Sprite
   {
      
      private static const progressLineClass:Class = StylishDishonestProgressBar_progressLineClass;
      
      private static const rightGlowClass:Class = StylishDishonestProgressBar_rightGlowClass;
      
      private static const DEFAULT_HEIGHT:int = 58;
      
      private var _progressLine:Bitmap;
      
      private var _rightGlow:Bitmap;
      
      private var _complete:Function;
      
      private var _timeOutComplete:int;
      
      private var _frameTime:int;
      
      private var _stage:Stage;
      
      private var _progress:Number = 0;
      
      private var _speed:Number = 1;
      
      private var _isFinish:Boolean = false;
      
      public function StylishDishonestProgressBar(_arg_1:Function)
      {
         super();
         this._complete = _arg_1;
         this.init();
      }
      
      private function init() : void
      {
         var _local_1:IDisplay = IDisplay(OSGi.getInstance().getService(IDisplay));
         this._stage = _local_1.stage;
         this._progressLine = new progressLineClass();
         this._progressLine.height = DEFAULT_HEIGHT;
         this._rightGlow = new rightGlowClass();
         this._rightGlow.height = DEFAULT_HEIGHT;
         addChild(this._progressLine);
         addChild(this._rightGlow);
      }
      
      public function start() : void
      {
         this._isFinish = false;
         clearTimeout(this._timeOutComplete);
         addEventListener(Event.RESIZE,this.onResize);
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onResize(_arg_1:Event) : void
      {
         this.setPercentWidth(this._progress);
      }
      
      private function onEnterFrame(_arg_1:Event) : void
      {
         if(this._isFinish)
         {
            this.onCompleted();
            return;
         }
         if(getTimer() - this._frameTime < 5)
         {
            return;
         }
         this._frameTime = getTimer();
         this._progress += this._speed;
         if(this._progress >= 100)
         {
            this._progress = 50;
            this._speed /= 2;
         }
         this.setPercentWidth(this._progress);
      }
      
      private function setPercentWidth(_arg_1:Number) : void
      {
         var _local_2:Number = _arg_1 * (this._stage.stageWidth / 100);
         this._progressLine.width = _local_2;
         this._rightGlow.x = _local_2;
      }
      
      private function onCompleted() : void
      {
         this._complete.apply();
      }
      
      public function forciblyFinish() : void
      {
         this.forciblyStop();
      }
      
      public function forciblyStop() : void
      {
         this._isFinish = true;
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         removeEventListener(Event.RESIZE,this.onResize);
         clearTimeout(this._timeOutComplete);
      }
   }
}

