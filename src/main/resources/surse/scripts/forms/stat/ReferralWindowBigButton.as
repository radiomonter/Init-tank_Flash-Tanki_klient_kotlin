package forms.stat
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import forms.battlelist.BattleBigButton;
   
   public class ReferralWindowBigButton extends BattleBigButton
   {
      
      private static const bitmapGreen:Class = ReferralWindowBigButton_bitmapGreen;
      
      private static const green:BitmapData = new bitmapGreen().bitmapData;
      
      private var labelY:int;
      
      public function ReferralWindowBigButton()
      {
         super();
         _label.size = 12;
         _label.color = 52238;
         _label.multiline = true;
         _label.align = TextFormatAlign.LEFT;
         _label.autoSize = TextFieldAutoSize.LEFT;
         _label.wordWrap = true;
         this.width = 156;
         var _local_1:Bitmap = new Bitmap(green);
         _local_1.x = _local_1.y = 7;
         addChildAt(_local_1,getChildIndex(_label));
      }
      
      override public function set label(_arg_1:String) : void
      {
         super.label = _arg_1;
         this.labelY = 24 - _label.textHeight / 2;
         this.width = _width;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         _width = int(_arg_1);
         stateDOWN.width = stateOFF.width = stateOVER.width = stateUP.width = _width;
         if(_icon.bitmapData != null)
         {
            _icon.x = 12;
            _icon.y = int(27 - _icon.height / 2);
            _label.width = _width - 8 - _icon.width;
            _label.x = _icon.width + 14;
            _label.y = this.labelY;
         }
      }
      
      override protected function onMouseEvent(_arg_1:MouseEvent) : void
      {
         if(_enable)
         {
            switch(_arg_1.type)
            {
               case MouseEvent.MOUSE_OVER:
                  setState(2);
                  _label.y = this.labelY;
                  break;
               case MouseEvent.MOUSE_OUT:
                  setState(1);
                  _label.y = this.labelY;
                  break;
               case MouseEvent.MOUSE_DOWN:
                  setState(3);
                  _label.y = this.labelY + 1;
                  break;
               case MouseEvent.MOUSE_UP:
                  setState(1);
                  _label.y = this.labelY;
            }
            if(_icon != null)
            {
               _icon.y = int(27 - _icon.height / 2) + (_arg_1.type == MouseEvent.MOUSE_DOWN ? 1 : 0);
            }
         }
      }
   }
}

