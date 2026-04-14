package alternativa.tanks.model.item
{
   import alternativa.osgi.service.dump.IDumper;
   import alternativa.tanks.model.item.item.IItem;
   import alternativa.tanks.service.item.ItemService;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.SpaceRegistry;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   
   public class ItemDumper implements IDumper
   {
      
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      [Inject]
      public static var spaceRegistry:SpaceRegistry;
      
      [Inject]
      public static var itemService:ItemService;
      
      public function ItemDumper()
      {
         super();
      }
      
      public function dump(_arg_1:Array) : String
      {
         var _local_2:Vector.<ISpace> = null;
         var _local_3:int = 0;
         var _local_4:Vector.<IGameObject> = null;
         var _local_5:IGameObject = null;
         var _local_6:* = "\n";
         var _local_7:IItem = (modelRegistry.getModelsByInterface(IItem) as Vector.<IModel>)[0] as IItem;
         if(_local_7 != null)
         {
            _local_2 = spaceRegistry.spaces;
            _local_3 = 0;
            while(_local_3 < _local_2.length)
            {
               _local_4 = _local_2[_local_3].objects;
               for each(_local_5 in _local_4)
               {
                  if(_local_5.hasModel(IItem))
                  {
                     _local_6 += "\n" + itemService.getName(_local_5);
                     _local_6 += "   type: " + itemService.getCategory(_local_5) + "\n";
                     _local_6 += "   description: " + itemService.getDescription(_local_5) + "\n";
                     _local_6 += "   rankId: " + itemService.ruma(_local_5) + "\n";
                     _local_6 += "   price: " + itemService.getPrice(_local_5) + "\n";
                  }
               }
               _local_3++;
            }
         }
         else
         {
            _local_6 += "ItemModel not registered!";
         }
         return _local_6 + "\n";
      }
      
      public function get dumperName() : String
      {
         return "item";
      }
   }
}

