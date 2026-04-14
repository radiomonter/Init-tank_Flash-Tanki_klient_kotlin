package platform.client.fp10.core.type.impl
{
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.IGameObjectInternal;
   import platform.client.fp10.core.type.ISpace;
   
   public class GameObject implements IGameObject, IGameObjectInternal
   {
      
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      private var _name:String;
      
      private var _id:Long;
      
      private var _gameClass:GameClass;
      
      private var _space:ISpace;
      
      private var data:Dictionary = new Dictionary();
      
      private var _adapts:Dictionary = new Dictionary();
      
      private var _events:Dictionary = new Dictionary();
      
      private var _multiAdapts:Dictionary = new Dictionary();
      
      public function GameObject(_arg_1:Long, _arg_2:GameClass, _arg_3:String, _arg_4:ISpace)
      {
         super();
         this._id = _arg_1;
         this._gameClass = _arg_2;
         this._name = _arg_3;
         this._space = _arg_4;
      }
      
      public function get id() : Long
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gameClass() : IGameClass
      {
         return this._gameClass;
      }
      
      public function get space() : ISpace
      {
         return this._space;
      }
      
      public function event(_arg_1:Class) : Object
      {
         var _local_2:Object = this._events[_arg_1];
         if(_local_2 == null)
         {
            _local_2 = this._adapt(_arg_1,true);
            this._events[_arg_1] = _local_2;
         }
         return _local_2;
      }
      
      public function hasModel(_arg_1:Class) : Boolean
      {
         if(this._adapts[_arg_1] == null)
         {
            return modelRegistry.getModelsForObject(this,_arg_1).length > 0;
         }
         return true;
      }
      
      public function adapt(_arg_1:Class) : Object
      {
         var _local_2:Object = this._adapts[_arg_1];
         if(_local_2 == null)
         {
            _local_2 = this._adapt(_arg_1,false);
            if(_local_2 == null)
            {
               throw new Error("GameObject::adapt() No models have been found. Object: " + this + ", interface: " + _arg_1);
            }
            this._adapts[_arg_1] = _local_2;
         }
         return _local_2;
      }
      
      public function putData(_arg_1:Model, _arg_2:Class, _arg_3:Object) : void
      {
         var _local_4:Dictionary = this.data[_arg_1];
         if(_local_4 == null)
         {
            _local_4 = new Dictionary();
            this.data[_arg_1] = _local_4;
         }
         _local_4[_arg_2] = _arg_3;
      }
      
      public function getData(_arg_1:Model, _arg_2:Class) : Object
      {
         var _local_3:Dictionary = this.data[_arg_1];
         return _local_3 == null ? null : _local_3[_arg_2];
      }
      
      public function clearData(_arg_1:Model, _arg_2:Class) : Object
      {
         var _local_3:Dictionary = this.data[_arg_1];
         if(_local_3 == null)
         {
            return null;
         }
         var _local_4:Object = _local_3[_arg_2];
         delete _local_3[_arg_2];
         return _local_4;
      }
      
      public function toString() : String
      {
         return "[GameObject id=" + this._id + "]";
      }
      
      private function _adapt(_arg_1:Class, _arg_2:Boolean) : Object
      {
         var _local_3:uint = 0;
         var _local_4:Vector.<IModel> = modelRegistry.getModelsForObject(this,_arg_1);
         if(!_arg_2)
         {
            _local_3 = _local_4.length;
            if(_local_3 > 1)
            {
               throw new Error("GameObject::_adapt() Multiple models have been found. Object: " + this + ", interface: " + _arg_1);
            }
            if(_local_3 == 0)
            {
               return null;
            }
         }
         var _local_5:Class = _arg_2 ? modelRegistry.getEventsClass(_arg_1) : modelRegistry.getAdaptClass(_arg_1);
         if(_local_5 == null)
         {
            throw new Error("Proxy class not found for specified interface");
         }
         return new _local_5(this,_arg_2 ? _local_4 : _local_4[0]);
      }
      
      public function clear() : void
      {
         this.clearModelsInitParams();
         this._gameClass = null;
         this._space = null;
         this.clearModelData();
         this.clearDictionary(this._adapts);
         this.clearDictionary(this._multiAdapts);
         this.clearDictionary(this._events);
      }
      
      private function clearModelData() : void
      {
         var _local_2:Dictionary = null;
         var _local_1:* = undefined;
         var _local_3:* = undefined;
         var _local_4:* = undefined;
         for(_local_1 in this.data)
         {
            _local_2 = this.data[_local_1];
            for(_local_3 in _local_2)
            {
               _local_4 = _local_2[_local_3];
               if(_local_4 is AutoClosable)
               {
                  AutoClosable(_local_4).close();
               }
               delete _local_2[_local_3];
            }
            delete this.data[_local_1];
         }
      }
      
      private function clearModelsInitParams() : void
      {
         var _local_1:IModel = null;
         var _local_2:Vector.<IModel> = modelRegistry.getModelsForObject(this,IModel);
         Model.object = this;
         for each(_local_1 in _local_2)
         {
            _local_1.clearInitParams();
         }
         Model.popObject();
      }
      
      private function clearDictionary(_arg_1:Dictionary) : void
      {
         var _local_2:* = undefined;
         for(_local_2 in _arg_1)
         {
            delete _arg_1[_local_2];
         }
      }
   }
}

