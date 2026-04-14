package controls
{
   import flash.display.BitmapData;
   
   public class FixedHeightRectangleSkin
   {
      
      private var _left:BitmapData;
      
      private var _middle:BitmapData;
      
      private var _right:BitmapData;
      
      public function FixedHeightRectangleSkin(_arg_1:Class = null, _arg_2:Class = null, _arg_3:Class = null)
      {
         super();
         if(_arg_1 == null || _arg_2 == null || _arg_3 == null)
         {
            return;
         }
         this._left = new _arg_1().bitmapData;
         this._middle = new _arg_2().bitmapData;
         this._right = new _arg_3().bitmapData;
      }
      
      public static function createSkin(_arg_1:BitmapData, _arg_2:BitmapData, _arg_3:BitmapData) : FixedHeightRectangleSkin
      {
         var _local_4:FixedHeightRectangleSkin = new FixedHeightRectangleSkin();
         _local_4._left = _arg_1;
         _local_4._right = _arg_3;
         _local_4._middle = _arg_2;
         return _local_4;
      }
      
      public function get left() : BitmapData
      {
         return this._left;
      }
      
      public function get middle() : BitmapData
      {
         return this._middle;
      }
      
      public function get right() : BitmapData
      {
         return this._right;
      }
   }
}

