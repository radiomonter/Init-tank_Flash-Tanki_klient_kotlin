package projects.tanks.clients.fp10.models.tankschatmodelflash
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.gui.LobbyChat;
   import alternativa.tanks.model.ChatModel;
   import alternativa.tanks.model.ChatSettingsTracker;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.utils.Antiflood;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.IBattleLinkActivatorService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import services.contextmenu.IContextMenuService;
   
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
         var _osgi:OSGi = param1;
         osgi = _osgi;
         osgi.injectService(IClientLog,function(_arg_1:Object):void
         {
            Antiflood.clientLog = IClientLog(_arg_1);
         },function():IClientLog
         {
            return Antiflood.clientLog;
         });
         osgi.injectService(ITrackerService,function(_arg_1:Object):void
         {
            ChatModel.trackerService = ITrackerService(_arg_1);
         },function():ITrackerService
         {
            return ChatModel.trackerService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            ChatModel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return ChatModel.display;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ChatModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ChatModel.localeService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            ChatModel.userPropertyService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return ChatModel.userPropertyService;
         });
         osgi.injectService(IBattleLinkActivatorService,function(_arg_1:Object):void
         {
            ChatModel.battleLinkActivatorService = IBattleLinkActivatorService(_arg_1);
         },function():IBattleLinkActivatorService
         {
            return ChatModel.battleLinkActivatorService;
         });
         osgi.injectService(IClientLog,function(_arg_1:Object):void
         {
            ChatModel.clientLog = IClientLog(_arg_1);
         },function():IClientLog
         {
            return ChatModel.clientLog;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            ChatSettingsTracker.settingsService = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return ChatSettingsTracker.settingsService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            LobbyChat.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return LobbyChat.localeService;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            LobbyChat.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return LobbyChat.storageService;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            LobbyChat.logService = LogService(_arg_1);
         },function():LogService
         {
            return LobbyChat.logService;
         });
         osgi.injectService(IContextMenuService,function(_arg_1:Object):void
         {
            LobbyChat.contextMenuService = IContextMenuService(_arg_1);
         },function():IContextMenuService
         {
            return LobbyChat.contextMenuService;
         });
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

