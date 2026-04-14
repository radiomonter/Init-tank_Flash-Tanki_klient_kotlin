package platform.client.fp10.core.type.impl
{
   import alternativa.types.Long;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   
   public class NotLoadedGameObject implements IGameObject
   {
      
      private var _id:Long;
      
      private var _space:ISpace;
      
      public function NotLoadedGameObject(_arg_1:Long, _arg_2:ISpace)
      {
         super();
         this._id = _arg_1;
         this._space = _arg_2;
      }
      
      public function get id() : Long
      {
         return this._id;
      }
      
      public function get name() : String
      {
         throw new Error("Object not loaded, id = " + this._id);
      }
      
      public function get gameClass() : IGameClass
      {
         throw new Error("Object not loaded, id = " + this._id);
      }
      
      public function get space() : ISpace
      {
         return this._space;
      }
      
      public function hasModel(_arg_1:Class) : Boolean
      {
         return false;
      }
      
      public function adapt(_arg_1:Class) : Object
      {
         throw new Error("Object not loaded, id = " + this._id);
      }
      
      public function event(_arg_1:Class) : Object
      {
         throw new Error("Object not loaded, id = " + this._id);
      }
   }
}

