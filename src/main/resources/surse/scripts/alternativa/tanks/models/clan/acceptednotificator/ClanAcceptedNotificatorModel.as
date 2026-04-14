package alternativa.tanks.models.clan.acceptednotificator
{
   import alternativa.tanks.models.service.ClanNotificationEvent;
   import alternativa.tanks.models.service.ClanNotificationsManager;
   import alternativa.tanks.models.user.IClanUserModel;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.clans.clan.acceptednotificator.ClanAcceptedNotificatorModelBase;
   import projects.tanks.client.clans.clan.acceptednotificator.IClanAcceptedNotificatorModelBase;
   
   [ModelInfo]
   public class ClanAcceptedNotificatorModel extends ClanAcceptedNotificatorModelBase implements ObjectLoadListener, ObjectUnloadListener, IClanAcceptedNotificatorModelBase
   {
      
      public function ClanAcceptedNotificatorModel()
      {
         super();
      }
      
      public function onAdding(_arg_1:String) : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         ClanNotificationsManager.onAcceptedNotification(_arg_1);
      }
      
      public function onRemoved(_arg_1:String) : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         ClanNotificationsManager.onRemoveAcceptedNotification(_arg_1);
      }
      
      public function objectLoaded() : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         ClanNotificationsManager.initializeAcceptedNotifications(getInitParam().objects);
         ClanNotificationsManager.dispatcher.addEventListener(ClanNotificationEvent.REMOVE_ACCEPTED_NOTIFICATION,getFunctionWrapper(this.onServerRemove));
      }
      
      public function objectUnloaded() : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         ClanNotificationsManager.dispatcher.removeEventListener(ClanNotificationEvent.REMOVE_ACCEPTED_NOTIFICATION,getFunctionWrapper(this.onServerRemove));
      }
      
      private function onServerRemove(_arg_1:ClanNotificationEvent) : void
      {
         server.remove(_arg_1.id);
      }
      
      private function isServiceSpace() : Boolean
      {
         return IClanUserModel(object.adapt(IClanUserModel)).loadingInServiceSpace();
      }
   }
}

