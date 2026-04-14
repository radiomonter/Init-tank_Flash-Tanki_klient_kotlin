package controls.buttons
{
   import controls.FixedHeightRectangleSkin;
   
   public class FixedHeightButtonSkin
   {
      
      private var _up:FixedHeightRectangleSkin;
      
      private var _over:FixedHeightRectangleSkin;
      
      private var _down:FixedHeightRectangleSkin;
      
      private var _disabled:FixedHeightRectangleSkin;
      
      public function FixedHeightButtonSkin(_arg_1:FixedHeightRectangleSkin, _arg_2:FixedHeightRectangleSkin, _arg_3:FixedHeightRectangleSkin, _arg_4:FixedHeightRectangleSkin)
      {
         super();
         this._up = _arg_1;
         this._over = _arg_2;
         this._down = _arg_3;
         this._disabled = _arg_4;
      }
      
      public function get up() : FixedHeightRectangleSkin
      {
         return this._up;
      }
      
      public function get over() : FixedHeightRectangleSkin
      {
         return this._over;
      }
      
      public function get down() : FixedHeightRectangleSkin
      {
         return this._down;
      }
      
      public function get disabled() : FixedHeightRectangleSkin
      {
         return this._disabled;
      }
   }
}

