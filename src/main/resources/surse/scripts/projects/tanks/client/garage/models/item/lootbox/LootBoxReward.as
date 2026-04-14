package projects.tanks.client.garage.models.item.lootbox
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class LootBoxReward
   {
      
      private var _category:LootBoxCategory;
      
      private var _count:int;
      
      private var _image:ImageResource;
      
      private var _name:String;
      
      public function LootBoxReward(_arg_1:LootBoxCategory = null, _arg_2:int = 0, _arg_3:ImageResource = null, _arg_4:String = null)
      {
         super();
         this._category = _arg_1;
         this._count = _arg_2;
         this._image = _arg_3;
         this._name = _arg_4;
      }
      
      public function get category() : LootBoxCategory
      {
         return this._category;
      }
      
      public function set category(_arg_1:LootBoxCategory) : void
      {
         this._category = _arg_1;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set count(_arg_1:int) : void
      {
         this._count = _arg_1;
      }
      
      public function get image() : ImageResource
      {
         return this._image;
      }
      
      public function set image(_arg_1:ImageResource) : void
      {
         this._image = _arg_1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(_arg_1:String) : void
      {
         this._name = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "LootBoxReward [";
         _local_1 += "category = " + this.category + " ";
         _local_1 += "count = " + this.count + " ";
         _local_1 += "image = " + this.image + " ";
         _local_1 += "name = " + this.name + " ";
         return _local_1 + "]";
      }
   }
}

