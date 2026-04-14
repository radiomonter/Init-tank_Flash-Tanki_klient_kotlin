package utils
{
   import alternativa.osgi.service.locale.ILocaleService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class TimeFormatter
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const MINUTE:int = 60;
      
      private static const HOUR:int = MINUTE * 60;
      
      private static const DAY:int = HOUR * 24;
      
      public function TimeFormatter()
      {
         super();
      }
      
      public static function format(_arg_1:int) : String
      {
         var _local_2:int = int(_arg_1 / DAY);
         _arg_1 %= DAY;
         var _local_3:int = int(_arg_1 / HOUR);
         _arg_1 %= HOUR;
         var _local_4:int = int(_arg_1 / MINUTE);
         _arg_1 %= MINUTE;
         return formatDHMS(_local_2,_local_3,_local_4,_arg_1);
      }
      
      public static function formatDHMS(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int) : String
      {
         var _local_5:* = "";
         var _local_6:* = localeService.language == "cn";
         if(_arg_1 > 0)
         {
            _local_5 = add(_arg_1,TanksLocale.TEXT_TIME_LABEL_DAY,_local_5);
            if(!_local_6)
            {
               _local_5 = add(_arg_2,TanksLocale.TEXT_TIME_LABEL_HOUR,_local_5);
            }
         }
         else if(_arg_2 > 0)
         {
            _local_5 = add(_arg_2,TanksLocale.TEXT_TIME_LABEL_HOUR,_local_5);
            if(!_local_6)
            {
               _local_5 = add(_arg_3,TanksLocale.TEXT_TIME_LABEL_MINUTE,_local_5);
            }
         }
         else if(_arg_3 > 0)
         {
            _local_5 = add(_arg_3,TanksLocale.TEXT_TIME_LABEL_MINUTE,_local_5);
            if(!_local_6)
            {
               _local_5 = add(_arg_4,TanksLocale.TEXT_TIME_LABEL_SECOND,_local_5);
            }
         }
         else
         {
            _local_5 = add(_arg_4,TanksLocale.TEXT_TIME_LABEL_SECOND,_local_5);
         }
         return _local_5;
      }
      
      private static function add(_arg_1:int, _arg_2:String, _arg_3:String) : String
      {
         if(_arg_1 > 0)
         {
            if(_arg_3.length > 0)
            {
               _arg_3 += " ";
            }
            _arg_3 += _arg_1 + localeService.getText(_arg_2);
         }
         return _arg_3;
      }
   }
}

