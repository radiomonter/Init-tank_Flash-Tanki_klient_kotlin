package projects.tanks.client.garage.skins
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import platform.client.fp10.core.model.IModel;
   
   public class MountSkinItemModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _mountSkinId:Long = Long.getLong(1313185646,-234635884);
      
      private var _mountSkin_skinCodec:ICodec;
      
      private var model:IModel;
      
      public function MountSkinItemModelServer(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function mountSkin(_arg_1:Object) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("garage;mountSkin;" + _arg_1.previewResourceId);
      }
   }
}

