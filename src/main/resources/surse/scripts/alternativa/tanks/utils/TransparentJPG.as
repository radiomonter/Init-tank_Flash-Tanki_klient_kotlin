package alternativa.tanks.utils
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class TransparentJPG
   {
      
      public function TransparentJPG()
      {
         super();
      }
      
      public static function createImageFromRGBAndAlpha(_arg_1:BitmapData, _arg_2:BitmapData) : Bitmap
      {
         var _local_3:Number = _arg_1.width;
         var _local_4:Number = _arg_1.height;
         var _local_5:BitmapData = new BitmapData(_local_3,_local_4,true,0);
         _local_5.copyPixels(_arg_1,new Rectangle(0,0,_local_3,_local_4),new Point());
         _local_5.copyChannel(_arg_2,new Rectangle(0,0,_local_3,_local_4),new Point(),1,8);
         return new Bitmap(_local_5);
      }
   }
}

