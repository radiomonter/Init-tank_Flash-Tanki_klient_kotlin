package alternativa.tanks.model.item.discount
{
   import flash.utils.getTimer;
   
   public class DiscountInfo
   {
      
      public static const NO_DISCOUNT:DiscountInfo = new DiscountInfo(0,0,0);
      
      public static const FULL_DISCOUNT:DiscountInfo = new DiscountInfo(100);
      
      private var discountInPercent:int;
      
      private var beginTime:uint;
      
      private var endTime:uint;
      
      public function DiscountInfo(_arg_1:int, _arg_2:uint = 0, _arg_3:uint = 4294967295)
      {
         super();
         if(getTimer() > _arg_3)
         {
            _arg_1 = 0;
            _arg_2 = 0;
            _arg_3 = 0;
            return;
         }
         this.discountInPercent = _arg_1;
         this.beginTime = _arg_2;
         this.endTime = _arg_3;
      }
      
      public function getDiscountInPercent() : int
      {
         return this.discountInPercent;
      }
      
      public function getBeginTime() : uint
      {
         return this.beginTime;
      }
      
      public function getEndTime() : uint
      {
         return this.endTime;
      }
      
      public function isDiscountTime(_arg_1:uint) : Boolean
      {
         return this.beginTime <= _arg_1 && _arg_1 < this.endTime;
      }
      
      public function hasDiscount() : Boolean
      {
         return this.discountInPercent > 0;
      }
   }
}

