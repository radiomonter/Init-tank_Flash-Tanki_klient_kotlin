package utils
{
   import flash.display.BitmapData;
   
   public class FlipBitmapDataUtils
   {
      
      public function FlipBitmapDataUtils()
      {
         super();
      }
      
      public static function flipH(_arg_1:BitmapData) : BitmapData
      {
         var _local_2:int = 0;
         var _local_4:int = 0;
         var _local_3:BitmapData = new BitmapData(_arg_1.width,_arg_1.height,true);
         while(_local_4 < _arg_1.width)
         {
            _local_2 = 0;
            while(_local_2 < _arg_1.height)
            {
               _local_3.setPixel32(_local_4,_local_2,_arg_1.getPixel32(_arg_1.width - 1 - _local_4,_local_2));
               _local_2++;
            }
            _local_4++;
         }
         return _local_3;
      }
      
      public static function flipW(_arg_1:BitmapData) : BitmapData
      {
         var _local_2:int = 0;
         var _local_4:int = 0;
         var _local_3:BitmapData = new BitmapData(_arg_1.width,_arg_1.height,true);
         while(_local_4 < _arg_1.width)
         {
            _local_2 = 0;
            while(_local_2 < _arg_1.height)
            {
               _local_3.setPixel32(_local_4,_local_2,_arg_1.getPixel32(_local_4,_arg_1.height - 1 - _local_2));
               _local_2++;
            }
            _local_4++;
         }
         return _local_3;
      }
   }
}

