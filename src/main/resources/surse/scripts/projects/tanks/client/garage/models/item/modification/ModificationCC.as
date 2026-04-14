package projects.tanks.client.garage.models.item.modification
{
   import alternativa.types.Long;
   
   public class ModificationCC
   {
      
      private var _baseItemId:Long;
      
      private var _modificationIndex:int;
      
      public function ModificationCC(_arg_1:Long = null, _arg_2:int = 0)
      {
         super();
         this._baseItemId = _arg_1;
         this._modificationIndex = _arg_2;
      }
      
      public function get baseItemId() : Long
      {
         return this._baseItemId;
      }
      
      public function set baseItemId(_arg_1:Long) : void
      {
         this._baseItemId = _arg_1;
      }
      
      public function get modificationIndex() : int
      {
         return this._modificationIndex;
      }
      
      public function set modificationIndex(_arg_1:int) : void
      {
         this._modificationIndex = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ModificationCC [";
         _local_1 += "baseItemId = " + this.baseItemId + " ";
         _local_1 += "modificationIndex = " + this.modificationIndex + " ";
         return _local_1 + "]";
      }
   }
}

