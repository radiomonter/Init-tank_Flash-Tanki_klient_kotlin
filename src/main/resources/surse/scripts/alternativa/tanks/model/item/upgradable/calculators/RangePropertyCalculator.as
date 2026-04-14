package alternativa.tanks.model.item.upgradable.calculators
{
   public class RangePropertyCalculator implements IGaragePropertyCalculator
   {
      
      private var minValue:GaragePropertyCalculator;
      
      private var maxValue:GaragePropertyCalculator;
      
      public function RangePropertyCalculator(_arg_1:GaragePropertyCalculator, _arg_2:GaragePropertyCalculator)
      {
         super();
         if(_arg_1.getNumberValue(0) < _arg_2.getNumberValue(0))
         {
            this.minValue = _arg_1;
            this.maxValue = _arg_2;
         }
         else
         {
            this.minValue = _arg_2;
            this.maxValue = _arg_1;
         }
         this.minValue.setPrecision(this.maxValue.getPrecision());
      }
      
      public function getValue(_arg_1:int) : String
      {
         return this.minValue.getValue(_arg_1) + "-" + this.maxValue.getValue(_arg_1);
      }
      
      public function getDelta(_arg_1:int) : String
      {
         return this.maxValue.getDelta(_arg_1);
      }
      
      public function getPrecision() : int
      {
         return this.maxValue.getPrecision();
      }
      
      public function setPrecision(_arg_1:int) : void
      {
         this.minValue.setPrecision(_arg_1);
         this.maxValue.setPrecision(_arg_1);
      }
   }
}

