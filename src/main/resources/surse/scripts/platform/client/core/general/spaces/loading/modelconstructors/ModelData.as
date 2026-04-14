package platform.client.core.general.spaces.loading.modelconstructors
{
   import alternativa.types.Long;
   
   public class ModelData
   {
      
      private var _data:Object;
      
      private var _id:Long;
      
      public function ModelData(_arg_1:Object = null, _arg_2:Long = null)
      {
         super();
         this._data = _arg_1;
         this._id = _arg_2;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(_arg_1:Object) : void
      {
         this._data = _arg_1;
      }
      
      public function get id() : Long
      {
         return this._id;
      }
      
      public function set id(_arg_1:Long) : void
      {
         this._id = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ModelData [";
         _local_1 += "data = " + this.data + " ";
         _local_1 += "id = " + this.id + " ";
         return _local_1 + "]";
      }
   }
}

