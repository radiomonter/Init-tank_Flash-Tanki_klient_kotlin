package alternativa.protocol.impl
{
   import alternativa.protocol.CompressionType;
   import alternativa.protocol.ProtocolBuffer;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class PacketHelper
   {
      
      private static const ZIP_PACKET_SIZE_DELIMITER:int = 2000;
      
      private static const LONG_SIZE_DELIMITER:int = 16384;
      
      private static const ZIPPED_FLAG:int = 64;
      
      private static const BIG_LENGTH_FLAG:int = 128;
      
      private static const HELPER:ByteArray = new ByteArray();
      
      public function PacketHelper()
      {
         super();
      }
      
      public static function unwrapPacket(_arg_1:IDataInput, _arg_2:ProtocolBuffer, _arg_3:CompressionType) : Boolean
      {
         var _local_4:Boolean = false;
         var _local_5:int = 0;
         var _local_6:int = 0;
         var _local_7:int = 0;
         var _local_8:int = 0;
         var _local_9:int = 0;
         if(_arg_1.bytesAvailable < 2)
         {
            return false;
         }
         var _local_10:int = _arg_1.readByte();
         var _local_11:* = (_local_10 & BIG_LENGTH_FLAG) != 0;
         if(Boolean(_local_11))
         {
            if(_arg_1.bytesAvailable < 3)
            {
               return false;
            }
            _local_4 = _arg_3 != CompressionType.NONE;
            _local_6 = (_local_10 ^ BIG_LENGTH_FLAG) << 24;
            _local_7 = (_arg_1.readByte() & 0xFF) << 16;
            _local_8 = (_arg_1.readByte() & 0xFF) << 8;
            _local_9 = _arg_1.readByte() & 0xFF;
            _local_5 = _local_6 + _local_7 + _local_8 + _local_9;
         }
         else
         {
            _local_4 = (_local_10 & ZIPPED_FLAG) != 0;
            _local_6 = (_local_10 & 0x3F) << 8;
            _local_8 = _arg_1.readByte() & 0xFF;
            _local_5 = _local_6 + _local_8;
         }
         if(_arg_1.bytesAvailable < _local_5)
         {
            return false;
         }
         var _local_12:ByteArray = new ByteArray();
         if(_local_5 != 0)
         {
            _arg_1.readBytes(_local_12,0,_local_5);
         }
         if(_local_4)
         {
            _local_12.uncompress();
         }
         _local_12.position = 0;
         var _local_13:ByteArray = ByteArray(_arg_2.reader);
         OptionalMapCodecHelper.decodeNullMap(_local_12,_arg_2.optionalMap);
         _local_13.writeBytes(_local_12,_local_12.position,_local_12.length - _local_12.position);
         _local_13.position = 0;
         return true;
      }
      
      public static function wrapPacket(_arg_1:IDataOutput, _arg_2:ProtocolBuffer, _arg_3:CompressionType) : void
      {
         var _local_4:int = 0;
         var _local_5:int = 0;
         var _local_6:int = 0;
         var _local_7:Boolean = false;
         switch(_arg_3)
         {
            case CompressionType.NONE:
               break;
            case CompressionType.DEFLATE:
               _local_7 = true;
               break;
            case CompressionType.DEFLATE_AUTO:
               _local_7 = determineZipped(_arg_2.reader);
         }
         HELPER.position = 0;
         HELPER.length = 0;
         OptionalMapCodecHelper.encodeNullMap(_arg_2.optionalMap,HELPER);
         _arg_2.reader.readBytes(HELPER,HELPER.position,_arg_2.reader.bytesAvailable);
         HELPER.position = 0;
         var _local_8:Boolean = isLongSize(HELPER);
         if(_local_7)
         {
            HELPER.compress();
         }
         var _local_9:int = int(HELPER.length);
         if(_local_8)
         {
            _local_4 = _local_9 + (BIG_LENGTH_FLAG << 24);
            _arg_1.writeInt(_local_4);
         }
         else
         {
            _local_5 = int(((_local_9 & 0xFF00) >> 8) + (!_local_7 ? 0 : ZIPPED_FLAG));
            _local_6 = int(_local_9 & 0xFF);
            _arg_1.writeByte(_local_5);
            _arg_1.writeByte(_local_6);
         }
         _arg_1.writeBytes(HELPER,0,_local_9);
      }
      
      private static function isLongSize(_arg_1:IDataInput) : Boolean
      {
         return _arg_1.bytesAvailable >= LONG_SIZE_DELIMITER || _arg_1.bytesAvailable == -1;
      }
      
      private static function determineZipped(_arg_1:IDataInput) : Boolean
      {
         return _arg_1.bytesAvailable == -1 || _arg_1.bytesAvailable > ZIP_PACKET_SIZE_DELIMITER;
      }
      
      private static function bytesToString(_arg_1:ByteArray, _arg_2:int, _arg_3:int, _arg_4:int) : String
      {
         var _local_5:int = 0;
         var _local_6:int = 0;
         var _local_7:int = 0;
         var _local_8:String = null;
         var _local_9:* = "";
         var _local_10:int = int(_arg_1.position);
         _arg_1.position = _arg_2;
         while(_arg_1.bytesAvailable > 0 && _local_7 < _arg_3)
         {
            _local_7++;
            _local_8 = _arg_1.readUnsignedByte().toString(16);
            if(_local_8.length == 1)
            {
               _local_8 = "0" + _local_8;
            }
            _local_9 += _local_8;
            if(++_local_6 == 4)
            {
               _local_6 = 0;
               if(++_local_5 == _arg_4)
               {
                  _local_5 = 0;
                  _local_9 += "\n";
               }
               else
               {
                  _local_9 += "  ";
               }
            }
            else
            {
               _local_9 += " ";
            }
         }
         if(_local_7 < _arg_3)
         {
            _local_9 += "\nOnly " + _local_7 + " of " + _arg_3 + " bytes have been read";
         }
         _arg_1.position = _local_10;
         return _local_9;
      }
   }
}

