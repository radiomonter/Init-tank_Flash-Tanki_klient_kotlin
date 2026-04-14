package controls.base
{
   import controls.TankInput;
   import flash.events.MouseEvent;
   import flash.text.TextFieldType;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import utils.FontParamsUtil;
   
   public class TankInputBase extends controls.TankInput
   {
      
      public function TankInputBase()
      {
         super();
         _label.sharpness = FontParamsUtil.SHARPNESS_LABEL_BASE;
         _label.thickness = FontParamsUtil.THICKNESS_LABEL_BASE;
         textField.sharpness = FontParamsUtil.SHARPNESS_TANK_INPUT_BASE;
         textField.thickness = FontParamsUtil.THICKNESS_TANK_INPUT_BASE;
         textField.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         textField.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
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
         textField.type = !_arg_1 ? TextFieldType.DYNAMIC : TextFieldType.INPUT;
         textField.selectable = _arg_1;
         textField.mouseEnabled = _arg_1;
         textField.mouseWheelEnabled = _arg_1;
         textField.tabEnabled = _arg_1;
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
         super.width = Math.ceil(_arg_1);
      }
      
      override public function set height(_arg_1:Number) : void
      {
         super.height = Math.ceil(_arg_1);
      }
   }
}

