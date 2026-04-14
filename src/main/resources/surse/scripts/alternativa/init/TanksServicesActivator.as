package alternativa.init
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Qoc;
   import alternativa.tanks.bg.BackgroundService;
   import alternativa.tanks.bg.IBackgroundService;
   import alternativa.tanks.blur.BlurService;
   import alternativa.tanks.blur.IBlurService;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.loader.ILoaderTipsService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.loader.LoaderTips;
   import alternativa.tanks.loader.LoaderWindow;
   import alternativa.tanks.model.useremailandpassword.PasswordService;
   import alternativa.tanks.model.useremailandpassword.UserEmailAndPasswordModel;
   import alternativa.tanks.servermodels.captcha.IServerCaptcha;
   import alternativa.tanks.servermodels.captcha.ServerCaptchaModel;
   import alternativa.tanks.servermodels.login.ILogin;
   import alternativa.tanks.servermodels.login.LoginModel;
   import alternativa.tanks.servermodels.loginbyhash.ILoginByHash;
   import alternativa.tanks.servermodels.loginbyhash.LoginByHashModel;
   import alternativa.tanks.servermodels.registartion.password.IPasswordRegistration;
   import alternativa.tanks.servermodels.registartion.password.PasswordRegistrationModel;
   import alternativa.tanks.servermodels.socialnetwork.ExternalEntranceModel;
   import alternativa.tanks.servermodels.socialnetwork.IExternalEntranceModel;
   import alternativa.tanks.service.IPasswordParamsService;
   import alternativa.tanks.service.dialogs.DialogsService;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.panel.PanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingsService;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.service.settings.keybinding.KeysBindingServiceImpl;
   import alternativa.tanks.service.socialnetwork.ISocialNetworkPanelService;
   import alternativa.tanks.service.socialnetwork.Naqohi;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battlegui.Bohago;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.battleinput.Wyj;
   import alternativa.tanks.services.ping.Jorytydek;
   import alternativa.tanks.services.ping.PingService;
   import alternativa.tanks.services.targeting.Cifoduk;
   import alternativa.tanks.services.targeting.Lipasod;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.tracker.TrackerService;
   import obfuscation.syfodi.Hof;
   import projects.tanks.clients.flash.commons.models.layout.ILobbyLayout;
   import projects.tanks.clients.flash.commons.models.layout.LobbyLayoutModel;
   import projects.tanks.clients.flash.commons.models.layout.notify.ILobbyLayoutNotify;
   import projects.tanks.clients.flash.commons.models.layout.notify.LobbyLayoutNotifyModel;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.BattleLinkActivatorService;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.IBattleLinkActivatorService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.BattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.BlockUserService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.IBlockUserService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.DialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.FriendActionService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.FriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendActionService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.BattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle.BattleNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle.IBattleNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.IOnlineNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.OnlineNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumServiceImpl;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.StorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.UserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.UserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   
   public class TanksServicesActivator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
      
      private var loaderWindow:LoaderWindow;
      
      public function TanksServicesActivator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         TanksServicesActivator.osgi = _arg_1;
         var _local_2:IBackgroundService = new BackgroundService();
         _arg_1.registerService(IStorageService,new StorageService(_arg_1.createSharedObject("name"),_arg_1.createSharedObject("accounts")));
         _arg_1.registerService(IBackgroundService,_local_2);
         _arg_1.registerService(IBlurService,new BlurService());
         _arg_1.registerService(ITrackerService,new TrackerService());
         _arg_1.registerService(IBlockUserService,new BlockUserService());
         _arg_1.registerService(IFriendInfoService,new FriendInfoService());
         _arg_1.registerService(IFriendActionService,new FriendActionService());
         _arg_1.registerService(IDialogsService,new DialogsService());
         _arg_1.registerService(IBattleInfoService,new BattleInfoService());
         _arg_1.registerService(IBattleInviteService,new BattleInviteService());
         _arg_1.registerService(IDialogWindowsDispatcherService,new DialogWindowsDispatcherService());
         _arg_1.registerService(ILoaderWindowService,new LoaderWindow());
         _arg_1.registerService(ILoaderTipsService,new LoaderTips());
         _arg_1.registerService(IUserPropertiesService,new UserPropertiesService());
         _arg_1.registerService(IUserInfoService,new UserInfoService());
         _arg_1.registerService(BattleEventDispatcher,new Qoc());
         _arg_1.registerService(BattleGUIService,new Bohago());
         _arg_1.registerService(IOnlineNotifierService,new OnlineNotifierService());
         _arg_1.registerService(IPanelView,new PanelView());
         _arg_1.registerService(ISocialNetworkPanelService,new Naqohi());
         _arg_1.registerService(PasswordService,new UserEmailAndPasswordModel());
         _arg_1.registerService(ISettingsService,new SettingsService());
         _arg_1.registerService(IExternalEntranceModel,new ExternalEntranceModel());
         _arg_1.registerService(ILogin,new LoginModel());
         _arg_1.registerService(IPasswordRegistration,new PasswordRegistrationModel());
         _arg_1.registerService(ILobbyLayoutNotify,new LobbyLayoutNotifyModel());
         _arg_1.registerService(ILobbyLayout,new LobbyLayoutModel());
         _arg_1.registerService(IBattleNotifierService,new BattleNotifierService());
         _arg_1.registerService(IBattleLinkActivatorService,new BattleLinkActivatorService());
         _arg_1.registerService(IServerCaptcha,new ServerCaptchaModel());
         _arg_1.registerService(PingService,new Jorytydek());
         _arg_1.registerService(BattleInputService,new Wyj());
         _arg_1.registerService(TargetingInputManager,new Lipasod());
         _arg_1.registerService(TargetingModeService,new Cifoduk());
         _arg_1.registerService(KeysBindingService,new KeysBindingServiceImpl());
         _arg_1.registerService(IPasswordParamsService,new Hof());
         _arg_1.registerService(PremiumService,new PremiumServiceImpl());
         _arg_1.registerService(ILoginByHash,new LoginByHashModel());
         _arg_1.registerService(BattleFormatUtil,new BattleFormatUtil());
         _local_2.showBg();
      }
      
      public function stop(_arg_1:OSGi) : void
      {
         _arg_1.unregisterService(IBackgroundService);
         _arg_1.unregisterService(IHelpService);
         _arg_1.unregisterService(ILoaderWindowService);
         _arg_1.unregisterService(IBlockUserService);
         _arg_1.unregisterService(IFriendActionService);
         _arg_1.unregisterService(IFriendInfoService);
         _arg_1.unregisterService(IDialogsService);
         _arg_1.unregisterService(IBlurService);
         _arg_1.unregisterService(IBattleInfoService);
         _arg_1.unregisterService(IBattleInviteService);
         _arg_1.unregisterService(IDialogWindowsDispatcherService);
         _arg_1.unregisterService(IUserPropertiesService);
         _arg_1.unregisterService(IUserInfoService);
         this.loaderWindow = null;
         TanksServicesActivator.osgi = null;
      }
   }
}

