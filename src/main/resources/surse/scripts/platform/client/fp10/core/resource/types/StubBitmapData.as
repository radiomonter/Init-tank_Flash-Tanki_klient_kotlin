package platform.client.fp10.core.resource.types
{
   import flash.display.BitmapData;
   
   public class StubBitmapData extends BitmapData
   {
      
      public function StubBitmapData(_arg_1:uint, _arg_2:uint = 20, _arg_3:uint = 20)
      {
         var _local_4:int = 0;
         var _local_5:int = 0;
         super(_arg_2,_arg_3,false,0);
         while(_local_5 < _arg_2)
         {
            _local_4 = 0;
            while(_local_4 < _arg_3)
            {
               setPixel(Boolean(_local_5 % 2) ? int(_local_4) : int(_local_4 + 1),_local_5,_arg_1);
               _local_4 += 2;
            }
            _local_5++;
         }
      }
   }
}

