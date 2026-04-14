package projects.tanks.client.garage.models.item.item3d
{
   public class Item3DCC
   {
      
      private var _mounted:Boolean;
      
      public function Item3DCC(_arg_1:Boolean = false)
      {
         super();
         this._mounted = _arg_1;
      }
      
      public function get mounted() : Boolean
      {
         return this._mounted;
      }
      
      public function set mounted(_arg_1:Boolean) : void
      {
         this._mounted = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "Item3DCC [";
         _local_1 += "mounted = " + this.mounted + " ";
         return _local_1 + "]";
      }
   }
}

