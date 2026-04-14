package projects.tanks.client.garage.models.garage
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.type.IGameObject;
   
   public class GarageModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:GarageModelServer;
      
      private var client:IGarageModelBase = IGarageModelBase(this);
      
      private var modelId:Long = Long.getLong(0,300040010);
      
      private var _initDepotId:Long = Long.getLong(0,300040005);
      
      private var _initDepot_itemsOnDepotCodec:ICodec;
      
      private var _initMarketId:Long = Long.getLong(0,300040006);
      
      private var _initMarket_itemsOnMarketCodec:ICodec;
      
      private var _initMountedId:Long = Long.getLong(0,300040007);
      
      private var _initMounted_mountedItemsCodec:ICodec;
      
      private var _reloadGarageId:Long = Long.getLong(0,300040008);
      
      private var _reloadGarage_messageCodec:ICodec;
      
      private var _reloadGarage_totalCrystalsCodec:ICodec;
      
      private var _selectId:Long = Long.getLong(0,300040009);
      
      private var _select_itemToSelectCodec:ICodec;
      
      private var _selectFirstItemInDepotId:Long = Long.getLong(0,300040010);
      
      public function GarageModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new GarageModelServer(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : GarageModelCC
      {
         return GarageModelCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this._initDepotId:
               this.client.initDepot(this._initDepot_itemsOnDepotCodec.decode(_arg_2) as Vector.<IGameObject>);
               return;
            case this._initMarketId:
               this.client.initMarket(this._initMarket_itemsOnMarketCodec.decode(_arg_2) as Vector.<IGameObject>);
               return;
            case this._initMountedId:
               this.client.initMounted(this._initMounted_mountedItemsCodec.decode(_arg_2) as Vector.<IGameObject>);
               return;
            case this._reloadGarageId:
               this.client.reloadGarage(String(this._reloadGarage_messageCodec.decode(_arg_2)),int(this._reloadGarage_totalCrystalsCodec.decode(_arg_2)));
               return;
            case this._selectId:
               this.client.select(IGameObject(this._select_itemToSelectCodec.decode(_arg_2)));
               return;
            case this._selectFirstItemInDepotId:
               this.client.selectFirstItemInDepot();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

