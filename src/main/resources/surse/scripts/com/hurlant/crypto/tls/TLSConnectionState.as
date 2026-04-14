package com.hurlant.crypto.tls
{
   import com.hurlant.crypto.hash.HMAC;
   import com.hurlant.crypto.symmetric.ICipher;
   import com.hurlant.crypto.symmetric.IVMode;
   import com.hurlant.util.ArrayUtil;
   import flash.utils.ByteArray;
   
   public class TLSConnectionState implements IConnectionState
   {
      
      private var bulkCipher:uint;
      
      private var cipherType:uint;
      
      private var CIPHER_key:ByteArray;
      
      private var CIPHER_IV:ByteArray;
      
      private var cipher:ICipher;
      
      private var ivmode:IVMode;
      
      private var macAlgorithm:uint;
      
      private var MAC_write_secret:ByteArray;
      
      private var hmac:HMAC;
      
      private var seq_lo:uint;
      
      private var seq_hi:uint;
      
      public function TLSConnectionState(_arg_1:uint = 0, _arg_2:uint = 0, _arg_3:uint = 0, _arg_4:ByteArray = null, _arg_5:ByteArray = null, _arg_6:ByteArray = null)
      {
         super();
         this.bulkCipher = _arg_1;
         this.cipherType = _arg_2;
         this.macAlgorithm = _arg_3;
         this.MAC_write_secret = _arg_4;
         this.hmac = MACs.getHMAC(_arg_3);
         this.CIPHER_key = _arg_5;
         this.CIPHER_IV = _arg_6;
         this.cipher = BulkCiphers.getCipher(_arg_1,_arg_5,769);
         if(this.cipher is IVMode)
         {
            this.ivmode = this.cipher as IVMode;
            this.ivmode.IV = _arg_6;
         }
      }
      
      public function decrypt(_arg_1:uint, _arg_2:uint, _arg_3:ByteArray) : ByteArray
      {
         var _local_4:ByteArray = null;
         var _local_5:ByteArray = null;
         var _local_6:uint = 0;
         var _local_7:ByteArray = null;
         var _local_8:ByteArray = null;
         if(this.cipherType == BulkCiphers.STREAM_CIPHER)
         {
            if(this.bulkCipher != BulkCiphers.NULL)
            {
               this.cipher.decrypt(_arg_3);
            }
         }
         else
         {
            _local_4 = new ByteArray();
            _local_4.writeBytes(_arg_3,_arg_3.length - this.CIPHER_IV.length,this.CIPHER_IV.length);
            this.cipher.decrypt(_arg_3);
            this.CIPHER_IV = _local_4;
            this.ivmode.IV = _local_4;
         }
         if(this.macAlgorithm != MACs.NULL)
         {
            _local_5 = new ByteArray();
            _local_6 = _arg_3.length - this.hmac.getHashSize();
            _local_5.writeUnsignedInt(this.seq_hi);
            _local_5.writeUnsignedInt(this.seq_lo);
            _local_5.writeByte(_arg_1);
            _local_5.writeShort(TLSSecurityParameters.PROTOCOL_VERSION);
            _local_5.writeShort(_local_6);
            if(_local_6 != 0)
            {
               _local_5.writeBytes(_arg_3,0,_local_6);
            }
            _local_7 = this.hmac.compute(this.MAC_write_secret,_local_5);
            _local_8 = new ByteArray();
            _local_8.writeBytes(_arg_3,_local_6,this.hmac.getHashSize());
            if(!ArrayUtil.equals(_local_7,_local_8))
            {
               throw new TLSError("Bad Mac Data",TLSError.bad_record_mac);
            }
            _arg_3.length = _local_6;
            _arg_3.position = 0;
         }
         ++this.seq_lo;
         if(this.seq_lo == 0)
         {
            ++this.seq_hi;
         }
         return _arg_3;
      }
      
      public function encrypt(_arg_1:uint, _arg_2:ByteArray) : ByteArray
      {
         var _local_4:ByteArray = null;
         var _local_5:ByteArray = null;
         var _local_3:ByteArray = null;
         if(this.macAlgorithm != MACs.NULL)
         {
            _local_4 = new ByteArray();
            _local_4.writeUnsignedInt(this.seq_hi);
            _local_4.writeUnsignedInt(this.seq_lo);
            _local_4.writeByte(_arg_1);
            _local_4.writeShort(TLSSecurityParameters.PROTOCOL_VERSION);
            _local_4.writeShort(_arg_2.length);
            if(_arg_2.length != 0)
            {
               _local_4.writeBytes(_arg_2,0,_arg_2.length);
            }
            _local_3 = this.hmac.compute(this.MAC_write_secret,_local_4);
            _arg_2.position = _arg_2.length;
            _arg_2.writeBytes(_local_3);
         }
         _arg_2.position = 0;
         if(this.cipherType == BulkCiphers.STREAM_CIPHER)
         {
            if(this.bulkCipher != BulkCiphers.NULL)
            {
               this.cipher.encrypt(_arg_2);
            }
         }
         else
         {
            this.cipher.encrypt(_arg_2);
            _local_5 = new ByteArray();
            _local_5.writeBytes(_arg_2,_arg_2.length - this.CIPHER_IV.length,this.CIPHER_IV.length);
            this.CIPHER_IV = _local_5;
            this.ivmode.IV = _local_5;
         }
         ++this.seq_lo;
         if(this.seq_lo == 0)
         {
            ++this.seq_hi;
         }
         return _arg_2;
      }
   }
}

