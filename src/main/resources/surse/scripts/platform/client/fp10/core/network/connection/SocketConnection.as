package platform.client.fp10.core.network.connection
{
   import alternativa.osgi.service.launcherparams.ILauncherParams;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import alternativa.osgi.service.network.INetworkService;
   import alternativa.protocol.CompressionType;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import com.hurlant.crypto.tls.TLSConfig;
   import com.hurlant.crypto.tls.TLSEngine;
   import com.hurlant.crypto.tls.TLSSecurityParameters;
   import com.hurlant.crypto.tls.TLSSocket;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import flash.utils.IDataOutput;
   import platform.client.fp10.core.network.ICommandHandler;
   import platform.client.fp10.core.network.command.IConnectionInitCommand;
   import platform.client.fp10.core.network.connection.protection.PrimitiveProtectionContext;
   import platform.client.fp10.core.service.errormessage.IErrorMessageService;
   import platform.client.fp10.core.service.errormessage.errors.CannotEstablishConnectionError;
   import platform.client.fp10.core.service.errormessage.errors.TransportError;
   import platform.client.fp10.core.service.errormessage.errors.UnclassifyedError;
   
   public class SocketConnection implements IConnection
   {
      
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var messageBoxService:IErrorMessageService;
      
      [Inject]
      public static var launcherParams:ILauncherParams;
      
      [Inject]
      public static var networkService:INetworkService;
      
      protected static var connectionLogger:Logger;
      
      protected static var networkLogger:Logger;
      
      protected static var serverCommandLogger:Logger;
      
      private static const PARAM_CLOSE_ON_ERROR:String = "closeonerror";
      
      public var host:String;
      
      public var ports:Vector.<int>;
      
      protected var portIndex:int;
      
      protected var connectionStatus:ConnectionStatus;
      
      protected var protocol:IProtocol;
      
      protected var commandCodec:ICodec;
      
      protected var commandHandler:ICommandHandler;
      
      protected var secure:Boolean;
      
      private var protectionContext:IProtectionContext;
      
      protected var rawDataBuffer:ByteArray;
      
      private var dataBuffer:ByteArray;
      
      private var currentPacketPosition:int;
      
      private var socket:Socket;
      
      public function SocketConnection(_arg_1:ConnectionInitializers)
      {
         var _local_2:TLSConfig = null;
         var _local_3:TLSSocket = null;
         this.connectionStatus = ConnectionStatus.IDLE;
         this.rawDataBuffer = new ByteArray();
         this.dataBuffer = new ByteArray();
         super();
         this.commandCodec = _arg_1.commandCodec;
         this.protocol = _arg_1.protocol;
         this.commandHandler = _arg_1.commandHandler;
         this.secure = _arg_1.secure;
         this.protectionContext = _arg_1.protectionContext;
         initLoggers();
         if(this.secure)
         {
            _local_2 = new TLSConfig(TLSEngine.CLIENT);
            _local_2.version = TLSSecurityParameters.PROTOCOL_VERSION;
            _local_2.trustAllCertificates = true;
            _local_2.ignoreCommonNameMismatch = true;
            _local_2.trustSelfSignedCertificates = true;
            _local_3 = new TLSSocket();
            _local_3.setTLSConfig(_local_2);
            this.socket = _local_3;
         }
         else
         {
            this.socket = new Socket();
         }
         this.initializeListeners();
      }
      
      private static function initLoggers() : void
      {
         connectionLogger = connectionLogger || logService.getLogger("connection");
         networkLogger = networkLogger || logService.getLogger("network");
         serverCommandLogger = serverCommandLogger || logService.getLogger("command");
      }
      
      public function connect(_arg_1:ConnectionConnectParameters) : void
      {
         this.host = _arg_1.host;
         this.preparePorts(_arg_1);
         this.connectionStatus = ConnectionStatus.CONNECTING;
         this.portIndex = -1;
         this.tryNextPort();
      }
      
      protected function tryNextPort() : void
      {
         ++this.portIndex;
         if(this.portIndex < this.ports.length)
         {
            this.tryConnect();
         }
         else
         {
            messageBoxService.showMessage(new CannotEstablishConnectionError(this.host,this.ports));
         }
      }
      
      protected function writeCommand(_arg_1:Object, _arg_2:IDataOutput) : void
      {
         var _local_3:* = _arg_1 is IConnectionInitCommand;
         var _local_4:ByteArray = new ByteArray();
         var _local_5:ProtocolBuffer = new ProtocolBuffer(_local_4,_local_4,new OptionalMap());
         this.commandCodec.encode(_local_5,_arg_1);
         _local_4.position = 0;
         var _local_6:ByteArray = new ByteArray();
         this.protocol.wrapPacket(_local_6,_local_5,CompressionType.DEFLATE_AUTO);
         _local_6.position = 0;
         var _local_7:IProtectionContext = !_local_3 ? this.protectionContext : PrimitiveProtectionContext.INSTANCE;
         _local_7.wrap(_arg_2,_local_6);
      }
      
      protected function processDataBuffer() : void
      {
         var byteArray:ByteArray = null;
         var packetData:ProtocolBuffer = null;
         var command:Object = null;
         this.dataBuffer.position = this.dataBuffer.length;
         this.protectionContext.unwrap(this.dataBuffer,this.rawDataBuffer);
         this.dataBuffer.position = this.currentPacketPosition;
         if(this.dataBuffer.bytesAvailable == 0)
         {
            return;
         }
         while(true)
         {
            byteArray = new ByteArray();
            packetData = new ProtocolBuffer(byteArray,byteArray,new OptionalMap());
            if(!this.protocol.unwrapPacket(this.dataBuffer,packetData,CompressionType.NONE))
            {
               return;
            }
            ByteArray(packetData.reader).position = 0;
            while(Boolean(packetData.reader.bytesAvailable))
            {
               command = null;
               try
               {
                  command = this.commandCodec.decode(packetData);
                  if(command == null)
                  {
                     throw new Error("Decoded command is null");
                  }
               }
               catch(e:Error)
               {
                  handleDataProcessingError("AbstractConnection::processDataBuffer() command decoding error: " + e.message + ", " + e.getStackTrace());
                  break;
               }
               this.commandHandler.executeCommand(command);
            }
            if(this.dataBuffer.bytesAvailable == 0)
            {
               this.dataBuffer.clear();
               this.currentPacketPosition = 0;
               return;
            }
            this.currentPacketPosition = this.dataBuffer.position;
         }
      }
      
      protected function handleDataProcessingError(_arg_1:String) : void
      {
         serverCommandLogger.error(_arg_1);
         if(launcherParams.isDebug)
         {
            messageBoxService.showMessage(new UnclassifyedError(_arg_1));
         }
         if(Boolean(launcherParams.getParameter(PARAM_CLOSE_ON_ERROR)))
         {
            this.close(ConnectionCloseStatus.DATA_PROCESSING_ERROR,_arg_1);
         }
      }
      
      protected function handleDataSendingError(_arg_1:Error) : void
      {
         var _local_2:String = _arg_1.message + ", " + _arg_1.getStackTrace();
         messageBoxService.showMessage(new UnclassifyedError(_local_2));
      }
      
      protected function onTransportError(_arg_1:ErrorEvent) : void
      {
         networkLogger.error(_arg_1.toString());
         if(this.connectionStatus == ConnectionStatus.CONNECTING)
         {
            this.tryNextPort();
         }
         else if(this.connectionStatus == ConnectionStatus.CONNECTED)
         {
            this.closeConnectionOnTransportError();
         }
      }
      
      public function closeConnectionOnTransportError() : void
      {
         messageBoxService.showMessage(new TransportError());
         this.close(ConnectionCloseStatus.CONNECTION_ERROR,"Transport error");
      }
      
      private function initializeListeners() : void
      {
         this.socket.addEventListener(Event.CLOSE,this.onSocketClose);
         this.socket.addEventListener(Event.CONNECT,this.onConnect);
         this.socket.addEventListener(IOErrorEvent.IO_ERROR,this.onTransportError);
         this.socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onTransportError);
         this.socket.addEventListener(ProgressEvent.SOCKET_DATA,this.onSocketData);
      }
      
      protected function preparePorts(_arg_1:ConnectionConnectParameters) : void
      {
         this.ports = _arg_1.ports;
         this.moveLastSuccessfulPortToFront();
      }
      
      private function moveLastSuccessfulPortToFront() : void
      {
         var lastPort:int = 0;
         var index:Number = NaN;
         try
         {
            lastPort = networkService.getLastPort(this.host);
            if(lastPort > 0)
            {
               index = this.ports.indexOf(lastPort);
               if(index >= 0)
               {
                  this.ports.splice(index,1);
                  this.ports.unshift(lastPort);
               }
            }
            return;
         }
         catch(e:Error)
         {
            connectionLogger.warning("Error read stored port from shared object, message = %1",[e]);
            return;
         }
      }
      
      protected function onConnect(_arg_1:Event) : void
      {
         networkService.saveLastPort(this.host,this.ports[this.portIndex]);
         this.connectionStatus = ConnectionStatus.CONNECTED;
         this.commandCodec.init(this.protocol);
         this.commandHandler.onConnectionOpen(this);
      }
      
      protected function tryConnect() : void
      {
         this.socket.connect(this.host,this.ports[this.portIndex]);
      }
      
      public function close(_arg_1:ConnectionCloseStatus, _arg_2:String = null) : void
      {
         this.socket.flush();
         this.socket.close();
         this.connectionStatus = ConnectionStatus.DISCONNECTED;
         this.commandHandler.onConnectionClose(_arg_1,_arg_2);
      }
      
      public function sendCommand(param1:Object) : void
      {
         var command:Object = param1;
         if(this.connectionStatus != ConnectionStatus.CONNECTED)
         {
            return;
         }
         try
         {
            this.writeCommand(command,this.socket);
            this.socket.flush();
            return;
         }
         catch(error:Error)
         {
            handleDataSendingError(error);
            return;
         }
      }
      
      private function onSocketClose(_arg_1:Event) : void
      {
         this.close(ConnectionCloseStatus.CLOSED_BY_SERVER);
      }
      
      private function onSocketData(_arg_1:ProgressEvent) : void
      {
         this.rawDataBuffer.clear();
         this.socket.readBytes(this.rawDataBuffer);
         this.processDataBuffer();
      }
   }
}

