package platform.client.fp10.core.registry.impl
{
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.registry.GameTypeRegistry;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.impl.GameClass;
   
   public class GameTypeRegistryImpl implements GameTypeRegistry
   {
      
      private var _classes:Dictionary;
      
      public function GameTypeRegistryImpl()
      {
         super();
         this._classes = new Dictionary();
      }
      
      public function createClass(_arg_1:Long, _arg_2:Vector.<Long>) : GameClass
      {
         var _local_3:GameClass = new GameClass(_arg_1,_arg_2);
         this._classes[_arg_1] = _local_3;
         return _local_3;
      }
      
      public function destroyClass(_arg_1:Long) : void
      {
         this._classes[_arg_1] = null;
      }
      
      public function getClass(_arg_1:Long) : IGameClass
      {
         return this._classes[_arg_1];
      }
      
      public function get classes() : Dictionary
      {
         return this._classes;
      }
   }
}

