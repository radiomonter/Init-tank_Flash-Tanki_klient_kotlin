package com.hurlant.crypto.tls
{
   import com.hurlant.crypto.hash.MD5;
   import com.hurlant.crypto.hash.SHA1;
   import com.hurlant.crypto.prng.TLSPRF;
   import com.hurlant.crypto.rsa.RSAKey;
   import flash.utils.ByteArray;
   
   public class TLSSecurityParameters implements ISecurityParameters
   {
      
      public static var USER_CERTIFICATE:String;
      
      public static const COMPRESSION_NULL:uint = 0;
      
      public static var IGNORE_CN_MISMATCH:Boolean = true;
      
      public static var ENABLE_USER_CLIENT_CERTIFICATE:Boolean = false;
      
      public static const PROTOCOL_VERSION:uint = 769;
      
      private var cert:ByteArray;
      
      private var key:RSAKey;
      
      private var entity:uint;
      
      private var bulkCipher:uint;
      
      private var cipherType:uint;
      
      private var keySize:uint;
      
      private var keyMaterialLength:uint;
      
      private var IVSize:uint;
      
      private var macAlgorithm:uint;
      
      private var hashSize:uint;
      
      private var compression:uint;
      
      private var masterSecret:ByteArray;
      
      private var clientRandom:ByteArray;
      
      private var serverRandom:ByteArray;
      
      private var ignoreCNMismatch:Boolean = true;
      
      private var trustAllCerts:Boolean = false;
      
      private var trustSelfSigned:Boolean = false;
      
      private var tlsDebug:Boolean = false;
      
      public var keyExchange:uint;
      
      public function TLSSecurityParameters(_arg_1:uint, _arg_2:ByteArray = null, _arg_3:RSAKey = null)
      {
         super();
         this.entity = _arg_1;
         this.reset();
         this.key = _arg_3;
         this.cert = _arg_2;
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
         this.bulkCipher = CipherSuites.getBulkCipher(_arg_1);
         this.cipherType = BulkCiphers.getType(this.bulkCipher);
         this.keySize = BulkCiphers.getExpandedKeyBytes(this.bulkCipher);
         this.keyMaterialLength = BulkCiphers.getKeyBytes(this.bulkCipher);
         this.IVSize = BulkCiphers.getIVSize(this.bulkCipher);
         this.keyExchange = CipherSuites.getKeyExchange(_arg_1);
         this.macAlgorithm = CipherSuites.getMac(_arg_1);
         this.hashSize = MACs.getHashSize(this.macAlgorithm);
      }
      
      public function setCompression(_arg_1:uint) : void
      {
         this.compression = _arg_1;
      }
      
      public function setPreMasterSecret(_arg_1:ByteArray) : void
      {
         var _local_2:ByteArray = new ByteArray();
         _local_2.writeBytes(this.clientRandom,0,this.clientRandom.length);
         _local_2.writeBytes(this.serverRandom,0,this.serverRandom.length);
         var _local_3:TLSPRF = new TLSPRF(_arg_1,"master secret",_local_2);
         this.masterSecret = new ByteArray();
         _local_3.nextBytes(this.masterSecret,48);
         if(this.tlsDebug)
         {
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
         var _local_7:TLSPRF = null;
         var _local_3:ByteArray = new ByteArray();
         var _local_4:MD5 = new MD5();
         if(this.tlsDebug)
         {
            _local_3.writeBytes(_local_4.hash(_arg_2),0,_local_4.getHashSize());
         }
         var _local_5:SHA1 = new SHA1();
         _local_3.writeBytes(_local_5.hash(_arg_2),0,_local_5.getHashSize());
         if(this.tlsDebug)
         {
            _local_7 = new TLSPRF(this.masterSecret,_arg_1 == TLSEngine.CLIENT ? "client finished" : "server finished",_local_3);
         }
         var _local_6:ByteArray = new ByteArray();
         _local_7.nextBytes(_local_6,12);
         if(this.tlsDebug)
         {
            _local_6.position = 0;
         }
         return _local_6;
      }
      
      public function computeCertificateVerify(_arg_1:uint, _arg_2:ByteArray) : ByteArray
      {
         var _local_3:ByteArray = new ByteArray();
         var _local_4:MD5 = new MD5();
         _local_3.writeBytes(_local_4.hash(_arg_2),0,_local_4.getHashSize());
         var _local_5:SHA1 = new SHA1();
         _local_3.writeBytes(_local_5.hash(_arg_2),0,_local_5.getHashSize());
         _local_3.position = 0;
         var _local_6:ByteArray = new ByteArray();
         this.key.sign(_local_3,_local_6,_local_3.bytesAvailable);
         _local_6.position = 0;
         return _local_6;
      }
      
      public function getConnectionStates() : Object
      {
         var _local_1:ByteArray = null;
         var _local_2:TLSPRF = null;
         var _local_3:ByteArray = null;
         var _local_4:ByteArray = null;
         var _local_5:ByteArray = null;
         var _local_6:ByteArray = null;
         var _local_7:ByteArray = null;
         var _local_8:ByteArray = null;
         var _local_9:TLSConnectionState = null;
         var _local_10:TLSConnectionState = null;
         if(this.masterSecret != null)
         {
            _local_1 = new ByteArray();
            _local_1.writeBytes(this.serverRandom,0,this.serverRandom.length);
            _local_1.writeBytes(this.clientRandom,0,this.clientRandom.length);
            _local_2 = new TLSPRF(this.masterSecret,"key expansion",_local_1);
            _local_3 = new ByteArray();
            _local_2.nextBytes(_local_3,this.hashSize);
            _local_4 = new ByteArray();
            _local_2.nextBytes(_local_4,this.hashSize);
            _local_5 = new ByteArray();
            _local_2.nextBytes(_local_5,this.keyMaterialLength);
            _local_6 = new ByteArray();
            _local_2.nextBytes(_local_6,this.keyMaterialLength);
            _local_7 = new ByteArray();
            _local_2.nextBytes(_local_7,this.IVSize);
            _local_8 = new ByteArray();
            _local_2.nextBytes(_local_8,this.IVSize);
            _local_9 = new TLSConnectionState(this.bulkCipher,this.cipherType,this.macAlgorithm,_local_3,_local_5,_local_7);
            _local_10 = new TLSConnectionState(this.bulkCipher,this.cipherType,this.macAlgorithm,_local_4,_local_6,_local_8);
            if(this.entity == TLSEngine.CLIENT)
            {
               return {
                  "read":_local_10,
                  "write":_local_9
               };
            }
            return {
               "read":_local_9,
               "write":_local_10
            };
         }
         return {
            "read":new TLSConnectionState(),
            "write":new TLSConnectionState()
         };
      }
   }
}

