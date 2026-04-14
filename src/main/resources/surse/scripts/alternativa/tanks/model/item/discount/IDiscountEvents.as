package alternativa.tanks.model.item.discount
{
   import controls.timer.CountDownTimer;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IDiscountEvents implements IDiscount
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<IDiscount>;
      
      public function IDiscountEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<IDiscount>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function getDiscountInPercent() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:IDiscount = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getDiscountInPercent();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function applyDiscount(param1:int) : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:IDiscount = null;
         var price:int = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.applyDiscount(price);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getEndDiscountTimer() : CountDownTimer
      {
         var result:CountDownTimer = null;
         var i:int = 0;
         var m:IDiscount = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getEndDiscountTimer();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

