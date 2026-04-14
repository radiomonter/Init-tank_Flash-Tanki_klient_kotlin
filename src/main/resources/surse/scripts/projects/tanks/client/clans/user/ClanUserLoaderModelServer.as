package projects.tanks.client.clans.user
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import platform.client.fp10.core.model.IModel;
   
   public class ClanUserLoaderModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _hideClanId:Long = Long.getLong(1773660503,-329990730);
      
      private var _showClanId:Long = Long.getLong(1773660433,-1765075589);
      
      private var model:IModel;
      
      public function ClanUserLoaderModelServer(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function hideClan() : void
      {
      }
      
      public function showClan() : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("clan;showClan");
      }
   }
}

