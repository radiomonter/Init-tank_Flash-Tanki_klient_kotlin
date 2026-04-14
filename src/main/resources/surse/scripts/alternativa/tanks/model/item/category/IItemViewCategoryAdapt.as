package alternativa.tanks.model.item.category
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   
   public class IItemViewCategoryAdapt implements IItemViewCategory
   {
      
      private var object:IGameObject;
      
      private var impl:IItemViewCategory;
      
      public function IItemViewCategoryAdapt(_arg_1:IGameObject, _arg_2:IItemViewCategory)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getCategory() : ItemViewCategoryEnum
      {
         var result:ItemViewCategoryEnum = null;
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
      
      public function setCategory(param1:ItemViewCategoryEnum) : void
      {
         var category:ItemViewCategoryEnum = param1;
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

