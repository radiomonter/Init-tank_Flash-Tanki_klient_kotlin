package projects.tanks.client.garage.models.item.lootbox
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
   
   public class LootBoxModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _openId:Long = Long.getLong(227613674,-1722353412);
      
      private var _open_amountCodec:ICodec;
      
      private var model:IModel;
      
      public function LootBoxModelServer(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function open(_arg_1:int) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("garage;openLootbox;" + _arg_1);
      }
   }
}

