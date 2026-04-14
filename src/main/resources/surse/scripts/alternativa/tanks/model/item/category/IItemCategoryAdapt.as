package alternativa.tanks.model.item.category
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   
   public class IItemCategoryAdapt implements IItemCategory
   {
      
      private var object:IGameObject;
      
      private var impl:IItemCategory;
      
      public function IItemCategoryAdapt(_arg_1:IGameObject, _arg_2:IItemCategory)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getCategory() : ItemCategoryEnum
      {
         var result:ItemCategoryEnum = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getCategory();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function setCategory(param1:ItemCategoryEnum) : void
      {
         var category:ItemCategoryEnum = param1;
         try
         {
            Model.object = this.object;
            this.impl.setCategory(category);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

