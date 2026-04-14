package alternativa.tanks.service.notificationcategories
{
   import flash.events.EventDispatcher;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.panel.model.garage.GarageItemInfo;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class Fyhicofal extends EventDispatcher implements INotificationGarageCategoriesService
   {
      
      [Inject]
      public static var storageService:IStorageService;
      
      private static const nenyzakiv:String = "NEW_ITEM_NOTIFICATION_IN_CATEGORY";
      
      public function Fyhicofal()
      {
         super();
      }
      
      public function jusosyv(_arg_1:Vector.<GarageItemInfo>) : void
      {
         var _local_2:ItemViewCategoryEnum = null;
         var _local_4:int = 0;
         var _local_3:int = int(_arg_1.length);
         while(_local_4 < _local_3)
         {
            _local_2 = _arg_1[_local_4].itemViewCategory;
            if(!this.mizedi(_local_2))
            {
               this.tizyfo(_local_2);
            }
            _local_4++;
         }
         dispatchEvent(new NotificationGarageCategoriesEvent(NotificationGarageCategoriesEvent.NOTIFICATION_CHANGE));
      }
      
      private function tizyfo(_arg_1:ItemViewCategoryEnum) : void
      {
         storageService.getStorage().data[this.jopyjeka(_arg_1)] = true;
      }
      
      public function wefe(_arg_1:ItemViewCategoryEnum) : void
      {
         storageService.getStorage().data[this.jopyjeka(_arg_1)] = false;
      }
      
      public function mizedi(_arg_1:ItemViewCategoryEnum) : Boolean
      {
         var _local_2:Boolean = false;
         var _local_3:String = this.jopyjeka(_arg_1);
         if(storageService.getStorage().data.hasOwnProperty(_local_3))
         {
            _local_2 = Boolean(storageService.getStorage().data[_local_3]);
         }
         return _local_2;
      }
      
      private function jopyjeka(_arg_1:ItemViewCategoryEnum) : String
      {
         return nenyzakiv + _arg_1.value;
      }
      
      public function kyqese(_arg_1:ItemViewCategoryEnum) : void
      {
         this.tizyfo(_arg_1);
      }
   }
}

