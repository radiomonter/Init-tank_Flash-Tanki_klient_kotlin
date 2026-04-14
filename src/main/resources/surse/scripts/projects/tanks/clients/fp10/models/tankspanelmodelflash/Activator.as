package projects.tanks.clients.fp10.models.tankspanelmodelflash
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.blur.IBlurService;
   import alternativa.tanks.gui.CongratulationsWindowPresent;
   import alternativa.tanks.gui.CongratulationsWindowWithBanner;
   import alternativa.tanks.gui.NewsAlertWindow;
   import alternativa.tanks.gui.RankUpSupplyBonusAlert;
   import alternativa.tanks.gui.RepatriateBonusWindow;
   import alternativa.tanks.gui.Ryrygo;
   import alternativa.tanks.gui.ThanksForPurchaseWindow;
   import alternativa.tanks.gui.alerts.ItemsAlert;
   import alternativa.tanks.gui.battle.BattleFinishNotification;
   import alternativa.tanks.gui.buycrystals.BuyCrystalsAlert;
   import alternativa.tanks.gui.error.ErrorForm;
   import alternativa.tanks.gui.error.ErrorNotification;
   import alternativa.tanks.gui.friends.AddRequestView;
   import alternativa.tanks.gui.friends.FriendsWindow;
   import alternativa.tanks.gui.friends.battleLink.BattleLink;
   import alternativa.tanks.gui.friends.battleinvite.BattleInviteNotification;
   import alternativa.tanks.gui.friends.list.AcceptedList;
   import alternativa.tanks.gui.friends.list.IncomingList;
   import alternativa.tanks.gui.friends.list.OutgoingList;
   import alternativa.tanks.gui.friends.list.dataprovider.FriendsDataProvider;
   import alternativa.tanks.gui.friends.list.renderer.FriendsAcceptedListRenderer;
   import alternativa.tanks.gui.friends.list.renderer.FriendsIncomingListRenderer;
   import alternativa.tanks.gui.friends.list.renderer.FriendsOutgoingListRenderer;
   import alternativa.tanks.gui.friends.list.renderer.HeaderAcceptedList;
   import alternativa.tanks.gui.premiumaccount.PremiumAccountWelcomeAlert;
   import alternativa.tanks.gui.presents.NewPresentsAlert;
   import alternativa.tanks.gui.settings.Pibu;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.model.achievement.AchievementModel;
   import alternativa.tanks.model.achievement.IAchievement;
   import alternativa.tanks.model.bonus.showing.image.BonusImageShowingModel;
   import alternativa.tanks.model.bonus.showing.info.BonusInfo;
   import alternativa.tanks.model.bonus.showing.info.BonusInfoAdapt;
   import alternativa.tanks.model.bonus.showing.info.BonusInfoEvents;
   import alternativa.tanks.model.bonus.showing.info.BonusInfoModel;
   import alternativa.tanks.model.bonus.showing.items.BonusItem;
   import alternativa.tanks.model.bonus.showing.items.BonusItemAdapt;
   import alternativa.tanks.model.bonus.showing.items.BonusItemEvents;
   import alternativa.tanks.model.bonus.showing.items.BonusItemModel;
   import alternativa.tanks.model.bonus.showing.items.BonusItemsShowingModel;
   import alternativa.tanks.model.donationalert.DonationAlertModel;
   import alternativa.tanks.model.friends.battleinvite.BattleInviteModel;
   import alternativa.tanks.model.garage.availableitems.AvailableItemsModel;
   import alternativa.tanks.model.garage.rankupsupplybonus.RankUpSupplyBonusModel;
   import alternativa.tanks.model.news.News;
   import alternativa.tanks.model.news.NewsAdapt;
   import alternativa.tanks.model.news.NewsEvents;
   import alternativa.tanks.model.news.NewsItemModel;
   import alternativa.tanks.model.news.NewsShowingModel;
   import alternativa.tanks.model.panel.PanelModel;
   import alternativa.tanks.model.premiumaccount.alert.PremiumAccountAlertModel;
   import alternativa.tanks.model.premiumaccount.notification.PremiumCompleteNotification;
   import alternativa.tanks.model.presents.NewPresentsShowingModel;
   import alternativa.tanks.model.referals.ReferalsModel;
   import alternativa.tanks.model.settings.SettingsModel;
   import alternativa.tanks.model.socialnetwork.SocialNetworkPanelModel;
   import alternativa.tanks.model.useremailandpassword.PasswordService;
   import alternativa.tanks.model.userproperties.UserPropertiesModel;
   import alternativa.tanks.servermodels.loginbyhash.LoginByHashModel;
   import alternativa.tanks.service.IEntranceClientFacade;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.service.achievement.Qigiv;
   import alternativa.tanks.service.dailyquest.DailyQuestNotifierService;
   import alternativa.tanks.service.dailyquest.Pugasuzyw;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import alternativa.tanks.service.fps.Qyficequ;
   import alternativa.tanks.service.money.Hocok;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.notificationcategories.Fyhicofal;
   import alternativa.tanks.service.notificationcategories.INotificationGarageCategoriesService;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.panel.PanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingsService;
   import alternativa.tanks.service.settings.keybinding.KeyCodesConverter;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.service.socialnetwork.ISocialNetworkPanelService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.forms.freeuids.FreeUidsForm;
   import alternativa.types.Long;
   import obfuscation.buwati.Dajy;
   import obfuscation.coh.Betugom;
   import obfuscation.coh.Favutedes;
   import obfuscation.coh.Raqohybe;
   import obfuscation.coh.Tydoca;
   import obfuscation.fador.Jenapery;
   import obfuscation.gomavik.Kyke;
   import obfuscation.jaso.Biretihap;
   import obfuscation.jaso.Rihusir;
   import obfuscation.jaso.Sawev;
   import obfuscation.jufuniqa.Cyzabosy;
   import obfuscation.lecezik.Gas;
   import obfuscation.lumygaw.Myzu;
   import obfuscation.pejug.Ruperip;
   import obfuscation.qimi.Jin;
   import obfuscation.qimi.Ziqysyrep;
   import obfuscation.ras.Zufuku;
   import obfuscation.wahyfeny.Bywoh;
   import obfuscation.wahyfeny.Jigece;
   import obfuscation.wahyfeny.Tajuje;
   import obfuscation.wahyfeny.Timazysol;
   import obfuscation.wahyfeny.Zidadoge;
   import obfuscation.wezej.Dizu;
   import obfuscation.wezej.Tikesutak;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadPostListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.service.address.AddressService;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import projects.tanks.client.panel.model.bonus.showing.image.IBonusImageShowingModelBase;
   import projects.tanks.client.panel.model.bonus.showing.info.IBonusInfoModelBase;
   import projects.tanks.client.panel.model.bonus.showing.items.IBonusItemModelBase;
   import projects.tanks.client.panel.model.bonus.showing.items.IBonusItemsShowingModelBase;
   import projects.tanks.client.panel.model.dailyquest.Bofavif;
   import projects.tanks.client.panel.model.garage.rankupsupplybonus.IRankUpSupplyBonusModelBase;
   import projects.tanks.client.panel.model.news.item.INewsItemModelBase;
   import projects.tanks.client.panel.model.news.showing.INewsShowingModelBase;
   import projects.tanks.client.panel.model.referrals.IReferrerPanelModelBase;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.BattleLinkActivatorService;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.IBattleLinkActivatorService;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.flash.commons.services.notification.sound.INotificationSoundService;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendActionService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle.IBattleNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.IOnlineNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import services.contextmenu.IContextMenuService;
   import utils.TimeFormatter;
   
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
            PremiumAccountWelcomeAlert.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return PremiumAccountWelcomeAlert.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            PremiumCompleteNotification.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return PremiumCompleteNotification.localeService;
         });
         osgi.injectService(INotificationService,function(_arg_1:Object):void
         {
            PremiumAccountAlertModel.notificationService = INotificationService(_arg_1);
         },function():INotificationService
         {
            return PremiumAccountAlertModel.notificationService;
         });
         osgi.injectService(PremiumService,function(_arg_1:Object):void
         {
            PremiumAccountAlertModel.premiumService = PremiumService(_arg_1);
         },function():PremiumService
         {
            return PremiumAccountAlertModel.premiumService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            PremiumAccountAlertModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return PremiumAccountAlertModel.localeService;
         });
         osgi.injectService(IContextMenuService,function(_arg_1:Object):void
         {
            AcceptedList.contextMenuService = IContextMenuService(_arg_1);
         },function():IContextMenuService
         {
            return AcceptedList.contextMenuService;
         });
         osgi.injectService(IOnlineNotifierService,function(_arg_1:Object):void
         {
            AcceptedList.onlineNotifierService = IOnlineNotifierService(_arg_1);
         },function():IOnlineNotifierService
         {
            return AcceptedList.onlineNotifierService;
         });
         osgi.injectService(IBattleNotifierService,function(_arg_1:Object):void
         {
            AcceptedList.battleNotifierService = IBattleNotifierService(_arg_1);
         },function():IBattleNotifierService
         {
            return AcceptedList.battleNotifierService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            AcceptedList.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return AcceptedList.battleInfoService;
         });
         osgi.injectService(IBattleInviteService,function(_arg_1:Object):void
         {
            AcceptedList.battleInviteService = IBattleInviteService(_arg_1);
         },function():IBattleInviteService
         {
            return AcceptedList.battleInviteService;
         });
         osgi.injectService(IBattleInviteService,function(_arg_1:Object):void
         {
            BattleInviteModel.battleInviteService = IBattleInviteService(_arg_1);
         },function():IBattleInviteService
         {
            return BattleInviteModel.battleInviteService;
         });
         osgi.injectService(INotificationService,function(_arg_1:Object):void
         {
            BattleInviteModel.notificationService = INotificationService(_arg_1);
         },function():INotificationService
         {
            return BattleInviteModel.notificationService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            BattleInviteModel.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return BattleInviteModel.battleInfoService;
         });
         osgi.injectService(IBattleLinkActivatorService,function(_arg_1:Object):void
         {
            BattleInviteModel.battleLinkActivatorService = IBattleLinkActivatorService(_arg_1);
         },function():IBattleLinkActivatorService
         {
            return BattleInviteModel.battleLinkActivatorService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            BattleInviteModel.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return BattleInviteModel.alertService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BattleInviteModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BattleInviteModel.localeService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            BattleInviteModel.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return BattleInviteModel.lobbyLayoutService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            BattleInviteModel.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return BattleInviteModel.userInfoService;
         });
         osgi.injectService(IBlurService,function(_arg_1:Object):void
         {
            BattleInviteModel.blurService = IBlurService(_arg_1);
         },function():IBlurService
         {
            return BattleInviteModel.blurService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            BattleInviteModel.friendInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return BattleInviteModel.friendInfoService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(_arg_1:Object):void
         {
            BattleInviteModel.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(_arg_1);
         },function():IDialogWindowsDispatcherService
         {
            return BattleInviteModel.dialogWindowsDispatcherService;
         });
         osgi.injectService(INotificationSoundService,function(_arg_1:Object):void
         {
            BattleInviteModel.myzywak = INotificationSoundService(_arg_1);
         },function():INotificationSoundService
         {
            return BattleInviteModel.myzywak;
         });
         osgi.injectService(IBattleInviteService,function(_arg_1:Object):void
         {
            BattleInviteNotification.battleInviteService = IBattleInviteService(_arg_1);
         },function():IBattleInviteService
         {
            return BattleInviteNotification.battleInviteService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            BattleInviteNotification.battleAlertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return BattleInviteNotification.battleAlertService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BattleInviteNotification.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BattleInviteNotification.localeService;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            BattleInviteNotification.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return BattleInviteNotification.storageService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            BattleLink.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return BattleLink.userInfoService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            BattleLink.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return BattleLink.lobbyLayoutService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BattleLink.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BattleLink.localeService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            BattleLink.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return BattleLink.userPropertiesService;
         });
         osgi.injectService(IPanelView,function(_arg_1:Object):void
         {
            UserPropertiesModel.panelView = IPanelView(_arg_1);
         },function():IPanelView
         {
            return UserPropertiesModel.panelView;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            UserPropertiesModel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return UserPropertiesModel.display;
         });
         osgi.injectService(IHelpService,function(_arg_1:Object):void
         {
            UserPropertiesModel.helpService = IHelpService(_arg_1);
         },function():IHelpService
         {
            return UserPropertiesModel.helpService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            UserPropertiesModel.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return UserPropertiesModel.userPropertiesService;
         });
         osgi.injectService(IMoneyService,function(_arg_1:Object):void
         {
            UserPropertiesModel.moneyService = IMoneyService(_arg_1);
         },function():IMoneyService
         {
            return UserPropertiesModel.moneyService;
         });
         osgi.injectService(IPanelView,function(_arg_1:Object):void
         {
            Hocok.panelView = IPanelView(_arg_1);
         },function():IPanelView
         {
            return Hocok.panelView;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            PanelView.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return PanelView.display;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            AvailableItemsModel.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return AvailableItemsModel.lobbyLayoutService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            AvailableItemsModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return AvailableItemsModel.localeService;
         });
         osgi.injectService(INotificationGarageCategoriesService,function(_arg_1:Object):void
         {
            AvailableItemsModel.notificationGarageCategoriesService = INotificationGarageCategoriesService(_arg_1);
         },function():INotificationGarageCategoriesService
         {
            return AvailableItemsModel.notificationGarageCategoriesService;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            Fyhicofal.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return Fyhicofal.storageService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            RepatriateBonusWindow.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return RepatriateBonusWindow.localeService;
         });
         osgi.injectService(IEntranceClientFacade,function(_arg_1:Object):void
         {
            LoginByHashModel.clientFacade = IEntranceClientFacade(_arg_1);
         },function():IEntranceClientFacade
         {
            return LoginByHashModel.clientFacade;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            LoginByHashModel.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return LoginByHashModel.storageService;
         });
         osgi.injectService(IDialogsService,function(_arg_1:Object):void
         {
            NewsShowingModel.dialogsService = IDialogsService(_arg_1);
         },function():IDialogsService
         {
            return NewsShowingModel.dialogsService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            NewsShowingModel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return NewsShowingModel.display;
         });
         osgi.injectService(IHelpService,function(_arg_1:Object):void
         {
            Qigiv.helpService = IHelpService(_arg_1);
         },function():IHelpService
         {
            return Qigiv.helpService;
         });
         osgi.injectService(IClientLog,function(_arg_1:Object):void
         {
            Qigiv.clientLog = IClientLog(_arg_1);
         },function():IClientLog
         {
            return Qigiv.clientLog;
         });
         osgi.injectService(ModelRegistry,function(_arg_1:Object):void
         {
            Qigiv.modelRegister = ModelRegistry(_arg_1);
         },function():ModelRegistry
         {
            return Qigiv.modelRegister;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Qigiv.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Qigiv.display;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            Qigiv.settingsService = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return Qigiv.settingsService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            Qigiv.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return Qigiv.lobbyLayoutService;
         });
         osgi.injectService(IPartnerService,function(_arg_1:Object):void
         {
            Qigiv.partnersService = IPartnerService(_arg_1);
         },function():IPartnerService
         {
            return Qigiv.partnersService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            CongratulationsWindowPresent.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return CongratulationsWindowPresent.display;
         });
         osgi.injectService(IDialogsService,function(_arg_1:Object):void
         {
            CongratulationsWindowPresent.dialogsService = IDialogsService(_arg_1);
         },function():IDialogsService
         {
            return CongratulationsWindowPresent.dialogsService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            CongratulationsWindowPresent.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return CongratulationsWindowPresent.localeService;
         });
         osgi.injectService(IAchievementService,function(_arg_1:Object):void
         {
            AchievementModel.achievementService = IAchievementService(_arg_1);
         },function():IAchievementService
         {
            return AchievementModel.achievementService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            RankUpSupplyBonusAlert.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return RankUpSupplyBonusAlert.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BattleFinishNotification.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BattleFinishNotification.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ErrorNotification.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ErrorNotification.localeService;
         });
         osgi.injectService(AddressService,function(_arg_1:Object):void
         {
            ErrorNotification.addressService = AddressService(_arg_1);
         },function():AddressService
         {
            return ErrorNotification.addressService;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            BattleLinkActivatorService.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return BattleLinkActivatorService.storageService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            BattleLinkActivatorService.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return BattleLinkActivatorService.battleInfoService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            BattleLinkActivatorService.userPropertyService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return BattleLinkActivatorService.userPropertyService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            BattleLinkActivatorService.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return BattleLinkActivatorService.alertService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            BattleLinkActivatorService.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return BattleLinkActivatorService.lobbyLayoutService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BattleLinkActivatorService.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BattleLinkActivatorService.localeService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(_arg_1:Object):void
         {
            BattleLinkActivatorService.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(_arg_1);
         },function():IDialogWindowsDispatcherService
         {
            return BattleLinkActivatorService.dialogWindowsDispatcherService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BuyCrystalsAlert.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BuyCrystalsAlert.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BonusItemsShowingModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BonusItemsShowingModel.localeService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            BonusItemsShowingModel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return BonusItemsShowingModel.display;
         });
         osgi.injectService(ResourceRegistry,function(_arg_1:Object):void
         {
            BonusItemsShowingModel.resourceRegistry = ResourceRegistry(_arg_1);
         },function():ResourceRegistry
         {
            return BonusItemsShowingModel.resourceRegistry;
         });
         osgi.injectService(ModelRegistry,function(_arg_1:Object):void
         {
            BonusItemsShowingModel.modelRegister = ModelRegistry(_arg_1);
         },function():ModelRegistry
         {
            return BonusItemsShowingModel.modelRegister;
         });
         osgi.injectService(IDialogsService,function(_arg_1:Object):void
         {
            BonusItemsShowingModel.dialogsService = IDialogsService(_arg_1);
         },function():IDialogsService
         {
            return BonusItemsShowingModel.dialogsService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            CongratulationsWindowWithBanner.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return CongratulationsWindowWithBanner.localeService;
         });
         osgi.injectService(AddressService,function(_arg_1:Object):void
         {
            ErrorForm.addressService = AddressService(_arg_1);
         },function():AddressService
         {
            return ErrorForm.addressService;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            BattleLinkActivatorService.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return BattleLinkActivatorService.storageService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            BattleLinkActivatorService.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return BattleLinkActivatorService.battleInfoService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            BattleLinkActivatorService.userPropertyService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return BattleLinkActivatorService.userPropertyService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            BattleLinkActivatorService.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return BattleLinkActivatorService.alertService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            BattleLinkActivatorService.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return BattleLinkActivatorService.lobbyLayoutService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BattleLinkActivatorService.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BattleLinkActivatorService.localeService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(_arg_1:Object):void
         {
            BattleLinkActivatorService.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(_arg_1);
         },function():IDialogWindowsDispatcherService
         {
            return BattleLinkActivatorService.dialogWindowsDispatcherService;
         });
         osgi.injectService(IDialogsService,function(_arg_1:Object):void
         {
            DonationAlertModel.dialogsService = IDialogsService(_arg_1);
         },function():IDialogsService
         {
            return DonationAlertModel.dialogsService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            DonationAlertModel.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return DonationAlertModel.alertService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            DonationAlertModel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return DonationAlertModel.display;
         });
         osgi.injectService(ITrackerService,function(_arg_1:Object):void
         {
            DonationAlertModel.trackerService = ITrackerService(_arg_1);
         },function():ITrackerService
         {
            return DonationAlertModel.trackerService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Qyficequ.lorunar = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Qyficequ.lorunar;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            FreeUidsForm.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return FreeUidsForm.display;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            FreeUidsForm.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return FreeUidsForm.localeService;
         });
         osgi.injectService(IBattleLinkActivatorService,function(_arg_1:Object):void
         {
            FriendsAcceptedListRenderer.battleLinkActivatorService = IBattleLinkActivatorService(_arg_1);
         },function():IBattleLinkActivatorService
         {
            return FriendsAcceptedListRenderer.battleLinkActivatorService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            FriendsAcceptedListRenderer.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return FriendsAcceptedListRenderer.localeService;
         });
         osgi.injectService(IContextMenuService,function(_arg_1:Object):void
         {
            FriendsAcceptedListRenderer.contextMenuService = IContextMenuService(_arg_1);
         },function():IContextMenuService
         {
            return FriendsAcceptedListRenderer.contextMenuService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            FriendsAcceptedListRenderer.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return FriendsAcceptedListRenderer.userPropertiesService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            FriendsDataProvider.friendInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return FriendsDataProvider.friendInfoService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            FriendsDataProvider.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return FriendsDataProvider.userInfoService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            FriendsDataProvider.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return FriendsDataProvider.battleInfoService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            FriendsDataProvider.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return FriendsDataProvider.userPropertiesService;
         });
         osgi.injectService(IPartnerService,function(_arg_1:Object):void
         {
            FriendsDataProvider.partnerService = IPartnerService(_arg_1);
         },function():IPartnerService
         {
            return FriendsDataProvider.partnerService;
         });
         osgi.injectService(IContextMenuService,function(_arg_1:Object):void
         {
            FriendsIncomingListRenderer.contextMenuService = IContextMenuService(_arg_1);
         },function():IContextMenuService
         {
            return FriendsIncomingListRenderer.contextMenuService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            FriendsIncomingListRenderer.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return FriendsIncomingListRenderer.localeService;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            SettingsModel.settingsService = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return SettingsModel.settingsService;
         });
         osgi.injectService(IPanelView,function(_arg_1:Object):void
         {
            SettingsModel.panelView = IPanelView(_arg_1);
         },function():IPanelView
         {
            return SettingsModel.panelView;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            SettingsModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return SettingsModel.localeService;
         });
         osgi.injectService(IBattleInviteService,function(_arg_1:Object):void
         {
            SettingsModel.battleInviteService = IBattleInviteService(_arg_1);
         },function():IBattleInviteService
         {
            return SettingsModel.battleInviteService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            SettingsModel.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return SettingsModel.alertService;
         });
         osgi.injectService(FullscreenService,function(_arg_1:Object):void
         {
            SettingsModel.fullscreenService = FullscreenService(_arg_1);
         },function():FullscreenService
         {
            return SettingsModel.fullscreenService;
         });
         osgi.injectService(PasswordService,function(_arg_1:Object):void
         {
            SettingsModel.bogeluquh = PasswordService(_arg_1);
         },function():PasswordService
         {
            return SettingsModel.bogeluquh;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            SettingsService.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return SettingsService.storageService;
         });
         osgi.injectService(IBattleInviteService,function(_arg_1:Object):void
         {
            SettingsService.battleInviteService = IBattleInviteService(_arg_1);
         },function():IBattleInviteService
         {
            return SettingsService.battleInviteService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Pibu.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Pibu.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            SettingsWindow.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return SettingsWindow.localeService;
         });
         osgi.injectService(IHelpService,function(_arg_1:Object):void
         {
            SettingsWindow.helperService = IHelpService(_arg_1);
         },function():IHelpService
         {
            return SettingsWindow.helperService;
         });
         osgi.injectService(IPartnerService,function(_arg_1:Object):void
         {
            SettingsWindow.partnersService = IPartnerService(_arg_1);
         },function():IPartnerService
         {
            return SettingsWindow.partnersService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Myzu.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Myzu.display;
         });
         osgi.injectService(IPartnerService,function(_arg_1:Object):void
         {
            Myzu.partnersService = IPartnerService(_arg_1);
         },function():IPartnerService
         {
            return Myzu.partnersService;
         });
         osgi.injectService(ISocialNetworkPanelService,function(_arg_1:Object):void
         {
            Myzu.socialNetworkService = ISocialNetworkPanelService(_arg_1);
         },function():ISocialNetworkPanelService
         {
            return Myzu.socialNetworkService;
         });
         osgi.injectService(IValidateService,function(_arg_1:Object):void
         {
            Myzu.validateService = IValidateService(_arg_1);
         },function():IValidateService
         {
            return Myzu.validateService;
         });
         osgi.injectService(IHelpService,function(_arg_1:Object):void
         {
            Myzu.helperService = IHelpService(_arg_1);
         },function():IHelpService
         {
            return Myzu.helperService;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            Jin.settingsService = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return Jin.settingsService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Jin.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Jin.localeService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Ziqysyrep.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Ziqysyrep.display;
         });
         osgi.injectService(KeysBindingService,function(_arg_1:Object):void
         {
            Rihusir.tytol = KeysBindingService(_arg_1);
         },function():KeysBindingService
         {
            return Rihusir.tytol;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Rihusir.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Rihusir.localeService;
         });
         osgi.injectService(FullscreenService,function(_arg_1:Object):void
         {
            Biretihap.dowiruduj = FullscreenService(_arg_1);
         },function():FullscreenService
         {
            return Biretihap.dowiruduj;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Biretihap.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Biretihap.display;
         });
         osgi.injectService(KeysBindingService,function(_arg_1:Object):void
         {
            Sawev.tytol = KeysBindingService(_arg_1);
         },function():KeysBindingService
         {
            return Sawev.tytol;
         });
         osgi.injectService(IBattleInviteService,function(_arg_1:Object):void
         {
            Kyke.battleInviteService = IBattleInviteService(_arg_1);
         },function():IBattleInviteService
         {
            return Kyke.battleInviteService;
         });
         osgi.injectService(IPanelView,function(_arg_1:Object):void
         {
            PanelModel.panelView = IPanelView(_arg_1);
         },function():IPanelView
         {
            return PanelModel.panelView;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            PanelModel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return PanelModel.display;
         });
         osgi.injectService(IHelpService,function(_arg_1:Object):void
         {
            PanelModel.helpService = IHelpService(_arg_1);
         },function():IHelpService
         {
            return PanelModel.helpService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            PanelModel.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return PanelModel.lobbyLayoutService;
         });
         osgi.injectService(IAchievementService,function(_arg_1:Object):void
         {
            PanelModel.achievementService = IAchievementService(_arg_1);
         },function():IAchievementService
         {
            return PanelModel.achievementService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            PanelModel.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return PanelModel.battleInfoService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            PanelModel.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return PanelModel.alertService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            PanelModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return PanelModel.localeService;
         });
         osgi.injectService(DailyQuestNotifierService,function(_arg_1:Object):void
         {
            Dajy.fuhebamug = DailyQuestNotifierService(_arg_1);
         },function():DailyQuestNotifierService
         {
            return Dajy.fuhebamug;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Tydoca.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Tydoca.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Raqohybe.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Raqohybe.localeService;
         });
         osgi.injectService(IMoneyService,function(_arg_1:Object):void
         {
            Raqohybe.moneyService = IMoneyService(_arg_1);
         },function():IMoneyService
         {
            return Raqohybe.moneyService;
         });
         osgi.injectService(DailyQuestNotifierService,function(_arg_1:Object):void
         {
            Raqohybe.ziwifeve = DailyQuestNotifierService(_arg_1);
         },function():DailyQuestNotifierService
         {
            return Raqohybe.ziwifeve;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Favutedes.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Favutedes.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Betugom.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Betugom.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Dizu.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Dizu.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Tikesutak.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Tikesutak.localeService;
         });
         osgi.injectService(IMoneyService,function(_arg_1:Object):void
         {
            Tikesutak.moneyService = IMoneyService(_arg_1);
         },function():IMoneyService
         {
            return Tikesutak.moneyService;
         });
         osgi.injectService(DailyQuestNotifierService,function(_arg_1:Object):void
         {
            Pugasuzyw.ziwifeve = DailyQuestNotifierService(_arg_1);
         },function():DailyQuestNotifierService
         {
            return Pugasuzyw.ziwifeve;
         });
         osgi.injectService(IPanelView,function(_arg_1:Object):void
         {
            Jigece.panelView = IPanelView(_arg_1);
         },function():IPanelView
         {
            return Jigece.panelView;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Ryrygo.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Ryrygo.localeService;
         });
         osgi.injectService(IFriendActionService,function(_arg_1:Object):void
         {
            AddRequestView.friendsActionService = IFriendActionService(_arg_1);
         },function():IFriendActionService
         {
            return AddRequestView.friendsActionService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            AddRequestView.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return AddRequestView.localeService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            AddRequestView.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return AddRequestView.alertService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(_arg_1:Object):void
         {
            AddRequestView.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(_arg_1);
         },function():IDialogWindowsDispatcherService
         {
            return AddRequestView.dialogWindowsDispatcherService;
         });
         osgi.injectService(IBlurService,function(_arg_1:Object):void
         {
            AddRequestView.blurService = IBlurService(_arg_1);
         },function():IBlurService
         {
            return AddRequestView.blurService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            AddRequestView.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return AddRequestView.userPropertiesService;
         });
         osgi.injectService(IContextMenuService,function(_arg_1:Object):void
         {
            FriendsOutgoingListRenderer.contextMenuService = IContextMenuService(_arg_1);
         },function():IContextMenuService
         {
            return FriendsOutgoingListRenderer.contextMenuService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            FriendsWindow.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return FriendsWindow.localeService;
         });
         osgi.injectService(IDialogsService,function(_arg_1:Object):void
         {
            FriendsWindow.dialogService = IDialogsService(_arg_1);
         },function():IDialogsService
         {
            return FriendsWindow.dialogService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            FriendsWindow.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return FriendsWindow.display;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(_arg_1:Object):void
         {
            FriendsWindow.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(_arg_1);
         },function():IDialogWindowsDispatcherService
         {
            return FriendsWindow.dialogWindowsDispatcherService;
         });
         osgi.injectService(IBattleLinkActivatorService,function(_arg_1:Object):void
         {
            FriendsWindow.battleLinkActivatorService = IBattleLinkActivatorService(_arg_1);
         },function():IBattleLinkActivatorService
         {
            return FriendsWindow.battleLinkActivatorService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            FriendsWindow.friendInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return FriendsWindow.friendInfoService;
         });
         osgi.injectService(IFriendActionService,function(_arg_1:Object):void
         {
            FriendsWindow.friendsActionService = IFriendActionService(_arg_1);
         },function():IFriendActionService
         {
            return FriendsWindow.friendsActionService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            FriendsWindow.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return FriendsWindow.alertService;
         });
         osgi.injectService(IBlurService,function(_arg_1:Object):void
         {
            FriendsWindow.blurService = IBlurService(_arg_1);
         },function():IBlurService
         {
            return FriendsWindow.blurService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            HeaderAcceptedList.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return HeaderAcceptedList.localeService;
         });
         osgi.injectService(IPartnerService,function(_arg_1:Object):void
         {
            HeaderAcceptedList.partnersService = IPartnerService(_arg_1);
         },function():IPartnerService
         {
            return HeaderAcceptedList.partnersService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            IncomingList.friendInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return IncomingList.friendInfoService;
         });
         osgi.injectService(IContextMenuService,function(_arg_1:Object):void
         {
            IncomingList.contextMenuService = IContextMenuService(_arg_1);
         },function():IContextMenuService
         {
            return IncomingList.contextMenuService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ItemsAlert.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ItemsAlert.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            KeyCodesConverter.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return KeyCodesConverter.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            NewPresentsAlert.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return NewPresentsAlert.localeService;
         });
         osgi.injectService(INotificationGarageCategoriesService,function(_arg_1:Object):void
         {
            NewPresentsShowingModel.notificationGarageCategoriesService = INotificationGarageCategoriesService(_arg_1);
         },function():INotificationGarageCategoriesService
         {
            return NewPresentsShowingModel.notificationGarageCategoriesService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            NewsAlertWindow.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return NewsAlertWindow.localeService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            OutgoingList.friendInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return OutgoingList.friendInfoService;
         });
         osgi.injectService(IContextMenuService,function(_arg_1:Object):void
         {
            OutgoingList.contextMenuService = IContextMenuService(_arg_1);
         },function():IContextMenuService
         {
            return OutgoingList.contextMenuService;
         });
         osgi.injectService(ResourceRegistry,function(_arg_1:Object):void
         {
            RepatriateBonusWindow.resourceService = ResourceRegistry(_arg_1);
         },function():ResourceRegistry
         {
            return RepatriateBonusWindow.resourceService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            RepatriateBonusWindow.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return RepatriateBonusWindow.localeService;
         });
         osgi.injectService(IClientLog,function(_arg_1:Object):void
         {
            RepatriateBonusWindow.clientLog = IClientLog(_arg_1);
         },function():IClientLog
         {
            return RepatriateBonusWindow.clientLog;
         });
         osgi.injectService(ISocialNetworkPanelService,function(_arg_1:Object):void
         {
            SocialNetworkPanelModel.socialNetworkService = ISocialNetworkPanelService(_arg_1);
         },function():ISocialNetworkPanelService
         {
            return SocialNetworkPanelModel.socialNetworkService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            SocialNetworkPanelModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return SocialNetworkPanelModel.localeService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            SocialNetworkPanelModel.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return SocialNetworkPanelModel.alertService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ThanksForPurchaseWindow.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ThanksForPurchaseWindow.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            TimeFormatter.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return TimeFormatter.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ReferalsModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ReferalsModel.localeService;
         });
         osgi.injectService(IPanelView,function(_arg_1:Object):void
         {
            ReferalsModel.panelView = IPanelView(_arg_1);
         },function():IPanelView
         {
            return ReferalsModel.panelView;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            ReferalsModel.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return ReferalsModel.userPropertiesService;
         });
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new NewsShowingModel(),Vector.<Class>([INewsShowingModelBase,IObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(News,NewsAdapt);
         modelRegisterAdapt.registerEvents(News,NewsEvents);
         modelRegister.add(new NewsItemModel(),Vector.<Class>([INewsItemModelBase,News]));
         modelRegister.register(Long.getLong(0,300050051),Long.getLong(0,300050031));
         modelRegister.add(new AchievementModel(),Vector.<Class>([Gas,IAchievement,IObjectLoadListener]));
         modelRegister.add(new RankUpSupplyBonusModel(),Vector.<Class>([IRankUpSupplyBonusModelBase]));
         modelRegister.add(new BonusInfoModel(),Vector.<Class>([IBonusInfoModelBase,BonusInfo]));
         modelRegisterAdapt.registerAdapt(BonusInfo,BonusInfoAdapt);
         modelRegisterAdapt.registerEvents(BonusInfo,BonusInfoEvents);
         modelRegister.add(new BonusItemsShowingModel(),Vector.<Class>([IBonusItemsShowingModelBase,IObjectLoadListener]));
         modelRegister.add(new BonusItemModel(),Vector.<Class>([IBonusItemModelBase,BonusItem]));
         modelRegisterAdapt.registerAdapt(BonusItem,BonusItemAdapt);
         modelRegisterAdapt.registerEvents(BonusItem,BonusItemEvents);
         modelRegister.add(new BonusImageShowingModel(),Vector.<Class>([IBonusImageShowingModelBase,IObjectLoadListener]));
         modelRegister.add(new Pugasuzyw(),Vector.<Class>([Jenapery,ObjectLoadPostListener,ObjectUnloadPostListener]));
         modelRegisterAdapt.registerAdapt(Timazysol,Tajuje);
         modelRegisterAdapt.registerEvents(Timazysol,Bywoh);
         modelRegister.add(new Zidadoge(),Vector.<Class>([Bofavif,Timazysol]));
         modelRegister.add(new Jigece(),Vector.<Class>([Ruperip,ObjectLoadPostListener,ObjectUnloadPostListener]));
         modelRegister.add(new Zufuku(),Vector.<Class>([Cyzabosy]));
         modelRegister.add(new ReferalsModel(),Vector.<Class>([IReferrerPanelModelBase,ObjectLoadPostListener]));
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

