package alternativa.tanks.battle
{
   import flash.utils.getTimer;
   
   public class FPSCounter
   {
      
      private var zihygun:int;
      
      private var lastTime:int;
      
      private var frameCounter:int;
      
      private var fps:Number = 0;
      
      public function FPSCounter(_arg_1:int)
      {
         super();
         this.zihygun = _arg_1;
         this.lastTime = getTimer();
      }
      
      public function update() : void
      {
         var _local_1:int = 0;
         var _local_2:int = 0;
         if(++this.frameCounter >= this.zihygun)
         {
            _local_1 = getTimer();
            _local_2 = _local_1 - this.lastTime;
            this.lastTime = _local_1;
            this.fps = 1000 * this.frameCounter / _local_2;
            this.frameCounter = 0;
         }
      }
      
      public function ruji() : Number
      {
         return this.fps;
      }
   }
}

