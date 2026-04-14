package alternativa.tanks.models.user.incoming
{
   import alternativa.tanks.gui.notinclan.clanslist.ClansListEvent;
   import alternativa.tanks.models.service.ClanUserNotificationsManager;
   import alternativa.tanks.models.user.ClanUserService;
   import alternativa.tanks.models.user.IClanUserModel;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import projects.tanks.client.clans.user.incoming.ClanUserIncomingModelBase;
   import projects.tanks.client.clans.user.incoming.IClanUserIncomingModelBase;
   
   [ModelInfo]
   public class ClanUserIncomingModel extends ClanUserIncomingModelBase implements IClanUserIncomingModelBase, ObjectLoadListener, IClanUserIncomingModel
   {
      
      [Inject]
      public static var clanUserService:ClanUserService;
      
      private var clans:Vector.<String>;
      
      public function ClanUserIncomingModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         this.clans = getInitParam().objects.concat();
      }
      
      public function objectUnloaded() : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         this.clans.length = 0;
      }
      
      public function onAdding(_arg_1:String) : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         this.clans.push(_arg_1);
         ClanUserNotificationsManager.onIncomingNotification(_arg_1);
         ClansListEvent.getDispatcher().dispatchEvent(new ClansListEvent(ClansListEvent.INCOMING + ClansListEvent.ADD,_arg_1));
      }
      
      public function onRemoved(_arg_1:String) : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         var _local_2:int = this.clans.indexOf(_arg_1);
         if(_local_2 >= 0)
         {
            this.clans.splice(_local_2,1);
            ClansListEvent.getDispatcher().dispatchEvent(new ClansListEvent(ClansListEvent.INCOMING + ClansListEvent.REMOVE,_arg_1));
         }
      }
      
      public function getIncomingClans() : Vector.<String>
      {
         return this.clans;
      }
      
      private function isServiceSpace() : Boolean
      {
         return IClanUserModel(object.adapt(IClanUserModel)).loadingInServiceSpace();
      }
   }
}

