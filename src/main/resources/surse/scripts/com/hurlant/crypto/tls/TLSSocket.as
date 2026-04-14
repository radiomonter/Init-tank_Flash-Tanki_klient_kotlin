package com.hurlant.crypto.tls
{
   import com.hurlant.crypto.cert.X509Certificate;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.ObjectEncoding;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class TLSSocket extends Socket implements IDataInput, IDataOutput
   {
      
      public static const ACCEPT_PEER_CERT_PROMPT:String = "acceptPeerCertificatePrompt";
      
      private var _endian:String;
      
      private var _objectEncoding:uint;
      
      private var _iStream:ByteArray;
      
      private var _oStream:ByteArray;
      
      private var _iStream_cursor:uint;
      
      private var _socket:Socket;
      
      private var _config:TLSConfig;
      
      private var _engine:TLSEngine;
      
      private var _ready:Boolean;
      
      private var _writeScheduler:uint;
      
      public function TLSSocket(_arg_1:String = null, _arg_2:int = 0, _arg_3:TLSConfig = null)
      {
         super();
         this._config = _arg_3;
         if(_arg_1 != null && _arg_2 != 0)
         {
            this.connect(_arg_1,_arg_2);
         }
      }
      
      override public function get bytesAvailable() : uint
      {
         return this._iStream.bytesAvailable;
      }
      
      override public function get connected() : Boolean
      {
         return this._socket.connected;
      }
      
      override public function get endian() : String
      {
         return this._endian;
      }
      
      override public function set endian(_arg_1:String) : void
      {
         this._endian = _arg_1;
         this._iStream.endian = _arg_1;
         this._oStream.endian = _arg_1;
      }
      
      override public function get objectEncoding() : uint
      {
         return this._objectEncoding;
      }
      
      override public function set objectEncoding(_arg_1:uint) : void
      {
         this._objectEncoding = _arg_1;
         this._iStream.objectEncoding = _arg_1;
         this._oStream.objectEncoding = _arg_1;
      }
      
      private function onTLSData(_arg_1:TLSEvent) : void
      {
         if(this._iStream.position == this._iStream.length)
         {
            this._iStream.position = 0;
            this._iStream.length = 0;
            this._iStream_cursor = 0;
         }
         var _local_2:uint = this._iStream.position;
         this._iStream.position = this._iStream_cursor;
         this._iStream.writeBytes(_arg_1.data);
         this._iStream_cursor = this._iStream.position;
         this._iStream.position = _local_2;
         dispatchEvent(new ProgressEvent(ProgressEvent.SOCKET_DATA,false,false,_arg_1.data.length));
      }
      
      private function onTLSReady(_arg_1:TLSEvent) : void
      {
         this._ready = true;
         this.scheduleWrite();
      }
      
      private function onTLSClose(_arg_1:Event) : void
      {
         dispatchEvent(_arg_1);
         this.close();
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
         if(this._ready)
         {
            this._engine.sendApplicationData(this._oStream);
            this._oStream.length = 0;
         }
      }
      
      override public function close() : void
      {
         this._ready = false;
         this._engine.close();
         if(this._socket.connected)
         {
            this._socket.flush();
            this._socket.close();
         }
      }
      
      public function setTLSConfig(_arg_1:TLSConfig) : void
      {
         this._config = _arg_1;
      }
      
      override public function connect(_arg_1:String, _arg_2:int) : void
      {
         this.init(new Socket(),this._config,_arg_1);
         this._socket.connect(_arg_1,_arg_2);
         this._engine.start();
      }
      
      public function releaseSocket() : void
      {
         this._socket.removeEventListener(Event.CONNECT,dispatchEvent);
         this._socket.removeEventListener(IOErrorEvent.IO_ERROR,dispatchEvent);
         this._socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,dispatchEvent);
         this._socket.removeEventListener(Event.CLOSE,dispatchEvent);
         this._socket.removeEventListener(ProgressEvent.SOCKET_DATA,this._engine.dataAvailable);
         this._socket = null;
      }
      
      public function reinitialize(host:String, config:TLSConfig) : void
      {
         var ba:ByteArray = new ByteArray();
         if(this._socket.bytesAvailable > 0)
         {
            this._socket.readBytes(ba,0,this._socket.bytesAvailable);
         }
         this._iStream = new ByteArray();
         this._oStream = new ByteArray();
         this._iStream_cursor = 0;
         this.objectEncoding = ObjectEncoding.DEFAULT;
         this.endian = Endian.BIG_ENDIAN;
         if(config == null)
         {
            config = new TLSConfig(TLSEngine.CLIENT);
         }
         this._engine = new TLSEngine(config,this._socket,this._socket,host);
         this._engine.addEventListener(TLSEvent.DATA,this.onTLSData);
         this._engine.addEventListener(TLSEvent.READY,this.onTLSReady);
         this._engine.addEventListener(Event.CLOSE,this.onTLSClose);
         this._engine.addEventListener(ProgressEvent.SOCKET_DATA,function(_arg_1:*):void
         {
            _socket.flush();
         });
         this._socket.addEventListener(ProgressEvent.SOCKET_DATA,this._engine.dataAvailable);
         this._engine.addEventListener(TLSEvent.PROMPT_ACCEPT_CERT,this.onAcceptCert);
         this._ready = false;
         this._engine.start();
      }
      
      public function startTLS(_arg_1:Socket, _arg_2:String, _arg_3:TLSConfig = null) : void
      {
         if(!_arg_1.connected)
         {
            throw new Error("Cannot STARTTLS on a socket that isn\'t connected.");
         }
         this.init(_arg_1,_arg_3,_arg_2);
         this._engine.start();
      }
      
      private function init(socket:Socket, config:TLSConfig, host:String) : void
      {
         this._iStream = new ByteArray();
         this._oStream = new ByteArray();
         this._iStream_cursor = 0;
         this.objectEncoding = ObjectEncoding.DEFAULT;
         this.endian = Endian.BIG_ENDIAN;
         this._socket = socket;
         this._socket.addEventListener(Event.CONNECT,dispatchEvent);
         this._socket.addEventListener(IOErrorEvent.IO_ERROR,dispatchEvent);
         this._socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR,dispatchEvent);
         this._socket.addEventListener(Event.CLOSE,dispatchEvent);
         if(config == null)
         {
            config = new TLSConfig(TLSEngine.CLIENT);
         }
         this._engine = new TLSEngine(config,this._socket,this._socket,host);
         this._engine.addEventListener(TLSEvent.DATA,this.onTLSData);
         this._engine.addEventListener(TLSEvent.PROMPT_ACCEPT_CERT,this.onAcceptCert);
         this._engine.addEventListener(TLSEvent.READY,this.onTLSReady);
         this._engine.addEventListener(Event.CLOSE,this.onTLSClose);
         this._engine.addEventListener(ProgressEvent.SOCKET_DATA,function(_arg_1:*):void
         {
            if(connected)
            {
               _socket.flush();
            }
         });
         this._socket.addEventListener(ProgressEvent.SOCKET_DATA,this._engine.dataAvailable);
         this._ready = false;
      }
      
      override public function flush() : void
      {
         this.commitWrite();
         this._socket.flush();
      }
      
      override public function readBoolean() : Boolean
      {
         return this._iStream.readBoolean();
      }
      
      override public function readByte() : int
      {
         return this._iStream.readByte();
      }
      
      override public function readBytes(_arg_1:ByteArray, _arg_2:uint = 0, _arg_3:uint = 0) : void
      {
         this._iStream.readBytes(_arg_1,_arg_2,_arg_3);
      }
      
      override public function readDouble() : Number
      {
         return this._iStream.readDouble();
      }
      
      override public function readFloat() : Number
      {
         return this._iStream.readFloat();
      }
      
      override public function readInt() : int
      {
         return this._iStream.readInt();
      }
      
      override public function readMultiByte(_arg_1:uint, _arg_2:String) : String
      {
         return this._iStream.readMultiByte(_arg_1,_arg_2);
      }
      
      override public function readObject() : *
      {
         return this._iStream.readObject();
      }
      
      override public function readShort() : int
      {
         return this._iStream.readShort();
      }
      
      override public function readUnsignedByte() : uint
      {
         return this._iStream.readUnsignedByte();
      }
      
      override public function readUnsignedInt() : uint
      {
         return this._iStream.readUnsignedInt();
      }
      
      override public function readUnsignedShort() : uint
      {
         return this._iStream.readUnsignedShort();
      }
      
      override public function readUTF() : String
      {
         return this._iStream.readUTF();
      }
      
      override public function readUTFBytes(_arg_1:uint) : String
      {
         return this._iStream.readUTFBytes(_arg_1);
      }
      
      override public function writeBoolean(_arg_1:Boolean) : void
      {
         this._oStream.writeBoolean(_arg_1);
         this.scheduleWrite();
      }
      
      override public function writeByte(_arg_1:int) : void
      {
         this._oStream.writeByte(_arg_1);
         this.scheduleWrite();
      }
      
      override public function writeBytes(_arg_1:ByteArray, _arg_2:uint = 0, _arg_3:uint = 0) : void
      {
         this._oStream.writeBytes(_arg_1,_arg_2,_arg_3);
         this.scheduleWrite();
      }
      
      override public function writeDouble(_arg_1:Number) : void
      {
         this._oStream.writeDouble(_arg_1);
         this.scheduleWrite();
      }
      
      override public function writeFloat(_arg_1:Number) : void
      {
         this._oStream.writeFloat(_arg_1);
         this.scheduleWrite();
      }
      
      override public function writeInt(_arg_1:int) : void
      {
         this._oStream.writeInt(_arg_1);
         this.scheduleWrite();
      }
      
      override public function writeMultiByte(_arg_1:String, _arg_2:String) : void
      {
         this._oStream.writeMultiByte(_arg_1,_arg_2);
         this.scheduleWrite();
      }
      
      override public function writeObject(_arg_1:*) : void
      {
         this._oStream.writeObject(_arg_1);
         this.scheduleWrite();
      }
      
      override public function writeShort(_arg_1:int) : void
      {
         this._oStream.writeShort(_arg_1);
         this.scheduleWrite();
      }
      
      override public function writeUnsignedInt(_arg_1:uint) : void
      {
         this._oStream.writeUnsignedInt(_arg_1);
         this.scheduleWrite();
      }
      
      override public function writeUTF(_arg_1:String) : void
      {
         this._oStream.writeUTF(_arg_1);
         this.scheduleWrite();
      }
      
      override public function writeUTFBytes(_arg_1:String) : void
      {
         this._oStream.writeUTFBytes(_arg_1);
         this.scheduleWrite();
      }
      
      public function getPeerCertificate() : X509Certificate
      {
         return this._engine.peerCertificate;
      }
      
      public function onAcceptCert(_arg_1:TLSEvent) : void
      {
         dispatchEvent(new TLSSocketEvent(this._engine.peerCertificate));
      }
      
      public function acceptPeerCertificate(_arg_1:Event) : void
      {
         this._engine.acceptPeerCertificate();
      }
      
      public function rejectPeerCertificate(_arg_1:Event) : void
      {
         this._engine.rejectPeerCertificate();
      }
   }
}

