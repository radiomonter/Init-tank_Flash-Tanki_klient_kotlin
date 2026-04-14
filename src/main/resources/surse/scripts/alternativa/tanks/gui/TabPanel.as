package alternativa.tanks.gui
{
   import base.DiscreteSprite;
   import controls.base.TankDefaultButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   
   public class TabPanel extends DiscreteSprite
   {
      
      private static const BUTTON_WIDTH:int = 100;
      
      private static const BUTTON_HEIGHT:int = 30;
      
      private static const MARGIN:int = 11;
      
      public static const LEFT:String = "LEFT";
      
      public static const RIGHT:String = "RIGHT";
      
      private var contents:Dictionary = new Dictionary();
      
      private var selected:TankDefaultButton;
      
      private var buttonPanel:DiscreteSprite = new DiscreteSprite();
      
      private var contentPanel:DiscreteSprite = new DiscreteSprite();
      
      private var countButtonLine:int;
      
      private var _width:int;
      
      private var _height:int;
      
      private var _buttonAlign:String;
      
      public function TabPanel(_arg_1:String = "LEFT")
      {
         super();
         this._buttonAlign = _arg_1;
         addChild(this.buttonPanel);
         addChild(this.contentPanel);
         addEventListener(Event.ADDED_TO_STAGE,this.addResizeListener);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      private function addResizeListener(_arg_1:Event) : void
      {
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize();
      }
      
      private function onRemoveFromStage(_arg_1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      public function onResize(_arg_1:Event = null) : void
      {
         var _local_3:TankDefaultButton = null;
         var _local_4:int = 0;
         var _local_5:* = undefined;
         var _local_2:int = 0;
         this.countButtonLine = this.width / (MARGIN + BUTTON_WIDTH);
         while(_local_2 < this.buttonPanel.numChildren)
         {
            _local_3 = TankDefaultButton(this.buttonPanel.getChildAt(_local_2));
            _local_3.width = BUTTON_WIDTH;
            _local_4 = MARGIN;
            if(_local_2 + 1 > this.countButtonLine)
            {
               _local_4 = 2 * MARGIN + _local_3.height;
            }
            if(this._buttonAlign == LEFT)
            {
               _local_3.x = MARGIN + _local_2 % this.countButtonLine * (_local_3.width + MARGIN);
            }
            else
            {
               _local_3.x = this.width - _local_3.width - MARGIN - _local_2 % this.countButtonLine * (_local_3.width + MARGIN);
            }
            _local_3.y = _local_4;
            _local_2++;
         }
         this.contentPanel.y = BUTTON_HEIGHT + 2 * MARGIN;
         if(this.selected != null)
         {
            _local_5 = this.contents[this.selected];
            _local_5.width = this.width;
            _local_5.height = this.height - (BUTTON_HEIGHT + 2 * MARGIN);
         }
      }
      
      public function addTab(_arg_1:String, _arg_2:DiscreteSprite, _arg_3:Class) : Object
      {
         var _local_4:TankDefaultButton = new _arg_3();
         _local_4.label = _arg_1;
         _local_4.width = BUTTON_WIDTH;
         _local_4.addEventListener(MouseEvent.CLICK,this.onClickTab);
         this.buttonPanel.addChild(_local_4);
         this.contents[_local_4] = _arg_2;
         this.onResize();
         return _local_4;
      }
      
      public function select(_arg_1:int) : void
      {
         this.selectTab(TankDefaultButton(this.buttonPanel.getChildAt(_arg_1)));
      }
      
      private function selectTab(_arg_1:TankDefaultButton) : void
      {
         if(this.selected != null)
         {
            this.selected.enable = true;
            this.contentPanel.removeChild(this.contents[this.selected]);
         }
         _arg_1.enable = false;
         var _local_2:DiscreteSprite = this.contents[_arg_1];
         this.contentPanel.addChild(_local_2);
         this.selected = _arg_1;
         this.onResize();
      }
      
      private function onClickTab(_arg_1:MouseEvent) : void
      {
         var _local_2:TankDefaultButton = TankDefaultButton(_arg_1.currentTarget);
         this.selectTab(_local_2);
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = _arg_1;
         this.onResize();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set height(_arg_1:Number) : void
      {
         this._height = _arg_1;
         this.onResize();
      }
      
      public function destroy() : void
      {
         var _local_1:DiscreteSprite = this.contents[this.selected];
         if(this.contentPanel.contains(_local_1))
         {
            this.contentPanel.removeChild(_local_1);
         }
         if(this.contentPanel != null && contains(this.contentPanel))
         {
            removeChild(this.contentPanel);
         }
         if(this.buttonPanel != null && contains(this.buttonPanel))
         {
            removeChild(this.buttonPanel);
         }
         _local_1 = null;
      }
   }
}

