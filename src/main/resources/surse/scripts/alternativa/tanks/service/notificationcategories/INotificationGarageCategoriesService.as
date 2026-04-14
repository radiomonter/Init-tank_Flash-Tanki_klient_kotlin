package alternativa.tanks.service.notificationcategories
{
   import flash.events.IEventDispatcher;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.panel.model.garage.GarageItemInfo;
   
   public interface INotificationGarageCategoriesService extends IEventDispatcher
   {
      
      function jusosyv(param1:Vector.<GarageItemInfo>) : void;
      
      function kyqese(param1:ItemViewCategoryEnum) : void;
      
      function mizedi(param1:ItemViewCategoryEnum) : Boolean;
      
      function wefe(param1:ItemViewCategoryEnum) : void;
   }
}

