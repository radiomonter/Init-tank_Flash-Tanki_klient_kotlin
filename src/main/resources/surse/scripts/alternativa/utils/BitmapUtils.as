package alternativa.utils
{
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class BitmapUtils
   {
      
      public function BitmapUtils()
      {
         super();
      }
      
      public static function mergeBitmapAlpha(_arg_1:BitmapData, _arg_2:BitmapData, _arg_3:Boolean = false) : BitmapData
      {
         var _local_4:BitmapData = new BitmapData(_arg_1.width,_arg_1.height);
         _local_4.copyPixels(_arg_1,_arg_1.rect,new Point());
         _local_4.copyChannel(_arg_2,_arg_2.rect,new Point(),BitmapDataChannel.RED,BitmapDataChannel.ALPHA);
         if(_arg_3)
         {
            _arg_1.dispose();
            _arg_2.dispose();
         }
         return _local_4;
      }
      
      public static function getFragment(_arg_1:BitmapData, _arg_2:Rectangle) : BitmapData
      {
         var _local_3:BitmapData = new BitmapData(_arg_2.width,_arg_2.height,_arg_1.transparent,0);
         _local_3.copyPixels(_arg_1,_arg_2,new Point());
         return _local_3;
      }
      
      public static function getNonTransparentRect(_arg_1:BitmapData) : Rectangle
      {
         return !_arg_1.transparent ? _arg_1.rect : _arg_1.getColorBoundsRect(4278190080,0,false);
      }
   }
}

