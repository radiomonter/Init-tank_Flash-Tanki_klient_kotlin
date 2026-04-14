package alternativa.tanks.model.item.upgradable.calculators
{
   import projects.tanks.client.garage.models.item.upgradeable.calculators.LinearParams;
   
   public class UpgradeLinearCalculator
   {
      
      private var params:LinearParams;
      
      public function UpgradeLinearCalculator(_arg_1:LinearParams)
      {
         super();
         this.params = _arg_1;
      }
      
      public function calculate(_arg_1:int) : int
      {
         return Math.round(this.params.initialValue + this.params.step * _arg_1);
      }
   }
}

