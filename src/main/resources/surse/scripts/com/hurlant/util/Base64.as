package com.hurlant.util
{
   import flash.utils.ByteArray;
   
   public class Base64
   {
      
      private static const _encodeChars:Vector.<int> = _initEncoreChar();
      
      private static const _decodeChars:Vector.<int> = _initDecodeChar();
      
      public function Base64()
      {
         super();
      }
      
      public static function encode(_arg_1:String) : String
      {
         var _local_2:ByteArray = new ByteArray();
         _local_2.writeUTFBytes(_arg_1);
         return encodeByteArray(_local_2);
      }
      
      public static function decode(_arg_1:String) : String
      {
         var _local_2:ByteArray = decodeToByteArray(_arg_1);
         return _local_2.readUTFBytes(_local_2.length);
      }
      
      public static function encodeByteArray(_arg_1:ByteArray) : String
      {
         var _local_6:uint = 0;
         var _local_3:int = 0;
         var _local_7:int = 0;
         var _local_2:ByteArray = new ByteArray();
         _local_2.length = (2 + _arg_1.length - (_arg_1.length + 2) % 3) * 4 / 3;
         var _local_4:int = _arg_1.length % 3;
         var _local_5:int = _arg_1.length - _local_4;
         while(_local_3 < _local_5)
         {
            _local_6 = uint(_arg_1[int(_local_3++)] << 16 | _arg_1[int(_local_3++)] << 8 | _arg_1[int(_local_3++)]);
            _local_2[int(_local_7++)] = _encodeChars[int(_local_6 >>> 18)];
            _local_2[int(_local_7++)] = _encodeChars[int(_local_6 >>> 12 & 0x3F)];
            _local_2[int(_local_7++)] = _encodeChars[int(_local_6 >>> 6 & 0x3F)];
            _local_2[int(_local_7++)] = _encodeChars[int(_local_6 & 0x3F)];
         }
         if(_local_4 == 1)
         {
            _local_6 = uint(_arg_1[int(_local_3)]);
            _local_2[int(_local_7++)] = _encodeChars[int(_local_6 >>> 2)];
            _local_2[int(_local_7++)] = _encodeChars[int((_local_6 & 3) << 4)];
            _local_2[int(_local_7++)] = 61;
            _local_2[int(_local_7++)] = 61;
         }
         else if(_local_4 == 2)
         {
            _local_6 = uint(_arg_1[int(_local_3++)] << 8 | _arg_1[int(_local_3)]);
            _local_2[int(_local_7++)] = _encodeChars[int(_local_6 >>> 10)];
            _local_2[int(_local_7++)] = _encodeChars[int(_local_6 >>> 4 & 0x3F)];
            _local_2[int(_local_7++)] = _encodeChars[int((_local_6 & 0x0F) << 2)];
            _local_2[int(_local_7++)] = 61;
         }
         return _local_2.readUTFBytes(_local_2.length);
      }
      
      public static function decodeToByteArray(_arg_1:String) : ByteArray
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_5:int = 0;
         var _local_6:int = 0;
         var _local_9:int = 0;
         var _local_7:int = _arg_1.length;
         var _local_8:ByteArray = new ByteArray();
         _local_8.writeUTFBytes(_arg_1);
         while(_local_6 < _local_7)
         {
            _local_2 = _decodeChars[int(_local_8[_local_6++])];
            if(_local_2 == -1)
            {
               break;
            }
            _local_3 = _decodeChars[int(_local_8[_local_6++])];
            if(_local_3 == -1)
            {
               break;
            }
            _local_8[int(_local_9++)] = _local_2 << 2 | (_local_3 & 0x30) >> 4;
            _local_4 = int(_local_8[int(_local_6++)]);
            if(_local_4 == 61)
            {
               break;
            }
            _local_4 = _decodeChars[int(_local_4)];
            if(_local_4 == -1)
            {
               break;
            }
            _local_8[int(_local_9++)] = (_local_3 & 0x0F) << 4 | (_local_4 & 0x3C) >> 2;
            _local_5 = int(_local_8[int(_local_6++)]);
            if(_local_5 == 61)
            {
               break;
            }
            _local_5 = _decodeChars[int(_local_5)];
            if(_local_5 == -1)
            {
               break;
            }
            _local_8[int(_local_9++)] = (_local_4 & 3) << 6 | _local_5;
         }
         _local_8.length = _local_9;
         _local_8.position = 0;
         return _local_8;
      }
      
      public static function decodeToByteArrayB(_arg_1:String) : ByteArray
      {
         return decodeToByteArray(_arg_1);
      }
      
      private static function _initEncoreChar() : Vector.<int>
      {
         var _local_3:int = 0;
         var _local_1:Vector.<int> = new Vector.<int>(64,true);
         var _local_2:* = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
         while(_local_3 < 64)
         {
            _local_1[_local_3] = _local_2.charCodeAt(_local_3);
            _local_3++;
         }
         return _local_1;
      }
      
      private static function _initDecodeChar() : Vector.<int>
      {
         return new <int>[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,62,-1,-1,-1,63,52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-1,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,-1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
      }
   }
}

