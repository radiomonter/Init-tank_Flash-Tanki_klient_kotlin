package com.hurlant.crypto.tls
{
   import com.hurlant.crypto.cert.X509Certificate;
   import com.hurlant.crypto.cert.X509CertificateCollection;
   import com.hurlant.crypto.prng.Random;
   import com.hurlant.util.ArrayUtil;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.ProgressEvent;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class TLSEngine extends EventDispatcher
   {
      
      public static const SERVER:uint = 0;
      
      public static const CLIENT:uint = 1;
      
      private static const PROTOCOL_HANDSHAKE:uint = 22;
      
      private static const PROTOCOL_ALERT:uint = 21;
      
      private static const PROTOCOL_CHANGE_CIPHER_SPEC:uint = 20;
      
      private static const PROTOCOL_APPLICATION_DATA:uint = 23;
      
      private static const STATE_NEW:uint = 0;
      
      private static const STATE_NEGOTIATING:uint = 1;
      
      private static const STATE_READY:uint = 2;
      
      private static const STATE_CLOSED:uint = 3;
      
      private static const HANDSHAKE_HELLO_REQUEST:uint = 0;
      
      private static const HANDSHAKE_CLIENT_HELLO:uint = 1;
      
      private static const HANDSHAKE_SERVER_HELLO:uint = 2;
      
      private static const HANDSHAKE_CERTIFICATE:uint = 11;
      
      private static const HANDSHAKE_SERVER_KEY_EXCHANGE:uint = 12;
      
      private static const HANDSHAKE_CERTIFICATE_REQUEST:uint = 13;
      
      private static const HANDSHAKE_HELLO_DONE:uint = 14;
      
      private static const HANDSHAKE_CERTIFICATE_VERIFY:uint = 15;
      
      private static const HANDSHAKE_CLIENT_KEY_EXCHANGE:uint = 16;
      
      private static const HANDSHAKE_FINISHED:uint = 20;
      
      public var protocol_version:uint;
      
      private var _entity:uint;
      
      private var _config:TLSConfig;
      
      private var _state:uint;
      
      private var _securityParameters:ISecurityParameters;
      
      private var _currentReadState:IConnectionState;
      
      private var _currentWriteState:IConnectionState;
      
      private var _pendingReadState:IConnectionState;
      
      private var _pendingWriteState:IConnectionState;
      
      private var _handshakePayloads:ByteArray;
      
      private var _handshakeRecords:ByteArray;
      
      private var _iStream:IDataInput;
      
      private var _oStream:IDataOutput;
      
      private var _store:X509CertificateCollection;
      
      private var _otherCertificate:X509Certificate;
      
      private var _otherIdentity:String;
      
      private var _myCertficate:X509Certificate;
      
      private var _myIdentity:String;
      
      private var _packetQueue:Array = [];
      
      private var protocolHandlers:Object;
      
      private var handshakeHandlersServer:Object;
      
      private var handshakeHandlersClient:Object;
      
      private var _entityHandshakeHandlers:Object;
      
      private var _handshakeCanContinue:Boolean = true;
      
      private var _handshakeQueue:Array = [];
      
      private var sendClientCert:Boolean = false;
      
      private var _writeScheduler:uint;
      
      public function TLSEngine(_arg_1:TLSConfig, _arg_2:IDataInput, _arg_3:IDataOutput, _arg_4:String = null)
      {
         this.protocolHandlers = {
            "23":this.parseApplicationData,
            "22":this.parseHandshake,
            "21":this.parseAlert,
            "20":this.parseChangeCipherSpec
         };
         this.handshakeHandlersServer = {
            "0":this.notifyStateError,
            "1":this.parseHandshakeClientHello,
            "2":this.notifyStateError,
            "11":this.loadCertificates,
            "12":this.notifyStateError,
            "13":this.notifyStateError,
            "14":this.notifyStateError,
            "15":this.notifyStateError,
            "16":this.parseHandshakeClientKeyExchange,
            "20":this.verifyHandshake
         };
         this.handshakeHandlersClient = {
            "0":this.parseHandshakeHello,
            "1":this.notifyStateError,
            "2":this.parseHandshakeServerHello,
            "11":this.loadCertificates,
            "12":this.parseServerKeyExchange,
            "13":this.setStateRespondWithCertificate,
            "14":this.sendClientAck,
            "15":this.notifyStateError,
            "16":this.notifyStateError,
            "20":this.verifyHandshake
         };
         super();
         this._entity = _arg_1.entity;
         this._config = _arg_1;
         this._iStream = _arg_2;
         this._oStream = _arg_3;
         this._otherIdentity = _arg_4;
         this._state = STATE_NEW;
         this._entityHandshakeHandlers = this._entity == CLIENT ? this.handshakeHandlersClient : this.handshakeHandlersServer;
         if(this._config.version == SSLSecurityParameters.PROTOCOL_VERSION)
         {
            this._securityParameters = new SSLSecurityParameters(this._entity);
         }
         else
         {
            this._securityParameters = new TLSSecurityParameters(this._entity,this._config.certificate,this._config.privateKey);
         }
         this.protocol_version = this._config.version;
         var _local_5:Object = this._securityParameters.getConnectionStates();
         this._currentReadState = _local_5.read;
         this._currentWriteState = _local_5.write;
         this._handshakePayloads = new ByteArray();
         this._store = new X509CertificateCollection();
      }
      
      public function get peerCertificate() : X509Certificate
      {
         return this._otherCertificate;
      }
      
      public function start() : void
      {
         if(this._entity == CLIENT)
         {
            try
            {
               this.startHandshake();
            }
            catch(e:TLSError)
            {
               handleTLSError(e);
            }
         }
      }
      
      public function dataAvailable(e:* = null) : void
      {
         if(this._state == STATE_CLOSED)
         {
            return;
         }
         try
         {
            this.parseRecord(this._iStream);
         }
         catch(e:TLSError)
         {
            handleTLSError(e);
         }
      }
      
      public function close(_arg_1:TLSError = null) : void
      {
         if(this._state == STATE_CLOSED)
         {
            return;
         }
         var _local_2:ByteArray = new ByteArray();
         if(_arg_1 == null && this._state != STATE_READY)
         {
            _local_2[0] = 1;
            _local_2[1] = TLSError.user_canceled;
            this.sendRecord(PROTOCOL_ALERT,_local_2);
         }
         _local_2[0] = 2;
         if(_arg_1 == null)
         {
            _local_2[1] = TLSError.close_notify;
         }
         else
         {
            _local_2[1] = _arg_1.errorID;
         }
         this.sendRecord(PROTOCOL_ALERT,_local_2);
         this._state = STATE_CLOSED;
         dispatchEvent(new Event(Event.CLOSE));
      }
      
      private function parseRecord(_arg_1:IDataInput) : void
      {
         var _local_2:ByteArray = null;
         var _local_3:uint = 0;
         var _local_4:uint = 0;
         var _local_5:uint = 0;
         var _local_6:uint = 0;
         var _local_7:Object = null;
         while(this._state != STATE_CLOSED && _arg_1.bytesAvailable > 4)
         {
            if(this._packetQueue.length > 0)
            {
               _local_7 = this._packetQueue.shift();
               _local_2 = _local_7.data;
               if(_arg_1.bytesAvailable + _local_2.length >= _local_7.length)
               {
                  _arg_1.readBytes(_local_2,_local_2.length,_local_7.length - _local_2.length);
                  this.parseOneRecord(_local_7.type,_local_7.length,_local_2);
               }
               else
               {
                  _arg_1.readBytes(_local_2,_local_2.length,_arg_1.bytesAvailable);
                  this._packetQueue.push(_local_7);
               }
            }
            else
            {
               _local_3 = uint(_arg_1.readByte());
               _local_4 = uint(_arg_1.readShort());
               _local_5 = uint(_arg_1.readShort());
               if(_local_5 > 16384 + 2048)
               {
                  throw new TLSError("Excessive TLS Record length: " + _local_5,TLSError.record_overflow);
               }
               if(_local_4 != this._securityParameters.version)
               {
                  throw new TLSError("Unsupported TLS version: " + _local_4.toString(16),TLSError.protocol_version);
               }
               _local_2 = new ByteArray();
               _local_6 = Math.min(_arg_1.bytesAvailable,_local_5);
               _arg_1.readBytes(_local_2,0,_local_6);
               if(_local_6 == _local_5)
               {
                  this.parseOneRecord(_local_3,_local_5,_local_2);
               }
               else
               {
                  this._packetQueue.push({
                     "type":_local_3,
                     "length":_local_5,
                     "data":_local_2
                  });
               }
            }
         }
      }
      
      private function parseOneRecord(_arg_1:uint, _arg_2:uint, _arg_3:ByteArray) : void
      {
         _arg_3 = this._currentReadState.decrypt(_arg_1,_arg_2,_arg_3);
         if(_arg_3.length > 16384)
         {
            throw new TLSError("Excessive Decrypted TLS Record length: " + _arg_3.length,TLSError.record_overflow);
         }
         if(this.protocolHandlers.hasOwnProperty(_arg_1))
         {
            while(_arg_3 != null)
            {
               _arg_3 = this.protocolHandlers[_arg_1](_arg_3);
            }
            return;
         }
         throw new TLSError("Unsupported TLS Record Content Type: " + _arg_1.toString(16),TLSError.unexpected_message);
      }
      
      private function startHandshake() : void
      {
         this._state = STATE_NEGOTIATING;
         this.sendClientHello();
      }
      
      private function parseHandshake(_arg_1:ByteArray) : ByteArray
      {
         var _local_6:ByteArray = null;
         var _local_7:* = undefined;
         if(_arg_1.length < 4)
         {
            return null;
         }
         _arg_1.position = 0;
         var _local_2:ByteArray = _arg_1;
         var _local_3:uint = _local_2.readUnsignedByte();
         var _local_4:uint = _local_2.readUnsignedByte();
         var _local_5:uint = uint(_local_4 << 16 | _local_2.readUnsignedShort());
         if(_local_5 + 4 > _arg_1.length)
         {
            return null;
         }
         if(_local_3 != HANDSHAKE_FINISHED)
         {
            this._handshakePayloads.writeBytes(_arg_1,0,_local_5 + 4);
         }
         if(this._entityHandshakeHandlers.hasOwnProperty(_local_3))
         {
            if(this._entityHandshakeHandlers[_local_3] is Function)
            {
               _local_7 = this._entityHandshakeHandlers;
               _local_7[_local_3](_local_2);
            }
            if(_local_5 + 4 < _arg_1.length)
            {
               _local_6 = new ByteArray();
               _local_6.writeBytes(_arg_1,_local_5 + 4,_arg_1.length - (_local_5 + 4));
               return _local_6;
            }
            return null;
         }
         throw new TLSError("Unimplemented or unknown handshake type!",TLSError.internal_error);
      }
      
      private function notifyStateError(_arg_1:ByteArray) : void
      {
         throw new TLSError("Invalid handshake state for a TLS Entity type of " + this._entity,TLSError.internal_error);
      }
      
      private function parseClientKeyExchange(_arg_1:ByteArray) : void
      {
         throw new TLSError("ClientKeyExchange is currently unimplemented!",TLSError.internal_error);
      }
      
      private function parseServerKeyExchange(_arg_1:ByteArray) : void
      {
         throw new TLSError("ServerKeyExchange is currently unimplemented!",TLSError.internal_error);
      }
      
      private function verifyHandshake(_arg_1:ByteArray) : void
      {
         var _local_2:ByteArray = new ByteArray();
         if(this._securityParameters.version == SSLSecurityParameters.PROTOCOL_VERSION)
         {
            _arg_1.readBytes(_local_2,0,36);
         }
         else
         {
            _arg_1.readBytes(_local_2,0,12);
         }
         var _local_3:ByteArray = this._securityParameters.computeVerifyData(1 - this._entity,this._handshakePayloads);
         if(ArrayUtil.equals(_local_2,_local_3))
         {
            this._state = STATE_READY;
            dispatchEvent(new TLSEvent(TLSEvent.READY));
            return;
         }
         throw new TLSError("Invalid Finished mac.",TLSError.bad_record_mac);
      }
      
      private function parseHandshakeHello(_arg_1:ByteArray) : void
      {
         if(this._state != STATE_READY)
         {
            return;
         }
         this._handshakePayloads = new ByteArray();
         this.startHandshake();
      }
      
      private function parseHandshakeClientKeyExchange(_arg_1:ByteArray) : void
      {
         var _local_2:uint = 0;
         var _local_3:ByteArray = null;
         var _local_4:ByteArray = null;
         var _local_5:Object = null;
         if(this._securityParameters.useRSA)
         {
            _local_2 = uint(_arg_1.readShort());
            _local_3 = new ByteArray();
            _arg_1.readBytes(_local_3,0,_local_2);
            _local_4 = new ByteArray();
            this._config.privateKey.decrypt(_local_3,_local_4,_local_2);
            this._securityParameters.setPreMasterSecret(_local_4);
            _local_5 = this._securityParameters.getConnectionStates();
            this._pendingReadState = _local_5.read;
            this._pendingWriteState = _local_5.write;
            return;
         }
         throw new TLSError("parseHandshakeClientKeyExchange not implemented for DH modes.",TLSError.internal_error);
      }
      
      private function parseHandshakeServerHello(_arg_1:IDataInput) : void
      {
         var _local_2:uint = uint(_arg_1.readShort());
         if(_local_2 != this._securityParameters.version)
         {
            throw new TLSError("Unsupported TLS version: " + _local_2.toString(16),TLSError.protocol_version);
         }
         var _local_3:ByteArray = new ByteArray();
         _arg_1.readBytes(_local_3,0,32);
         var _local_4:uint = uint(_arg_1.readByte());
         var _local_5:ByteArray = new ByteArray();
         if(_local_4 > 0)
         {
            _arg_1.readBytes(_local_5,0,_local_4);
         }
         this._securityParameters.setCipher(_arg_1.readShort());
         this._securityParameters.setCompression(_arg_1.readByte());
         this._securityParameters.setServerRandom(_local_3);
      }
      
      private function parseHandshakeClientHello(_arg_1:IDataInput) : void
      {
         var _local_2:Object = null;
         var _local_14:uint = 0;
         var _local_15:uint = 0;
         var _local_16:uint = 0;
         var _local_17:ByteArray = null;
         var _local_9:uint = 0;
         var _local_3:uint = uint(_arg_1.readShort());
         if(_local_3 != this._securityParameters.version)
         {
            throw new TLSError("Unsupported TLS version: " + _local_3.toString(16),TLSError.protocol_version);
         }
         var _local_4:ByteArray = new ByteArray();
         _arg_1.readBytes(_local_4,0,32);
         var _local_5:uint = uint(_arg_1.readByte());
         var _local_6:ByteArray = new ByteArray();
         if(_local_5 > 0)
         {
            _arg_1.readBytes(_local_6,0,_local_5);
         }
         var _local_7:Array = [];
         var _local_8:uint = uint(_arg_1.readShort());
         while(_local_9 < _local_8 / 2)
         {
            _local_7.push(_arg_1.readShort());
            _local_9++;
         }
         var _local_10:Array = [];
         var _local_11:uint = uint(_arg_1.readByte());
         _local_9 = 0;
         while(_local_9 < _local_11)
         {
            _local_10.push(_arg_1.readByte());
            _local_9++;
         }
         _local_2 = {
            "random":_local_4,
            "session":_local_6,
            "suites":_local_7,
            "compressions":_local_10
         };
         var _local_12:uint = 2 + 32 + 1 + _local_5 + 2 + _local_8 + 1 + _local_11;
         var _local_13:Array = [];
         if(_local_12 < length)
         {
            _local_14 = uint(_arg_1.readShort());
            while(_local_14 > 0)
            {
               _local_15 = uint(_arg_1.readShort());
               _local_16 = uint(_arg_1.readShort());
               _local_17 = new ByteArray();
               _arg_1.readBytes(_local_17,0,_local_16);
               _local_14 -= 4 + _local_16;
               _local_13.push({
                  "type":_local_15,
                  "length":_local_16,
                  "data":_local_17
               });
            }
         }
         _local_2.ext = _local_13;
         this.sendServerHello(_local_2);
         this.sendCertificate();
         this.sendServerHelloDone();
      }
      
      private function sendClientHello() : void
      {
         var _local_5:int = 0;
         var _local_1:ByteArray = new ByteArray();
         _local_1.writeShort(this._securityParameters.version);
         var _local_2:Random = new Random();
         var _local_3:ByteArray = new ByteArray();
         _local_2.nextBytes(_local_3,32);
         this._securityParameters.setClientRandom(_local_3);
         _local_1.writeBytes(_local_3,0,32);
         _local_1.writeByte(32);
         _local_2.nextBytes(_local_1,32);
         var _local_4:Array = this._config.cipherSuites;
         _local_1.writeShort(2 * _local_4.length);
         while(_local_5 < _local_4.length)
         {
            _local_1.writeShort(_local_4[_local_5]);
            _local_5++;
         }
         _local_4 = this._config.compressions;
         _local_1.writeByte(_local_4.length);
         _local_5 = 0;
         while(_local_5 < _local_4.length)
         {
            _local_1.writeByte(_local_4[_local_5]);
            _local_5++;
         }
         _local_1.position = 0;
         this.sendHandshake(HANDSHAKE_CLIENT_HELLO,_local_1.length,_local_1);
      }
      
      private function findMatch(_arg_1:Array, _arg_2:Array) : int
      {
         var _local_4:uint = 0;
         var _local_3:int = 0;
         while(_local_3 < _arg_1.length)
         {
            _local_4 = uint(_arg_1[_local_3]);
            if(_arg_2.indexOf(_local_4) > -1)
            {
               return _local_4;
            }
            _local_3++;
         }
         return -1;
      }
      
      private function sendServerHello(_arg_1:Object) : void
      {
         var _local_2:int = this.findMatch(this._config.cipherSuites,_arg_1.suites);
         if(_local_2 == -1)
         {
            throw new TLSError("No compatible cipher found.",TLSError.handshake_failure);
         }
         this._securityParameters.setCipher(_local_2);
         var _local_3:int = this.findMatch(this._config.compressions,_arg_1.compressions);
         if(_local_3 == 1)
         {
            throw new TLSError("No compatible compression method found.",TLSError.handshake_failure);
         }
         this._securityParameters.setCompression(_local_3);
         this._securityParameters.setClientRandom(_arg_1.random);
         var _local_4:ByteArray = new ByteArray();
         _local_4.writeShort(this._securityParameters.version);
         var _local_5:Random = new Random();
         var _local_6:ByteArray = new ByteArray();
         _local_5.nextBytes(_local_6,32);
         this._securityParameters.setServerRandom(_local_6);
         _local_4.writeBytes(_local_6,0,32);
         _local_4.writeByte(32);
         _local_5.nextBytes(_local_4,32);
         _local_4.writeShort(_arg_1.suites[0]);
         _local_4.writeByte(_arg_1.compressions[0]);
         _local_4.position = 0;
         this.sendHandshake(HANDSHAKE_SERVER_HELLO,_local_4.length,_local_4);
      }
      
      private function setStateRespondWithCertificate(_arg_1:ByteArray = null) : void
      {
         this.sendClientCert = true;
      }
      
      private function sendCertificate(_arg_1:ByteArray = null) : void
      {
         var _local_3:uint = 0;
         var _local_4:uint = 0;
         var _local_2:ByteArray = this._config.certificate;
         var _local_5:ByteArray = new ByteArray();
         if(_local_2 != null)
         {
            _local_3 = _local_2.length;
            _local_4 = _local_2.length + 3;
            _local_5.writeByte(_local_4 >> 16);
            _local_5.writeShort(_local_4 & 0xFFFF);
            _local_5.writeByte(_local_3 >> 16);
            _local_5.writeShort(_local_3 & 0xFFFF);
            _local_5.writeBytes(_local_2);
         }
         else
         {
            _local_5.writeShort(0);
            _local_5.writeByte(0);
         }
         _local_5.position = 0;
         this.sendHandshake(HANDSHAKE_CERTIFICATE,_local_5.length,_local_5);
      }
      
      private function sendCertificateVerify() : void
      {
         var _local_1:ByteArray = new ByteArray();
         var _local_2:ByteArray = this._securityParameters.computeCertificateVerify(this._entity,this._handshakePayloads);
         _local_2.position = 0;
         this.sendHandshake(HANDSHAKE_CERTIFICATE_VERIFY,_local_2.length,_local_2);
      }
      
      private function sendServerHelloDone() : void
      {
         var _local_1:ByteArray = new ByteArray();
         this.sendHandshake(HANDSHAKE_HELLO_DONE,_local_1.length,_local_1);
      }
      
      private function sendClientKeyExchange() : void
      {
         var _local_1:ByteArray = null;
         var _local_2:Random = null;
         var _local_3:ByteArray = null;
         var _local_4:ByteArray = null;
         var _local_5:ByteArray = null;
         var _local_6:Object = null;
         if(this._securityParameters.useRSA)
         {
            _local_1 = new ByteArray();
            _local_1.writeShort(this._securityParameters.version);
            _local_2 = new Random();
            _local_2.nextBytes(_local_1,46);
            _local_1.position = 0;
            _local_3 = new ByteArray();
            _local_3.writeBytes(_local_1,0,_local_1.length);
            _local_3.position = 0;
            this._securityParameters.setPreMasterSecret(_local_3);
            _local_4 = new ByteArray();
            this._otherCertificate.getPublicKey().encrypt(_local_3,_local_4,_local_3.length);
            _local_4.position = 0;
            _local_5 = new ByteArray();
            if(this._securityParameters.version > 768)
            {
               _local_5.writeShort(_local_4.length);
            }
            _local_5.writeBytes(_local_4,0,_local_4.length);
            _local_5.position = 0;
            this.sendHandshake(HANDSHAKE_CLIENT_KEY_EXCHANGE,_local_5.length,_local_5);
            _local_6 = this._securityParameters.getConnectionStates();
            this._pendingReadState = _local_6.read;
            this._pendingWriteState = _local_6.write;
            return;
         }
         throw new TLSError("Non-RSA Client Key Exchange not implemented.",TLSError.internal_error);
      }
      
      private function sendFinished() : void
      {
         var _local_1:ByteArray = this._securityParameters.computeVerifyData(this._entity,this._handshakePayloads);
         _local_1.position = 0;
         this.sendHandshake(HANDSHAKE_FINISHED,_local_1.length,_local_1);
      }
      
      private function sendHandshake(_arg_1:uint, _arg_2:uint, _arg_3:IDataInput) : void
      {
         var _local_4:ByteArray = new ByteArray();
         _local_4.writeByte(_arg_1);
         _local_4.writeByte(0);
         _local_4.writeShort(_arg_2);
         _arg_3.readBytes(_local_4,_local_4.position,_arg_2);
         this._handshakePayloads.writeBytes(_local_4,0,_local_4.length);
         this.sendRecord(PROTOCOL_HANDSHAKE,_local_4);
      }
      
      private function sendChangeCipherSpec() : void
      {
         var _local_1:ByteArray = new ByteArray();
         _local_1[0] = 1;
         this.sendRecord(PROTOCOL_CHANGE_CIPHER_SPEC,_local_1);
         this._currentWriteState = this._pendingWriteState;
         this._pendingWriteState = null;
      }
      
      public function sendApplicationData(_arg_1:ByteArray, _arg_2:uint = 0, _arg_3:uint = 0) : void
      {
         var _local_4:ByteArray = new ByteArray();
         var _local_5:uint = _arg_3;
         if(_local_5 == 0)
         {
            _local_5 = _arg_1.length;
         }
         while(_local_5 > 16384)
         {
            _local_4.position = _local_4.length = 0;
            _local_4.writeBytes(_arg_1,_arg_2,16384);
            _local_4.position = 0;
            this.sendRecord(PROTOCOL_APPLICATION_DATA,_local_4);
            _arg_2 += 16384;
            _local_5 -= 16384;
         }
         _local_4.position = _local_4.length = 0;
         _local_4.writeBytes(_arg_1,_arg_2,_local_5);
         _local_4.position = 0;
         this.sendRecord(PROTOCOL_APPLICATION_DATA,_local_4);
      }
      
      private function sendRecord(_arg_1:uint, _arg_2:ByteArray) : void
      {
         _arg_2 = this._currentWriteState.encrypt(_arg_1,_arg_2);
         this._oStream.writeByte(_arg_1);
         this._oStream.writeShort(this._securityParameters.version);
         this._oStream.writeShort(_arg_2.length);
         this._oStream.writeBytes(_arg_2,0,_arg_2.length);
         this.scheduleWrite();
      }
      
      private function scheduleWrite() : void
      {
         if(this._writeScheduler != 0)
         {
            return;
         }
         this._writeScheduler = setTimeout(this.commitWrite,0);
      }
      
      private function commitWrite() : void
      {
         clearTimeout(this._writeScheduler);
         this._writeScheduler = 0;
         if(this._state != STATE_CLOSED)
         {
            dispatchEvent(new ProgressEvent(ProgressEvent.SOCKET_DATA));
         }
      }
      
      private function sendClientAck(_arg_1:ByteArray) : void
      {
         if(this._handshakeCanContinue)
         {
            if(this.sendClientCert)
            {
               this.sendCertificate();
            }
            this.sendClientKeyExchange();
            if(this._config.certificate != null)
            {
               this.sendCertificateVerify();
            }
            this.sendChangeCipherSpec();
            this.sendFinished();
         }
      }
      
      private function loadCertificates(_arg_1:ByteArray) : void
      {
         var _local_7:Boolean = false;
         var _local_8:uint = 0;
         var _local_9:ByteArray = null;
         var _local_10:X509Certificate = null;
         var _local_11:String = null;
         var _local_12:RegExp = null;
         var _local_5:X509Certificate = null;
         var _local_6:int = 0;
         var _local_2:uint = uint(_arg_1.readByte());
         var _local_3:uint = uint(_local_2 << 16 | _arg_1.readShort());
         var _local_4:Array = [];
         while(_local_3 > 0)
         {
            _local_2 = uint(_arg_1.readByte());
            _local_8 = uint(_local_2 << 16 | _arg_1.readShort());
            _local_9 = new ByteArray();
            _arg_1.readBytes(_local_9,0,_local_8);
            _local_4.push(_local_9);
            _local_3 -= 3 + _local_8;
         }
         while(_local_6 < _local_4.length)
         {
            _local_10 = new X509Certificate(_local_4[_local_6]);
            this._store.addCertificate(_local_10);
            if(_local_5 == null)
            {
               _local_5 = _local_10;
            }
            _local_6++;
         }
         if(this._config.trustAllCertificates)
         {
            _local_7 = true;
         }
         else if(this._config.trustSelfSignedCertificates)
         {
            _local_7 = _local_5.isSelfSigned(new Date());
         }
         else
         {
            _local_7 = _local_5.isSigned(this._store,this._config.CAStore);
         }
         if(_local_7)
         {
            if(this._otherIdentity == null || this._config.ignoreCommonNameMismatch)
            {
               this._otherCertificate = _local_5;
            }
            else
            {
               _local_11 = _local_5.getCommonName();
               _local_12 = new RegExp(_local_11.replace(/[\^\\\-$.[\]|()?+{}]/g,"\\$&").replace(/\*/g,"[^.]+"),"gi");
               if(Boolean(_local_12.exec(this._otherIdentity)))
               {
                  this._otherCertificate = _local_5;
               }
               else
               {
                  if(!this._config.promptUserForAcceptCert)
                  {
                     throw new TLSError("Invalid common name: " + _local_5.getCommonName() + ", expected " + this._otherIdentity,TLSError.bad_certificate);
                  }
                  this._handshakeCanContinue = false;
                  dispatchEvent(new TLSEvent(TLSEvent.PROMPT_ACCEPT_CERT));
               }
            }
         }
         else
         {
            if(!this._config.promptUserForAcceptCert)
            {
               throw new TLSError("Cannot verify certificate",TLSError.bad_certificate);
            }
            this._handshakeCanContinue = false;
            dispatchEvent(new TLSEvent(TLSEvent.PROMPT_ACCEPT_CERT));
         }
      }
      
      public function acceptPeerCertificate() : void
      {
         this._handshakeCanContinue = true;
         this.sendClientAck(null);
      }
      
      public function rejectPeerCertificate() : void
      {
         throw new TLSError("Peer certificate not accepted!",TLSError.bad_certificate);
      }
      
      private function parseAlert(_arg_1:ByteArray) : void
      {
         this.close();
      }
      
      private function parseChangeCipherSpec(_arg_1:ByteArray) : void
      {
         _arg_1.readUnsignedByte();
         if(this._pendingReadState == null)
         {
            throw new TLSError("Not ready to Change Cipher Spec, damnit.",TLSError.unexpected_message);
         }
         this._currentReadState = this._pendingReadState;
         this._pendingReadState = null;
      }
      
      private function parseApplicationData(_arg_1:ByteArray) : void
      {
         if(this._state != STATE_READY)
         {
            throw new TLSError("Too soon for data!",TLSError.unexpected_message);
         }
         dispatchEvent(new TLSEvent(TLSEvent.DATA,_arg_1));
      }
      
      private function handleTLSError(_arg_1:TLSError) : void
      {
         this.close(_arg_1);
      }
   }
}

