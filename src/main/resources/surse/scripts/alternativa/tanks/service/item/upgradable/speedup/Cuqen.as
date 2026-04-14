package alternativa.tanks.service.item.upgradable.speedup
{
   public class Cuqen implements SpeedUpCostCalculatorService
   {
      
      private var juva:Number;
      
      public function Cuqen()
      {
         super();
      }
      
      public function calculate(_arg_1:int, _arg_2:int) : int
      {
         var _local_3:Number = Math.round(_arg_1 * (1 + this.juva / Math.log(_arg_1 + 10)) * 0.5);
         return this.evaluateValueWithDiscount(_local_3,_arg_2);
      }
      
      public function init(_arg_1:Number) : void
      {
         this.juva = _arg_1 * Math.log(10);
      }
      
      private function evaluateValueWithDiscount(_arg_1:int, _arg_2:int) : int
      {
         return _arg_1 * (100 - _arg_2) * 0.01 + 0.001;
      }
   }
}

