package alternativa.tanks.model.item.discount
{
   public class DiscountCollector implements IDiscountCollector
   {
      
      private var discounts:Vector.<DiscountInfo> = new Vector.<DiscountInfo>();
      
      public function DiscountCollector()
      {
         super();
      }
      
      public function addDiscount(_arg_1:DiscountInfo) : void
      {
         if(_arg_1.hasDiscount())
         {
            this.discounts.push(_arg_1);
         }
      }
      
      public function getDiscountInfoes() : Vector.<DiscountInfo>
      {
         return this.discounts;
      }
   }
}

