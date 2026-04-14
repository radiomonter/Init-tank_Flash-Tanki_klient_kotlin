package controls.base
{
   import base.DiscreteSprite;
   import controls.TextFieldUtf8;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.events.MouseEvent;
   import flash.system.Capabilities;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import fonts.TanksFontService;
   import utils.FontParamsUtil;
   
   public class TankInput extends DiscreteSprite
   {
      
      private static const centerClass:Class = TankInput_centerClass;
      
      private static const centerWrongClass:Class = TankInput_centerWrongClass;
      
      private static const leftClass:Class = TankInput_leftClass;
      
      private static const leftWrondClass:Class = TankInput_leftWrondClass;
      
      private static const rightClass:Class = TankInput_rightClass;
      
      private static const rightWrongClass:Class = TankInput_rightWrongClass;
      
      public static const BORDER_THICKNESS:int = 5;
      
      public static const DEFAULT_INPUT_HEIGHT:int = 30;
      
      public static const DEFAULT_INPUT_WIDTH:int = 212;
      
      private static const TEXT_FIELD_INTERNAL_X:int = 3;
      
      private static const TEXT_FIELD_INTERNAL_Y:int = 7;
      
      private static const VERSION_PATTERN:RegExp = /^(\w*) (\d*),(\d*),(\d*),(\d*)$/;
      
      private const format:TextFormat = TanksFontService.getTextFormat(12);
      
      private const bg:DiscreteSprite = new DiscreteSprite();
      
      private const leftBorder:Shape = new Shape();
      
      private const centerBorder:Shape = new Shape();
      
      private const rightBorder:Shape = new Shape();
      
      private const bmpLeft:BitmapData = new leftClass().bitmapData;
      
      private const bmpCenter:BitmapData = new centerClass().bitmapData;
      
      private const bmpRight:BitmapData = new rightClass().bitmapData;
      
      private const bmpLeftWrong:BitmapData = new leftWrondClass().bitmapData;
      
      private const bmpCenterWrong:BitmapData = new centerWrongClass().bitmapData;
      
      private const bmpRightWrong:BitmapData = new rightWrongClass().bitmapData;
      
      public var textField:TextField;
      
      private var _hidden:Boolean;
      
      private var _valid:Boolean = true;
      
      private var _width:int;
      
      private var _height:int;
      
      public function TankInput()
      {
         super();
         addChild(this.bg);
         this.bg.addChild(this.leftBorder);
         this.bg.addChild(this.centerBorder);
         this.bg.addChild(this.rightBorder);
         this.addInternalTextField();
         this.height = DEFAULT_INPUT_HEIGHT;
         this.width = DEFAULT_INPUT_WIDTH;
      }
      
      private function addInternalTextField() : void
      {
         var _local_1:String = Capabilities.version;
         var _local_2:Object = VERSION_PATTERN.exec(_local_1);
         if(_local_2 != null && Number(_local_2[2] + "." + _local_2[3]) < 10.1)
         {
            this.textField = new TextFieldUtf8();
         }
         else
         {
            this.textField = new TextField();
         }
         this.textField.defaultTextFormat = this.format;
         this.textField.antiAliasType = AntiAliasType.ADVANCED;
         this.textField.gridFitType = GridFitType.PIXEL;
         this.textField.embedFonts = TanksFontService.isEmbedFonts();
         this.textField.type = TextFieldType.INPUT;
         this.textField.x = TEXT_FIELD_INTERNAL_X;
         this.textField.y = TEXT_FIELD_INTERNAL_Y;
         this.setTextFieldHeight();
         this.textField.sharpness = FontParamsUtil.SHARPNESS_TANK_INPUT_BASE;
         this.textField.thickness = FontParamsUtil.THICKNESS_TANK_INPUT_BASE;
         this.textField.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.textField.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         addChild(this.textField);
      }
      
      private function setTextFieldHeight() : void
      {
         this.textField.height = this._height - 2 * BORDER_THICKNESS;
      }
      
      private function onMouseOver(_arg_1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.IBEAM;
      }
      
      private function onMouseOut(_arg_1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.AUTO;
      }
      
      public function set enable(_arg_1:Boolean) : void
      {
         this.textField.type = _arg_1 ? TextFieldType.INPUT : TextFieldType.DYNAMIC;
         this.textField.selectable = _arg_1;
         this.textField.mouseEnabled = _arg_1;
         this.textField.mouseWheelEnabled = _arg_1;
         this.textField.tabEnabled = _arg_1;
      }
      
      override public function set x(_arg_1:Number) : void
      {
         super.x = int(_arg_1);
      }
      
      override public function set y(_arg_1:Number) : void
      {
         super.y = int(_arg_1);
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = Math.ceil(_arg_1);
         this.textField.width = this._width - 6;
         this.draw();
      }
      
      override public function set height(_arg_1:Number) : void
      {
         this._height = Math.ceil(_arg_1);
         this.setTextFieldHeight();
         this.draw();
      }
      
      public function set align(_arg_1:String) : void
      {
         this.format.align = _arg_1;
         this.updateTextFormat();
      }
      
      private function updateTextFormat() : void
      {
         this.textField.defaultTextFormat = this.format;
         this.textField.setTextFormat(this.format);
      }
      
      public function clear() : void
      {
         this.textField.text = "";
         this.validValue = true;
      }
      
      override public function set tabIndex(_arg_1:int) : void
      {
         this.textField.tabIndex = _arg_1;
      }
      
      public function set restrict(_arg_1:String) : void
      {
         this.textField.restrict = _arg_1;
      }
      
      public function set maxChars(_arg_1:int) : void
      {
         this.textField.maxChars = _arg_1;
      }
      
      public function get value() : String
      {
         return this.textField.text;
      }
      
      public function set value(_arg_1:String) : void
      {
         this.textField.text = _arg_1;
      }
      
      public function set hidden(_arg_1:Boolean) : void
      {
         this._hidden = _arg_1;
         this.textField.displayAsPassword = this._hidden;
      }
      
      public function get hidden() : Boolean
      {
         return this._hidden;
      }
      
      public function set validValue(_arg_1:Boolean) : void
      {
         this._valid = _arg_1;
         this.draw();
      }
      
      public function get validValue() : Boolean
      {
         return this._valid;
      }
      
      private function draw() : void
      {
         var _local_1:Graphics = this.leftBorder.graphics;
         _local_1.clear();
         _local_1.beginBitmapFill(this._valid ? this.bmpLeft : this.bmpLeftWrong);
         _local_1.drawRect(0,0,BORDER_THICKNESS,this._height);
         _local_1.endFill();
         this.leftBorder.x = 0;
         this.leftBorder.y = 0;
         var _local_2:Graphics = this.centerBorder.graphics;
         _local_2.clear();
         _local_2.beginBitmapFill(this._valid ? this.bmpCenter : this.bmpCenterWrong);
         _local_2.drawRect(0,0,this._width - 2 * BORDER_THICKNESS,this._height);
         _local_2.endFill();
         this.centerBorder.x = BORDER_THICKNESS;
         this.centerBorder.y = 0;
         var _local_3:Graphics = this.rightBorder.graphics;
         _local_3.clear();
         _local_3.beginBitmapFill(this._valid ? this.bmpRight : this.bmpRightWrong);
         _local_3.drawRect(0,0,BORDER_THICKNESS,this._height);
         _local_3.endFill();
         this.rightBorder.x = this._width - BORDER_THICKNESS;
         this.rightBorder.y = 0;
      }
   }
}

