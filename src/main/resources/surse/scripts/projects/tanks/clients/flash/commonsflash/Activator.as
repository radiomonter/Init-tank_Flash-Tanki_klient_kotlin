package projects.tanks.clients.flash.commonsflash
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import obfuscation.cygoqu.TimeUnitService;
   import obfuscation.fulegod.Vow;
   import obfuscation.puwope.Jor;
   import obfuscation.wesifi.Tolisi;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import projects.tanks.client.commons.models.coloring.IColoringModelBase;
   import projects.tanks.clients.flash.commons.models.battlelinkactivator.BattleLinkActivatorModel;
   import projects.tanks.clients.flash.commons.models.coloring.ColoringModel;
   import projects.tanks.clients.flash.commons.models.coloring.IColoring;
   import projects.tanks.clients.flash.commons.models.coloring.IColoringAdapt;
   import projects.tanks.clients.flash.commons.models.coloring.IColoringEvents;
   import projects.tanks.clients.flash.commons.models.layout.notify.LobbyLayoutNotifyModel;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.IBattleLinkActivatorService;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutService;
   import projects.tanks.clients.flash.commons.services.nameutils.SocialNetworkNameUtils;
   import projects.tanks.clients.flash.commons.services.notification.Notification;
   import projects.tanks.clients.flash.commons.services.notification.sound.INotificationSoundService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
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
         osgi.injectService(IBattleLinkActivatorService,function(_arg_1:Object):void
         {
            BattleLinkActivatorModel.battleLinkActivatorService = IBattleLinkActivatorService(_arg_1);
         },function():IBattleLinkActivatorService
         {
            return BattleLinkActivatorModel.battleLinkActivatorService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            BattleLinkActivatorModel.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return BattleLinkActivatorModel.lobbyLayoutService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            BattleLinkActivatorModel.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return BattleLinkActivatorModel.alertService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BattleLinkActivatorModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BattleLinkActivatorModel.localeService;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            BattleLinkActivatorModel.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return BattleLinkActivatorModel.storageService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            BattleLinkActivatorModel.userPropertyService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return BattleLinkActivatorModel.userPropertyService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            LobbyLayoutNotifyModel.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return LobbyLayoutNotifyModel.lobbyLayoutService;
         });
         osgi.injectService(ILoaderWindowService,function(_arg_1:Object):void
         {
            LobbyLayoutNotifyModel.loaderWindowService = ILoaderWindowService(_arg_1);
         },function():ILoaderWindowService
         {
            return LobbyLayoutNotifyModel.loaderWindowService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            LobbyLayoutService.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return LobbyLayoutService.alertService;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            LobbyLayoutService.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return LobbyLayoutService.storageService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            LobbyLayoutService.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return LobbyLayoutService.localeService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            LobbyLayoutService.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return LobbyLayoutService.battleInfoService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(_arg_1:Object):void
         {
            LobbyLayoutService.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(_arg_1);
         },function():IDialogWindowsDispatcherService
         {
            return LobbyLayoutService.dialogWindowsDispatcherService;
         });
         osgi.injectService(IPartnerService,function(_arg_1:Object):void
         {
            LobbyLayoutService.partnersService = IPartnerService(_arg_1);
         },function():IPartnerService
         {
            return LobbyLayoutService.partnersService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            LobbyLayoutService.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return LobbyLayoutService.userInfoService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            Jor.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return Jor.alertService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Jor.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Jor.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            TimeUnitService.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return TimeUnitService.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Tolisi.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Tolisi.localeService;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            Tolisi.logService = LogService(_arg_1);
         },function():LogService
         {
            return Tolisi.logService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Notification.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Notification.display;
         });
         osgi.injectService(INotificationSoundService,function(_arg_1:Object):void
         {
            Notification.myzywak = INotificationSoundService(_arg_1);
         },function():INotificationSoundService
         {
            return Notification.myzywak;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            SocialNetworkNameUtils.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return SocialNetworkNameUtils.localeService;
         });
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt.registerAdapt(IColoring,IColoringAdapt);
         modelRegisterAdapt.registerEvents(IColoring,IColoringEvents);
         modelRegister.add(new ColoringModel(),Vector.<Class>([IColoringModelBase,IColoring]));
         modelRegister.add(new Jor(),Vector.<Class>([Vow]));
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

