package projects.tanks.client.panel.model.garage
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   
   public class GarageItemInfo
   {
      
      private var _category:ItemCategoryEnum;
      
      private var _item:IGameObject;
      
      private var _itemViewCategory:ItemViewCategoryEnum;
      
      private var _modificationIndex:int;
      
      private var _mounted:Boolean;
      
      private var _name:String;
      
      private var _position:int;
      
      private var _premiumItem:Boolean;
      
      private var _preview:ImageResource;
      
      private var _remaingTimeInMS:int;
      
      public function GarageItemInfo(_arg_1:ItemCategoryEnum = null, _arg_2:IGameObject = null, _arg_3:ItemViewCategoryEnum = null, _arg_4:int = 0, _arg_5:Boolean = false, _arg_6:String = null, _arg_7:int = 0, _arg_8:Boolean = false, _arg_9:ImageResource = null, _arg_10:int = 0)
      {
         super();
         this._category = _arg_1;
         this._item = _arg_2;
         this._itemViewCategory = _arg_3;
         this._modificationIndex = _arg_4;
         this._mounted = _arg_5;
         this._name = _arg_6;
         this._position = _arg_7;
         this._premiumItem = _arg_8;
         this._preview = _arg_9;
         this._remaingTimeInMS = _arg_10;
      }
      
      public function get category() : ItemCategoryEnum
      {
         return this._category;
      }
      
      public function set category(_arg_1:ItemCategoryEnum) : void
      {
         this._category = _arg_1;
      }
      
      public function get item() : IGameObject
      {
         return this._item;
      }
      
      public function set item(_arg_1:IGameObject) : void
      {
         this._item = _arg_1;
      }
      
      public function get itemViewCategory() : ItemViewCategoryEnum
      {
         return this._itemViewCategory;
      }
      
      public function set itemViewCategory(_arg_1:ItemViewCategoryEnum) : void
      {
         this._itemViewCategory = _arg_1;
      }
      
      public function get modificationIndex() : int
      {
         return this._modificationIndex;
      }
      
      public function set modificationIndex(_arg_1:int) : void
      {
         this._modificationIndex = _arg_1;
      }
      
      public function get mounted() : Boolean
      {
         return this._mounted;
      }
      
      public function set mounted(_arg_1:Boolean) : void
      {
         this._mounted = _arg_1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(_arg_1:String) : void
      {
         this._name = _arg_1;
      }
      
      public function get position() : int
      {
         return this._position;
      }
      
      public function set position(_arg_1:int) : void
      {
         this._position = _arg_1;
      }
      
      public function get premiumItem() : Boolean
      {
         return this._premiumItem;
      }
      
      public function set premiumItem(_arg_1:Boolean) : void
      {
         this._premiumItem = _arg_1;
      }
      
      public function get preview() : ImageResource
      {
         return this._preview;
      }
      
      public function set preview(_arg_1:ImageResource) : void
      {
         this._preview = _arg_1;
      }
      
      public function get remaingTimeInMS() : int
      {
         return this._remaingTimeInMS;
      }
      
      public function set remaingTimeInMS(_arg_1:int) : void
      {
         this._remaingTimeInMS = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "GarageItemInfo [";
         _local_1 += "category = " + this.category + " ";
         _local_1 += "item = " + this.item + " ";
         _local_1 += "itemViewCategory = " + this.itemViewCategory + " ";
         _local_1 += "modificationIndex = " + this.modificationIndex + " ";
         _local_1 += "mounted = " + this.mounted + " ";
         _local_1 += "name = " + this.name + " ";
         _local_1 += "position = " + this.position + " ";
         _local_1 += "premiumItem = " + this.premiumItem + " ";
         _local_1 += "preview = " + this.preview + " ";
         _local_1 += "remaingTimeInMS = " + this.remaingTimeInMS + " ";
         return _local_1 + "]";
      }
   }
}

