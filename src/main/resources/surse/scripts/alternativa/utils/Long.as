package alternativa.utils
{
   public final class Long
   {
      
      private var _low:uint;
      
      private var _high:uint;
      
      public function Long(_arg_1:uint, _arg_2:uint)
      {
         super();
         this._high = _arg_1;
         this._low = _arg_2;
      }
      
      private function get low() : int
      {
         return this._low;
      }
      
      private function get high() : uint
      {
         return this._high;
      }
      
      public function toOct() : String
      {
         var _local_1:uint = 0;
         var _local_2:uint = 0;
         var _local_5:uint = 0;
         var _local_6:int = 0;
         var _local_3:* = "";
         var _local_4:* = "";
         while(_local_6 < 5)
         {
            _local_1 = uint((this.high & 63 << 4 + _local_5) >>> _local_5 + 4);
            _local_2 = uint((this.low & 63 << _local_5) >>> _local_5);
            _local_3 = this._toOct(_local_1) + _local_3;
            _local_4 = this._toOct(_local_2) + _local_4;
            _local_5 += 6;
            _local_6++;
         }
         var _local_7:String = _local_3 + this._toOct(((this.high & uint(15)) << 2) + (this.low >>> 30)) + _local_4;
         return this.trimLeadingZeros(_local_7);
      }
      
      private function trimLeadingZeros(_arg_1:String) : String
      {
         var _local_2:int = 0;
         while(_local_2 < _arg_1.length && _arg_1.charAt(_local_2) == "0")
         {
            _local_2++;
         }
         return _arg_1.substr(_local_2);
      }
      
      private function _toOct(_arg_1:uint) : String
      {
         var _local_2:String = _arg_1.toString(8);
         return (_local_2.length < 2 ? "0" : "") + _local_2;
      }
   }
}

