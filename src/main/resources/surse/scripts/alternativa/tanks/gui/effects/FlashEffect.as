package alternativa.tanks.gui.effects
{
   import alternativa.tanks.service.fps.FPSService;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.ColorTransform;
   
   public class FlashEffect extends EventDispatcher
   {
      
      [Inject]
      public static var fpsService:FPSService;
      
      private const EFFECT_TIME:Number = 1.25;
      
      private var numFrames:int;
      
      private var A:Number;
      
      private var frame:int;
      
      private var target:DisplayObject;
      
      public function FlashEffect()
      {
         super();
      }
      
      public static function flash(_arg_1:DisplayObject) : void
      {
         var _local_2:FlashEffect = new FlashEffect();
         _local_2.flash(_arg_1);
      }
      
      public function flash(_arg_1:DisplayObject) : void
      {
         this.numFrames = Math.ceil(fpsService.tabu() * this.EFFECT_TIME);
         this.A = 4 / (this.numFrames * this.numFrames);
         this.target = _arg_1;
         _arg_1.addEventListener(Event.ENTER_FRAME,this.onFrame);
         this.frame = 0;
      }
      
      private function onFrame(_arg_1:Event) : void
      {
         ++this.frame;
         if(this.frame == this.numFrames)
         {
            this.stop();
            dispatchEvent(new Event(Event.COMPLETE));
            return;
         }
         var _local_2:Number = 1 - this.A * (this.frame * (this.frame - this.numFrames));
         this.setTransform(this.target,_local_2);
      }
      
      public function stop() : void
      {
         if(this.target != null)
         {
            this.setTransform(this.target,1);
            this.target.removeEventListener(Event.ENTER_FRAME,this.onFrame);
            this.target = null;
         }
      }
      
      private function setTransform(_arg_1:DisplayObject, _arg_2:Number) : void
      {
         _arg_1.transform.colorTransform = new ColorTransform(_arg_2,_arg_2,_arg_2);
      }
   }
}

