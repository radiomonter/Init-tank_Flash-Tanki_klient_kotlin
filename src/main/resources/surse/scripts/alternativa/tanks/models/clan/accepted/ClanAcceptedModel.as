package alternativa.tanks.models.clan.accepted
{
   import alternativa.tanks.gui.clanmanagement.ClanManagementPanel;
   import alternativa.tanks.models.service.ClanService;
   import projects.tanks.client.clans.clan.accepted.ClanAcceptedModelBase;
   import projects.tanks.client.clans.clan.accepted.IClanAcceptedModelBase;
   
   [ModelInfo]
   public class ClanAcceptedModel extends ClanAcceptedModelBase implements IClanAcceptedModel, IClanAcceptedModelBase
   {
      
      [Inject]
      public static var clanService:ClanService;
      
      public function ClanAcceptedModel()
      {
         super();
      }
      
      public function onAdding(_arg_1:String) : void
      {
         if(this.getManagementPanel() != null)
         {
            this.getManagementPanel().addingAcceptedUser(_arg_1);
         }
      }
      
      public function onRemoved(_arg_1:String) : void
      {
         if(this.getManagementPanel() != null)
         {
            this.getManagementPanel().removeAcceptedUser(_arg_1);
         }
      }
      
      public function getAcceptedUsers() : Vector.<String>
      {
         return getInitParam().objects;
      }
      
      private function getManagementPanel() : ClanManagementPanel
      {
         return clanService.clanManagementPanel;
      }
   }
}

