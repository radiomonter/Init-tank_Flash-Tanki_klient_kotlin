package alternativa.tanks.gui.effects
{
   import alternativa.tanks.service.fps.FPSService;
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class BlinkEffect
   {
      
      [Inject]
      public static var fpsService:FPSService;
      
      private var state:int;
      
      private var displayObject:DisplayObject;
      
      private var cuqizuhuz:Number = 0.15;
      
      private var pekag:Number = 0.3;
      
      public function BlinkEffect(_arg_1:Number = 0.15, _arg_2:Number = 0.3)
      {
         super();
         this.cuqizuhuz = _arg_1;
         this.pekag = _arg_2;
      }
      
      public function start(_arg_1:DisplayObject) : void
      {
         this.stop();
         this.displayObject = _arg_1;
         this.state = 0;
         _arg_1.alpha = 1;
         _arg_1.addEventListener(Event.ENTER_FRAME,this.onFrame);
      }
      
      public function stop() : void
      {
         if(this.displayObject != null)
         {
            this.displayObject.removeEventListener(Event.ENTER_FRAME,this.onFrame);
            this.displayObject.alpha = 1;
            this.displayObject = null;
         }
      }
      
      private function onFrame(_arg_1:Event) : void
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         _local_2 = Math.ceil(this.cuqizuhuz * fpsService.tabu());
         _local_3 = Math.ceil(this.pekag * fpsService.tabu());
         ++this.state;
         if(this.state < _local_2)
         {
            this.displayObject.alpha = 1;
         }
         else if(this.state < _local_2 + _local_3)
         {
            this.displayObject.alpha = 1 - (this.state - _local_2) / _local_3;
         }
         else if(this.state < _local_2 + _local_3 + _local_2)
         {
            this.displayObject.alpha = 0;
         }
         else if(this.state < _local_2 + _local_3 + _local_2 + _local_3)
         {
            this.displayObject.alpha = (this.state - _local_2 - _local_3 - _local_2) / _local_3;
         }
         else
         {
            this.displayObject.alpha = 1;
            this.state = 0;
         }
      }
   }
}

