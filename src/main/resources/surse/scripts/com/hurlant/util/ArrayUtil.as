package com.hurlant.util
{
   import flash.utils.ByteArray;
   
   public class ArrayUtil
   {
      
      public function ArrayUtil()
      {
         super();
      }
      
      public static function equals(_arg_1:ByteArray, _arg_2:ByteArray) : Boolean
      {
         var _local_4:int = 0;
         if(_arg_1.length != _arg_2.length)
         {
            return false;
         }
         var _local_3:int = int(_arg_1.length);
         while(_local_4 < _local_3)
         {
            if(_arg_1[_local_4] != _arg_2[_local_4])
            {
               return false;
            }
            _local_4++;
         }
         return true;
      }
   }
}

