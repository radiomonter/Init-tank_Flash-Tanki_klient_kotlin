package alternativa.tanks.service.fps
{
   import alternativa.osgi.service.display.IDisplay;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class Qyficequ implements FPSService
   {
      
      [Inject]
      public static var lorunar:IDisplay;
      
      private var fps:Number;
      
      private var gamyqok:Number;
      
      private var lastTime:int;
      
      private var numFrames:int;
      
      private var qegug:Boolean;
      
      private var boritaqah:Boolean;
      
      public function Qyficequ()
      {
         super();
      }
      
      public function start() : void
      {
         this.jiquto(lorunar.stage.frameRate);
         lorunar.stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         lorunar.stage.addEventListener(Event.DEACTIVATE,this.paru);
         this.qegug = false;
         this.boritaqah = true;
      }
      
      private function peg(_arg_1:Event) : void
      {
         if(_arg_1.target == lorunar.stage)
         {
            lorunar.stage.removeEventListener(Event.ACTIVATE,this.peg);
            this.qegug = false;
            this.boritaqah = true;
         }
      }
      
      private function paru(_arg_1:Event) : void
      {
         if(_arg_1.target == lorunar.stage)
         {
            lorunar.stage.addEventListener(Event.ACTIVATE,this.peg);
            this.qegug = true;
         }
      }
      
      private function onEnterFrame(_arg_1:Event) : void
      {
         if(this.qegug)
         {
            return;
         }
         if(this.boritaqah)
         {
            this.lastTime = getTimer();
            this.numFrames = 0;
            this.boritaqah = false;
            return;
         }
         var _local_2:int = getTimer();
         ++this.numFrames;
         if(_local_2 - this.lastTime > 2000)
         {
            this.jiquto(1000 * this.numFrames / (_local_2 - this.lastTime));
            this.lastTime = _local_2;
            this.numFrames = 0;
         }
      }
      
      private function jiquto(_arg_1:Number) : void
      {
         this.fps = _arg_1;
         this.gamyqok = 1000 / _arg_1;
      }
      
      public function tabu() : Number
      {
         return this.fps;
      }
      
      public function kedozop() : Number
      {
         return this.gamyqok;
      }
   }
}

