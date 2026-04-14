package projects.tanks.client.garage.models.item.lootbox
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class LootBoxModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:LootBoxModelServer;
      
      private var client:ILootBoxModelBase = ILootBoxModelBase(this);
      
      private var modelId:Long = Long.getLong(1543015131,1817260381);
      
      private var _openSuccessfulId:Long = Long.getLong(525232336,-1555877066);
      
      private var _openSuccessful_rewardsCodec:ICodec;
      
      private var _updateCountId:Long = Long.getLong(81014514,-1607807060);
      
      private var _updateCount_countCodec:ICodec;
      
      public function LootBoxModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new LootBoxModelServer(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : LootBoxModelCC
      {
         return LootBoxModelCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

