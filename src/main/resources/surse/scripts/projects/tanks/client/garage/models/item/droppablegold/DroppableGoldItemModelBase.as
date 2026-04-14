package projects.tanks.client.garage.models.item.droppablegold
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class DroppableGoldItemModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:DroppableGoldItemModelServer;
      
      private var client:IDroppableGoldItemModelBase = IDroppableGoldItemModelBase(this);
      
      private var modelId:Long = Long.getLong(1027765745,-1102593126);
      
      public function DroppableGoldItemModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new DroppableGoldItemModelServer(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : DroppableGoldItemCC
      {
         return DroppableGoldItemCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         var _loc3_:Long = _arg_1;
         switch(0)
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

