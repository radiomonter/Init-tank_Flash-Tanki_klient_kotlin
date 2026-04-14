package controls.base
{
   import controls.TextFieldUtf8;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   
   public class TextFieldUtf8Base extends TextFieldUtf8
   {
      
      public function TextFieldUtf8Base()
      {
         super();
      }
      
      override public function set selectable(_arg_1:Boolean) : void
      {
         super.selectable = _arg_1;
         if(_arg_1)
         {
            addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
            addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         }
         else
         {
            removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
            removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         }
      }
      
      private function onMouseOver(_arg_1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.IBEAM;
      }
      
      private function onMouseOut(_arg_1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.AUTO;
      }
   }
}

