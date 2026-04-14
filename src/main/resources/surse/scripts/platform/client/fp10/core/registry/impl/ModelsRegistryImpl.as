package platform.client.fp10.core.registry.impl
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ModelsRegistryImpl implements ModelRegistry
   {
      
      [Inject]
      public static var clientLog:IClientLog;
      
      [Inject]
      public static var protocol:IProtocol;
      
      private var logger:Logger;
      
      private var modelById:Dictionary;
      
      private var modelsByInterface:Dictionary;
      
      private var modelInterfacesById:Dictionary;
      
      private var modelByMethod:Dictionary;
      
      private var model2constructorCodec:Dictionary;
      
      private var _models:Vector.<IModel>;
      
      private var class2Adapt:Dictionary = new Dictionary();
      
      private var class2Events:Dictionary = new Dictionary();
      
      public function ModelsRegistryImpl(_arg_1:OSGi)
      {
         super();
         var _local_2:LogService = LogService(_arg_1.getService(LogService));
         this.logger = _local_2.getLogger("modelsreg");
         this.modelInterfacesById = new Dictionary();
         this.modelById = new Dictionary();
         this.modelByMethod = new Dictionary();
         this.modelsByInterface = new Dictionary();
         this.model2constructorCodec = new Dictionary();
         this._models = new Vector.<IModel>();
      }
      
      public function register(_arg_1:Long, _arg_2:Long) : void
      {
         this.modelByMethod[_arg_2] = _arg_1;
      }
      
      public function registerModelConstructorCodec(_arg_1:Long, _arg_2:ICodec) : void
      {
         this.model2constructorCodec[_arg_1] = _arg_2;
      }
      
      public function unregisterModelsParamsStruct(_arg_1:Long) : void
      {
         delete this.model2constructorCodec[_arg_1];
      }
      
      public function getModelConstructorCodec(_arg_1:Long) : ICodec
      {
         return this.model2constructorCodec[_arg_1];
      }
      
      public function add(_arg_1:IModel, _arg_2:Vector.<Class>) : void
      {
         var _local_5:Class = null;
         var _local_6:Vector.<IModel> = null;
         var _local_4:int = 0;
         this._models.push(_arg_1);
         var _local_3:Long = _arg_1.id;
         this.modelById[_local_3] = _arg_1;
         this.modelInterfacesById[_local_3] = _arg_2;
         while(_local_4 < _arg_2.length)
         {
            _local_5 = _arg_2[_local_4];
            _local_6 = this.modelsByInterface[_local_5];
            if(_local_6 == null)
            {
               this.modelsByInterface[_local_5] = _local_6 = new Vector.<IModel>();
            }
            _local_6.push(_arg_1);
            _local_4++;
         }
      }
      
      public function remove(_arg_1:Long) : void
      {
         var _local_2:* = undefined;
         var _local_3:IModel = null;
         var _local_4:Vector.<Class> = null;
         var _local_5:int = 0;
         var _local_6:Long = null;
         var _local_7:Class = null;
         var _local_8:Vector.<IModel> = null;
         var _local_9:int = 0;
         this._models.splice(this._models.indexOf(this.modelById[_arg_1]),1);
         for(_local_2 in this.modelByMethod)
         {
            _local_6 = this.modelByMethod[_local_2];
            if(_local_6 == _arg_1)
            {
               delete this.modelByMethod[_local_2];
            }
         }
         _local_3 = IModel(this.modelById[_arg_1]);
         _local_4 = this.modelInterfacesById[_arg_1] as Vector.<Class>;
         _local_5 = 0;
         while(_local_5 < _local_4.length)
         {
            _local_7 = _local_4[_local_5];
            _local_8 = this.modelsByInterface[_local_7] as Vector.<IModel>;
            _local_9 = _local_8.indexOf(_local_3);
            _local_8.splice(_local_9,1);
            _local_5++;
         }
         delete this.modelInterfacesById[_arg_1];
         delete this.modelById[_arg_1];
      }
      
      public function invoke(_arg_1:IGameObject, _arg_2:Long, _arg_3:ProtocolBuffer) : void
      {
         var _local_4:Long = Long(this.modelByMethod[_arg_2]);
         var _local_5:Model = Model(this.modelById[_local_4]);
         if(_local_5 != null)
         {
            Model.object = _arg_1;
            _local_5.invoke(_arg_2,_arg_3);
            Model.popObject();
         }
      }
      
      public function getModel(_arg_1:Long) : IModel
      {
         return this.modelById[_arg_1];
      }
      
      public function getModelsByInterface(_arg_1:Class) : Vector.<IModel>
      {
         return this.modelsByInterface[_arg_1];
      }
      
      public function getModelForObject(_arg_1:IGameObject, _arg_2:Class) : IModel
      {
         var _local_3:IModel = null;
         var _local_4:Long = null;
         var _local_5:Vector.<Class> = null;
         var _local_6:int = 0;
         var _local_7:Vector.<Long> = _arg_1.gameClass.models;
         var _local_8:int = _local_7.length - 1;
         while(_local_8 >= 0)
         {
            _local_4 = _local_7[_local_8];
            _local_5 = this.modelInterfacesById[_local_4] as Vector.<Class>;
            if(_local_5 == null)
            {
               throw new Error("ModelsRegistryImpl::getModelForObject() No interfaces found. Object id=" + _arg_1.id + ", model id=" + _local_4);
            }
            _local_6 = _local_5.length - 1;
            while(_local_6 >= 0)
            {
               if(_local_5[_local_6] == _arg_2)
               {
                  if(_local_3 == null)
                  {
                     _local_3 = this.getModel(_local_4);
                     break;
                  }
                  throw new Error("ModelsRegistryImpl::getModelForObject() Multiple models have been found. Object: " + _arg_1 + ", interface: " + _arg_2);
               }
               _local_6--;
            }
            _local_8--;
         }
         return _local_3;
      }
      
      public function getModelsForObject(_arg_1:IGameObject, _arg_2:Class) : Vector.<IModel>
      {
         var _local_3:Long = null;
         var _local_4:Vector.<Class> = null;
         if(_arg_1.gameClass == null)
         {
            throw new Error("ModelsRegistryImpl::getModelsForObject(): Object class not found. Object: " + _arg_1 + ", interface: " + _arg_2 + ", name: " + _arg_1.name);
         }
         var _local_5:Vector.<Long> = _arg_1.gameClass.models;
         var _local_6:Vector.<IModel> = new Vector.<IModel>();
         var _local_7:int = _local_5.length - 1;
         while(_local_7 >= 0)
         {
            _local_3 = _local_5[_local_7];
            _local_4 = this.modelInterfacesById[_local_3] as Vector.<Class>;
            if(_local_4 != null && _local_4.indexOf(_arg_2) >= 0)
            {
               _local_6.push(this.getModel(_local_3));
            }
            _local_7--;
         }
         return _local_6;
      }
      
      public function getInterfacesForModel(_arg_1:Long) : Vector.<Class>
      {
         return this.modelInterfacesById[_arg_1];
      }
      
      public function get models() : Vector.<IModel>
      {
         return this._models;
      }
      
      public function registerAdapt(_arg_1:Class, _arg_2:Class) : void
      {
         this.class2Adapt[_arg_1] = _arg_2;
      }
      
      public function registerEvents(_arg_1:Class, _arg_2:Class) : void
      {
         this.class2Events[_arg_1] = _arg_2;
      }
      
      public function getAdaptClass(_arg_1:Class) : Class
      {
         return this.class2Adapt[_arg_1];
      }
      
      public function getEventsClass(_arg_1:Class) : Class
      {
         return this.class2Events[_arg_1];
      }
   }
}

