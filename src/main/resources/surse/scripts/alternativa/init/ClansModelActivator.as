package alternativa.init
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.tanks.models.clan.membersdata.ClanMembersDataService;
   import alternativa.tanks.models.clan.membersdata.ClanMembersDataServiceImpl;
   import alternativa.tanks.models.foreignclan.ForeignClanService;
   import alternativa.tanks.models.foreignclan.ForeignClanServiceImpl;
   import alternativa.tanks.models.panel.ClanPanelNotificationServiceImpl;
   import alternativa.tanks.models.panel.create.ClanCreateService;
   import alternativa.tanks.models.panel.create.ClanCreateServiceImpl;
   import alternativa.tanks.models.service.ClanFriendsServiceImpl;
   import alternativa.tanks.models.service.ClanFunctionsServiceImpl;
   import alternativa.tanks.models.service.ClanService;
   import alternativa.tanks.models.service.ClanServiceImpl;
   import alternativa.tanks.models.user.ClanUserService;
   import alternativa.tanks.models.user.ClanUserServiceImpl;
   import alternativa.tanks.service.clan.ClanFriendsService;
   import alternativa.tanks.service.clan.ClanPanelNotificationService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanFunctionsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanUserInfoServiceImpl;
   
   public class ClansModelActivator implements IBundleActivator
   {
      
      public function ClansModelActivator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         _arg_1.registerService(ClanService,new ClanServiceImpl());
         _arg_1.registerService(ClanCreateService,new ClanCreateServiceImpl());
         _arg_1.registerService(ClanUserService,new ClanUserServiceImpl());
         _arg_1.registerService(ClanMembersDataService,new ClanMembersDataServiceImpl());
         _arg_1.registerService(ClanPanelNotificationService,new ClanPanelNotificationServiceImpl());
         _arg_1.registerService(ClanUserInfoService,new ClanUserInfoServiceImpl());
         _arg_1.registerService(ClanFriendsService,new ClanFriendsServiceImpl());
         _arg_1.registerService(ClanFunctionsService,new ClanFunctionsServiceImpl());
         _arg_1.registerService(ForeignClanService,new ForeignClanServiceImpl());
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

