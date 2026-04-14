package projects.tanks.clients.flash.commons.osgi
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.launcherparams.ILauncherParams;
   import obfuscation.cygoqu.TimeUnitService;
   import obfuscation.cygoqu.Vacepanuf;
   import projects.tanks.clients.flash.commons.services.fullscreen.FullscreenServiceImpl;
   import projects.tanks.clients.flash.commons.services.fullscreen.FullscreenStateServiceImpl;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutService;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.flash.commons.services.notification.NotificationService;
   import projects.tanks.clients.flash.commons.services.notification.sound.INotificationSoundService;
   import projects.tanks.clients.flash.commons.services.notification.sound.Sokud;
   import projects.tanks.clients.flash.commons.services.serverhalt.IServerHaltService;
   import projects.tanks.clients.flash.commons.services.serverhalt.ServerHaltService;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.flash.commons.services.validate.ValidateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenStateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.LobbyLayoutServiceBase;
   
   public class Activator implements IBundleActivator
   {
      
      public function Activator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         var _local_2:ILobbyLayoutService = new LobbyLayoutService();
         _arg_1.registerService(ILobbyLayoutService,_local_2);
         _arg_1.registerService(LobbyLayoutServiceBase,_local_2);
         _arg_1.registerService(INotificationService,new NotificationService(_local_2));
         _arg_1.registerService(IServerHaltService,new ServerHaltService());
         _arg_1.registerService(IValidateService,new ValidateService());
         _arg_1.registerService(INotificationSoundService,new Sokud());
         _arg_1.registerService(Vacepanuf,new TimeUnitService());
         var _local_3:IDisplay = IDisplay(OSGi.getInstance().getService(IDisplay));
         var _local_4:ILauncherParams = ILauncherParams(OSGi.getInstance().getService(ILauncherParams));
         var _local_5:FullscreenServiceImpl = new FullscreenServiceImpl(_local_3);
         _arg_1.registerService(FullscreenService,_local_5);
         _arg_1.registerService(FullscreenStateService,new FullscreenStateServiceImpl(_local_3,_local_5.isAvailable()));
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

