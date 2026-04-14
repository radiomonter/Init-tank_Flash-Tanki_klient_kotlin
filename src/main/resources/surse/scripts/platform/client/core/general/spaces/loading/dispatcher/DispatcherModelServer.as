package platform.client.core.general.spaces.loading.dispatcher
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import platform.client.fp10.core.model.IModel;
   
   public class DispatcherModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _dependeciesLoadedId:Long = Long.getLong(423004956,1791645716);
      
      private var _dependeciesLoaded_callbackIdCodec:ICodec;
      
      private var model:IModel;
      
      public function DispatcherModelServer(param1:IModel)
      {
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this._dependeciesLoaded_callbackIdCodec = this.protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      public function dependeciesLoaded(param1:int) : void
      {
         OSGi.clientLog.log("dispatcher","dependenciesLoaded: %1",param1);
         Network(OSGi.getInstance().getService(INetworker)).send("system;dependencies_loaded;" + param1);
      }
   }
}

