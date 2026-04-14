package fominskiy.networking.aes
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.startup.StartupSettings;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.loader.ILoaderWindowService2;
   import alternativa.tanks.loader.LoaderWindow2;
   import alternativa.tanks.servermodels.registartion.password.IPasswordRegistration;
   import alternativa.tanks.servermodels.registartion.password.PasswordRegistrationModel;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.types.Long;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworkListener;
   import fominskiy.networking.Network;
   import fominskiy.networking.commands.Command;
   import fominskiy.networking.commands.Type;
   import fominskiy.server.models.locale.LocalizationLoader;
   import fominskiy.utils.ResourcesLoader;
   import obfuscation.pipis.Siqu;
   import obfuscation.puwope.Jor;
   import obfuscation.pygame.Mirakiqiq;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.loading.DispatcherModel;
   import projects.tanks.client.entrance.model.entrance.registration.RegistrationModelCC;
   
   public class AESEncrypterModel implements INetworkListener
   {
      
      private var netwoker:Network;
      
      private var loader:Loader;
      
      private var localizationLoader:LocalizationLoader = new LocalizationLoader();
      
      private var resourcesLoader:ResourcesLoader = new ResourcesLoader();
      
      private var modelRegistry:ModelRegistry = OSGi.getInstance().getService(ModelRegistry) as ModelRegistry;
      
      private var vygajad:Mirakiqiq = Mirakiqiq(this.modelRegistry.getModel(Long.getLong(0,300020016)));
      
      public function AESEncrypterModel()
      {
         super();
      }
      
      public function onData(_arg_1:Command) : void
      {
         var _local_2:ByteArray = null;
         var _local_3:Array = null;
         var _local_4:String = null;
         var _local_5:LoaderContext = null;
         var _local_6:DispatcherModel = null;
         var _local_7:Object = null;
         var _local_8:RegistrationModelCC = null;
         if(_arg_1.type == Type.SYSTEM)
         {
            if(_arg_1.args[0] == "set_aes_data")
            {
               try
               {
                  _local_2 = new ByteArray();
                  _local_3 = _arg_1.args[1].split(",");
                  for each(_local_4 in _local_3)
                  {
                     _local_2.writeByte(parseInt(_local_4));
                  }
                  _local_5 = new LoaderContext(false,ApplicationDomain.currentDomain);
                  if(StartupSettings.isDesktop)
                  {
                     _local_5.allowLoadBytesCodeExecution = true;
                  }
                  this.loader = new Loader();
                  this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onAesLoadComplete);
                  this.loader.loadBytes(_local_2,_local_5);
               }
               catch(e:Error)
               {
               }
            }
            if(_arg_1.args[0] == "init_locale")
            {
               this.localizationLoader.init(_arg_1.args[1]);
               OSGi.getInstance().registerService(ILoaderWindowService2,new LoaderWindow2());
               if(ISettingsService(OSGi.getInstance().getService(ISettingsService)).useNewLoader)
               {
                  ILoaderWindowService2(OSGi.getInstance().getService(ILoaderWindowService2)).showLoaderWindow();
               }
               else
               {
                  ILoaderWindowService(OSGi.getInstance().getService(ILoaderWindowService)).showLoaderWindow();
               }
            }
            if(_arg_1.args[0] == "main_resources_loaded")
            {
               Game.onResourceLoaded();
            }
            if(_arg_1.args[0] == "load_resources")
            {
               _local_6 = this.modelRegistry.getModel(Long.getLong(191355032,163351191)) as DispatcherModel;
               _local_6.loadDependencies(this.resourcesLoader.makeDependencies(_arg_1.args[1],_arg_1.args[2]));
               Model.popObject();
            }
            if(_arg_1.args[0] == "initInviteModel")
            {
               this.vygajad.putInitParams(new Siqu(_arg_1.args[1] == "false" ? false : true));
               this.vygajad.objectLoaded();
            }
            if(_arg_1.args[0] == "inviteNotFound")
            {
               this.vygajad.inviteNotFound();
            }
            if(_arg_1.args[0] == "inviteFree")
            {
               this.vygajad.inviteFree();
            }
            if(_arg_1.args[0] == "inviteAlreadyActivated")
            {
               this.vygajad.inviteAlreadyActivated(_arg_1.args[1]);
            }
            if(_arg_1.args[0] == "init_registration_model")
            {
               _local_7 = JSON.parse(_arg_1.args[1]);
               _local_8 = new RegistrationModelCC();
               _local_8.enableRequiredEmail = _local_7.enableRequiredEmail;
               _local_8.maxPasswordLength = _local_7.maxPasswordLength;
               _local_8.minPasswordLength = _local_7.minPasswordLength;
               PasswordRegistrationModel(OSGi.getInstance().getService(IPasswordRegistration)).putInitParams(_local_8);
               PasswordRegistrationModel(OSGi.getInstance().getService(IPasswordRegistration)).objectLoaded();
            }
            if(_arg_1.args[0] == "showAlert")
            {
               Jor(this.modelRegistry.getModel(Long.getLong(2058573415,-746879275))).show(_arg_1.args[1]);
            }
         }
      }
      
      private function onAesLoadComplete(_arg_1:Event) : void
      {
         this.netwoker.AESDecrypter = new (Class(this.loader.contentLoaderInfo.applicationDomain.getDefinition("Main")))();
      }
      
      public function resourceLoaded(_arg_1:Network) : void
      {
         this.netwoker = _arg_1;
         _arg_1.send("system;get_aes_data;" + this.defuv(ILocaleService(OSGi.getInstance().getService(ILocaleService)).language));
      }
      
      private function defuv(_arg_1:String) : String
      {
         switch(_arg_1)
         {
            case "ru":
            case "en":
               return _arg_1.toUpperCase();
            case "pt_BR":
               return _arg_1;
            default:
               return _arg_1.toUpperCase();
         }
      }
   }
}

