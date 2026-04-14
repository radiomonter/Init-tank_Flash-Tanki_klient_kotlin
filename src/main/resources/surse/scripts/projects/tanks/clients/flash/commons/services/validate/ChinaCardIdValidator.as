package projects.tanks.clients.flash.commons.services.validate
{
   public class ChinaCardIdValidator
   {
      
      private static const KEY:Vector.<int> = Vector.<int>([7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2]);
      
      private static const AUTH:Vector.<String> = Vector.<String>(["1","0","x","9","8","7","6","5","4","3","2"]);
      
      private static const REGIONSLIST:Vector.<String> = Vector.<String>(["11","12","13","14","15","21","22","23","31","32","33","34","35","36","37","41","42","43","44","45","46","50","51","52","53","54","61","62","63","64","65","71","81","82","91"]);
      
      public function ChinaCardIdValidator()
      {
         super();
      }
      
      public static function isValidIdNumber(_arg_1:String) : Boolean
      {
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_6:int = 0;
         var _local_2:Number = NaN;
         var _local_5:int = _arg_1.length;
         if(_local_5 != 15 && _local_5 != 18)
         {
            return false;
         }
         _local_5 = _local_5 == 15 ? int(15) : int(17);
         while(_local_6 < _local_5 - 1)
         {
            _local_2 = _arg_1.charCodeAt(_local_6);
            if(_local_2 < 48 || _local_2 > 57)
            {
               return false;
            }
            _local_6++;
         }
         var _local_7:String = _local_5 == 17 ? _arg_1 : _arg_1.substr(0,6) + "19" + _arg_1.substr(6,9);
         var _local_8:String = _local_7.substr(0,2);
         if(REGIONSLIST.indexOf(_local_8) == -1)
         {
            return false;
         }
         var _local_9:Date = new Date();
         var _local_10:Number = _local_9.fullYear;
         var _local_11:int = parseInt(_local_7.substr(6,4));
         if(_local_11 < 1900 || _local_11 > _local_10)
         {
            return false;
         }
         var _local_12:int = parseInt(_local_7.substr(10,2));
         var _local_13:int = parseInt(_local_7.substr(12,2));
         if(_local_12 < 1 || _local_12 > 12 || _local_13 < 1 || _local_13 > 31)
         {
            return false;
         }
         if(_local_5 == 17)
         {
            _local_3 = 0;
            _local_4 = 0;
            while(_local_4 < _local_5)
            {
               _local_3 += KEY[_local_4] * parseInt(_local_7.substr(_local_4,1));
               _local_4++;
            }
            if(_local_7.charAt(17).toLowerCase() != AUTH[_local_3 % 11])
            {
               return false;
            }
         }
         return true;
      }
   }
}

