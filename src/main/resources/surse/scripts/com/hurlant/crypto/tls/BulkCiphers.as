package com.hurlant.crypto.tls
{
   import com.hurlant.crypto.Crypto;
   import com.hurlant.crypto.symmetric.ICipher;
   import com.hurlant.crypto.symmetric.SSLPad;
   import com.hurlant.crypto.symmetric.TLSPad;
   import flash.utils.ByteArray;
   
   public class BulkCiphers
   {
      
      private static var _props:Array;
      
      public static const STREAM_CIPHER:uint = 0;
      
      public static const BLOCK_CIPHER:uint = 1;
      
      public static const NULL:uint = 0;
      
      public static const RC4_40:uint = 1;
      
      public static const RC4_128:uint = 2;
      
      public static const RC2_CBC_40:uint = 3;
      
      public static const DES_CBC:uint = 4;
      
      public static const DES3_EDE_CBC:uint = 5;
      
      public static const DES40_CBC:uint = 6;
      
      public static const IDEA_CBC:uint = 7;
      
      public static const AES_128:uint = 8;
      
      public static const AES_256:uint = 9;
      
      private static const algos:Array = ["","rc4","rc4","","des-cbc","3des-cbc","des-cbc","","aes","aes"];
      
      init();
      
      private var type:uint;
      
      private var keyBytes:uint;
      
      private var expandedKeyBytes:uint;
      
      private var effectiveKeyBits:uint;
      
      private var IVSize:uint;
      
      private var blockSize:uint;
      
      public function BulkCiphers(_arg_1:uint, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:uint, _arg_6:uint)
      {
         super();
         this.type = _arg_1;
         this.keyBytes = _arg_2;
         this.expandedKeyBytes = _arg_3;
         this.effectiveKeyBits = _arg_4;
         this.IVSize = _arg_5;
         this.blockSize = _arg_6;
      }
      
      private static function init() : void
      {
         _props = [];
         _props[NULL] = new BulkCiphers(STREAM_CIPHER,0,0,0,0,0);
         _props[RC4_40] = new BulkCiphers(STREAM_CIPHER,5,16,40,0,0);
         _props[RC4_128] = new BulkCiphers(STREAM_CIPHER,16,16,128,0,0);
         _props[RC2_CBC_40] = new BulkCiphers(BLOCK_CIPHER,5,16,40,8,8);
         _props[DES_CBC] = new BulkCiphers(BLOCK_CIPHER,8,8,56,8,8);
         _props[DES3_EDE_CBC] = new BulkCiphers(BLOCK_CIPHER,24,24,168,8,8);
         _props[DES40_CBC] = new BulkCiphers(BLOCK_CIPHER,5,8,40,8,8);
         _props[IDEA_CBC] = new BulkCiphers(BLOCK_CIPHER,16,16,128,8,8);
         _props[AES_128] = new BulkCiphers(BLOCK_CIPHER,16,16,128,16,16);
         _props[AES_256] = new BulkCiphers(BLOCK_CIPHER,32,32,256,16,16);
      }
      
      private static function getProp(_arg_1:uint) : BulkCiphers
      {
         var _local_2:BulkCiphers = _props[_arg_1];
         if(_local_2 == null)
         {
            throw new Error("Unknown bulk cipher " + _arg_1.toString(16));
         }
         return _local_2;
      }
      
      public static function getType(_arg_1:uint) : uint
      {
         return getProp(_arg_1).type;
      }
      
      public static function getKeyBytes(_arg_1:uint) : uint
      {
         return getProp(_arg_1).keyBytes;
      }
      
      public static function getExpandedKeyBytes(_arg_1:uint) : uint
      {
         return getProp(_arg_1).expandedKeyBytes;
      }
      
      public static function getEffectiveKeyBits(_arg_1:uint) : uint
      {
         return getProp(_arg_1).effectiveKeyBits;
      }
      
      public static function getIVSize(_arg_1:uint) : uint
      {
         return getProp(_arg_1).IVSize;
      }
      
      public static function getBlockSize(_arg_1:uint) : uint
      {
         return getProp(_arg_1).blockSize;
      }
      
      public static function getCipher(_arg_1:uint, _arg_2:ByteArray, _arg_3:uint) : ICipher
      {
         if(_arg_3 == TLSSecurityParameters.PROTOCOL_VERSION)
         {
            return Crypto.getCipher(algos[_arg_1],_arg_2,new TLSPad());
         }
         return Crypto.getCipher(algos[_arg_1],_arg_2,new SSLPad());
      }
   }
}

