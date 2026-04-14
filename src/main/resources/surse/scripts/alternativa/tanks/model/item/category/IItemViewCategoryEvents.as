package alternativa.tanks.model.item.category
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   
   public class IItemViewCategoryEvents implements IItemViewCategory
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<IItemViewCategory>;
      
      public function IItemViewCategoryEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<IItemViewCategory>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function getCategory() : ItemViewCategoryEnum
      {
         var result:ItemViewCategoryEnum = null;
         var i:int = 0;
         var m:IItemViewCategory = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getCategory();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function setCategory(param1:ItemViewCategoryEnum) : void
      {
         var i:int = 0;
         var m:IItemViewCategory = null;
         var category:ItemViewCategoryEnum = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.setCategory(category);
               i += 1;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

