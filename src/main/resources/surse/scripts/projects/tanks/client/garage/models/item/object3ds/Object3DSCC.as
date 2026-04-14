package projects.tanks.client.garage.models.item.object3ds
{
   import alternativa.types.Long;
   
   public class Object3DSCC
   {
      
      private var _resourceId:Long;
      
      public function Object3DSCC(_arg_1:Long = null)
      {
         super();
         this._resourceId = _arg_1;
      }
      
      public function get resourceId() : Long
      {
         return this._resourceId;
      }
      
      public function set resourceId(_arg_1:Long) : void
      {
         this._resourceId = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "Object3DSCC [";
         _local_1 += "resourceId = " + this.resourceId + " ";
         return _local_1 + "]";
      }
   }
}

