package platform.client.fp10.core.resource
{
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.BlendMode;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class ResourceUtils
   {
      
      public function ResourceUtils()
      {
         super();
      }
      
      public static function mergeBitmapAlpha(_arg_1:BitmapData, _arg_2:BitmapData, _arg_3:Boolean = false) : BitmapData
      {
         var _local_4:BitmapData = null;
         var _local_5:BitmapData = new BitmapData(_arg_1.width,_arg_1.height);
         var _local_6:Point = new Point();
         _local_5.copyPixels(_arg_1,_arg_1.rect,_local_6);
         if(_arg_1.width != _arg_2.width || _arg_1.height != _arg_2.height)
         {
            _local_4 = _arg_2;
            _arg_2 = new BitmapData(_arg_1.width,_arg_1.height);
            _arg_2.draw(_local_4,new Matrix(_arg_1.width / _local_4.width,0,0,_arg_1.height / _local_4.height),null,BlendMode.NORMAL,null,true);
         }
         _local_5.copyChannel(_arg_2,_arg_2.rect,_local_6,BitmapDataChannel.RED,BitmapDataChannel.ALPHA);
         if(_local_4 != null)
         {
            _arg_2.dispose();
            _arg_2 = _local_4;
         }
         if(_arg_3)
         {
            _arg_1.dispose();
            _arg_2.dispose();
         }
         return _local_5;
      }
   }
}

