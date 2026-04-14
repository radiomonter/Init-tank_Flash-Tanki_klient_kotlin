package alternativa.tanks.model.item.temporary
{
   import alternativa.tanks.service.temporaryitem.ITemporaryItemService;
   import alternativa.tanks.service.temporaryitemnotify.ITemporaryItemNotifyService;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.item.temporary.ITemporaryItemModelBase;
   import projects.tanks.client.garage.models.item.temporary.TemporaryItemModelBase;
   
   public class TemporaryItemModel extends TemporaryItemModelBase implements ITemporaryItemModelBase, ITemporaryItem, IObjectLoadListener
   {
      
      [Inject]
      public static var temporaryItemService:ITemporaryItemService;
      
      [Inject]
      public static var temporaryItemNotifyService:ITemporaryItemNotifyService;
      
      public function TemporaryItemModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _local_1:int = getInitParam().remainingTimeInSec;
         if(_local_1 > 0)
         {
            this.startTemporaryItem(object,_local_1);
         }
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
         this.stopTemporaryItem(object);
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      public function getStopDate() : Date
      {
         return new Date(new Date().getTime() + temporaryItemService.qed(object));
      }
      
      public function getTimeRemainingInMSec() : Number
      {
         return temporaryItemService.qed(object);
      }
      
      public function startTiming(_arg_1:int) : void
      {
         this.startTemporaryItem(object,getInitParam().lifeTimeInSec + _arg_1);
      }
      
      private function startTemporaryItem(_arg_1:IGameObject, _arg_2:int) : void
      {
         temporaryItemService.higyzive(_arg_1,_arg_2);
      }
      
      private function stopTemporaryItem(_arg_1:IGameObject) : void
      {
         temporaryItemService.gewadejem(_arg_1);
      }
   }
}

