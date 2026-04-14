package alternativa.tanks.models.service
{
   import alternativa.tanks.models.clan.IClanModel;
   import flash.events.EventDispatcher;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanFunctionsService;
   
   public class ClanFunctionsServiceImpl extends EventDispatcher implements ClanFunctionsService
   {
      
      [Inject]
      public static var clanService:ClanService;
      
      public function ClanFunctionsServiceImpl()
      {
         super();
      }
      
      public function invite(_arg_1:String) : void
      {
         clanService.clanPanelModel.sendInviteToClan(_arg_1);
      }
      
      public function leave() : void
      {
         this.clanModel().leaveClan();
      }
      
      public function exclude(_arg_1:String) : void
      {
         this.clanModel().excludeClanMember(_arg_1);
      }
      
      public function revokeRequest(_arg_1:String) : void
      {
         this.clanModel().revokeRequest(_arg_1);
      }
      
      public function acceptRequest(_arg_1:String) : void
      {
         this.clanModel().acceptRequest(_arg_1);
      }
      
      public function rejectRequest(_arg_1:String) : void
      {
         this.clanModel().rejectRequest(_arg_1);
      }
      
      public function rejectAllRequests() : void
      {
         this.clanModel().rejectAllRequests();
      }
      
      private function clanModel() : IClanModel
      {
         return IClanModel(clanService.clanObject.adapt(IClanModel));
      }
   }
}

