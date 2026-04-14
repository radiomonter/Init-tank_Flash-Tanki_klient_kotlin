package alternativa.osgi.service.network
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.startup.ConnectionParameters;
   import flash.net.SharedObject;
   
   public class NetworkService implements INetworkService
   {
      
      private static const SHARED_OBJECT_NAME:String = "connection";
      
      private var logService:LogService;
      
      private var _controlServerAddress:String;
      
      private var _controlServerPorts:Vector.<int>;
      
      private var _resourcesRootUrl:String;
      
      private var _secure:Boolean;
      
      public function NetworkService(_arg_1:ConnectionParameters)
      {
         super();
         this._controlServerAddress = _arg_1.serverAddress;
         this._controlServerPorts = _arg_1.serverPorts;
         this._resourcesRootUrl = _arg_1.resourcesRootURL;
         this._secure = _arg_1.secure;
         this.logService = LogService(OSGi.getInstance().getService(LogService));
      }
      
      public function get controlServerAddress() : String
      {
         return this._controlServerAddress;
      }
      
      public function get secure() : Boolean
      {
         return this._secure;
      }
      
      public function get controlServerPorts() : Vector.<int>
      {
         return this._controlServerPorts;
      }
      
      public function get resourcesRootUrl() : String
      {
         return this._resourcesRootUrl;
      }
      
      public function getLastPort(_arg_1:String) : int
      {
         var _local_2:SharedObject = SharedObject.getLocal(SHARED_OBJECT_NAME,"/");
         return _local_2.data[_arg_1];
      }
      
      public function saveLastPort(param1:String, param2:int) : void
      {
         var so:SharedObject = null;
         var host:String = param1;
         var port:int = param2;
         try
         {
            so = SharedObject.getLocal(SHARED_OBJECT_NAME,"/");
            so.data[host] = port;
            so.flush();
            return;
         }
         catch(e:Error)
         {
            logService.getLogger("NetworkServer").warning("Error stored port in shared object, message = %1",[e]);
            return;
         }
      }
   }
}

