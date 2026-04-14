package alternativa.tanks.utils
{
   public class TimeUtil
   {
      
      public function TimeUtil()
      {
         super();
      }
      
      public static function getLocalazedPeriodForKickAlert(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int) : String
      {
         var _local_5:TimeUnitNames = null;
         var _local_6:* = "";
         switch(_arg_1)
         {
            case "ru":
               _local_5 = getRuTimeUnitNames(_arg_2,_arg_3,_arg_4);
               break;
            case "en":
            case "cn":
               _local_5 = getEnTimeUnitNames(_arg_2,_arg_3,_arg_4);
               break;
            case "de":
               _local_5 = getDeTimeUnitNames(_arg_2,_arg_3,_arg_4);
         }
         if(_arg_4 == 0 && _arg_3 == 0 && _arg_2 == 0)
         {
            return "1 " + _local_5.minuteName;
         }
         if(_arg_4 != 0)
         {
            _local_6 = _arg_4 + " " + _local_5.dayName;
         }
         if(_arg_3 != 0)
         {
            _local_6 = _local_6 + " " + _arg_3 + " " + _local_5.hourName;
         }
         if(_arg_2 != 0)
         {
            _local_6 = _local_6 + " " + _arg_2 + " " + _local_5.minuteName;
         }
         return _local_6;
      }
      
      private static function getRuTimeUnitNames(_arg_1:int, _arg_2:int, _arg_3:int) : TimeUnitNames
      {
         var _local_4:TimeUnitNames = new TimeUnitNames();
         if(_arg_3 == 1 || _arg_3 == 21 || _arg_3 == 31)
         {
            _local_4.dayName = "день";
         }
         else if(_arg_3 >= 2 && _arg_3 <= 4 || _arg_3 >= 22 && _arg_3 <= 24)
         {
            _local_4.dayName = "дня";
         }
         else if(_arg_3 >= 5 && _arg_3 <= 20 || _arg_3 >= 25 && _arg_3 <= 30)
         {
            _local_4.dayName = "дней";
         }
         else
         {
            _local_4.dayName = "дня";
         }
         if(_arg_2 == 1 || _arg_2 == 21)
         {
            _local_4.hourName = "час";
         }
         else if(_arg_2 >= 2 && _arg_2 <= 4 || _arg_2 >= 22 && _arg_2 <= 24)
         {
            _local_4.hourName = "часа";
         }
         else if(_arg_2 >= 5 && _arg_2 <= 20)
         {
            _local_4.hourName = "часов";
         }
         if(_arg_1 == 0 || _arg_1 == 1 || _arg_1 == 21 || _arg_1 == 31 || _arg_1 == 41 || _arg_1 == 51)
         {
            _local_4.minuteName = "минуту";
         }
         else if(_arg_1 >= 2 && _arg_1 <= 4 || _arg_1 >= 22 && _arg_1 <= 24 || _arg_1 >= 32 && _arg_1 <= 34 || _arg_1 >= 42 && _arg_1 <= 44 || _arg_1 >= 52 && _arg_1 <= 54)
         {
            _local_4.minuteName = "минуты";
         }
         else if(_arg_1 >= 5 && _arg_1 <= 20 || _arg_1 >= 25 && _arg_1 <= 30 || _arg_1 >= 35 && _arg_1 <= 40 || _arg_1 >= 45 && _arg_1 <= 50 || _arg_1 >= 55 && _arg_1 <= 60)
         {
            _local_4.minuteName = "минут";
         }
         return _local_4;
      }
      
      private static function getEnTimeUnitNames(_arg_1:int, _arg_2:int, _arg_3:int) : TimeUnitNames
      {
         var _local_4:TimeUnitNames = new TimeUnitNames();
         if(_arg_3 == 1)
         {
            _local_4.dayName = "day";
         }
         else
         {
            _local_4.dayName = "days";
         }
         if(_arg_2 == 1)
         {
            _local_4.hourName = "hour";
         }
         else
         {
            _local_4.hourName = "hours";
         }
         if(_arg_1 == 1 || _arg_1 == 0)
         {
            _local_4.minuteName = "minute";
         }
         else
         {
            _local_4.minuteName = "minutes";
         }
         return _local_4;
      }
      
      private static function getDeTimeUnitNames(_arg_1:int, _arg_2:int, _arg_3:int) : TimeUnitNames
      {
         var _local_4:TimeUnitNames = new TimeUnitNames();
         if(_arg_3 == 1)
         {
            _local_4.dayName = "Tag";
         }
         else
         {
            _local_4.dayName = "Tagen";
         }
         if(_arg_2 == 1)
         {
            _local_4.hourName = "Stunde";
         }
         else
         {
            _local_4.hourName = "Stunden";
         }
         if(_arg_1 == 1 || _arg_1 == 0)
         {
            _local_4.minuteName = "Minute";
         }
         else
         {
            _local_4.minuteName = "Minuten";
         }
         return _local_4;
      }
   }
}

class TimeUnitNames
{
   
   public var dayName:String;
   
   public var hourName:String;
   
   public var minuteName:String;
   
   public function TimeUnitNames()
   {
      super();
   }
}
