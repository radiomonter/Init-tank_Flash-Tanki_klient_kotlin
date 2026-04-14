package alternativa.tanks.controllers.battleinfo
{
   public class TimeStringUtils
   {
      
      public function TimeStringUtils()
      {
         super();
      }
      
      public static function getTimeStr(_arg_1:int) : String
      {
         var _local_2:String = null;
         var _local_3:int = int(int(_arg_1 / 60));
         var _local_4:int = _arg_1 - _local_3 * 60;
         return String(_local_3) + ":" + (_local_4 > 9 ? String(_local_4) : "0" + String(_local_4));
      }
   }
}

