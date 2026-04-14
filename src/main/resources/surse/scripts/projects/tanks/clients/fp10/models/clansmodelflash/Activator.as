package projects.tanks.clients.fp10.models.clansmodelflash
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.ClanWindow;
   import alternativa.tanks.gui.clanmanagement.ClanEditProfileDialog;
   import alternativa.tanks.gui.clanmanagement.ClanIncomingRequestsDialog;
   import alternativa.tanks.gui.clanmanagement.ClanManagementPanel;
   import alternativa.tanks.gui.clanmanagement.ClanOutgoingRequestsDialog;
   import alternativa.tanks.gui.clanmanagement.ClanPermissionsManager;
   import alternativa.tanks.gui.clanmanagement.ClanProfileWindow;
   import alternativa.tanks.gui.clanmanagement.ClanTopManagementPanel;
   import alternativa.tanks.gui.clanmanagement.ClanUsersWindow;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.ContextMenuPermissionLabel;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.ISourceData;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.ISourceDataAdapt;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.ISourceDataEvents;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.SearchInputView;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.candidates.ClanIncomingRequestItem;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.candidates.ClanOutgoingRequestsItem;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.candidates.HeaderClanCandidateList;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.list.DeleteIndicator;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.members.ClanMemberItem;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.members.ClanMembersList;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.members.HeaderClanMemberList;
   import alternativa.tanks.gui.components.button.ClanButtonActionListener;
   import alternativa.tanks.gui.components.button.ClanUsersButton;
   import alternativa.tanks.gui.components.flag.Flag;
   import alternativa.tanks.gui.components.flag.FlagsDropDownList;
   import alternativa.tanks.gui.foreignclan.ForeignClanWindow;
   import alternativa.tanks.gui.notinclan.ClanListDialog;
   import alternativa.tanks.gui.notinclan.NotInClanPanel;
   import alternativa.tanks.gui.notinclan.clanslist.ClanInfoLabel;
   import alternativa.tanks.gui.notinclan.clanslist.ClansDataProvider;
   import alternativa.tanks.gui.notinclan.clanslist.ClansList;
   import alternativa.tanks.gui.notinclan.clanslist.ClansListHeader;
   import alternativa.tanks.gui.notinclan.clanslist.UserIncomingRequestLabel;
   import alternativa.tanks.gui.notinclan.dialogs.ClanCreateDialog;
   import alternativa.tanks.gui.notinclan.dialogs.ClanDialog;
   import alternativa.tanks.gui.notinclan.dialogs.ClanLicenseDialog;
   import alternativa.tanks.gui.notinclan.dialogs.requests.UserIncomingRequestsDialog;
   import alternativa.tanks.gui.notinclan.dialogs.requests.UserOutgoingRequestsDialog;
   import alternativa.tanks.gui.notinclan.dialogs.requests.UserRequestsDialog;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.models.clan.ClanModel;
   import alternativa.tanks.models.clan.IClanModel;
   import alternativa.tanks.models.clan.IClanModelAdapt;
   import alternativa.tanks.models.clan.IClanModelEvents;
   import alternativa.tanks.models.clan.accepted.ClanAcceptedModel;
   import alternativa.tanks.models.clan.accepted.IClanAcceptedModel;
   import alternativa.tanks.models.clan.accepted.IClanAcceptedModelAdapt;
   import alternativa.tanks.models.clan.accepted.IClanAcceptedModelEvents;
   import alternativa.tanks.models.clan.acceptednotificator.ClanAcceptedNotificatorModel;
   import alternativa.tanks.models.clan.block.ClanBlockModel;
   import alternativa.tanks.models.clan.clanfriends.ClanFriendsModel;
   import alternativa.tanks.models.clan.incoming.ClanIncomingModel;
   import alternativa.tanks.models.clan.incoming.IClanIncomingModel;
   import alternativa.tanks.models.clan.incoming.IClanIncomingModelAdapt;
   import alternativa.tanks.models.clan.incoming.IClanIncomingModelEvents;
   import alternativa.tanks.models.clan.incomingnotificator.ClanIncomingNotificatorModel;
   import alternativa.tanks.models.clan.info.ClanInfoModel;
   import alternativa.tanks.models.clan.info.IClanInfoModel;
   import alternativa.tanks.models.clan.info.IClanInfoModelAdapt;
   import alternativa.tanks.models.clan.info.IClanInfoModelEvents;
   import alternativa.tanks.models.clan.membersdata.ClanMembersDataModel;
   import alternativa.tanks.models.clan.membersdata.ClanMembersDataService;
   import alternativa.tanks.models.clan.membersdata.ClanMembersDataServiceImpl;
   import alternativa.tanks.models.clan.outgoing.ClanOutgoingModel;
   import alternativa.tanks.models.clan.outgoing.IClanOutgoingModel;
   import alternativa.tanks.models.clan.outgoing.IClanOutgoingModelAdapt;
   import alternativa.tanks.models.clan.outgoing.IClanOutgoingModelEvents;
   import alternativa.tanks.models.clan.permission.ClanPermissionsModel;
   import alternativa.tanks.models.clan.permission.IClanPermissionsModel;
   import alternativa.tanks.models.clan.permission.IClanPermissionsModelAdapt;
   import alternativa.tanks.models.clan.permission.IClanPermissionsModelEvents;
   import alternativa.tanks.models.foreignclan.ForeignClanModel;
   import alternativa.tanks.models.foreignclan.ForeignClanService;
   import alternativa.tanks.models.license.LicenseClanUserModel;
   import alternativa.tanks.models.notifier.ClanNotifierModel;
   import alternativa.tanks.models.panel.ClanLoadingPanelModel;
   import alternativa.tanks.models.panel.ClanPanelNotificationModel;
   import alternativa.tanks.models.panel.ClanPanelNotificationServiceImpl;
   import alternativa.tanks.models.panel.clanpanel.ClanPanelModel;
   import alternativa.tanks.models.panel.clanpanel.IClanPanelModel;
   import alternativa.tanks.models.panel.clanpanel.IClanPanelModelAdapt;
   import alternativa.tanks.models.panel.clanpanel.IClanPanelModelEvents;
   import alternativa.tanks.models.panel.create.ClanCreateModel;
   import alternativa.tanks.models.panel.create.ClanCreateService;
   import alternativa.tanks.models.panel.create.ClanCreateServiceImpl;
   import alternativa.tanks.models.service.ClanFunctionsServiceImpl;
   import alternativa.tanks.models.service.ClanService;
   import alternativa.tanks.models.service.ClanServiceImpl;
   import alternativa.tanks.models.user.ClanUserLoaderModel;
   import alternativa.tanks.models.user.ClanUserModel;
   import alternativa.tanks.models.user.ClanUserService;
   import alternativa.tanks.models.user.IClanUserModel;
   import alternativa.tanks.models.user.IClanUserModelAdapt;
   import alternativa.tanks.models.user.IClanUserModelEvents;
   import alternativa.tanks.models.user.accepted.ClanUserAcceptedModel;
   import alternativa.tanks.models.user.acceptednotificator.ClanUserAcceptedNotificatorModel;
   import alternativa.tanks.models.user.incoming.ClanUserIncomingModel;
   import alternativa.tanks.models.user.incoming.IClanUserIncomingModel;
   import alternativa.tanks.models.user.incoming.IClanUserIncomingModelAdapt;
   import alternativa.tanks.models.user.incoming.IClanUserIncomingModelEvents;
   import alternativa.tanks.models.user.incomingnotificator.ClanUserIncomingNotificatorModel;
   import alternativa.tanks.models.user.outgoing.ClanUserOutgoingModel;
   import alternativa.tanks.models.user.outgoing.IClanUserOutgoingModel;
   import alternativa.tanks.models.user.outgoing.IClanUserOutgoingModelAdapt;
   import alternativa.tanks.models.user.outgoing.IClanUserOutgoingModelEvents;
   import alternativa.tanks.service.clan.ClanFriendsService;
   import alternativa.tanks.service.clan.ClanPanelNotificationService;
   import alternativa.tanks.service.panel.IPanelView;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.clans.clan.IClanModelBase;
   import projects.tanks.client.clans.clan.accepted.IClanAcceptedModelBase;
   import projects.tanks.client.clans.clan.acceptednotificator.IClanAcceptedNotificatorModelBase;
   import projects.tanks.client.clans.clan.block.IClanBlockModelBase;
   import projects.tanks.client.clans.clan.clanfriends.IClanFriendsModelBase;
   import projects.tanks.client.clans.clan.clanmembersdata.IClanMembersDataModelBase;
   import projects.tanks.client.clans.clan.incoming.IClanIncomingModelBase;
   import projects.tanks.client.clans.clan.incomingnotificator.IClanIncomingNotificatorModelBase;
   import projects.tanks.client.clans.clan.info.IClanInfoModelBase;
   import projects.tanks.client.clans.clan.outgoing.IClanOutgoingModelBase;
   import projects.tanks.client.clans.clan.permissions.IClanPermissionsModelBase;
   import projects.tanks.client.clans.license.user.ILicenseClanUserModelBase;
   import projects.tanks.client.clans.notifier.IClanNotifierModelBase;
   import projects.tanks.client.clans.panel.clanpanel.IClanPanelModelBase;
   import projects.tanks.client.clans.panel.foreignclan.IForeignClanModelBase;
   import projects.tanks.client.clans.panel.loadingclan.IClanLoadingPanelModelBase;
   import projects.tanks.client.clans.panel.notification.IClanPanelNotificationModelBase;
   import projects.tanks.client.clans.space.createclan.IClanCreateModelBase;
   import projects.tanks.client.clans.user.IClanUserLoaderModelBase;
   import projects.tanks.client.clans.user.IClanUserModelBase;
   import projects.tanks.client.clans.user.accepted.IClanUserAcceptedModelBase;
   import projects.tanks.client.clans.user.acceptednotificator.IClanUserAcceptedNotificatorModelBase;
   import projects.tanks.client.clans.user.incoming.IClanUserIncomingModelBase;
   import projects.tanks.client.clans.user.incomingnotificator.IClanUserIncomingNotificatorModelBase;
   import projects.tanks.client.clans.user.outgoing.IClanUserOutgoingModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanFunctionsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import services.buttonbar.IButtonBarService;
   import services.contextmenu.IContextMenuService;
   
   public class Activator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(_osgi:OSGi) : void
      {
         var modelRegisterAdapt:ModelRegistry;
         var modelRegister:ModelRegistry;
         osgi = _osgi;
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            ClanWindow.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return ClanWindow.display;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanEditProfileDialog.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanEditProfileDialog.clanService;
         });
         osgi.injectService(ClanCreateService,function(_arg_1:Object):void
         {
            ClanEditProfileDialog.createClanService = ClanCreateService(_arg_1);
         },function():ClanCreateService
         {
            return ClanEditProfileDialog.createClanService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClanEditProfileDialog.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClanEditProfileDialog.localeService;
         });
         osgi.injectService(ClanFunctionsService,function(_arg_1:Object):void
         {
            ClanIncomingRequestsDialog.clanFunctionsService = ClanFunctionsService(_arg_1);
         },function():ClanFunctionsService
         {
            return ClanIncomingRequestsDialog.clanFunctionsService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClanIncomingRequestsDialog.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClanIncomingRequestsDialog.localeService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            ClanIncomingRequestsDialog.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return ClanIncomingRequestsDialog.userInfoService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            ClanManagementPanel.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return ClanManagementPanel.alertService;
         });
         osgi.injectService(ClanFriendsService,function(_arg_1:Object):void
         {
            ClanManagementPanel.clanFriendsService = ClanFriendsService(_arg_1);
         },function():ClanFriendsService
         {
            return ClanManagementPanel.clanFriendsService;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanManagementPanel.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanManagementPanel.clanService;
         });
         osgi.injectService(CommandService,function(_arg_1:Object):void
         {
            ClanManagementPanel.commandService = CommandService(_arg_1);
         },function():CommandService
         {
            return ClanManagementPanel.commandService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            ClanManagementPanel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return ClanManagementPanel.display;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClanManagementPanel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClanManagementPanel.localeService;
         });
         osgi.injectService(ClanFunctionsService,function(_arg_1:Object):void
         {
            ClanOutgoingRequestsDialog.clanFunctionsService = ClanFunctionsService(_arg_1);
         },function():ClanFunctionsService
         {
            return ClanOutgoingRequestsDialog.clanFunctionsService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClanOutgoingRequestsDialog.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClanOutgoingRequestsDialog.localeService;
         });
         osgi.injectService(ClanMembersDataService,function(_arg_1:Object):void
         {
            ClanPermissionsManager.clanMembersDataService = ClanMembersDataService(_arg_1);
         },function():ClanMembersDataService
         {
            return ClanPermissionsManager.clanMembersDataService;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanPermissionsManager.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanPermissionsManager.clanService;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            ClanPermissionsManager.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return ClanPermissionsManager.clanUserInfoService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            ClanPermissionsManager.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return ClanPermissionsManager.display;
         });
         osgi.injectService(ClanMembersDataService,function(_arg_1:Object):void
         {
            ClanProfileWindow.clanMembersData = ClanMembersDataService(_arg_1);
         },function():ClanMembersDataService
         {
            return ClanProfileWindow.clanMembersData;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanProfileWindow.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanProfileWindow.clanService;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            ClanProfileWindow.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return ClanProfileWindow.clanUserInfoService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClanProfileWindow.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClanProfileWindow.localeService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            ClanTopManagementPanel.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return ClanTopManagementPanel.alertService;
         });
         osgi.injectService(ClanFunctionsService,function(_arg_1:Object):void
         {
            ClanTopManagementPanel.clanFunctionsService = ClanFunctionsService(_arg_1);
         },function():ClanFunctionsService
         {
            return ClanTopManagementPanel.clanFunctionsService;
         });
         osgi.injectService(ClanMembersDataService,function(_arg_1:Object):void
         {
            ClanTopManagementPanel.clanMembersService = ClanMembersDataService(_arg_1);
         },function():ClanMembersDataService
         {
            return ClanTopManagementPanel.clanMembersService;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanTopManagementPanel.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanTopManagementPanel.clanService;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            ClanTopManagementPanel.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return ClanTopManagementPanel.clanUserInfoService;
         });
         osgi.injectService(ClanUserService,function(_arg_1:Object):void
         {
            ClanTopManagementPanel.clanUserService = ClanUserService(_arg_1);
         },function():ClanUserService
         {
            return ClanTopManagementPanel.clanUserService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClanTopManagementPanel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClanTopManagementPanel.localeService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            ClanTopManagementPanel.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return ClanTopManagementPanel.userInfoService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            ClanTopManagementPanel.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return ClanTopManagementPanel.userPropertiesService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            ClanUsersWindow.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return ClanUsersWindow.alertService;
         });
         osgi.injectService(ClanFunctionsService,function(_arg_1:Object):void
         {
            ClanUsersWindow.clanFunctionsService = ClanFunctionsService(_arg_1);
         },function():ClanFunctionsService
         {
            return ClanUsersWindow.clanFunctionsService;
         });
         osgi.injectService(ClanMembersDataService,function(_arg_1:Object):void
         {
            ClanUsersWindow.clanMembersData = ClanMembersDataService(_arg_1);
         },function():ClanMembersDataService
         {
            return ClanUsersWindow.clanMembersData;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanUsersWindow.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanUsersWindow.clanService;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            ClanUsersWindow.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return ClanUsersWindow.clanUserInfoService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClanUsersWindow.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClanUsersWindow.localeService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            ClanUsersWindow.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return ClanUsersWindow.userInfoService;
         });
         osgi.injectService(ClanMembersDataService,function(_arg_1:Object):void
         {
            ContextMenuPermissionLabel.clanMembersData = ClanMembersDataService(_arg_1);
         },function():ClanMembersDataService
         {
            return ContextMenuPermissionLabel.clanMembersData;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ContextMenuPermissionLabel.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ContextMenuPermissionLabel.clanService;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            ContextMenuPermissionLabel.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return ContextMenuPermissionLabel.clanUserInfoService;
         });
         osgi.injectService(ForeignClanService,function(_arg_1:Object):void
         {
            ContextMenuPermissionLabel.foreignClanService = ForeignClanService(_arg_1);
         },function():ForeignClanService
         {
            return ContextMenuPermissionLabel.foreignClanService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ContextMenuPermissionLabel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ContextMenuPermissionLabel.localeService;
         });
         osgi.injectService(IBlurService,function(_arg_1:Object):void
         {
            SearchInputView.blurService = IBlurService(_arg_1);
         },function():IBlurService
         {
            return SearchInputView.blurService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            SearchInputView.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return SearchInputView.localeService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            SearchInputView.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return SearchInputView.userPropertiesService;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanIncomingRequestItem.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanIncomingRequestItem.clanService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClanIncomingRequestItem.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClanIncomingRequestItem.localeService;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanOutgoingRequestsItem.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanOutgoingRequestsItem.clanService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            HeaderClanCandidateList.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return HeaderClanCandidateList.localeService;
         });
         osgi.injectService(ClanMembersDataService,function(_arg_1:Object):void
         {
            DeleteIndicator.clanMembersData = ClanMembersDataService(_arg_1);
         },function():ClanMembersDataService
         {
            return DeleteIndicator.clanMembersData;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            DeleteIndicator.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return DeleteIndicator.clanUserInfoService;
         });
         osgi.injectService(ForeignClanService,function(_arg_1:Object):void
         {
            DeleteIndicator.foreignClanService = ForeignClanService(_arg_1);
         },function():ForeignClanService
         {
            return DeleteIndicator.foreignClanService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClanMemberItem.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClanMemberItem.localeService;
         });
         osgi.injectService(ClanMembersDataService,function(_arg_1:Object):void
         {
            ClanMembersList.clanMembersData = ClanMembersDataService(_arg_1);
         },function():ClanMembersDataService
         {
            return ClanMembersList.clanMembersData;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            ClanMembersList.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return ClanMembersList.userInfoService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            HeaderClanMemberList.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return HeaderClanMemberList.localeService;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanButtonActionListener.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanButtonActionListener.clanService;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            ClanButtonActionListener.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return ClanButtonActionListener.clanUserInfoService;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanUsersButton.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanUsersButton.clanService;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            ClanUsersButton.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return ClanUsersButton.clanUserInfoService;
         });
         osgi.injectService(ClanCreateService,function(_arg_1:Object):void
         {
            Flag.clanCreateService = ClanCreateService(_arg_1);
         },function():ClanCreateService
         {
            return Flag.clanCreateService;
         });
         osgi.injectService(ClanCreateService,function(_arg_1:Object):void
         {
            FlagsDropDownList.clanCreateService = ClanCreateService(_arg_1);
         },function():ClanCreateService
         {
            return FlagsDropDownList.clanCreateService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            FlagsDropDownList.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return FlagsDropDownList.localeService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            ForeignClanWindow.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return ForeignClanWindow.alertService;
         });
         osgi.injectService(ClanCreateService,function(_arg_1:Object):void
         {
            ForeignClanWindow.createClanService = ClanCreateService(_arg_1);
         },function():ClanCreateService
         {
            return ForeignClanWindow.createClanService;
         });
         osgi.injectService(ForeignClanService,function(_arg_1:Object):void
         {
            ForeignClanWindow.foreignClanService = ForeignClanService(_arg_1);
         },function():ForeignClanService
         {
            return ForeignClanWindow.foreignClanService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ForeignClanWindow.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ForeignClanWindow.localeService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            ForeignClanWindow.userPropertyService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return ForeignClanWindow.userPropertyService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClanListDialog.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClanListDialog.localeService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            NotInClanPanel.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return NotInClanPanel.alertService;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            NotInClanPanel.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return NotInClanPanel.clanUserInfoService;
         });
         osgi.injectService(ClanUserService,function(_arg_1:Object):void
         {
            NotInClanPanel.clanUserService = ClanUserService(_arg_1);
         },function():ClanUserService
         {
            return NotInClanPanel.clanUserService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            NotInClanPanel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return NotInClanPanel.localeService;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            ClanInfoLabel.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return ClanInfoLabel.clanUserInfoService;
         });
         osgi.injectService(ClanUserService,function(_arg_1:Object):void
         {
            ClanInfoLabel.clanUserService = ClanUserService(_arg_1);
         },function():ClanUserService
         {
            return ClanInfoLabel.clanUserService;
         });
         osgi.injectService(ClanUserService,function(_arg_1:Object):void
         {
            ClansDataProvider.clanUserService = ClanUserService(_arg_1);
         },function():ClanUserService
         {
            return ClansDataProvider.clanUserService;
         });
         osgi.injectService(ClanUserService,function(_arg_1:Object):void
         {
            ClansList.clanUserService = ClanUserService(_arg_1);
         },function():ClanUserService
         {
            return ClansList.clanUserService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClansListHeader.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClansListHeader.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            UserIncomingRequestLabel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return UserIncomingRequestLabel.localeService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            ClanCreateDialog.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return ClanCreateDialog.alertService;
         });
         osgi.injectService(ClanCreateService,function(_arg_1:Object):void
         {
            ClanCreateDialog.createClanService = ClanCreateService(_arg_1);
         },function():ClanCreateService
         {
            return ClanCreateDialog.createClanService;
         });
         osgi.injectService(IHelpService,function(_arg_1:Object):void
         {
            ClanCreateDialog.helpService = IHelpService(_arg_1);
         },function():IHelpService
         {
            return ClanCreateDialog.helpService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClanCreateDialog.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClanCreateDialog.localeService;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanDialog.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanDialog.clanService;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            ClanDialog.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return ClanDialog.clanUserInfoService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClanDialog.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClanDialog.localeService;
         });
         osgi.injectService(ClanUserService,function(_arg_1:Object):void
         {
            ClanLicenseDialog.clanUserService = ClanUserService(_arg_1);
         },function():ClanUserService
         {
            return ClanLicenseDialog.clanUserService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClanLicenseDialog.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClanLicenseDialog.localeService;
         });
         osgi.injectService(ClanUserService,function(_arg_1:Object):void
         {
            UserIncomingRequestsDialog.clanUserService = ClanUserService(_arg_1);
         },function():ClanUserService
         {
            return UserIncomingRequestsDialog.clanUserService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            UserIncomingRequestsDialog.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return UserIncomingRequestsDialog.localeService;
         });
         osgi.injectService(ClanUserService,function(_arg_1:Object):void
         {
            UserOutgoingRequestsDialog.clanUserService = ClanUserService(_arg_1);
         },function():ClanUserService
         {
            return UserOutgoingRequestsDialog.clanUserService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            UserOutgoingRequestsDialog.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return UserOutgoingRequestsDialog.localeService;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            UserRequestsDialog.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return UserRequestsDialog.clanUserInfoService;
         });
         osgi.injectService(ClanUserService,function(_arg_1:Object):void
         {
            UserRequestsDialog.clanUserService = ClanUserService(_arg_1);
         },function():ClanUserService
         {
            return UserRequestsDialog.clanUserService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            UserRequestsDialog.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return UserRequestsDialog.display;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanModel.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanModel.clanService;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            ClanModel.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return ClanModel.clanUserInfoService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClanModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClanModel.localeService;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanAcceptedModel.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanAcceptedModel.clanService;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanBlockModel.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanBlockModel.clanService;
         });
         osgi.injectService(ClanFriendsService,function(_arg_1:Object):void
         {
            ClanFriendsModel.clanFriendsService = ClanFriendsService(_arg_1);
         },function():ClanFriendsService
         {
            return ClanFriendsModel.clanFriendsService;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanInfoModel.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanInfoModel.clanService;
         });
         osgi.injectService(ClanCreateService,function(_arg_1:Object):void
         {
            ClanInfoModel.createClanService = ClanCreateService(_arg_1);
         },function():ClanCreateService
         {
            return ClanInfoModel.createClanService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            ClanInfoModel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return ClanInfoModel.display;
         });
         osgi.injectService(ClanMembersDataService,function(_arg_1:Object):void
         {
            ClanMembersDataModel.clanMembersService = ClanMembersDataService(_arg_1);
         },function():ClanMembersDataService
         {
            return ClanMembersDataModel.clanMembersService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            ClanMembersDataServiceImpl.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return ClanMembersDataServiceImpl.userInfoService;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            ClanPermissionsModel.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return ClanPermissionsModel.clanUserInfoService;
         });
         osgi.injectService(ClanCreateService,function(_arg_1:Object):void
         {
            ForeignClanModel.createClanService = ClanCreateService(_arg_1);
         },function():ClanCreateService
         {
            return ForeignClanModel.createClanService;
         });
         osgi.injectService(ForeignClanService,function(_arg_1:Object):void
         {
            ForeignClanModel.foreignClanService = ForeignClanService(_arg_1);
         },function():ForeignClanService
         {
            return ForeignClanModel.foreignClanService;
         });
         osgi.injectService(ClanUserService,function(_arg_1:Object):void
         {
            LicenseClanUserModel.clanUserService = ClanUserService(_arg_1);
         },function():ClanUserService
         {
            return LicenseClanUserModel.clanUserService;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            ClanNotifierModel.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return ClanNotifierModel.clanUserInfoService;
         });
         osgi.injectService(ClanUserService,function(_arg_1:Object):void
         {
            ClanNotifierModel.clanUserService = ClanUserService(_arg_1);
         },function():ClanUserService
         {
            return ClanNotifierModel.clanUserService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            ClanNotifierModel.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return ClanNotifierModel.userInfoService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            ClanNotifierModel.userPropertyService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return ClanNotifierModel.userPropertyService;
         });
         osgi.injectService(IButtonBarService,function(_arg_1:Object):void
         {
            ClanLoadingPanelModel.buttonBarService = IButtonBarService(_arg_1);
         },function():IButtonBarService
         {
            return ClanLoadingPanelModel.buttonBarService;
         });
         osgi.injectService(ClanPanelNotificationService,function(_arg_1:Object):void
         {
            ClanLoadingPanelModel.clanPanelNotification = ClanPanelNotificationService(_arg_1);
         },function():ClanPanelNotificationService
         {
            return ClanLoadingPanelModel.clanPanelNotification;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanLoadingPanelModel.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanLoadingPanelModel.clanService;
         });
         osgi.injectService(IContextMenuService,function(_arg_1:Object):void
         {
            ClanLoadingPanelModel.contextMenuService = IContextMenuService(_arg_1);
         },function():IContextMenuService
         {
            return ClanLoadingPanelModel.contextMenuService;
         });
         osgi.injectService(IPanelView,function(_arg_1:Object):void
         {
            ClanLoadingPanelModel.panel = IPanelView(_arg_1);
         },function():IPanelView
         {
            return ClanLoadingPanelModel.panel;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            ClanLoadingPanelModel.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return ClanLoadingPanelModel.userPropertiesService;
         });
         osgi.injectService(ClanPanelNotificationService,function(_arg_1:Object):void
         {
            ClanPanelNotificationModel.clanPanelNotificationService = ClanPanelNotificationService(_arg_1);
         },function():ClanPanelNotificationService
         {
            return ClanPanelNotificationModel.clanPanelNotificationService;
         });
         osgi.injectService(IPanelView,function(_arg_1:Object):void
         {
            ClanPanelNotificationServiceImpl.panel = IPanelView(_arg_1);
         },function():IPanelView
         {
            return ClanPanelNotificationServiceImpl.panel;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            ClanPanelNotificationServiceImpl.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return ClanPanelNotificationServiceImpl.userPropertiesService;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanPanelModel.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanPanelModel.clanService;
         });
         osgi.injectService(ClanCreateService,function(_arg_1:Object):void
         {
            ClanCreateModel.createClanService = ClanCreateService(_arg_1);
         },function():ClanCreateService
         {
            return ClanCreateModel.createClanService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClanCreateServiceImpl.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClanCreateServiceImpl.localeService;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanFunctionsServiceImpl.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanFunctionsServiceImpl.clanService;
         });
         osgi.injectService(IPanelView,function(_arg_1:Object):void
         {
            ClanServiceImpl.panelView = IPanelView(_arg_1);
         },function():IPanelView
         {
            return ClanServiceImpl.panelView;
         });
         osgi.injectService(IButtonBarService,function(_arg_1:Object):void
         {
            ClanUserLoaderModel.buttonBarService = IButtonBarService(_arg_1);
         },function():IButtonBarService
         {
            return ClanUserLoaderModel.buttonBarService;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanUserLoaderModel.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanUserLoaderModel.clanService;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            ClanUserLoaderModel.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return ClanUserLoaderModel.clanUserInfoService;
         });
         osgi.injectService(ClanUserService,function(_arg_1:Object):void
         {
            ClanUserLoaderModel.clanUserService = ClanUserService(_arg_1);
         },function():ClanUserService
         {
            return ClanUserLoaderModel.clanUserService;
         });
         osgi.injectService(ILoaderWindowService,function(_arg_1:Object):void
         {
            ClanUserLoaderModel.loaderWindowService = ILoaderWindowService(_arg_1);
         },function():ILoaderWindowService
         {
            return ClanUserLoaderModel.loaderWindowService;
         });
         osgi.injectService(IPanelView,function(_arg_1:Object):void
         {
            ClanUserLoaderModel.panelView = IPanelView(_arg_1);
         },function():IPanelView
         {
            return ClanUserLoaderModel.panelView;
         });
         osgi.injectService(ClanService,function(_arg_1:Object):void
         {
            ClanUserModel.clanService = ClanService(_arg_1);
         },function():ClanService
         {
            return ClanUserModel.clanService;
         });
         osgi.injectService(ClanUserInfoService,function(_arg_1:Object):void
         {
            ClanUserModel.clanUserInfoService = ClanUserInfoService(_arg_1);
         },function():ClanUserInfoService
         {
            return ClanUserModel.clanUserInfoService;
         });
         osgi.injectService(ClanUserService,function(_arg_1:Object):void
         {
            ClanUserModel.clanUserService = ClanUserService(_arg_1);
         },function():ClanUserService
         {
            return ClanUserModel.clanUserService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ClanUserModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ClanUserModel.localeService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            ClanUserModel.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return ClanUserModel.userPropertiesService;
         });
         osgi.injectService(ClanPanelNotificationService,function(_arg_1:Object):void
         {
            ClanUserAcceptedNotificatorModel.clanPanelNotificationService = ClanPanelNotificationService(_arg_1);
         },function():ClanPanelNotificationService
         {
            return ClanUserAcceptedNotificatorModel.clanPanelNotificationService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            ClanUserAcceptedNotificatorModel.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return ClanUserAcceptedNotificatorModel.lobbyLayoutService;
         });
         osgi.injectService(ClanUserService,function(_arg_1:Object):void
         {
            ClanUserIncomingModel.clanUserService = ClanUserService(_arg_1);
         },function():ClanUserService
         {
            return ClanUserIncomingModel.clanUserService;
         });
         osgi.injectService(ClanUserService,function(_arg_1:Object):void
         {
            ClanUserIncomingNotificatorModel.clanUserService = ClanUserService(_arg_1);
         },function():ClanUserService
         {
            return ClanUserIncomingNotificatorModel.clanUserService;
         });
         osgi.injectService(ClanUserService,function(_arg_1:Object):void
         {
            ClanUserOutgoingModel.clanUserService = ClanUserService(_arg_1);
         },function():ClanUserService
         {
            return ClanUserOutgoingModel.clanUserService;
         });
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt.registerAdapt(ISourceData,ISourceDataAdapt);
         modelRegisterAdapt.registerEvents(ISourceData,ISourceDataEvents);
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new ClanModel(),Vector.<Class>([IClanModelBase,IClanModel,ISourceData,ObjectUnloadListener,ObjectLoadPostListener]));
         modelRegisterAdapt.registerAdapt(IClanModel,IClanModelAdapt);
         modelRegisterAdapt.registerEvents(IClanModel,IClanModelEvents);
         modelRegister.add(new ClanAcceptedModel(),Vector.<Class>([IClanAcceptedModel,IClanAcceptedModelBase]));
         modelRegisterAdapt.registerAdapt(IClanAcceptedModel,IClanAcceptedModelAdapt);
         modelRegisterAdapt.registerEvents(IClanAcceptedModel,IClanAcceptedModelEvents);
         modelRegister.add(new ClanAcceptedNotificatorModel(),Vector.<Class>([ObjectLoadListener,ObjectUnloadListener,IClanAcceptedNotificatorModelBase]));
         modelRegister.add(new ClanBlockModel(),Vector.<Class>([IClanBlockModelBase]));
         modelRegister.add(new ClanFriendsModel(),Vector.<Class>([IClanFriendsModelBase,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new ClanIncomingModel(),Vector.<Class>([IClanIncomingModelBase,IClanIncomingModel,ObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(IClanIncomingModel,IClanIncomingModelAdapt);
         modelRegisterAdapt.registerEvents(IClanIncomingModel,IClanIncomingModelEvents);
         modelRegister.add(new ClanIncomingNotificatorModel(),Vector.<Class>([ObjectLoadListener,ObjectUnloadListener,IClanIncomingNotificatorModelBase]));
         modelRegister.add(new ClanInfoModel(),Vector.<Class>([IClanInfoModelBase,IClanInfoModel,ObjectLoadListener,ObjectUnloadListener]));
         modelRegisterAdapt.registerAdapt(IClanInfoModel,IClanInfoModelAdapt);
         modelRegisterAdapt.registerEvents(IClanInfoModel,IClanInfoModelEvents);
         modelRegister.add(new ClanMembersDataModel(),Vector.<Class>([IClanMembersDataModelBase,ObjectLoadListener]));
         modelRegister.add(new ClanOutgoingModel(),Vector.<Class>([IClanOutgoingModelBase,IClanOutgoingModel,ObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(IClanOutgoingModel,IClanOutgoingModelAdapt);
         modelRegisterAdapt.registerEvents(IClanOutgoingModel,IClanOutgoingModelEvents);
         modelRegister.add(new ClanPermissionsModel(),Vector.<Class>([IClanPermissionsModel,IClanPermissionsModelBase,ObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(IClanPermissionsModel,IClanPermissionsModelAdapt);
         modelRegisterAdapt.registerEvents(IClanPermissionsModel,IClanPermissionsModelEvents);
         modelRegister.add(new ForeignClanModel(),Vector.<Class>([IForeignClanModelBase,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new LicenseClanUserModel(),Vector.<Class>([ILicenseClanUserModelBase,ObjectLoadListener]));
         modelRegister.add(new ClanNotifierModel(),Vector.<Class>([IClanNotifierModelBase,ObjectLoadListener]));
         modelRegister.add(new ClanLoadingPanelModel(),Vector.<Class>([IClanLoadingPanelModelBase,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new ClanPanelNotificationModel(),Vector.<Class>([IClanPanelNotificationModelBase,ObjectLoadListener]));
         modelRegister.add(new ClanPanelModel(),Vector.<Class>([IClanPanelModelBase,IClanPanelModel,ObjectLoadListener,ObjectUnloadListener]));
         modelRegisterAdapt.registerAdapt(IClanPanelModel,IClanPanelModelAdapt);
         modelRegisterAdapt.registerEvents(IClanPanelModel,IClanPanelModelEvents);
         modelRegister.add(new ClanCreateModel(),Vector.<Class>([IClanCreateModelBase,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new ClanUserLoaderModel(),Vector.<Class>([IClanUserLoaderModelBase,ObjectLoadPostListener,ObjectUnloadListener]));
         modelRegister.add(new ClanUserModel(),Vector.<Class>([IClanUserModelBase,IClanUserModel,ObjectLoadListener,ObjectLoadPostListener,ISourceData]));
         modelRegisterAdapt.registerAdapt(IClanUserModel,IClanUserModelAdapt);
         modelRegisterAdapt.registerEvents(IClanUserModel,IClanUserModelEvents);
         modelRegister.add(new ClanUserAcceptedModel(),Vector.<Class>([IClanUserAcceptedModelBase]));
         modelRegister.add(new ClanUserAcceptedNotificatorModel(),Vector.<Class>([IClanUserAcceptedNotificatorModelBase,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new ClanUserIncomingModel(),Vector.<Class>([IClanUserIncomingModelBase,ObjectLoadListener,IClanUserIncomingModel]));
         modelRegisterAdapt.registerAdapt(IClanUserIncomingModel,IClanUserIncomingModelAdapt);
         modelRegisterAdapt.registerEvents(IClanUserIncomingModel,IClanUserIncomingModelEvents);
         modelRegister.add(new ClanUserIncomingNotificatorModel(),Vector.<Class>([ObjectLoadListener,ObjectUnloadListener,IClanUserIncomingNotificatorModelBase]));
         modelRegister.add(new ClanUserOutgoingModel(),Vector.<Class>([IClanUserOutgoingModelBase,ObjectLoadListener,ObjectUnloadListener,IClanUserOutgoingModel]));
         modelRegisterAdapt.registerAdapt(IClanUserOutgoingModel,IClanUserOutgoingModelAdapt);
         modelRegisterAdapt.registerEvents(IClanUserOutgoingModel,IClanUserOutgoingModelEvents);
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

