package alternativa.tanks.model.item.category
{
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.garage.models.item.view.IItemViewCategoryModelBase;
   import projects.tanks.client.garage.models.item.view.ItemViewCategoryModelBase;
   
   public class ItemViewCategoryModel extends ItemViewCategoryModelBase implements IItemViewCategoryModelBase, IItemViewCategory
   {
      
      public function ItemViewCategoryModel()
      {
         super();
      }
      
      public function getCategory() : ItemViewCategoryEnum
      {
         return getInitParam().category;
      }
      
      public function setCategory(_arg_1:ItemViewCategoryEnum) : void
      {
         getInitParam().category = _arg_1;
      }
   }
}

