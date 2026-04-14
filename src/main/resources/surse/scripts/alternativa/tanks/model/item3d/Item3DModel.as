package alternativa.tanks.model.item3d
{
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.item3d.ITank3DViewer;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.garage.models.item.item3d.IItem3DModelBase;
   import projects.tanks.client.garage.models.item.item3d.Item3DModelBase;
   import projects.tanks.clients.flash.commons.models.coloring.IColoring;
   import projects.tanks.clients.flash.resources.object3ds.IObject3DS;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Item3DModel extends Item3DModelBase implements IItem3DModelBase, IObjectLoadListener
   {
      
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var tank3DViewer:ITank3DViewer;
      
      [Inject]
      public static var resourceRegistry:ResourceRegistry;
      
      public function Item3DModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _local_1:Tanks3DSResource = null;
         var _local_2:IColoring = null;
         var _local_3:ItemCategoryEnum = itemService.getCategory(object);
         switch(_local_3)
         {
            case ItemCategoryEnum.ARMOR:
               _local_1 = IObject3DS(object.adapt(IObject3DS)).getResource3DS();
               tank3DViewer.setArmor(_local_1);
               return;
            case ItemCategoryEnum.WEAPON:
               _local_1 = IObject3DS(object.adapt(IObject3DS)).getResource3DS();
               tank3DViewer.setWeapon(_local_1);
               return;
            case ItemCategoryEnum.COLOR:
               _local_2 = IColoring(object.adapt(IColoring));
               if(_local_2.isAnimated())
               {
                  if(getInitParam().mounted)
                  {
                     tank3DViewer.setAnimation(_local_2.getAnimatedColoring());
                  }
                  else
                  {
                     tank3DViewer.setPreviewAnimation(_local_2.getAnimatedColoring());
                  }
                  return;
               }
               if(getInitParam().mounted)
               {
                  tank3DViewer.setColor(_local_2.getColoring().data);
               }
               else
               {
                  tank3DViewer.feduli(_local_2.getColoring().data);
               }
               return;
               break;
            default:
               return;
         }
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
   }
}

