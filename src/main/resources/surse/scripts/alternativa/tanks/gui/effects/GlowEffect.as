package alternativa.tanks.gui.effects
{
   import alternativa.tanks.service.fps.FPSService;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.filters.GlowFilter;
   
   public class GlowEffect extends EventDispatcher
   {
      
      [Inject]
      public static var fpsService:FPSService;
      
      private var glowAlpha:Number;
      
      private var glowColor:int;
      
      private var glowDelta:Number;
      
      private var EFFECT_TIME:Number = 1.25;
      
      public function GlowEffect()
      {
         super();
      }
      
      public static function glow(_arg_1:DisplayObject, _arg_2:uint) : void
      {
         var _local_3:GlowEffect = new GlowEffect();
         _local_3.glow(_arg_1,_arg_2);
      }
      
      public function glow(_arg_1:DisplayObject, _arg_2:uint) : void
      {
         this.glowAlpha = _arg_1.alpha;
         this.glowColor = _arg_2;
         this.glowDelta = 1 / (this.EFFECT_TIME * fpsService.tabu());
         _arg_1.addEventListener(Event.ENTER_FRAME,this.glowFrame);
      }
      
      private function glowFrame(_arg_1:Event) : void
      {
         var _local_2:DisplayObject = _arg_1.target as DisplayObject;
         var _local_3:GlowFilter = new GlowFilter(this.glowColor,this.glowAlpha,6,6,4,1,false);
         _local_2.filters = [_local_3];
         this.glowAlpha -= this.glowDelta;
         if(this.glowAlpha < 0)
         {
            _local_2.filters = [];
            _local_2.removeEventListener(Event.ENTER_FRAME,this.glowFrame);
            dispatchEvent(new Event(Event.COMPLETE));
         }
      }
   }
}

