package com.hurlant.crypto.tls
{
   import com.hurlant.crypto.hash.MD5;
   import com.hurlant.crypto.hash.SHA1;
   import com.hurlant.util.Hex;
   import flash.utils.ByteArray;
   
   public class SSLSecurityParameters implements ISecurityParameters
   {
      
      public static const COMPRESSION_NULL:uint = 0;
      
      public static const PROTOCOL_VERSION:uint = 768;
      
      private var entity:uint;
      
      private var bulkCipher:uint;
      
      private var cipherType:uint;
      
      private var keySize:uint;
      
      private var keyMaterialLength:uint;
      
      private var keyBlock:ByteArray;
      
      private var IVSize:uint;
      
      private var MAC_length:uint;
      
      private var macAlgorithm:uint;
      
      private var hashSize:uint;
      
      private var compression:uint;
      
      private var masterSecret:ByteArray;
      
      private var clientRandom:ByteArray;
      
      private var serverRandom:ByteArray;
      
      private var pad_1:ByteArray;
      
      private var pad_2:ByteArray;
      
      private var ignoreCNMismatch:Boolean = true;
      
      private var trustAllCerts:Boolean = false;
      
      private var trustSelfSigned:Boolean = false;
      
      public var keyExchange:uint;
      
      public function SSLSecurityParameters(_arg_1:uint, _arg_2:ByteArray = null, _arg_3:ByteArray = null)
      {
         super();
         this.entity = _arg_1;
         this.reset();
      }
      
      public function get version() : uint
      {
         return PROTOCOL_VERSION;
      }
      
      public function reset() : void
      {
         this.bulkCipher = BulkCiphers.NULL;
         this.cipherType = BulkCiphers.BLOCK_CIPHER;
         this.macAlgorithm = MACs.NULL;
         this.compression = COMPRESSION_NULL;
         this.masterSecret = null;
      }
      
      public function getBulkCipher() : uint
      {
         return this.bulkCipher;
      }
      
      public function getCipherType() : uint
      {
         return this.cipherType;
      }
      
      public function getMacAlgorithm() : uint
      {
         return this.macAlgorithm;
      }
      
      public function setCipher(_arg_1:uint) : void
      {
         var _local_2:int = 0;
         this.bulkCipher = CipherSuites.getBulkCipher(_arg_1);
         this.cipherType = BulkCiphers.getType(this.bulkCipher);
         this.keySize = BulkCiphers.getExpandedKeyBytes(this.bulkCipher);
         this.keyMaterialLength = BulkCiphers.getKeyBytes(this.bulkCipher);
         this.IVSize = BulkCiphers.getIVSize(this.bulkCipher);
         this.keyExchange = CipherSuites.getKeyExchange(_arg_1);
         this.macAlgorithm = CipherSuites.getMac(_arg_1);
         this.hashSize = MACs.getHashSize(this.macAlgorithm);
         this.pad_1 = new ByteArray();
         this.pad_2 = new ByteArray();
         while(_local_2 < 48)
         {
            this.pad_1.writeByte(54);
            this.pad_2.writeByte(92);
            _local_2++;
         }
      }
      
      public function setCompression(_arg_1:uint) : void
      {
         this.compression = _arg_1;
      }
      
      public function setPreMasterSecret(_arg_1:ByteArray) : void
      {
         var _local_4:ByteArray = null;
         var _local_5:ByteArray = null;
         var _local_6:int = 0;
         var _local_7:int = 0;
         var _local_2:ByteArray = new ByteArray();
         var _local_3:ByteArray = new ByteArray();
         var _local_8:SHA1 = new SHA1();
         var _local_9:MD5 = new MD5();
         var _local_10:ByteArray = new ByteArray();
         _local_10.writeBytes(_arg_1);
         _local_10.writeBytes(this.clientRandom);
         _local_10.writeBytes(this.serverRandom);
         this.masterSecret = new ByteArray();
         var _local_11:uint = 65;
         _local_6 = 0;
         while(_local_6 < 3)
         {
            _local_2.position = 0;
            _local_7 = 0;
            while(_local_7 < _local_6 + 1)
            {
               _local_2.writeByte(_local_11);
               _local_7++;
            }
            _local_11++;
            _local_2.writeBytes(_local_10);
            _local_4 = _local_8.hash(_local_2);
            _local_3.position = 0;
            _local_3.writeBytes(_arg_1);
            _local_3.writeBytes(_local_4);
            _local_5 = _local_9.hash(_local_3);
            this.masterSecret.writeBytes(_local_5);
            _local_6++;
         }
         _local_10.position = 0;
         _local_10.writeBytes(this.masterSecret);
         _local_10.writeBytes(this.serverRandom);
         _local_10.writeBytes(this.clientRandom);
         this.keyBlock = new ByteArray();
         _local_2 = new ByteArray();
         _local_3 = new ByteArray();
         _local_11 = 65;
         _local_6 = 0;
         while(_local_6 < 16)
         {
            _local_2.position = 0;
            _local_7 = 0;
            while(_local_7 < _local_6 + 1)
            {
               _local_2.writeByte(_local_11);
               _local_7++;
            }
            _local_11++;
            _local_2.writeBytes(_local_10);
            _local_4 = _local_8.hash(_local_2);
            _local_3.position = 0;
            _local_3.writeBytes(this.masterSecret);
            _local_3.writeBytes(_local_4,0);
            _local_5 = _local_9.hash(_local_3);
            this.keyBlock.writeBytes(_local_5);
            _local_6++;
         }
      }
      
      public function setClientRandom(_arg_1:ByteArray) : void
      {
         this.clientRandom = _arg_1;
      }
      
      public function setServerRandom(_arg_1:ByteArray) : void
      {
         this.serverRandom = _arg_1;
      }
      
      public function get useRSA() : Boolean
      {
         return KeyExchanges.useRSA(this.keyExchange);
      }
      
      public function computeVerifyData(_arg_1:uint, _arg_2:ByteArray) : ByteArray
      {
         var _local_7:ByteArray = null;
         var _local_9:ByteArray = null;
         var _local_10:ByteArray = null;
         var _local_3:SHA1 = new SHA1();
         var _local_4:MD5 = new MD5();
         var _local_5:ByteArray = new ByteArray();
         var _local_6:ByteArray = new ByteArray();
         var _local_8:ByteArray = new ByteArray();
         var _local_11:ByteArray = new ByteArray();
         if(_arg_1 == TLSEngine.CLIENT)
         {
            _local_11.writeUnsignedInt(1129074260);
         }
         else
         {
            _local_11.writeUnsignedInt(1397904978);
         }
         this.masterSecret.position = 0;
         _local_5.writeBytes(_arg_2);
         _local_5.writeBytes(_local_11);
         _local_5.writeBytes(this.masterSecret);
         _local_5.writeBytes(this.pad_1,0,40);
         _local_7 = _local_3.hash(_local_5);
         _local_6.writeBytes(this.masterSecret);
         _local_6.writeBytes(this.pad_2,0,40);
         _local_6.writeBytes(_local_7);
         _local_9 = _local_3.hash(_local_6);
         _local_5 = new ByteArray();
         _local_5.writeBytes(_arg_2);
         _local_5.writeBytes(_local_11);
         _local_5.writeBytes(this.masterSecret);
         _local_5.writeBytes(this.pad_1);
         _local_7 = _local_4.hash(_local_5);
         _local_6 = new ByteArray();
         _local_6.writeBytes(this.masterSecret);
         _local_6.writeBytes(this.pad_2);
         _local_6.writeBytes(_local_7);
         _local_10 = _local_4.hash(_local_6);
         _local_8.writeBytes(_local_10,0,_local_10.length);
         _local_8.writeBytes(_local_9,0,_local_9.length);
         var _local_12:String = Hex.fromArray(_local_8);
         _local_8.position = 0;
         return _local_8;
      }
      
      public function computeCertificateVerify(_arg_1:uint, _arg_2:ByteArray) : ByteArray
      {
         return null;
      }
      
      public function getConnectionStates() : Object
      {
         var _local_1:int = 0;
         var _local_2:int = 0;
         var _local_3:int = 0;
         var _local_4:ByteArray = null;
         var _local_5:ByteArray = null;
         var _local_6:ByteArray = null;
         var _local_7:ByteArray = null;
         var _local_8:ByteArray = null;
         var _local_9:ByteArray = null;
         var _local_10:SSLConnectionState = null;
         var _local_11:SSLConnectionState = null;
         if(this.masterSecret != null)
         {
            _local_1 = this.hashSize as Number;
            _local_2 = this.keySize as Number;
            _local_3 = this.IVSize as Number;
            _local_4 = new ByteArray();
            _local_5 = new ByteArray();
            _local_6 = new ByteArray();
            _local_7 = new ByteArray();
            _local_8 = new ByteArray();
            _local_9 = new ByteArray();
            this.keyBlock.position = 0;
            this.keyBlock.readBytes(_local_4,0,_local_1);
            this.keyBlock.readBytes(_local_5,0,_local_1);
            this.keyBlock.readBytes(_local_6,0,_local_2);
            this.keyBlock.readBytes(_local_7,0,_local_2);
            this.keyBlock.readBytes(_local_8,0,_local_3);
            this.keyBlock.readBytes(_local_9,0,_local_3);
            this.keyBlock.position = 0;
            _local_10 = new SSLConnectionState(this.bulkCipher,this.cipherType,this.macAlgorithm,_local_4,_local_6,_local_8);
            _local_11 = new SSLConnectionState(this.bulkCipher,this.cipherType,this.macAlgorithm,_local_5,_local_7,_local_9);
            if(this.entity == TLSEngine.CLIENT)
            {
               return {
                  "read":_local_11,
                  "write":_local_10
               };
            }
            return {
               "read":_local_10,
               "write":_local_11
            };
         }
         return {
            "read":new SSLConnectionState(),
            "write":new SSLConnectionState()
         };
      }
   }
}

