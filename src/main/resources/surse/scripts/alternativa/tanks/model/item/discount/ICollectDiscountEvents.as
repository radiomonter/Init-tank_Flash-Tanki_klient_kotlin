package alternativa.tanks.model.item.discount
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ICollectDiscountEvents implements ICollectDiscount
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<ICollectDiscount>;
      
      public function ICollectDiscountEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<ICollectDiscount>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function collectDiscountsInfo(param1:IDiscountCollector) : void
      {
         var i:int = 0;
         var m:ICollectDiscount = null;
         var collector:IDiscountCollector = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.collectDiscountsInfo(collector);
               i += 1;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

