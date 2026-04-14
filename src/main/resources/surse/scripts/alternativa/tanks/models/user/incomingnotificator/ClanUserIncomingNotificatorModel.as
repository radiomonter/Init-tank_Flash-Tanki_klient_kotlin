package alternativa.tanks.models.user.incomingnotificator
{
   import alternativa.tanks.models.service.ClanNotificationEvent;
   import alternativa.tanks.models.service.ClanUserNotificationsManager;
   import alternativa.tanks.models.user.ClanUserService;
   import alternativa.tanks.models.user.IClanUserModel;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.clans.user.incomingnotificator.ClanUserIncomingNotificatorModelBase;
   import projects.tanks.client.clans.user.incomingnotificator.IClanUserIncomingNotificatorModelBase;
   
   [ModelInfo]
   public class ClanUserIncomingNotificatorModel extends ClanUserIncomingNotificatorModelBase implements ObjectLoadListener, ObjectUnloadListener, IClanUserIncomingNotificatorModelBase
   {
      
      [Inject]
      public static var clanUserService:ClanUserService;
      
      public function ClanUserIncomingNotificatorModel()
      {
         super();
      }
      
      public function onAdding(_arg_1:String) : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         ClanUserNotificationsManager.onIncomingNotification(_arg_1);
      }
      
      public function onRemoved(_arg_1:String) : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         ClanUserNotificationsManager.onRemoveIncomingNotification(_arg_1);
      }
      
      public function objectLoaded() : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         ClanUserNotificationsManager.initializeIncomingNotifications(getInitParam().objects);
         ClanUserNotificationsManager.dispatcher.addEventListener(ClanNotificationEvent.REMOVE_INCOMING_NOTIFICATION,getFunctionWrapper(this.onServerRemove));
      }
      
      public function objectUnloaded() : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         ClanUserNotificationsManager.dispatcher.removeEventListener(ClanNotificationEvent.REMOVE_INCOMING_NOTIFICATION,getFunctionWrapper(this.onServerRemove));
         ClanUserNotificationsManager.resetManager();
      }
      
      private function onServerRemove(_arg_1:ClanNotificationEvent) : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         var _local_2:IGameObject = clanUserService.getObjectById(_arg_1.id);
         server.removeNotification(_local_2);
      }
      
      private function isServiceSpace() : Boolean
      {
         return IClanUserModel(object.adapt(IClanUserModel)).loadingInServiceSpace();
      }
   }
}

