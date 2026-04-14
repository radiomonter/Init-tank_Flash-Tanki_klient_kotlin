package alternativa.types
{
   public class UInt64 extends Binary64
   {
      
      public function UInt64(_arg_1:uint = 0, _arg_2:uint = 0)
      {
         super(_arg_1,_arg_2);
      }
      
      public static function parseUInt64(_arg_1:String, _arg_2:uint = 0) : UInt64
      {
         var _local_3:uint = 0;
         var _local_4:uint = 0;
         if(_arg_2 == 0)
         {
            if(_arg_1.search(/^0x/) == 0)
            {
               _arg_2 = 16;
               _local_4 = 2;
            }
            else
            {
               _arg_2 = 10;
            }
         }
         if(_arg_2 < 2 || _arg_2 > 36)
         {
            throw new ArgumentError();
         }
         _arg_1 = _arg_1.toLowerCase();
         var _local_5:UInt64 = new UInt64();
         while(_local_4 < _arg_1.length)
         {
            _local_3 = _arg_1.charCodeAt(_local_4);
            if(_local_3 >= "0".charCodeAt() && _local_3 <= "9".charCodeAt())
            {
               _local_3 -= "0".charCodeAt();
            }
            else
            {
               if(!(_local_3 >= "a".charCodeAt() && _local_3 <= "z".charCodeAt()))
               {
                  throw new ArgumentError();
               }
               _local_3 -= "a".charCodeAt();
            }
            if(_local_3 >= _arg_2)
            {
               throw new ArgumentError();
            }
            _local_5.mul(_arg_2);
            _local_5.add(_local_3);
            _local_4++;
         }
         return _local_5;
      }
      
      final public function set high(_arg_1:uint) : void
      {
         internalHigh = _arg_1;
      }
      
      final public function get high() : uint
      {
         return internalHigh;
      }
      
      final public function toNumber() : Number
      {
         return this.high * 4294967296 + low;
      }
      
      final public function toString(_arg_1:uint = 10) : String
      {
         var _local_2:uint = 0;
         if(_arg_1 < 2 || _arg_1 > 36)
         {
            throw new ArgumentError();
         }
         if(this.high == 0)
         {
            return low.toString(_arg_1);
         }
         var _local_3:Array = [];
         var _local_4:UInt64 = new UInt64(low,this.high);
         do
         {
            _local_2 = _local_4.div(_arg_1);
            _local_3.push((_local_2 < 10 ? "0" : "a").charCodeAt() + _local_2);
         }
         while(_local_4.high != 0);
         return _local_4.low.toString(_arg_1) + String.fromCharCode.apply(String,_local_3.reverse());
      }
   }
}

