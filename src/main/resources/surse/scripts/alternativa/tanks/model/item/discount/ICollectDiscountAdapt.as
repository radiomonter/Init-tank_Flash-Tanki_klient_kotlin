package alternativa.tanks.model.item.discount
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ICollectDiscountAdapt implements ICollectDiscount
   {
      
      private var object:IGameObject;
      
      private var impl:ICollectDiscount;
      
      public function ICollectDiscountAdapt(_arg_1:IGameObject, _arg_2:ICollectDiscount)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function collectDiscountsInfo(param1:IDiscountCollector) : void
      {
         var collector:IDiscountCollector = param1;
         try
         {
            Model.object = this.object;
            this.impl.collectDiscountsInfo(collector);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

