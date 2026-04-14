package alternativa.tanks.model.shop
{
   import controls.TankWindowInner;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import forms.ColorConstants;
   import utils.ScrollStyleUtils;
   
   public class ShopCategorysView extends Sprite
   {
      
      private static const VERTICAL_GAP:int = 20;
      
      private static const AROUND_GAP:int = 25;
      
      private static const SCROLL_GAP:int = 5;
      
      private static const SCROLL_PANE_BOTTOM_PADDING:int = 15;
      
      private static const SCROLL_SHIFT_GAP:int = 5;
      
      private static const SCROLL_SPEED_MULTIPLIER:int = 3;
      
      private var scrollPane:ScrollPane;
      
      private var scrollContainer:Sprite;
      
      private var scrollPaneBottomPadding:Sprite;
      
      private var inner:TankWindowInner;
      
      private var categoriesPosition:Vector.<ShopCategoryView>;
      
      private var categories:Dictionary;
      
      private var _width:int;
      
      private var _height:int;
      
      public function ShopCategorysView()
      {
         super();
         this.categories = new Dictionary();
         this.categoriesPosition = new Vector.<ShopCategoryView>();
         this.inner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         addChild(this.inner);
         this.scrollContainer = new Sprite();
         this.scrollPaneBottomPadding = new Sprite();
         this.scrollContainer.addChild(this.scrollPaneBottomPadding);
         this.scrollPane = new ScrollPane();
         ScrollStyleUtils.setGreenStyle(this.scrollPane);
         this.scrollPane.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.scrollPane.verticalScrollPolicy = ScrollPolicy.AUTO;
         this.scrollPane.source = this.scrollContainer;
         this.scrollPane.update();
         this.scrollPane.focusEnabled = false;
         this.scrollPane.addEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel,true);
         addChild(this.scrollPane);
      }
      
      private static function onMouseWheel(_arg_1:MouseEvent) : void
      {
         _arg_1.delta *= SCROLL_SPEED_MULTIPLIER;
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:ShopCategoryView = null;
         _local_3 = null;
         this._width = _arg_1;
         this._height = _arg_2;
         this.scrollPane.y = SCROLL_GAP;
         this.scrollPane.setSize(_arg_1 + SCROLL_SHIFT_GAP,_arg_2 - SCROLL_GAP * 2);
         this.inner.width = _arg_1;
         this.inner.height = _arg_2;
         var _local_4:int = -12;
         for each(_local_3 in this.categoriesPosition)
         {
            _local_3.x = AROUND_GAP;
            _local_3.render(this._width - AROUND_GAP * 2 - (this.scrollPane.verticalScrollBar.width - SCROLL_SHIFT_GAP - 1));
            _local_3.y = _local_4 + VERTICAL_GAP;
            _local_4 = _local_3.y + _local_3.height;
         }
         this.fixScrollPaneBottomPadding(_local_4);
         this.scrollPane.update();
      }
      
      private function fixScrollPaneBottomPadding(_arg_1:int) : void
      {
         this.scrollPaneBottomPadding.graphics.lineStyle(1,ColorConstants.WHITE,0);
         this.scrollPaneBottomPadding.graphics.beginFill(ColorConstants.WHITE,0);
         this.scrollPaneBottomPadding.graphics.drawRect(0,0,1,SCROLL_PANE_BOTTOM_PADDING);
         this.scrollPaneBottomPadding.graphics.endFill();
         this.scrollPaneBottomPadding.x = AROUND_GAP;
         this.scrollPaneBottomPadding.y = _arg_1;
      }
      
      public function addCategory(_arg_1:ShopCategoryView) : void
      {
         this.categories[_arg_1.categoryId] = _arg_1;
         this.categoriesPosition.push(_arg_1);
         this.scrollContainer.addChild(_arg_1);
      }
      
      public function addItem(_arg_1:String, _arg_2:ItemBase) : void
      {
         ShopCategoryView(this.categories[_arg_1]).addItem(_arg_2);
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      public function destroy() : void
      {
         var _local_1:ShopCategoryView = null;
         for each(_local_1 in this.categories)
         {
            _local_1.destroy();
         }
         this.categories = null;
         this.categoriesPosition = null;
         this.scrollPane.removeEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel,true);
         this.scrollPane = null;
      }
   }
}

