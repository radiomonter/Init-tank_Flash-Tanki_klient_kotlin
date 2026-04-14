package alternativa.protocol.impl
{
   import alternativa.protocol.ProtocolBuffer;
   
   public class LengthCodecHelper
   {
      
      public function LengthCodecHelper()
      {
         super();
      }
      
      public static function encodeLength(_arg_1:ProtocolBuffer, _arg_2:int) : void
      {
         var _local_3:Number = NaN;
         if(_arg_2 < 0)
         {
            throw new Error("Length is incorrect (" + _arg_2 + ")");
         }
         if(_arg_2 < 128)
         {
            _arg_1.writer.writeByte(int(_arg_2 & 0x7F));
         }
         else if(_arg_2 < 16384)
         {
            _local_3 = (_arg_2 & 0x3FFF) + 32768;
            _arg_1.writer.writeByte(int((_local_3 & 0xFF00) >> 8));
            _arg_1.writer.writeByte(int(_local_3 & 0xFF));
         }
         else
         {
            if(_arg_2 >= 4194304)
            {
               throw new Error("Length is incorrect (" + _arg_2 + ")");
            }
            _local_3 = (_arg_2 & 0x3FFFFF) + 12582912;
            _arg_1.writer.writeByte(int((_local_3 & 0xFF0000) >> 16));
            _arg_1.writer.writeByte(int((_local_3 & 0xFF00) >> 8));
            _arg_1.writer.writeByte(int(_local_3 & 0xFF));
         }
      }
      
      public static function decodeLength(_arg_1:ProtocolBuffer) : int
      {
         var _local_2:int = 0;
         var _local_3:Boolean = false;
         var _local_4:int = 0;
         var _local_5:int = _arg_1.reader.readByte();
         var _local_6:* = (_local_5 & 0x80) == 0;
         if(Boolean(_local_6))
         {
            return _local_5;
         }
         _local_2 = _arg_1.reader.readByte();
         _local_3 = (_local_5 & 0x40) == 0;
         if(_local_3)
         {
            return ((_local_5 & 0x3F) << 8) + (_local_2 & 0xFF);
         }
         _local_4 = _arg_1.reader.readByte();
         return ((_local_5 & 0x3F) << 16) + ((_local_2 & 0xFF) << 8) + (_local_4 & 0xFF);
      }
   }
}

