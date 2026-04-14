package alternativa.tanks.utils
{
   public class ShiftUtils
   {
      
      public function ShiftUtils()
      {
         super();
      }
      
      public static function rotateRight(_arg_1:int, _arg_2:int) : int
      {
         var _local_3:* = _arg_1 << 32 - _arg_2;
         return (_arg_1 >>> _arg_2) + _local_3;
      }
      
      public static function rotateLeft(_arg_1:int, _arg_2:int) : int
      {
         var _local_3:int = _arg_1 >>> 32 - _arg_2;
         return (_arg_1 << _arg_2) + _local_3;
      }
   }
}

