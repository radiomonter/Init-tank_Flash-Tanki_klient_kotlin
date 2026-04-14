package alternativa.utils
{
   import flash.utils.ByteArray;
   
   public class LoaderUtils
   {
      
      private static const SEPARATOR:String = "/";
      
      public function LoaderUtils()
      {
         super();
      }
      
      public static function getResourcePath(_arg_1:ByteArray, _arg_2:ByteArray) : String
      {
         var _local_3:uint = 0;
         var _local_4:uint = 0;
         _local_3 = _arg_2.readUnsignedInt();
         _local_4 = _arg_2.readUnsignedInt();
         var _local_5:String = new Long(_local_3,_local_4).toOct();
         return SEPARATOR + _arg_1.readUnsignedInt().toString(8) + SEPARATOR + _arg_1.readUnsignedShort().toString(8) + SEPARATOR + _arg_1.readUnsignedByte().toString(8) + SEPARATOR + _arg_1.readUnsignedByte().toString(8) + SEPARATOR + _local_5 + SEPARATOR;
      }
   }
}

