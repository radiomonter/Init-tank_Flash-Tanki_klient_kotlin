package projects.tanks.clients.fp10.libraries.tanksservicesflash
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.gui.friends.list.FriendsList;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.model.friends.loader.FriendsLoaderModel;
   import obfuscation.dykuwiwoz.Weg;
   import obfuscation.pytimykap.Qifizid;
   import obfuscation.wane.Jit;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.FriendsModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.accepted.FriendsAcceptedModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.acceptednotificator.FriendsAcceptedNotificatorModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.incoming.FriendsIncomingModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.incomingnotificator.FriendsIncomingNotificatorModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.outgoing.FriendsOutgoingModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle.BattleLinkData;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle.BattleNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.online.OnlineNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.premium.PremiumNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck.UidCheckModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck.UidCheckService;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck.UidCheckServiceAdapt;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck.UidCheckServiceEvents;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.BlockUserService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.BlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.DialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendActionService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.BattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenStateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle.IBattleNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.IOnlineNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.UserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.AlertUtils;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   import services.buttonbar.IButtonBarService;
   
   public class Activator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var modelRegister:ModelRegistry;
         var modelRegisterAdapt:ModelRegistry;
         var _osgi:OSGi = param1;
         osgi = _osgi;
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BattleFormatUtil.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BattleFormatUtil.localeService;
         });
         osgi.injectService(PremiumService,function(_arg_1:Object):void
         {
            UserInfoService.premiumService = PremiumService(_arg_1);
         },function():PremiumService
         {
            return UserInfoService.premiumService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            BattleInviteService.friendInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return BattleInviteService.friendInfoService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            BattleInviteService.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return BattleInviteService.battleInfoService;
         });
         osgi.injectService(IHelpService,function(_arg_1:Object):void
         {
            BlurService.helperService = IHelpService(_arg_1);
         },function():IHelpService
         {
            return BlurService.helperService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            DialogsService.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return DialogsService.display;
         });
         osgi.injectService(IBlurService,function(_arg_1:Object):void
         {
            DialogsService.blurService = IBlurService(_arg_1);
         },function():IBlurService
         {
            return DialogsService.blurService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(_arg_1:Object):void
         {
            DialogsService.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(_arg_1);
         },function():IDialogWindowsDispatcherService
         {
            return DialogsService.dialogWindowsDispatcherService;
         });
         osgi.injectService(ILoaderWindowService,function(_arg_1:Object):void
         {
            DialogsService.loaderWindowService = ILoaderWindowService(_arg_1);
         },function():ILoaderWindowService
         {
            return DialogsService.loaderWindowService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            DialogWindow.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return DialogWindow.display;
         });
         osgi.injectService(IDialogsService,function(_arg_1:Object):void
         {
            DialogWindow.dialogService = IDialogsService(_arg_1);
         },function():IDialogsService
         {
            return DialogWindow.dialogService;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            BlockUserService.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return BlockUserService.storageService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            PremiumNotifierModel.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return PremiumNotifierModel.userPropertiesService;
         });
         osgi.injectService(PremiumService,function(_arg_1:Object):void
         {
            PremiumNotifierModel.premiumService = PremiumService(_arg_1);
         },function():PremiumService
         {
            return PremiumNotifierModel.premiumService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            PremiumNotifierModel.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return PremiumNotifierModel.userInfoService;
         });
         osgi.injectService(FullscreenStateService,function(_arg_1:Object):void
         {
            AlertUtils.fullscreenStateService = FullscreenStateService(_arg_1);
         },function():FullscreenStateService
         {
            return AlertUtils.fullscreenStateService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            BattleLinkData.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return BattleLinkData.userInfoService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            BattleLinkData.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return BattleLinkData.userPropertiesService;
         });
         osgi.injectService(IBattleNotifierService,function(_arg_1:Object):void
         {
            BattleNotifierModel.battleNotifierService = IBattleNotifierService(_arg_1);
         },function():IBattleNotifierService
         {
            return BattleNotifierModel.battleNotifierService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            FriendsAcceptedModel.friendsInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return FriendsAcceptedModel.friendsInfoService;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            FriendsAcceptedNotificatorModel.logService = LogService(_arg_1);
         },function():LogService
         {
            return FriendsAcceptedNotificatorModel.logService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            FriendsAcceptedNotificatorModel.friendsInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return FriendsAcceptedNotificatorModel.friendsInfoService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            FriendsIncomingModel.friendsInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return FriendsIncomingModel.friendsInfoService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            FriendsOutgoingModel.friendsInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return FriendsOutgoingModel.friendsInfoService;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            FriendsIncomingNotificatorModel.logService = LogService(_arg_1);
         },function():LogService
         {
            return FriendsIncomingNotificatorModel.logService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            FriendsIncomingNotificatorModel.friendsInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return FriendsIncomingNotificatorModel.friendsInfoService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            FriendsList.friendInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return FriendsList.friendInfoService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            FriendsList.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return FriendsList.userInfoService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            FriendsLoaderModel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return FriendsLoaderModel.display;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            FriendsLoaderModel.friendInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return FriendsLoaderModel.friendInfoService;
         });
         osgi.injectService(IButtonBarService,function(_arg_1:Object):void
         {
            FriendsLoaderModel.buttonBarService = IButtonBarService(_arg_1);
         },function():IButtonBarService
         {
            return FriendsLoaderModel.buttonBarService;
         });
         osgi.injectService(IFriendActionService,function(_arg_1:Object):void
         {
            FriendsModel.friendsActionService = IFriendActionService(_arg_1);
         },function():IFriendActionService
         {
            return FriendsModel.friendsActionService;
         });
         osgi.injectService(IBattleInviteService,function(_arg_1:Object):void
         {
            Jit.battleInviteService = IBattleInviteService(_arg_1);
         },function():IBattleInviteService
         {
            return Jit.battleInviteService;
         });
         osgi.injectService(IOnlineNotifierService,function(_arg_1:Object):void
         {
            OnlineNotifierModel.onlineNotifierService = IOnlineNotifierService(_arg_1);
         },function():IOnlineNotifierService
         {
            return OnlineNotifierModel.onlineNotifierService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            UserNotifierModel.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return UserNotifierModel.userInfoService;
         });
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new UidCheckModel(),Vector.<Class>([Qifizid,ObjectLoadListener,ObjectUnloadListener,UidCheckService]));
         modelRegisterAdapt.registerAdapt(UidCheckService,UidCheckServiceAdapt);
         modelRegisterAdapt.registerEvents(UidCheckService,UidCheckServiceEvents);
         modelRegister.add(new Jit(),Vector.<Class>([Weg,ObjectLoadListener,ObjectUnloadListener]));
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

