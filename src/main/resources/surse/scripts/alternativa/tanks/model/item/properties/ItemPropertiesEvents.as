package alternativa.tanks.model.item.properties
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ItemPropertiesEvents implements ItemProperties
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<ItemProperties>;
      
      public function ItemPropertiesEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<ItemProperties>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function getProperties() : Vector.<ItemPropertyValue>
      {
         var result:Vector.<ItemPropertyValue> = null;
         var i:int = 0;
         var m:ItemProperties = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getProperties();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

