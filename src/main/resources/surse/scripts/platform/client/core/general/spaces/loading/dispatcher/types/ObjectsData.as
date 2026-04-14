package platform.client.core.general.spaces.loading.dispatcher.types
{
   import platform.client.core.general.spaces.loading.modelconstructors.ModelData;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ObjectsData
   {
      
      private var _modelsData:Vector.<ModelData>;
      
      private var _objects:Vector.<IGameObject>;
      
      public function ObjectsData(_arg_1:Vector.<ModelData> = null, _arg_2:Vector.<IGameObject> = null)
      {
         super();
         this._modelsData = _arg_1;
         this._objects = _arg_2;
      }
      
      public function get modelsData() : Vector.<ModelData>
      {
         return this._modelsData;
      }
      
      public function set modelsData(_arg_1:Vector.<ModelData>) : void
      {
         this._modelsData = _arg_1;
      }
      
      public function get objects() : Vector.<IGameObject>
      {
         return this._objects;
      }
      
      public function set objects(_arg_1:Vector.<IGameObject>) : void
      {
         this._objects = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ObjectsData [";
         _local_1 += "modelsData = " + this.modelsData + " ";
         _local_1 += "objects = " + this.objects + " ";
         return _local_1 + "]";
      }
   }
}

