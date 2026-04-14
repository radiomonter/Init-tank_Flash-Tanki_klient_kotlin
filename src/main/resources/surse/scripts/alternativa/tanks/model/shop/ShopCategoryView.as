package alternativa.tanks.model.shop
{
   import flash.display.Sprite;
   
   public class ShopCategoryView extends Sprite
   {
      
      private static const GAP:int = 10;
      
      public var headerText:String;
      
      public var descriptionText:String;
      
      public var categoryId:String;
      
      public var header:ShopCategoryHeader;
      
      public var items:ShopCategoryViewGrid;
      
      public function ShopCategoryView(_arg_1:String, _arg_2:String, _arg_3:String)
      {
         super();
         this.headerText = _arg_1;
         this.descriptionText = _arg_2;
         this.categoryId = _arg_3;
         this.init();
      }
      
      private function init() : void
      {
         this.header = new ShopCategoryHeader(this.headerText,this.descriptionText);
         addChild(this.header);
         this.items = new ShopCategoryViewGrid();
         addChild(this.items);
      }
      
      public function addItem(_arg_1:ItemBase) : void
      {
         this.items.addItem(_arg_1);
      }
      
      public function render(_arg_1:int) : void
      {
         this.header.render(_arg_1);
         this.items.render();
         this.items.y = this.header.y + this.header.height + GAP;
      }
      
      public function destroy() : void
      {
         this.header = null;
         this.items.destroy();
         this.items = null;
      }
   }
}

