package alternativa.tanks.gui.category
{
   import flash.events.Event;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   
   public class CategoryButtonsListEvent extends Event
   {
      
      public static const CATEGORY_SELECTED:String = "CategoryButtonsListEvent:CategorySelected";
      
      private var category:ItemViewCategoryEnum;
      
      public function CategoryButtonsListEvent(_arg_1:String, _arg_2:ItemViewCategoryEnum)
      {
         super(_arg_1);
         this.category = _arg_2;
      }
      
      public function getCategory() : ItemViewCategoryEnum
      {
         return this.category;
      }
   }
}

