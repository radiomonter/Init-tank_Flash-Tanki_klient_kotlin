package projects.tanks.client.garage.models.item.view
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class ItemViewCategoryModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ItemViewCategoryModelServer;
      
      private var client:IItemViewCategoryModelBase = IItemViewCategoryModelBase(this);
      
      private var modelId:Long = Long.getLong(1424296501,-807048170);
      
      public function ItemViewCategoryModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ItemViewCategoryModelServer(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : ItemViewCategoryCC
      {
         return ItemViewCategoryCC(initParams[Model.object]);
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

