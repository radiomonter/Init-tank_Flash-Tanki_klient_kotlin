package alternativa.tanks.model.item.properties
{
   import projects.tanks.client.garage.models.item.properties.IItemPropertiesModelBase;
   import projects.tanks.client.garage.models.item.properties.ItemGaragePropertyData;
   import projects.tanks.client.garage.models.item.properties.ItemPropertiesModelBase;
   
   public class ItemPropertiesModel extends ItemPropertiesModelBase implements IItemPropertiesModelBase, ItemProperties
   {
      
      public function ItemPropertiesModel()
      {
         super();
      }
      
      public function getProperties() : Vector.<ItemPropertyValue>
      {
         var _local_1:Vector.<ItemPropertyValue> = null;
         var _local_2:ItemGaragePropertyData = null;
         var _local_3:Object = getData(Vector);
         if(_local_3 == null)
         {
            _local_1 = new Vector.<ItemPropertyValue>();
            for each(_local_2 in getInitParam().properties)
            {
               _local_1.push(new ItemGaragePropertyValue(_local_2));
            }
            putData(Vector,_local_1);
         }
         else
         {
            _local_1 = Vector.<ItemPropertyValue>(_local_3);
         }
         return _local_1;
      }
   }
}

