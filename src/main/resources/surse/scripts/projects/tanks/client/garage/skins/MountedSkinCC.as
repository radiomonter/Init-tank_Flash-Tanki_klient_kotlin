package projects.tanks.client.garage.skins
{
   public class MountedSkinCC
   {
      
      private var _item:Object;
      
      public function MountedSkinCC(_arg_1:Object = null)
      {
         super();
         this._item = _arg_1;
      }
      
      public function get item() : Object
      {
         return this._item;
      }
      
      public function set item(_arg_1:Object) : void
      {
         this._item = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "MountedSkinCC [";
         _local_1 += "item = " + this.item + " ";
         return _local_1 + "]";
      }
   }
}

