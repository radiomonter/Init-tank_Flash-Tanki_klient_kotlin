package alternativa.tanks.model.item.upgradable
{
   import alternativa.tanks.model.item.properties.ItemPropertyValue;
   import alternativa.tanks.model.item.upgradable.calculators.GaragePropertyCalculator;
   import alternativa.tanks.model.item.upgradable.calculators.IGaragePropertyCalculator;
   import alternativa.tanks.model.item.upgradable.calculators.RangePropertyCalculator;
   import alternativa.tanks.model.item.upgradable.calculators.UpgradeLinearCalculator;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.item.upgradable.speedup.SpeedUpCostCalculatorService;
   import alternativa.tanks.service.itempropertyparams.Bekipudi;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import alternativa.tanks.service.itempropertyparams.Sycykeqi;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.client.garage.models.item.properties.ItemProperty;
   import projects.tanks.client.garage.models.item.upgradeable.types.GaragePropertyData;
   import projects.tanks.client.garage.models.item.upgradeable.types.PropertyData;
   
   public class UpgradableItemPropertyValue implements ItemPropertyValue
   {
      
      [Inject]
      public static var propertyParamsService:ItemPropertyParamsService;
      
      [Inject]
      public static var speedUpCostCalculator:SpeedUpCostCalculatorService;
      
      [Inject]
      public static var itemService:ItemService;
      
      private static const MAX_SALE:Number = 0.75;
      
      private var data:GaragePropertyData;
      
      private var costCalculator:UpgradeLinearCalculator;
      
      private var timeCalculator:UpgradeLinearCalculator;
      
      private var valueCalculator:IGaragePropertyCalculator;
      
      private var isDiscountForNextModification:Boolean;
      
      public function UpgradableItemPropertyValue(_arg_1:GaragePropertyData, _arg_2:Boolean)
      {
         var _local_3:Bekipudi = null;
         var _local_4:PropertyData = null;
         var _local_5:Vector.<GaragePropertyCalculator> = null;
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         super();
         this.data = _arg_1;
         this.costCalculator = new UpgradeLinearCalculator(_arg_1.costParams);
         this.timeCalculator = new UpgradeLinearCalculator(_arg_1.timeParams);
         this.isDiscountForNextModification = _arg_2;
         _local_3 = propertyParamsService.getParams(_arg_1.property);
         var _local_9:Vector.<ItemProperty> = _local_3.getProperties();
         switch(_local_3.joku())
         {
            case Sycykeqi.hysonifyg:
               _local_5 = new Vector.<GaragePropertyCalculator>();
               for each(_local_4 in _arg_1.properties)
               {
                  if(_local_9.indexOf(_local_4.property) != -1)
                  {
                     _local_5.push(new GaragePropertyCalculator(_local_4.initialValue,_local_4.finalValue,this.data.maxLevel));
                  }
               }
               if(_local_5.length != 2)
               {
                  throw new Error("Unexpected number subproperties: property=" + this.data.property + ";valueCalculators=" + _local_5);
               }
               this.valueCalculator = new RangePropertyCalculator(_local_5[0],_local_5[1]);
               return;
               break;
            case Sycykeqi.cogij:
               _local_6 = 0;
               _local_7 = 0;
               for each(_local_4 in _arg_1.properties)
               {
                  if(_local_9.indexOf(_local_4.property) != -1)
                  {
                     _local_6 += _local_4.initialValue;
                     _local_7 += _local_4.finalValue;
                  }
               }
               _local_8 = _local_3.bapycibu();
               _local_6 *= _local_8;
               _local_7 *= _local_8;
               this.valueCalculator = new GaragePropertyCalculator(_local_6,_local_7,this.data.maxLevel);
         }
      }
      
      public function isUpgradable() : Boolean
      {
         return true;
      }
      
      public function getUpgradableValue() : UpgradableItemPropertyValue
      {
         return this;
      }
      
      public function getCost() : int
      {
         var _local_1:int = this.costCalculator.calculate(this.data.level);
         return this.evaluateValueWithDiscount(_local_1,this.data.upgradeDiscount);
      }
      
      public function getTimeInSeconds() : int
      {
         return this.evaluateValueWithDiscount(this.getTimeWithoutDiscountInMinutes() * 60,this.data.timeDiscount);
      }
      
      private function getTimeWithoutDiscountInMinutes() : int
      {
         return this.timeCalculator.calculate(this.data.level);
      }
      
      public function getSpeedUpCost() : int
      {
         return speedUpCostCalculator.calculate(this.getTimeWithoutDiscountInMinutes(),this.data.speedUpDiscount);
      }
      
      public function getValue() : String
      {
         return this.valueCalculator.getValue(this.data.level);
      }
      
      public function getProperty() : ItemGarageProperty
      {
         return this.data.property;
      }
      
      public function getLevel() : int
      {
         return this.data.level;
      }
      
      public function getMaxLevel() : int
      {
         return this.data.maxLevel;
      }
      
      public function isFullUpgraded() : Boolean
      {
         return this.data.level == this.data.maxLevel;
      }
      
      public function getDiscount() : Number
      {
         if(this.isDiscountForNextModification && this.isFullUpgraded())
         {
            return this.data.importance * MAX_SALE;
         }
         return 0;
      }
      
      public function incrementLevel() : void
      {
         ++this.data.level;
      }
      
      public function getNextValue() : String
      {
         return this.valueCalculator.getValue(this.data.level + 1);
      }
      
      public function getDelta() : String
      {
         return this.valueCalculator.getDelta(this.data.level);
      }
      
      public function getPrecision() : int
      {
         return this.valueCalculator.getPrecision();
      }
      
      public function setPrecision(_arg_1:int) : void
      {
         this.valueCalculator.setPrecision(_arg_1);
      }
      
      private function evaluateValueWithDiscount(_arg_1:int, _arg_2:int) : int
      {
         return _arg_1 * (100 - _arg_2) * 0.01 + 0.001;
      }
      
      public function traceUpgrades() : void
      {
         var _local_1:int = 0;
         var _local_2:int = 0;
         while(_local_2 < this.getMaxLevel())
         {
            _local_1 = this.timeCalculator.calculate(_local_2);
            _local_2++;
         }
      }
   }
}

