package alternativa.tanks.model.item.properties
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ItemPropertiesAdapt implements ItemProperties
   {
      
      private var object:IGameObject;
      
      private var impl:ItemProperties;
      
      public function ItemPropertiesAdapt(_arg_1:IGameObject, _arg_2:ItemProperties)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getProperties() : Vector.<ItemPropertyValue>
      {
         var result:Vector.<ItemPropertyValue> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getProperties();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

