package controls
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   
   public class DefaultIconButton extends DefaultButton
   {
      
      protected var _icon:Bitmap;
      
      private var _releaseIcon:BitmapData;
      
      private var _hoveredIcon:BitmapData;
      
      private var _pressedIcon:BitmapData;
      
      public function DefaultIconButton(_arg_1:BitmapData, _arg_2:BitmapData, _arg_3:BitmapData)
      {
         super();
         this.icon = _arg_1;
         this._releaseIcon = _arg_1;
         this._hoveredIcon = _arg_2;
         this._pressedIcon = _arg_3;
         this.width = 70;
         removeChild(stateUP);
         removeChild(stateDOWN);
         removeChild(stateOFF);
         removeChild(stateOVER);
      }
      
      public function set icon(_arg_1:BitmapData) : void
      {
         this._icon = new Bitmap(_arg_1);
         addChild(this._icon);
         this._icon.x = 3;
         this._icon.y = 3;
         this.width = _width;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         _width = int(_arg_1);
         stateDOWN.width = stateOFF.width = stateOVER.width = stateUP.width = _width;
         if(this._icon != null)
         {
            _label.x = 20;
            _label.width = _width - 22;
         }
         else
         {
            _label.x = 2;
            _label.width = _width - 4;
         }
      }
      
      override protected function onMouseEvent(_arg_1:MouseEvent) : void
      {
         if(enable)
         {
            switch(_arg_1.type)
            {
               case MouseEvent.MOUSE_OVER:
                  setState(2);
                  this.icon = this._hoveredIcon;
                  return;
               case MouseEvent.MOUSE_OUT:
                  setState(1);
                  this.icon = this._releaseIcon;
                  return;
               case MouseEvent.MOUSE_DOWN:
                  setState(3);
                  this.icon = this._pressedIcon;
                  return;
               case MouseEvent.MOUSE_UP:
                  setState(1);
                  this.icon = this._releaseIcon;
                  return;
            }
         }
      }
   }
}

