package alternativa.tanks.models.clan.incomingnotificator
{
   import alternativa.tanks.models.service.ClanNotificationEvent;
   import alternativa.tanks.models.service.ClanNotificationsManager;
   import alternativa.tanks.models.user.IClanUserModel;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.clans.clan.incomingnotificator.ClanIncomingNotificatorModelBase;
   import projects.tanks.client.clans.clan.incomingnotificator.IClanIncomingNotificatorModelBase;
   
   [ModelInfo]
   public class ClanIncomingNotificatorModel extends ClanIncomingNotificatorModelBase implements ObjectLoadListener, ObjectUnloadListener, IClanIncomingNotificatorModelBase
   {
      
      public function ClanIncomingNotificatorModel()
      {
         super();
      }
      
      public function onAdding(_arg_1:String) : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         ClanNotificationsManager.onIncomingNotification(_arg_1);
      }
      
      public function onRemoved(_arg_1:String) : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         ClanNotificationsManager.onRemoveIncomingNotification(_arg_1);
      }
      
      public function objectLoaded() : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         ClanNotificationsManager.initializeIncomingNotifications(getInitParam().objects);
         ClanNotificationsManager.dispatcher.addEventListener(ClanNotificationEvent.REMOVE_INCOMING_NOTIFICATION,getFunctionWrapper(this.onServerRemove));
      }
      
      private function onServerRemove(_arg_1:ClanNotificationEvent) : void
      {
         server.remove(_arg_1.id);
      }
      
      public function objectUnloaded() : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         ClanNotificationsManager.dispatcher.removeEventListener(ClanNotificationEvent.REMOVE_INCOMING_NOTIFICATION,getFunctionWrapper(this.onServerRemove));
      }
      
      private function isServiceSpace() : Boolean
      {
         return IClanUserModel(object.adapt(IClanUserModel)).loadingInServiceSpace();
      }
   }
}

