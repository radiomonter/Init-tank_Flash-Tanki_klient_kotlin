package fominskiy.networking.connecting
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.network.INetworkService;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   
   public class ServerConnectionServiceImpl implements ServerConnectionService
   {
      
      public static var networkService:INetworkService;
      
      private var networker:Network;
      
      private var connectionListener:Function;
      
      public function ServerConnectionServiceImpl()
      {
         super();
      }
      
      public function connect(_arg_1:Function) : void
      {
         this.networker = new Network();
         this.connectionListener = _arg_1;
         networkService = OSGi.getInstance().getService(INetworkService) as INetworkService;
         this.networker.connectionListener = _arg_1;
         var _local_2:String = networkService.controlServerAddress;
         var _local_3:int = networkService.controlServerPorts[0];
         this.networker.connect(_local_2,_local_3);
         OSGi.getInstance().registerService(INetworker,this.networker);
      }
   }
}

