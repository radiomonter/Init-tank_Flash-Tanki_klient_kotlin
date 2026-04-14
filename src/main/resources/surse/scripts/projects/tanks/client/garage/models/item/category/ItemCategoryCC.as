package projects.tanks.client.garage.models.item.category
{
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   
   public class ItemCategoryCC
   {
      
      private var _category:ItemCategoryEnum;
      
      public function ItemCategoryCC(_arg_1:ItemCategoryEnum = null)
      {
         super();
         this._category = _arg_1;
      }
      
      public function get category() : ItemCategoryEnum
      {
         return this._category;
      }
      
      public function set category(_arg_1:ItemCategoryEnum) : void
      {
         this._category = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ItemCategoryCC [";
         _local_1 += "category = " + this.category + " ";
         return _local_1 + "]";
      }
   }
}

