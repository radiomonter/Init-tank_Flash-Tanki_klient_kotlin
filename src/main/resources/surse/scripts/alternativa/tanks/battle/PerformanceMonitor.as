package alternativa.tanks.battle
{
   import flash.utils.getTimer;
   
   public class PerformanceMonitor
   {
      
      private var zihygun:int;
      
      private var boji:int;
      
      private var fykyk:int;
      
      private var vudy:Number = 0;
      
      private var hunas:int;
      
      private var frameCounter:int;
      
      private var wyfejew:int;
      
      public function PerformanceMonitor(_arg_1:int)
      {
         super();
         this.zihygun = _arg_1;
         this.reset();
      }
      
      public function decen() : void
      {
         this.hunas = getTimer();
      }
      
      public function gukyz() : void
      {
         var _local_1:int = getTimer() - this.hunas;
         this.wyfejew += _local_1;
         this.weqode(_local_1);
         if(++this.frameCounter >= this.zihygun)
         {
            this.vudy = this.wyfejew / this.frameCounter;
            this.wyfejew = 0;
            this.frameCounter = 0;
         }
      }
      
      public function dyvij() : Number
      {
         return this.vudy;
      }
      
      public function hiwucoca() : Number
      {
         return 1000 / this.vudy;
      }
      
      private function weqode(_arg_1:int) : void
      {
         if(_arg_1 > this.fykyk)
         {
            this.fykyk = _arg_1;
         }
         else if(_arg_1 < this.boji)
         {
            this.boji = _arg_1;
         }
      }
      
      public function reset() : void
      {
         this.boji = 0;
         this.fykyk = 0;
         this.vudy = 0;
         this.frameCounter = 0;
         this.wyfejew = 0;
      }
   }
}

