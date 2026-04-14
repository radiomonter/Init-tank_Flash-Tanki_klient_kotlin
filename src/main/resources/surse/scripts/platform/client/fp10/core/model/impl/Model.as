package platform.client.fp10.core.model.impl
{
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.IGameObjectInternal;
   
   public class Model implements IModel
   {
      
      private static var currentObject:IGameObject;
      
      private static var objects:Vector.<IGameObject> = new Vector.<IGameObject>();
      
      protected var initParams:Dictionary = new Dictionary();
      
      public function Model()
      {
         super();
      }
      
      public static function get object() : IGameObject
      {
         return currentObject;
      }
      
      public static function set object(_arg_1:IGameObject) : void
      {
         objects.push(currentObject);
         currentObject = _arg_1;
      }
      
      public static function popObject() : void
      {
         currentObject = objects.pop();
      }
      
      public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
      }
      
      public function get id() : Long
      {
         return null;
      }
      
      public function putInitParams(_arg_1:Object) : void
      {
         this.initParams[object] = _arg_1;
      }
      
      public function clearInitParams() : void
      {
         delete this.initParams[object];
      }
      
      public function getData(_arg_1:Class) : Object
      {
         return IGameObjectInternal(currentObject).getData(this,_arg_1);
      }
      
      public function putData(_arg_1:Class, _arg_2:Object) : void
      {
         IGameObjectInternal(currentObject).putData(this,_arg_1,_arg_2);
      }
      
      public function clearData(_arg_1:Class) : Object
      {
         return IGameObjectInternal(currentObject).clearData(this,_arg_1);
      }
      
      protected function getFunctionWrapper(f:Function) : Function
      {
         var wrapper:Function;
         var object:IGameObject = null;
         object = null;
         ;
         var wrappers:Dictionary = this.getData(Model) as Dictionary;
         if(wrappers == null)
         {
            wrappers = new Dictionary();
            this.putData(Model,wrappers);
         }
         wrapper = wrappers[f];
         if(wrapper == null)
         {
            object = Model.object;
            wrapper = function(... _args):void
            {
               Model.object = object;
               f.apply(null,_args);
               Model.popObject();
            };
            wrappers[f] = wrapper;
         }
         return wrapper;
      }
   }
}

