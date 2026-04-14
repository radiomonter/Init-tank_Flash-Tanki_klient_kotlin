package alternativa.tanks.model.item.upgradable.calculators
{
   public class GaragePropertyCalculator implements IGaragePropertyCalculator
   {
      
      private const LN_2:Number;
      
      private var initialValue:Number;
      
      private var finalValue:Number;
      
      private var maxLevel:int;
      
      private var precision:int;
      
      private var factor:Number;
      
      private var maxWeight:Number;
      
      public function GaragePropertyCalculator(_arg_1:Number, _arg_2:Number, _arg_3:int)
      {
         var _local_5:Boolean = false;
         var _local_6:String = null;
         var _local_7:int = 0;
         this.LN_2 = Math.log(2);
         var _local_4:Number = NaN;
         var _local_8:Number = 0;
         super();
         this.initialValue = _arg_1;
         this.finalValue = _arg_2;
         this.maxLevel = _arg_3;
         this.precision = 0;
         this.factor = 1;
         if(_arg_3 > 0)
         {
            this.maxWeight = this.weight(_arg_3);
            _local_4 = Math.abs(this.calculate(_arg_3) - this.calculate(_arg_3 - 1));
            this.precision = Math.ceil(-Math.log(_local_4) / Math.log(10));
            if(this.precision < 0)
            {
               this.precision = 0;
            }
            this.factor = Math.pow(10,-this.precision);
            if(this.precision > 0)
            {
               --this.precision;
               this.factor *= 10;
               _local_5 = true;
               _local_6 = "+" + _arg_1.toFixed(this.precision);
               _local_7 = 0;
               while(_local_7 < _arg_3)
               {
                  if(this.getDelta(_local_7) == _local_6)
                  {
                     _local_5 = false;
                     break;
                  }
                  _local_7++;
               }
               if(!_local_5)
               {
                  ++this.precision;
                  this.factor *= 0.1;
               }
            }
         }
      }
      
      public function getValue(_arg_1:int) : String
      {
         var _local_2:Number = this.getRoundValue(_arg_1);
         return this.valueToString(_local_2);
      }
      
      public function getNumberValue(_arg_1:int) : Number
      {
         return this.calculate(_arg_1);
      }
      
      public function getDelta(_arg_1:int) : String
      {
         var _local_2:String = null;
         var _local_3:Number = this.round(this.getRoundValue(_arg_1 + 1) - this.getRoundValue(_arg_1));
         if(_local_3 < 0)
         {
            _local_2 = "−";
            _local_3 = -_local_3;
         }
         else
         {
            _local_2 = "+";
         }
         return _local_2 + this.valueToString(_local_3);
      }
      
      private function valueToString(_arg_1:Number) : String
      {
         return String(_arg_1);
      }
      
      private function getRoundValue(_arg_1:int) : Number
      {
         return this.calculate(_arg_1);
      }
      
      private function calculate(_arg_1:int) : Number
      {
         if(_arg_1 == 0)
         {
            return this.initialValue;
         }
         return this.initialValue + this.weight(_arg_1) * (this.finalValue - this.initialValue) / this.maxWeight;
      }
      
      private function round(_arg_1:Number) : Number
      {
         return Math.round(_arg_1 / this.factor) * this.factor;
      }
      
      private function weight(_arg_1:int) : Number
      {
         return Math.log(_arg_1 + 1) / this.LN_2 + _arg_1 * 5 / this.maxLevel;
      }
      
      public function getPrecision() : int
      {
         return this.precision;
      }
      
      public function setPrecision(_arg_1:int) : void
      {
         this.precision = _arg_1;
         this.factor = Math.pow(10,-this.precision);
      }
   }
}

