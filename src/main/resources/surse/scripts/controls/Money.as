package controls
{
   public class Money
   {
      
      public static const ROUBLE_SIGN:String = " ¤";
      
      public function Money()
      {
         super();
      }
      
      public static function roubleToString(_arg_1:Number) : String
      {
         var _local_5:int = 0;
         var _local_2:Array = new Array();
         var _local_3:String = String(_arg_1);
         var _local_4:int = int(_local_3.length - int(_local_3.length / 3) * 3);
         if(_local_4 > 0)
         {
            _local_3 = (_local_4 == 1 ? "  " : " ") + _local_3;
         }
         _local_5 = 0;
         while(_local_5 < _local_3.length)
         {
            _local_2.push(_local_3.substr(_local_5,3));
            _local_5 += 3;
         }
         _local_3 = _local_2.join(" ");
         if(_local_4 > 0)
         {
            _local_3 = _local_3.substr(3 - _local_4);
         }
         return _local_3 + ROUBLE_SIGN;
      }
      
      public static function numToString(_arg_1:Number, _arg_2:Boolean = true) : String
      {
         var _local_6:int = 0;
         var _local_3:Array = new Array();
         var _local_4:String = _arg_2 ? String(int(_arg_1)) : String(Math.round(_arg_1));
         var _local_5:int = int(_local_4.length - int(_local_4.length / 3) * 3);
         if(_local_5 > 0)
         {
            _local_4 = (_local_5 == 1 ? "  " : " ") + _local_4;
         }
         _local_6 = 0;
         while(_local_6 < _local_4.length)
         {
            _local_3.push(_local_4.substr(_local_6,3));
            _local_6 += 3;
         }
         _local_4 = _local_3.join(" ");
         if(_local_5 > 0)
         {
            _local_4 = _local_4.substr(3 - _local_5);
         }
         return _local_4 + (_arg_2 ? _arg_1.toFixed(10).substr(-11,3) : "");
      }
   }
}

