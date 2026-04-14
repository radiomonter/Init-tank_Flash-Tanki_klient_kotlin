package projects.tanks.clients.fp10.models.tanksusermodel
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.model.useremailandpassword.UserEmailAndPasswordModel;
   import alternativa.tanks.servermodels.EntranceModel;
   import alternativa.tanks.servermodels.blockvalidator.BlockValidatorModel;
   import alternativa.tanks.servermodels.captcha.ServerCaptchaModel;
   import alternativa.tanks.servermodels.login.LoginModel;
   import alternativa.tanks.servermodels.registartion.password.PasswordRegistrationModel;
   import alternativa.tanks.servermodels.socialnetwork.ExternalEntranceModel;
   import alternativa.tanks.service.IEntranceClientFacade;
   import alternativa.tanks.service.IEntranceServerFacade;
   import alternativa.tanks.service.IPasswordParamsService;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.socialnetwork.ISocialNetworkPanelService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.bubbles.EntranceBubbleFactory;
   import alternativa.tanks.view.forms.ChangeUidForm;
   import alternativa.tanks.view.forms.ExternalRegistrationForm;
   import alternativa.tanks.view.forms.LinkExternalLoginForm;
   import alternativa.tanks.view.forms.LoginForm;
   import alternativa.tanks.view.forms.PasswordRestoreForm;
   import alternativa.tanks.view.forms.RegistrationForm;
   import alternativa.tanks.view.forms.commons.ChangeUidInputField;
   import alternativa.tanks.view.forms.commons.RegistrationCommonElementsSection;
   import alternativa.tanks.view.layers.EntranceView;
   import obfuscation.lucaby.Tezyl;
   import obfuscation.pipis.Kefij;
   import obfuscation.pygame.Leku;
   import obfuscation.pygame.Meca;
   import obfuscation.pygame.Mewebovu;
   import obfuscation.pygame.Mirakiqiq;
   import obfuscation.vinygavew.Nosum;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class Activator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var modelRegisterAdapt:ModelRegistry;
         var modelRegister:ModelRegistry;
         var _osgi:OSGi = param1;
         osgi = _osgi;
         osgi.injectService(IEntranceServerFacade,function(_arg_1:Object):void
         {
            EntranceModel.serverFacade = IEntranceServerFacade(_arg_1);
         },function():IEntranceServerFacade
         {
            return EntranceModel.serverFacade;
         });
         osgi.injectService(IEntranceClientFacade,function(_arg_1:Object):void
         {
            EntranceModel.clientFacade = IEntranceClientFacade(_arg_1);
         },function():IEntranceClientFacade
         {
            return EntranceModel.clientFacade;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            EntranceModel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return EntranceModel.display;
         });
         osgi.injectService(IEntranceClientFacade,function(_arg_1:Object):void
         {
            BlockValidatorModel.clientFacade = IEntranceClientFacade(_arg_1);
         },function():IEntranceClientFacade
         {
            return BlockValidatorModel.clientFacade;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            BlockValidatorModel.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return BlockValidatorModel.storageService;
         });
         osgi.injectService(ITrackerService,function(_arg_1:Object):void
         {
            BlockValidatorModel.trackerService = ITrackerService(_arg_1);
         },function():ITrackerService
         {
            return BlockValidatorModel.trackerService;
         });
         osgi.injectService(IEntranceClientFacade,function(_arg_1:Object):void
         {
            ServerCaptchaModel.clientFacade = IEntranceClientFacade(_arg_1);
         },function():IEntranceClientFacade
         {
            return ServerCaptchaModel.clientFacade;
         });
         osgi.injectService(IEntranceClientFacade,function(_arg_1:Object):void
         {
            PasswordRegistrationModel.facade = IEntranceClientFacade(_arg_1);
         },function():IEntranceClientFacade
         {
            return PasswordRegistrationModel.facade;
         });
         osgi.injectService(IPasswordParamsService,function(_arg_1:Object):void
         {
            PasswordRegistrationModel.passwordParamsService = IPasswordParamsService(_arg_1);
         },function():IPasswordParamsService
         {
            return PasswordRegistrationModel.passwordParamsService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            PasswordRegistrationModel.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return PasswordRegistrationModel.alertService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            PasswordRegistrationModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return PasswordRegistrationModel.localeService;
         });
         osgi.injectService(ITrackerService,function(_arg_1:Object):void
         {
            PasswordRegistrationModel.trackerService = ITrackerService(_arg_1);
         },function():ITrackerService
         {
            return PasswordRegistrationModel.trackerService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            EntranceBubbleFactory.LocaleService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return EntranceBubbleFactory.LocaleService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            EntranceView.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return EntranceView.localeService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            EntranceView.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return EntranceView.alertService;
         });
         osgi.injectService(IEntranceClientFacade,function(_arg_1:Object):void
         {
            ExternalEntranceModel.clientFacade = IEntranceClientFacade(_arg_1);
         },function():IEntranceClientFacade
         {
            return ExternalEntranceModel.clientFacade;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ExternalEntranceModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ExternalEntranceModel.localeService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            ExternalEntranceModel.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return ExternalEntranceModel.alertService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ExternalRegistrationForm.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ExternalRegistrationForm.localeService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            ExternalRegistrationForm.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return ExternalRegistrationForm.display;
         });
         osgi.injectService(IHelpService,function(_arg_1:Object):void
         {
            ExternalRegistrationForm.helperService = IHelpService(_arg_1);
         },function():IHelpService
         {
            return ExternalRegistrationForm.helperService;
         });
         osgi.injectService(IValidateService,function(_arg_1:Object):void
         {
            ExternalRegistrationForm.validateService = IValidateService(_arg_1);
         },function():IValidateService
         {
            return ExternalRegistrationForm.validateService;
         });
         osgi.injectService(IEntranceClientFacade,function(_arg_1:Object):void
         {
            Nosum.facade = IEntranceClientFacade(_arg_1);
         },function():IEntranceClientFacade
         {
            return Nosum.facade;
         });
         osgi.injectService(IPanelView,function(_arg_1:Object):void
         {
            UserEmailAndPasswordModel.panelView = IPanelView(_arg_1);
         },function():IPanelView
         {
            return UserEmailAndPasswordModel.panelView;
         });
         osgi.injectService(ISocialNetworkPanelService,function(_arg_1:Object):void
         {
            UserEmailAndPasswordModel.socialNetworkPanelService = ISocialNetworkPanelService(_arg_1);
         },function():ISocialNetworkPanelService
         {
            return UserEmailAndPasswordModel.socialNetworkPanelService;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            UserEmailAndPasswordModel.bezyvesif = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return UserEmailAndPasswordModel.bezyvesif;
         });
         osgi.injectService(IEntranceClientFacade,function(_arg_1:Object):void
         {
            Mirakiqiq.clientFacade = IEntranceClientFacade(_arg_1);
         },function():IEntranceClientFacade
         {
            return Mirakiqiq.clientFacade;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            LinkExternalLoginForm.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return LinkExternalLoginForm.localeService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            LinkExternalLoginForm.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return LinkExternalLoginForm.display;
         });
         osgi.injectService(IValidateService,function(_arg_1:Object):void
         {
            LinkExternalLoginForm.validateService = IValidateService(_arg_1);
         },function():IValidateService
         {
            return LinkExternalLoginForm.validateService;
         });
         osgi.injectService(IPasswordParamsService,function(_arg_1:Object):void
         {
            ChangeUidForm.passwordParamsService = IPasswordParamsService(_arg_1);
         },function():IPasswordParamsService
         {
            return ChangeUidForm.passwordParamsService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ChangeUidForm.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ChangeUidForm.localeService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            ChangeUidForm.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return ChangeUidForm.display;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            ChangeUidInputField.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return ChangeUidForm.display;
         });
         osgi.injectService(IValidateService,function(_arg_1:Object):void
         {
            ChangeUidInputField.validateService = IValidateService(_arg_1);
         },function():IValidateService
         {
            return ChangeUidInputField.validateService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            LoginForm.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return LoginForm.display;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            LoginForm.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return LoginForm.storageService;
         });
         osgi.injectService(IValidateService,function(_arg_1:Object):void
         {
            LoginForm.validateService = IValidateService(_arg_1);
         },function():IValidateService
         {
            return LoginForm.validateService;
         });
         osgi.injectService(IEntranceClientFacade,function(_arg_1:Object):void
         {
            LoginModel.entranceClientFacade = IEntranceClientFacade(_arg_1);
         },function():IEntranceClientFacade
         {
            return LoginModel.entranceClientFacade;
         });
         osgi.injectService(IValidateService,function(_arg_1:Object):void
         {
            PasswordRestoreForm.validateService = IValidateService(_arg_1);
         },function():IValidateService
         {
            return PasswordRestoreForm.validateService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            RegistrationCommonElementsSection.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return RegistrationCommonElementsSection.display;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            RegistrationCommonElementsSection.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return RegistrationCommonElementsSection.localeService;
         });
         osgi.injectService(IPasswordParamsService,function(_arg_1:Object):void
         {
            RegistrationCommonElementsSection.passwordParamsService = IPasswordParamsService(_arg_1);
         },function():IPasswordParamsService
         {
            return RegistrationCommonElementsSection.passwordParamsService;
         });
         osgi.injectService(IValidateService,function(_arg_1:Object):void
         {
            RegistrationCommonElementsSection.validateService = IValidateService(_arg_1);
         },function():IValidateService
         {
            return RegistrationCommonElementsSection.validateService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            RegistrationForm.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return RegistrationForm.localeService;
         });
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new Nosum(),Vector.<Class>([Tezyl,IObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(Meca,Mewebovu);
         modelRegisterAdapt.registerEvents(Meca,Leku);
         modelRegister.add(new Mirakiqiq(),Vector.<Class>([Kefij,Meca,IObjectLoadListener]));
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

