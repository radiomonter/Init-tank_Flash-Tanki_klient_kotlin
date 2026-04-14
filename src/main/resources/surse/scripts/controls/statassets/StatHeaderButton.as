package controls.statassets
{
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   
   public class StatHeaderButton extends Sprite
   {
      
      private var _bg:StatLineHeader = new StatLineHeader();
      
      private var _label:LabelBase = new LabelBase();
      
      public var numSort:int = 0;
      
      protected var _selected:Boolean = false;
      
      protected var _width:int = 100;
      
      protected var _height:int = 20;
      
      public function StatHeaderButton(_arg_1:Boolean = true)
      {
         super();
         this._bg.width = this._width;
         this._bg.height = this._height;
         addChild(this._bg);
         addChild(this._label);
         this._label.color = 860685;
         this._label.x = 2;
         this._label.y = 0;
         this._label.mouseEnabled = false;
         this._label.autoSize = TextFieldAutoSize.NONE;
         this._label.align = _arg_1 ? TextFormatAlign.RIGHT : TextFormatAlign.LEFT;
         this._label.height = 19;
      }
      
      public function set selected(_arg_1:Boolean) : void
      {
         this._selected = _arg_1;
         this._bg.selected = this._selected;
      }
      
      public function set label(_arg_1:String) : void
      {
         this._label.text = _arg_1;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = Math.floor(_arg_1);
         this._bg.width = _arg_1;
         this._label.width = this._width - 4;
      }
      
      override public function set height(_arg_1:Number) : void
      {
         this._height = Math.floor(_arg_1);
         this._bg.height = _arg_1;
      }
   }
}

