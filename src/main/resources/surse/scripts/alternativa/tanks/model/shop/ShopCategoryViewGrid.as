package alternativa.tanks.model.shop
{
   import flash.display.Sprite;
   
   public class ShopCategoryViewGrid extends Sprite
   {
      
      public var columnCount:int = 3;
      
      public var columnSpacing:int = 3;
      
      public var items:Vector.<ItemBase>;
      
      public function ShopCategoryViewGrid()
      {
         super();
         this.items = new Vector.<ItemBase>();
      }
      
      public function addItem(_arg_1:ItemBase) : void
      {
         _arg_1.gridPosition = this.items.length;
         this.items.push(_arg_1);
         addChild(_arg_1);
      }
      
      public function render() : void
      {
         var _local_1:int = 0;
         var _local_2:int = 0;
         var _local_4:int = 0;
         var _local_3:int = int(this.items.length);
         while(_local_4 < _local_3)
         {
            _local_1 = _local_4 % this.columnCount;
            _local_2 = int(_local_4 / this.columnCount);
            this.items[_local_4].x = _local_1 * this.items[_local_4].width + _local_1 * this.columnSpacing;
            this.items[_local_4].y = _local_2 * this.items[_local_4].height + _local_2 * this.columnSpacing;
            _local_4++;
         }
      }
      
      public function destroy() : void
      {
         var _local_1:ItemBase = null;
         for each(_local_1 in this.items)
         {
            _local_1.destroy();
         }
         this.items = null;
      }
   }
}

