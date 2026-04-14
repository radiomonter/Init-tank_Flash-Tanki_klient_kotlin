package alternativa.tanks.model.item.discount
{
   import alternativa.tanks.service.garage.GarageService;
   import controls.timer.CountDownTimer;
   import controls.timer.CountDownTimerOnCompleteBefore;
   import controls.timer.CountDownTimerOnCompleteBeforeWithContext;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.garage.models.item.discount.DiscountCC;
   import projects.tanks.client.garage.models.item.discount.DiscountModelBase;
   import projects.tanks.client.garage.models.item.discount.IDiscountModelBase;
   
   public class DiscountModel extends DiscountModelBase implements IDiscountModelBase, ICollectDiscount, ObjectLoadPostListener, ObjectUnloadListener, CountDownTimerOnCompleteBefore
   {
      
      [Inject]
      public static var garageService:GarageService;
      
      private const SECONDS_IN_MONTH:uint = 2592000;
      
      private const SECOND_MS:int = 1000;
      
      public function DiscountModel()
      {
         super();
      }
      
      public function objectLoadedPost() : void
      {
         this.initDiscountInfo();
         this.scheduleEndDiscount();
         this.scheduleNextStartDiscount();
      }
      
      private function initDiscountInfo() : void
      {
         var _local_3:uint = 0;
         var _local_1:DiscountCC = getInitParam();
         if(_local_1 == null || _local_1.discount == 0 || _local_1.timeToStartInSeconds > this.SECONDS_IN_MONTH)
         {
            putData(DiscountInfo,DiscountInfo.NO_DISCOUNT);
            return;
         }
         var _local_2:uint = uint(getTimer());
         if(_local_1.timeToStartInSeconds > 0)
         {
            _local_3 = _local_2 + _local_1.timeToStartInSeconds * this.SECOND_MS;
         }
         var _local_4:uint = uint.MAX_VALUE;
         if(_local_1.timeLeftInSeconds > 0 && _local_1.timeLeftInSeconds < this.SECONDS_IN_MONTH)
         {
            _local_4 = _local_2 + _local_1.timeLeftInSeconds * this.SECOND_MS;
         }
         putData(DiscountInfo,new DiscountInfo(_local_1.discount,_local_3,_local_4));
      }
      
      private function scheduleEndDiscount() : void
      {
         var _local_1:DiscountInfo = null;
         var _local_2:CountDownTimer = null;
         this.destroyEndDiscountTimer();
         var _local_3:uint = uint.MAX_VALUE;
         var _local_4:int = getTimer();
         var _local_5:DiscountCollector = new DiscountCollector();
         ICollectDiscount(object.event(ICollectDiscount)).collectDiscountsInfo(_local_5);
         for each(_local_1 in _local_5.getDiscountInfoes())
         {
            if(_local_1.isDiscountTime(_local_4))
            {
               _local_3 = Math.min(_local_3,_local_1.getEndTime());
            }
         }
         if(_local_3 != uint.MAX_VALUE)
         {
            _local_2 = new CountDownTimer();
            _local_2.start(_local_3);
            _local_2.addListener(CountDownTimerOnCompleteBefore,new CountDownTimerOnCompleteBeforeWithContext(object,this));
            putData(CountDownTimer,_local_2);
         }
      }
      
      private function destroyEndDiscountTimer() : void
      {
         var _local_1:CountDownTimer = CountDownTimer(getData(CountDownTimer));
         if(_local_1 != null)
         {
            _local_1.destroy();
            clearData(CountDownTimer);
         }
      }
      
      public function onCompleteBefore(_arg_1:CountDownTimer, _arg_2:Boolean) : void
      {
         this.scheduleEndDiscount();
         this.updateDiscount();
      }
      
      private function scheduleNextStartDiscount() : void
      {
         var _local_1:DiscountInfo = null;
         var _local_2:uint = 0;
         var _local_3:uint = uint.MAX_VALUE;
         var _local_4:int = getTimer();
         var _local_5:DiscountCollector = new DiscountCollector();
         ICollectDiscount(object.event(ICollectDiscount)).collectDiscountsInfo(_local_5);
         for each(_local_1 in _local_5.getDiscountInfoes())
         {
            if(_local_4 < _local_1.getBeginTime())
            {
               _local_3 = Math.min(_local_3,_local_1.getBeginTime());
            }
         }
         if(_local_3 != uint.MAX_VALUE)
         {
            _local_2 = setTimeout(getFunctionWrapper(this.startDiscount),_local_3 - _local_4);
            putData(uint,_local_2);
         }
      }
      
      private function startDiscount() : void
      {
         clearData(uint);
         this.scheduleEndDiscount();
         this.updateDiscount();
         this.scheduleNextStartDiscount();
      }
      
      private function updateDiscount() : void
      {
         garageService.tolycavu().updateDiscount(object);
      }
      
      public function objectUnloaded() : void
      {
         var _local_1:Object = getData(uint);
         if(_local_1 != null)
         {
            clearTimeout(uint(_local_1));
         }
      }
      
      public function collectDiscountsInfo(_arg_1:IDiscountCollector) : void
      {
         _arg_1.addDiscount(DiscountInfo(getData(DiscountInfo)));
      }
   }
}

