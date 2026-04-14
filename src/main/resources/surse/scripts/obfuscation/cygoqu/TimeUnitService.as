package obfuscation.cygoqu
{
   import alternativa.osgi.service.locale.ILocaleService;
   
   public class TimeUnitService implements Vacepanuf
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function TimeUnitService()
      {
         super();
      }
      
      private static function getRuTimeUnitNames(_arg_1:int, _arg_2:int, _arg_3:int) : TimeUnitNames
      {
         var _local_4:TimeUnitNames = new TimeUnitNames();
         _arg_3 %= 100;
         if(_arg_3 >= 11 && _arg_3 <= 19)
         {
            _local_4.dayName = "дней";
         }
         else
         {
            _arg_3 %= 10;
            if(_arg_3 == 1)
            {
               _local_4.dayName = "день";
            }
            else if(_arg_3 >= 2 && _arg_3 <= 4)
            {
               _local_4.dayName = "дня";
            }
            else
            {
               _local_4.dayName = "дней";
            }
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
            _local_4.dayName = "Tage";
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
      
      private static function qakinep(_arg_1:int, _arg_2:int, _arg_3:int) : TimeUnitNames
      {
         var _local_4:TimeUnitNames = new TimeUnitNames();
         if(_arg_3 == 1)
         {
            _local_4.dayName = "dia";
         }
         else
         {
            _local_4.dayName = "dias";
         }
         if(_arg_2 == 1)
         {
            _local_4.hourName = "hora";
         }
         else
         {
            _local_4.hourName = "horas";
         }
         if(_arg_1 == 1 || _arg_1 == 0)
         {
            _local_4.minuteName = "minuto";
         }
         else
         {
            _local_4.minuteName = "minutos";
         }
         return _local_4;
      }
      
      private static function dido(_arg_1:int, _arg_2:int, _arg_3:int) : TimeUnitNames
      {
         var _local_4:TimeUnitNames = new TimeUnitNames();
         if(_arg_3 == 1)
         {
            _local_4.dayName = "día";
         }
         else
         {
            _local_4.dayName = "días";
         }
         if(_arg_2 == 1)
         {
            _local_4.hourName = "hora";
         }
         else
         {
            _local_4.hourName = "horas";
         }
         if(_arg_1 == 1 || _arg_1 == 0)
         {
            _local_4.minuteName = "minuto";
         }
         else
         {
            _local_4.minuteName = "minutos";
         }
         return _local_4;
      }
      
      private static function dejawalaw() : TimeUnitNames
      {
         var _local_1:TimeUnitNames = new TimeUnitNames();
         _local_1.dayName = "天";
         _local_1.hourName = "小时";
         _local_1.minuteName = "分鐘";
         return _local_1;
      }
      
      private static function wykimyb(_arg_1:int, _arg_2:int, _arg_3:int) : TimeUnitNames
      {
         var _local_4:TimeUnitNames = new TimeUnitNames();
         if(_arg_3 == 1)
         {
            _local_4.dayName = "dzień";
         }
         else
         {
            _local_4.dayName = "dni";
         }
         if(_arg_2 == 1)
         {
            _local_4.hourName = "godzina";
         }
         else
         {
            _local_4.hourName = "godzin";
         }
         if(_arg_1 == 0)
         {
            _local_4.minuteName = "minut";
         }
         else if(_arg_1 == 1)
         {
            _local_4.minuteName = "minuta";
         }
         else if(_arg_1 >= 2 && _arg_1 <= 4 || _arg_1 >= 22 && _arg_1 <= 24 || _arg_1 >= 32 && _arg_1 <= 34 || _arg_1 >= 42 && _arg_1 <= 44 || _arg_1 >= 52 && _arg_1 <= 54)
         {
            _local_4.minuteName = "minuty";
         }
         else
         {
            _local_4.minuteName = "minut";
         }
         return _local_4;
      }
      
      public function getLocalizedTimeString(_arg_1:int, _arg_2:int, _arg_3:int) : String
      {
         var _local_4:* = "";
         var _local_5:TimeUnitNames = this.getTimeUnitNames(_arg_1,_arg_2,_arg_3);
         if(_arg_3 == 0 && _arg_2 == 0 && _arg_1 == 0)
         {
            return "1 " + _local_5.minuteName;
         }
         if(_arg_3 != 0)
         {
            _local_4 = _arg_3 + " " + _local_5.dayName;
         }
         if(_arg_2 != 0)
         {
            _local_4 = _local_4 + " " + _arg_2 + " " + _local_5.hourName;
         }
         if(_arg_1 != 0)
         {
            _local_4 = _local_4 + " " + _arg_1 + " " + _local_5.minuteName;
         }
         return _local_4;
      }
      
      public function getLocalizedDaysString(_arg_1:int) : String
      {
         return _arg_1 + " " + this.getLocalizedDaysName(_arg_1);
      }
      
      public function getLocalizedDaysName(_arg_1:int) : String
      {
         return this.getTimeUnitNames(0,0,_arg_1).dayName;
      }
      
      public function getTimeUnitNames(_arg_1:int, _arg_2:int, _arg_3:int) : TimeUnitNames
      {
         switch(localeService.language)
         {
            case "ru":
               return getRuTimeUnitNames(_arg_1,_arg_2,_arg_3);
            case "de":
               return getDeTimeUnitNames(_arg_1,_arg_2,_arg_3);
            case "pt_BR":
               return qakinep(_arg_1,_arg_2,_arg_3);
            case "pl":
               return wykimyb(_arg_1,_arg_2,_arg_3);
            case "es":
               return dido(_arg_1,_arg_2,_arg_3);
            case "cn":
               return dejawalaw();
            case "en":
         }
         return getEnTimeUnitNames(_arg_1,_arg_2,_arg_3);
      }
   }
}

