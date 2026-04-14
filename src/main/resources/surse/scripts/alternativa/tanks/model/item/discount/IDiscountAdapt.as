package alternativa.tanks.model.item.discount
{
   import controls.timer.CountDownTimer;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IDiscountAdapt implements IDiscount
   {
      
      private var object:IGameObject;
      
      private var impl:IDiscount;
      
      public function IDiscountAdapt(_arg_1:IGameObject, _arg_2:IDiscount)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getDiscountInPercent() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getDiscountInPercent();
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
         var price:int = param1;
         try
         {
            Model.object = this.object;
            result = this.impl.applyDiscount(price);
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
         try
         {
            Model.object = this.object;
            result = this.impl.getEndDiscountTimer();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

