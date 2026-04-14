package platform.client.core.general.spaces.loading.dispatcher
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.core.general.spaces.loading.dispatcher.types.ObjectsData;
   import platform.client.core.general.spaces.loading.dispatcher.types.ObjectsDependencies;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class DispatcherModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:DispatcherModelServer;
      
      private var client:IDispatcherModelBase = IDispatcherModelBase(this);
      
      private var modelId:Long = Long.getLong(191355032,163351191);
      
      private var _loadDependenciesId:Long = Long.getLong(748816660,1488436371);
      
      private var _loadDependencies_dependenciesCodec:ICodec;
      
      private var _loadObjectsDataId:Long = Long.getLong(1779039460,1862164506);
      
      private var _loadObjectsData_objectsDataCodec:ICodec;
      
      private var _unloadObjectsId:Long = Long.getLong(2104499555,54326167);
      
      private var _unloadObjects_objectsCodec:ICodec;
      
      public function DispatcherModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new DispatcherModelServer(IModel(this));
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this._loadDependenciesId:
               this.client.loadDependencies(ObjectsDependencies(this._loadDependencies_dependenciesCodec.decode(_arg_2)));
               return;
            case this._loadObjectsDataId:
               this.client.loadObjectsData(ObjectsData(this._loadObjectsData_objectsDataCodec.decode(_arg_2)));
               return;
            case this._unloadObjectsId:
               this.client.unloadObjects(this._unloadObjects_objectsCodec.decode(_arg_2) as Vector.<IGameObject>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

