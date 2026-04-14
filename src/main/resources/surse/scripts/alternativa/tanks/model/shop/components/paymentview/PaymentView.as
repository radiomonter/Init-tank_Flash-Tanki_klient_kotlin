package alternativa.tanks.model.shop.components.paymentview
{
   import alternativa.tanks.model.shop.ShopWindow;
   import base.DiscreteSprite;
   
   public class PaymentView extends DiscreteSprite
   {
      
      public var window:ShopWindow;
      
      public function PaymentView()
      {
         super();
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
      }
      
      public function destroy() : void
      {
         this.window = null;
      }
      
      public function postRender() : void
      {
      }
   }
}

