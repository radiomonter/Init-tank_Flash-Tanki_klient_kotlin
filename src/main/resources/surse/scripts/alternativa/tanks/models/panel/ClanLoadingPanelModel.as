package alternativa.tanks.models.panel
{
   import alternativa.tanks.models.service.ClanService;
   import alternativa.tanks.service.clan.ClanPanelNotificationService;
   import alternativa.tanks.service.panel.IPanelView;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.clans.panel.loadingclan.ClanLoadingPanelModelBase;
   import projects.tanks.client.clans.panel.loadingclan.IClanLoadingPanelModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.UserPropertiesServiceEvent;
   import services.buttonbar.IButtonBarService;
   import services.contextmenu.ContextMenuServiceEvent;
   import services.contextmenu.IContextMenuService;
   
   [ModelInfo]
   public class ClanLoadingPanelModel extends ClanLoadingPanelModelBase implements IClanLoadingPanelModelBase, ObjectLoadListener, ObjectUnloadListener
   {
      
      [Inject]
      public static var buttonBarService:IButtonBarService;
      
      [Inject]
      public static var contextMenuService:IContextMenuService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var panel:IPanelView;
      
      [Inject]
      public static var clanService:ClanService;
      
      [Inject]
      public static var clanPanelNotification:ClanPanelNotificationService;
      
      public function ClanLoadingPanelModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         userPropertiesService.addEventListener(UserPropertiesServiceEvent.UPDATE_RANK,getFunctionWrapper(this.updateRank));
         clanService.minRankForCreateClan = getInitParam().minRankForCreateClan;
         clanPanelNotification.clanButtonVisible = getInitParam().clanButtonVisible;
      }
      
      private function updateRank(_arg_1:UserPropertiesServiceEvent) : void
      {
         clanPanelNotification.clanButtonVisible = userPropertiesService.rank >= getInitParam().minRankForCreateClan;
      }
      
      private function onShowClan(_arg_1:ContextMenuServiceEvent) : void
      {
      }
      
      public function objectUnloaded() : void
      {
      }
   }
}

