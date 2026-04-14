package controls.buttons
{
   import base.DiscreteSprite;
   import controls.Label;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.utils.Dictionary;
   import utils.FontParamsUtil;
   
   public class ButtonBase extends DiscreteSprite
   {
      
      private var _labelPositionY:int = 15;
      
      private var _labelHeight:int = 24;
      
      private var _labelSize:int = 14;
      
      private var _enabled:Boolean;
      
      private var upState:DisplayObject;
      
      private var overState:DisplayObject;
      
      private var downState:DisplayObject;
      
      private var disabledState:DisplayObject;
      
      protected var _label:Label = new Label();
      
      protected var _innerLayer:DiscreteSprite = new DiscreteSprite();
      
      private var state2view:Dictionary = new Dictionary();
      
      private var currentState:ButtonStates = ButtonStates.UP;
      
      public function ButtonBase(_arg_1:DisplayObject, _arg_2:DisplayObject, _arg_3:DisplayObject, _arg_4:DisplayObject)
      {
         super();
         this.upState = _arg_1;
         this.overState = _arg_2;
         this.downState = _arg_3;
         this.disabledState = _arg_4;
         this._enabled = true;
         addChild(_arg_1);
         addChild(_arg_2);
         addChild(_arg_3);
         addChild(_arg_4);
         addChild(this._innerLayer);
         this._innerLayer.addChild(this._label);
         this._innerLayer.mouseEnabled = false;
         this._innerLayer.mouseChildren = false;
         this._label.align = TextFormatAlign.CENTER;
         this._label.autoSize = TextFieldAutoSize.NONE;
         this._label.selectable = false;
         this._label.x = 2;
         this._label.y = this._labelPositionY;
         this._label.height = this._labelHeight;
         this._label.size = this._labelSize;
         this._label.mouseEnabled = false;
         this._label.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
         this._label.sharpness = FontParamsUtil.SHARPNESS_LABEL_BASE;
         this._label.thickness = FontParamsUtil.THICKNESS_LABEL_BASE;
         _arg_1.visible = true;
         _arg_2.visible = false;
         _arg_3.visible = false;
         _arg_4.visible = false;
         this.state2view[ButtonStates.UP] = _arg_1;
         this.state2view[ButtonStates.DOWN] = _arg_3;
         this.state2view[ButtonStates.OVER] = _arg_2;
         this.state2view[ButtonStates.DISABLED] = _arg_4;
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseEvent);
         this.width = 120;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         _arg_1 = int(_arg_1);
         this.upState.width = _arg_1;
         this.overState.width = _arg_1;
         this.downState.width = _arg_1;
         this.disabledState.width = _arg_1;
         this._label.width = _arg_1 - 4;
      }
      
      public function set label(_arg_1:String) : void
      {
         this._label.text = _arg_1;
      }
      
      public function get label() : String
      {
         return this._label.text;
      }
      
      public function set enabled(_arg_1:Boolean) : void
      {
         this._enabled = _arg_1;
         buttonMode = this._enabled;
         mouseEnabled = this._enabled;
         mouseChildren = this._enabled;
         if(this._enabled)
         {
            this.setState(ButtonStates.UP);
            this.onEnable();
         }
         else
         {
            this.setState(ButtonStates.DISABLED);
            this.onDisable();
         }
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function setState(_arg_1:ButtonStates) : void
      {
         var _local_2:DisplayObject = null;
         var _local_3:DisplayObject = null;
         if(this.currentState != _arg_1)
         {
            _local_2 = this.state2view[this.currentState];
            _local_3 = this.state2view[_arg_1];
            this.currentState = _arg_1;
            _local_3.visible = true;
            _local_2.visible = false;
            this.onStateChanged();
         }
      }
      
      protected function onMouseEvent(_arg_1:MouseEvent) : void
      {
         if(this._enabled)
         {
            switch(_arg_1.type)
            {
               case MouseEvent.MOUSE_OVER:
                  this.setState(ButtonStates.OVER);
                  return;
               case MouseEvent.MOUSE_OUT:
               case MouseEvent.MOUSE_UP:
                  this.setState(ButtonStates.UP);
                  return;
               case MouseEvent.MOUSE_DOWN:
                  this.setState(ButtonStates.DOWN);
                  return;
            }
         }
      }
      
      public function getState() : ButtonStates
      {
         return this.currentState;
      }
      
      protected function onStateChanged() : void
      {
         this._innerLayer.y = this.getState() == ButtonStates.DOWN || !this.enabled ? 1 : 0;
      }
      
      protected function onEnable() : void
      {
      }
      
      protected function onDisable() : void
      {
      }
      
      public function set labelPositionY(_arg_1:int) : void
      {
         this._labelPositionY = _arg_1;
         this._label.y = _arg_1;
      }
      
      public function set labelHeight(_arg_1:int) : void
      {
         this._labelHeight = _arg_1;
         this._label.height = _arg_1;
      }
      
      public function set labelSize(_arg_1:int) : void
      {
         this._labelSize = _arg_1;
         this._label.size = _arg_1;
      }
   }
}

