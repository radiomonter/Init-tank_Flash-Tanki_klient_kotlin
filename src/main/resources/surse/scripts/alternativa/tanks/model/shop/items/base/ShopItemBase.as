package alternativa.tanks.model.shop.items.base
{
   import alternativa.tanks.model.shop.event.ShopItemChosen;
   import controls.base.LabelBase;
   import flash.events.MouseEvent;
   
   public class ShopItemBase extends ButtonItemBase
   {
      
      protected static const WIDTH:int = 279;
      
      protected static const HEIGHT:int = 143;
      
      protected var itemId:String;
      
      public function ShopItemBase(_arg_1:String, _arg_2:ButtonItemSkin)
      {
         this.itemId = _arg_1;
         addEventListener(MouseEvent.CLICK,this.onMouseClick);
         super(_arg_2);
      }
      
      protected function fixChineseCurrencyLabelRendering(_arg_1:LabelBase) : void
      {
      }
      
      private function onMouseClick(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new ShopItemChosen(ShopItemChosen.EVENT_TYPE,this.itemId,gridPosition,this));
      }
      
      override public function get width() : Number
      {
         return WIDTH;
      }
      
      override public function get height() : Number
      {
         return HEIGHT;
      }
      
      override public function destroy() : void
      {
         super.destroy();
         removeEventListener(MouseEvent.CLICK,this.onMouseClick);
      }
      
      public function activateDisabledFilter() : void
      {
         alpha = 0.9;
      }
      
      public function cymy() : String
      {
         return this.itemId;
      }
   }
}

