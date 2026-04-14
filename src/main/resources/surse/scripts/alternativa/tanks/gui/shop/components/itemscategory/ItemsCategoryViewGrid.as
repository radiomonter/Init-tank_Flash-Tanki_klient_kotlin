package alternativa.tanks.gui.shop.components.itemscategory
{
   import alternativa.tanks.gui.shop.components.item.GridItemBase;
   import base.DiscreteSprite;
   
   public class ItemsCategoryViewGrid extends DiscreteSprite
   {
      
      public var columnCount:int = 3;
      
      public var horizontalSpacing:int = 3;
      
      public var verticalSpacing:int = 3;
      
      public var items:Vector.<GridItemBase>;
      
      public function ItemsCategoryViewGrid()
      {
         super();
         this.items = new Vector.<GridItemBase>();
      }
      
      public function addItem(_arg_1:GridItemBase) : void
      {
         this.items.push(_arg_1);
         addChild(_arg_1);
      }
      
      public function render() : void
      {
         var _local_5:GridItemBase = null;
         var _local_1:int = 0;
         var _local_2:int = 0;
         var _local_3:int = 0;
         var _local_4:int = 0;
         for each(_local_5 in this.items)
         {
            if(_local_5.forceNewLine || _local_1 + _local_5.widthInCells > this.columnCount)
            {
               _local_1 = 0;
               _local_2 = 0;
               _local_3 += this.verticalSpacing + _local_4;
               _local_4 = 0;
            }
            _local_1 += _local_5.widthInCells;
            _local_5.x = _local_2;
            _local_5.y = _local_3;
            _local_2 += _local_5.width + this.horizontalSpacing;
            if(_local_5.height > _local_4)
            {
               _local_4 = _local_5.height;
            }
         }
      }
      
      public function destroy() : void
      {
         var _local_1:GridItemBase = null;
         for each(_local_1 in this.items)
         {
            _local_1.destroy();
         }
         this.items = null;
      }
      
      public function set spacing(_arg_1:int) : void
      {
         this.horizontalSpacing = _arg_1;
         this.verticalSpacing = _arg_1;
      }
   }
}

