package
{
   import alternativa.ClientConfigurator;
   import alternativa.init.TanksFontsActivator;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.launcherparams.LauncherParams;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.locale.LocaleService;
   import alternativa.register.ModelsRegister;
   import alternativa.service.IModelService;
   import alternativa.startup.ConnectionParameters;
   import alternativa.startup.StartupSettings;
   import alternativa.tanks.help.HelpService;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.loader.ILoaderWindowService2;
   import alternativa.tanks.locale.en.Image;
   import alternativa.tanks.locale.ru.Image;
   import alternativa.tanks.model.UserModel;
   import alternativa.tanks.model.panel.IPanel;
   import alternativa.tanks.model.panel.PanelModel;
   import alternativa.tanks.servermodels.socialnetwork.ExternalEntranceModel;
   import alternativa.tanks.servermodels.socialnetwork.IExternalEntranceModel;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.service.achievement.Qigiv;
   import alternativa.tanks.service.settings.ISettingsService;
   import flash.display.DisplayObjectContainer;
   import flash.display.LoaderInfo;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.UncaughtErrorEvent;
   import flash.net.FileReference;
   import flash.system.System;
   import flash.utils.getTimer;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import fominskiy.networking.aes.AESEncrypterModel;
   import fominskiy.networking.aes.IAESModel;
   import fominskiy.networking.connecting.ServerConnectionService;
   import fominskiy.networking.connecting.ServerConnectionServiceImpl;
   import init.TanksFormsActivator;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class Game extends Sprite
   {
      
      private static var userModel:UserModel;
      
      public static const CRASH_LOGGER_ENABLED:Boolean = false;
      
      private var container:DisplayObjectContainer;
      
      public function Game()
      {
         super();
         if(CRASH_LOGGER_ENABLED)
         {
            this.setupCrashLogger();
         }
         if(numChildren > 1)
         {
            removeChildAt(0);
            removeChildAt(0);
         }
      }
      
      public static function onResourceLoaded() : void
      {
         var _local_1:Network = OSGi.getInstance().getService(INetworker) as Network;
         new TanksFormsActivator().start(OSGi.getInstance());
         OSGi.getInstance().registerService(IHelpService,new HelpService());
         new TanksFontsActivator().start(OSGi.getInstance());
         OSGi.getInstance().registerService(IAchievementService,new Qigiv());
         var _local_2:PanelModel = new PanelModel();
         OSGi.getInstance().registerService(IPanel,_local_2);
         if(ISettingsService(OSGi.getInstance().getService(ISettingsService)).useNewLoader)
         {
            ILoaderWindowService2(OSGi.getInstance().getService(ILoaderWindowService2)).hideLoaderWindow();
         }
         else
         {
            ILoaderWindowService(OSGi.getInstance().getService(ILoaderWindowService)).hideLoaderWindow();
            ILoaderWindowService(OSGi.getInstance().getService(ILoaderWindowService)).lockLoaderWindow();
         }
         userModel = new UserModel();
         userModel.initObject(false,false);
         userModel.objectLoaded();
      }
      
      private function setupCrashLogger() : void
      {
         if(Boolean(loaderInfo) && Boolean(loaderInfo.uncaughtErrorEvents))
         {
            loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.onCrash,false,0,true);
         }
      }
      
      private function onCrash(e:UncaughtErrorEvent) : void
      {
         var msg:String;
         var err:Error = null;
         var stack:String = null;
         var fr:FileReference = null;
         if(!CRASH_LOGGER_ENABLED)
         {
            return;
         }
         e.preventDefault();
         msg = "==== </Fominskiy> ====\n";
         msg += "===== GAME CRASH =====\n";
         msg += "Time: " + new Date() + "\n";
         msg += "Memory: " + System.totalMemory + "\n";
         if(e.error is Error)
         {
            err = e.error as Error;
            msg += "Type: " + err.name + "\n";
            msg += "Message: " + err.message + "\n";
            if(Boolean(err.errorID))
            {
               msg += "ErrorID: " + err.errorID + "\n";
            }
            stack = err.getStackTrace();
            if(Boolean(stack))
            {
               msg += "Stack:\n" + stack + "\n";
            }
            else
            {
               msg += "Stack: <empty>\n";
            }
         }
         else
         {
            msg += "Message: " + e.error + "\n";
         }
         trace(msg);
         try
         {
            fr = new FileReference();
            fr.save(msg,"crash_" + getTimer() + ".log");
         }
         catch(ex:Error)
         {
            trace("Save crash failed:",ex.message);
         }
      }
      
      public function activateAllModels(_arg_1:LoaderInfo) : void
      {
         new ClientConfigurator().start(this.container,new LauncherParams(),new ConnectionParameters(_arg_1.parameters["ip"],Vector.<int>([_arg_1.parameters["port"]]),null,_arg_1.parameters["resources"],false,false),null);
         OSGi.getInstance().registerService(ILocaleService,new LocaleService(_arg_1.parameters["lang"],"en"));
         if(_arg_1.parameters["lang"] == "ru")
         {
            Image.init(OSGi.getInstance().getService(ILocaleService) as ILocaleService);
         }
         else
         {
            Image.init(OSGi.getInstance().getService(ILocaleService) as ILocaleService);
         }
         var _local_2:IModelService = new ModelsRegister();
         OSGi.getInstance().registerService(IModelService,_local_2);
         new EntranceActivator().start(OSGi.getInstance());
      }
      
      public function SUPER(_arg_1:Stage, _arg_2:DisplayObjectContainer, _arg_3:LoaderInfo = null) : void
      {
         this.container = _arg_2;
         _arg_1.dispatchEvent(new Event("EntranceModel.objectLoaded",true));
         this.activateAllModels(_arg_3);
         var _local_4:GPUCapabilities = new GPUCapabilities(IDisplay(OSGi.getInstance().getService(IDisplay)).stage);
         _local_4.addEventListener(Event.COMPLETE,this.onGPUDetected);
         _local_4.detect();
         StartupSettings.preLauncher = Sprite(parent.parent.parent);
      }
      
      private function onGPUDetected(_arg_1:Event) : void
      {
         OSGi.clientLog.log("GPUDetection","GPU detection completed, %1",GPUCapabilities.gpuEnabled);
         this.serverNormal();
      }
      
      private function serverNormal() : void
      {
         var _local_1:ServerConnectionService = new ServerConnectionServiceImpl();
         _local_1.connect(this.onConnected);
      }
      
      private function onConnected() : void
      {
         var _local_1:Network = OSGi.getInstance().getService(INetworker) as Network;
         var _local_2:ExternalEntranceModel = OSGi.getInstance().getService(IExternalEntranceModel) as ExternalEntranceModel;
         _local_1.addListener(_local_2);
         _local_2.objectLoaded();
         var _local_3:AESEncrypterModel = new AESEncrypterModel();
         OSGi.getInstance().registerService(IAESModel,_local_3);
         _local_1.addListener(_local_3);
         _local_3.resourceLoaded(_local_1);
      }
   }
}

