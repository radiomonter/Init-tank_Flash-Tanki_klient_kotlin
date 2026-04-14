package projects.tanks.client.garage.models.item.kit
{
   import platform.client.fp10.core.type.IGameObject;
   
   public class KitItem
   {
      
      private var _count:int;
      
      private var _item:IGameObject;
      
      private var _mount:Boolean;
      
      public function KitItem(_arg_1:int = 0, _arg_2:IGameObject = null, _arg_3:Boolean = false)
      {
         super();
         this._count = _arg_1;
         this._item = _arg_2;
         this._mount = _arg_3;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set count(_arg_1:int) : void
      {
         this._count = _arg_1;
      }
      
      public function get item() : IGameObject
      {
         return this._item;
      }
      
      public function set item(_arg_1:IGameObject) : void
      {
         this._item = _arg_1;
      }
      
      public function get mount() : Boolean
      {
         return this._mount;
      }
      
      public function set mount(_arg_1:Boolean) : void
      {
         this._mount = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "KitItem [";
         _local_1 += "count = " + this.count + " ";
         _local_1 += "item = " + this.item + " ";
         _local_1 += "mount = " + this.mount + " ";
         return _local_1 + "]";
      }
   }
}

