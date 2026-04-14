package alternativa.tanks.model.item.discount
{
   import alternativa.osgi.OSGi;
   import controls.timer.CountDownTimer;
   import flash.utils.getTimer;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.garage.models.item.discount.DiscountCollectorModelBase;
   import projects.tanks.client.garage.models.item.discount.IDiscountCollectorModelBase;
   import projects.tanks.client.garage.models.item.discount.IDiscountModelBase;
   
   public class DiscountCollectorModel extends DiscountCollectorModelBase implements IDiscountCollectorModelBase, IDiscount
   {
      
      public function DiscountCollectorModel()
      {
         super();
      }
      
      public function getDiscountInPercent() : int
      {
         var _local_1:Number = this.getDiscount();
         return _local_1 * 100 + 0.0001;
      }
      
      public function applyDiscount(_arg_1:int) : int
      {
         var _local_2:DiscountInfo = null;
         var _local_3:int = 0;
         var _local_4:int = getTimer();
         var _local_5:Vector.<int> = new Vector.<int>();
         var _local_6:DiscountCollector = new DiscountCollector();
         ICollectDiscount(object.event(ICollectDiscount)).collectDiscountsInfo(_local_6);
         for each(_local_2 in _local_6.getDiscountInfoes())
         {
            if(_local_2.hasDiscount() && _local_2.isDiscountTime(_local_4))
            {
               _local_5.push(_local_2.getDiscountInPercent());
            }
         }
         _local_5.sort(Array.NUMERIC);
         for each(_local_3 in _local_5)
         {
            _arg_1 = int(int(_arg_1 * (100 - _local_3) / 100 + 0.001));
         }
         return _arg_1;
      }
      
      public function getEndDiscountTimer() : CountDownTimer
      {
         return CountDownTimer(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModelForObject(object,IDiscountModelBase).getData(CountDownTimer));
      }
      
      private function getDiscount() : Number
      {
         var _local_1:DiscountInfo = null;
         var _local_2:Number = 0;
         var _local_3:int = getTimer();
         var _local_4:DiscountCollector = new DiscountCollector();
         ICollectDiscount(object.event(ICollectDiscount)).collectDiscountsInfo(_local_4);
         for each(_local_1 in _local_4.getDiscountInfoes())
         {
            if(_local_1.isDiscountTime(_local_3))
            {
               _local_2 = 1 - (1 - _local_2) * (1 - _local_1.getDiscountInPercent() * 0.01);
            }
         }
         return _local_2;
      }
   }
}

