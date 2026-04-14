package projects.tanks.client.garage.models.item.view
{
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   
   public class ItemViewCategoryCC
   {
      
      private var _category:ItemViewCategoryEnum;
      
      public function ItemViewCategoryCC(_arg_1:ItemViewCategoryEnum = null)
      {
         super();
         this._category = _arg_1;
      }
      
      public function get category() : ItemViewCategoryEnum
      {
         return this._category;
      }
      
      public function set category(_arg_1:ItemViewCategoryEnum) : void
      {
         this._category = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ItemViewCategoryCC [";
         _local_1 += "category = " + this.category + " ";
         return _local_1 + "]";
      }
   }
}

