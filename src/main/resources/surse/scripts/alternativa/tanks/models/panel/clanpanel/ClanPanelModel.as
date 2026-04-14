package alternativa.tanks.models.panel.clanpanel
{
   import alternativa.tanks.models.service.ClanService;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.clans.panel.clanpanel.ClanPanelModelBase;
   import projects.tanks.client.clans.panel.clanpanel.IClanPanelModelBase;
   
   [ModelInfo]
   public class ClanPanelModel extends ClanPanelModelBase implements IClanPanelModelBase, IClanPanelModel, ObjectLoadListener, ObjectUnloadListener
   {
      
      [Inject]
      public static var clanService:ClanService;
      
      public function ClanPanelModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         clanService.clanPanelModel = IClanPanelModel(object.adapt(IClanPanelModel));
      }
      
      public function sendInviteToClan(_arg_1:String) : void
      {
         server.sendInviteToClan(_arg_1);
      }
      
      public function objectUnloaded() : void
      {
         clanService.clanPanelModel = null;
      }
   }
}

