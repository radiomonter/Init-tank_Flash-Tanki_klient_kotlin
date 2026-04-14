package alternativa.tanks.model.shop.items.utils
{
   public class FormatUtils
   {
      
      public function FormatUtils()
      {
         super();
      }
      
      public static function valueToString(_arg_1:Number, _arg_2:int, _arg_3:Boolean) : String
      {
         if(_arg_3)
         {
            _arg_1 = Math.ceil(_arg_1);
         }
         if(_arg_1 % 1 != 0)
         {
            return String(_arg_1);
         }
         var _local_4:String = _arg_1.toFixed(_arg_2);
         var _local_5:* = "";
         if(_arg_2 > 0)
         {
            _local_5 = _local_4.substr(_local_4.length - _arg_2 - 1);
            if(_local_5 == ".00")
            {
               _local_5 = "";
            }
            _local_4 = _local_4.substr(0,_local_4.length - _arg_2 - 1);
         }
         while(_local_4.length > 3)
         {
            _local_5 = " " + _local_4.substr(_local_4.length - 3,3) + _local_5;
            _local_4 = _local_4.substr(0,_local_4.length - 3);
         }
         return _local_4 + _local_5;
      }
   }
}

