package obfuscation.qimi
{
   import alternativa.tanks.gui.settings.SettingsWindow;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import forms.ColorConstants;
   import utils.ScrollStyleUtils;
   
   public class Qokaci extends Jin
   {
      
      public static const lonece:int = MARGIN - SCROLL_GAP;
      
      private static const AROUND_GAP:int = 25;
      
      private static const SCROLL_GAP:int = 5;
      
      private static const SCROLL_PANE_BOTTOM_PADDING:int = 15;
      
      private static const SCROLL_SHIFT_GAP:int = 5;
      
      private static const SCROLL_SPEED_MULTIPLIER:int = 3;
      
      protected var scrollPane:ScrollPane;
      
      private var scrollContainer:Sprite;
      
      private var scrollPaneBottomPadding:Sprite;
      
      private var _width:int;
      
      private var _height:int;
      
      private var items:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      public function Qokaci()
      {
         super();
         this.scrollContainer = new Sprite();
         this.scrollPaneBottomPadding = new Sprite();
         this.scrollContainer.addChild(this.scrollPaneBottomPadding);
         this.scrollPane = new ScrollPane();
         ScrollStyleUtils.setGrayStyle(this.scrollPane);
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
      
      protected function addItem(_arg_1:DisplayObject) : void
      {
         this.items.push(_arg_1);
         this.scrollContainer.addChild(_arg_1);
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:DisplayObject = null;
         var _local_4:int = 0;
         this._width = _arg_1;
         this._height = _arg_2;
         this.scrollPane.y = SCROLL_GAP;
         this.scrollPane.setSize(_arg_1 + SCROLL_SHIFT_GAP,_arg_2 - SCROLL_GAP * 2);
         for each(_local_3 in this.items)
         {
            _local_4 += _local_3.height;
         }
         this.fixScrollPaneBottomPadding(_local_4);
         this.scrollPane.update();
      }
      
      override public function show() : void
      {
         this.render(SettingsWindow.daqowuso,SettingsWindow.fahohaq);
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
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
      
      override public function destroy() : void
      {
         this.scrollPane.removeEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel,true);
         this.scrollPane = null;
         super.destroy();
      }
   }
}

