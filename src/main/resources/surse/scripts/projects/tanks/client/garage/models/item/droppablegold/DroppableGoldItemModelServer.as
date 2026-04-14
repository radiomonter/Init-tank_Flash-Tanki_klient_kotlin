package projects.tanks.client.garage.models.item.droppablegold
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
   
   public class DroppableGoldItemModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _setShowGoldAuthorId:Long = Long.getLong(1506855567,-1914637357);
      
      private var _setShowGoldAuthor_showCodec:ICodec;
      
      private var model:IModel;
      
      public function DroppableGoldItemModelServer(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function setShowGoldAuthor(_arg_1:Boolean) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("garage;setShowGoldAuthor;" + _arg_1);
      }
   }
}

