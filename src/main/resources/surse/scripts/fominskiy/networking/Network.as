package fominskiy.networking
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.bg.IBackgroundService;
   import alternativa.tanks.gui.error.CustomErrorWindow;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.network.connection.ConnectionCloseStatus;
   import platform.client.fp10.core.network.handler.OnConnectionClosedServiceListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.service.errormessage.errors.ConnectionClosedError;
   
   public class Network extends NetworkService
   {
      
      public static var modelRegistry:ModelRegistry = OSGi.getInstance().getService(ModelRegistry) as ModelRegistry;
      
      private var socket:Socket;
      
      private var keys:Array = new Array(1,2,3,4,5,6,7,8,9);
      
      private var lastKey:int = 1;
      
      public var AESDecrypter:*;
      
      public var AESKey:String = "F54BF833E76C15A12B7977CF5858FB96";
      
      public var iv:int = 1;
      
      public var connectionListener:Function;
      
      private var errorForm:CustomErrorWindow = new CustomErrorWindow(OSGi.getInstance());
      
      private var buffer:ByteArray = new ByteArray();
      
      private var kilohadu:Boolean = false;
      
      public function Network()
      {
         super();
         this.socket = new Socket();
      }
      
      public function connect(_arg_1:String, _arg_2:int) : void
      {
         this.socket.connect(_arg_1,_arg_2);
         this.socket.addEventListener(ProgressEvent.SOCKET_DATA,this.onDataSocket);
         this.socket.addEventListener(Event.CONNECT,this.onConnected);
         this.socket.addEventListener(Event.CLOSE,this.onCloseConnecting);
         this.socket.addEventListener(IOErrorEvent.IO_ERROR,this.ioError);
         this.socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityError);
      }
      
      public function destroy() : void
      {
         this.socket.removeEventListener(ProgressEvent.SOCKET_DATA,this.onDataSocket);
         this.socket.removeEventListener(Event.CONNECT,this.onConnected);
         this.socket.removeEventListener(Event.CLOSE,this.onCloseConnecting);
         this.socket.removeEventListener(IOErrorEvent.IO_ERROR,this.ioError);
         this.socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityError);
      }
      
      public function addEventListener(_arg_1:INetworkListener) : void
      {
         addListener(_arg_1);
      }
      
      public function removeEventListener(_arg_1:INetworkListener) : void
      {
         removeListener(_arg_1);
      }
      
      public function send(_arg_1:String) : void
      {
         try
         {
            _arg_1 = this.AESDecrypter == null ? this.crypt(_arg_1) : this.AESDecrypter.encrypt(_arg_1,this.AESKey);
            _arg_1 += DELIM_COMMANDS_SYMBOL;
            this.socket.writeUTFBytes(_arg_1);
            this.socket.flush();
         }
         catch(e:Error)
         {
         }
      }
      
      private function crypt(_arg_1:String) : String
      {
         var _local_4:int = 0;
         var _local_2:int = (this.lastKey + 1) % this.keys.length;
         if(_local_2 <= 0)
         {
            _local_2 = 1;
         }
         this.lastKey = _local_2;
         var _local_3:Array = _arg_1.split("");
         while(_local_4 < _arg_1.length)
         {
            _local_3[_local_4] = String.fromCharCode(_arg_1.charCodeAt(_local_4) + (_local_2 + 1));
            _local_4++;
         }
         return _local_2 + _local_3.join("");
      }
      
      private function onConnected(_arg_1:Event) : void
      {
         if(this.connectionListener != null)
         {
            this.connectionListener.call();
         }
      }
      
      private function onDataSocket(_arg_1:Event) : void
      {
         var _local_2:ByteArray = new ByteArray();
         var _local_3:int = int(this.socket.bytesAvailable);
         this.socket.readBytes(_local_2,0,_local_3);
         var _local_4:String = _local_2.readUTFBytes(_local_3);
         protocolDecrypt(_local_4,this);
         _local_2.clear();
         this.socket.flush();
      }
      
      public function onCloseConnecting(_arg_1:Event) : void
      {
         var _local_2:Object = null;
         var _local_3:int = 0;
         this.socket.flush();
         this.socket.close();
         while(_local_3 < IDisplay(OSGi.getInstance().getService(IDisplay)).mainContainer.numChildren)
         {
            IDisplay(OSGi.getInstance().getService(IDisplay)).mainContainer.removeChildAt(1);
            _local_3++;
         }
         IBackgroundService(OSGi.getInstance().getService(IBackgroundService)).drawBg();
         IBackgroundService(OSGi.getInstance().getService(IBackgroundService)).showBg();
         for each(_local_2 in OSGi.getInstance().serviceList)
         {
            if(_local_2 is OnConnectionClosedServiceListener)
            {
               OnConnectionClosedServiceListener(_local_2).onConnectionClosed(ConnectionCloseStatus.CLOSED_BY_SERVER);
            }
         }
         IBackgroundService(OSGi.getInstance().getService(IBackgroundService)).drawBg();
         IBackgroundService(OSGi.getInstance().getService(IBackgroundService)).showBg();
         IDisplay(OSGi.getInstance().getService(IDisplay)).mainContainer.addChild(this.errorForm.getDisplayObject(new ConnectionClosedError(ConnectionCloseStatus.CLOSED_BY_SERVER)));
      }
      
      private function ioError(_arg_1:Event) : void
      {
         this.socket.flush();
         this.socket.close();
         IDisplay(OSGi.getInstance().getService(IDisplay)).mainContainer.addChild(this.errorForm.getDisplayObject(new ConnectionClosedError(ConnectionCloseStatus.CONNECTION_ERROR)));
         IBackgroundService(OSGi.getInstance().getService(IBackgroundService)).drawBg();
         IBackgroundService(OSGi.getInstance().getService(IBackgroundService)).showBg();
      }
      
      private function securityError(_arg_1:Event) : void
      {
         this.socket.flush();
         this.socket.close();
         IDisplay(OSGi.getInstance().getService(IDisplay)).mainContainer.addChild(this.errorForm.getDisplayObject(new ConnectionClosedError(ConnectionCloseStatus.CONNECTION_ERROR)));
         IBackgroundService(OSGi.getInstance().getService(IBackgroundService)).drawBg();
         IBackgroundService(OSGi.getInstance().getService(IBackgroundService)).showBg();
      }
      
      public function socketConnected() : Boolean
      {
         return this.socket.connected;
      }
   }
}

