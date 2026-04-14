package alternativa.tanks.servermodels.registartion.password
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.IEntranceClientFacade;
   import alternativa.tanks.service.IPasswordParamsService;
   import alternativa.tanks.tracker.ITrackerService;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.entrance.model.entrance.registration.IRegistrationModelBase;
   import projects.tanks.client.entrance.model.entrance.registration.RegistrationModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import services.alertservice.AlertAnswer;
   import utils.preview.IImageResource;
   
   public class PasswordRegistrationModel extends RegistrationModelBase implements IRegistrationModelBase, IPasswordRegistration, ObjectLoadListener, IImageResource
   {
      
      [Inject]
      public static var facade:IEntranceClientFacade;
      
      [Inject]
      public static var passwordParamsService:IPasswordParamsService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      public function PasswordRegistrationModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         passwordParamsService.minPasswordLength = getInitParam().minPasswordLength;
         passwordParamsService.maxPasswordLength = getInitParam().maxPasswordLength;
      }
      
      public function enteredUidIsFree() : void
      {
         facade.ropiqybuc();
      }
      
      public function anchorRegistration() : void
      {
      }
      
      public function enteredUidIsBusy(_arg_1:Vector.<String>) : void
      {
         facade.cuvanosin(_arg_1);
      }
      
      public function enteredUidIsIncorrect() : void
      {
         facade.lofoju();
      }
      
      public function passwordIsIncorrect() : void
      {
         facade.gonele();
      }
      
      public function registrationFailed() : void
      {
         alertService.showAlert("Registration failed. Try again.",Vector.<String>([localeService.getText(AlertAnswer.OK)]));
      }
      
      public function register(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:Boolean, _arg_5:String, _arg_6:String, _arg_7:String, _arg_8:String) : void
      {
         server.register(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6,_arg_7,_arg_8);
      }
      
      public function checkCallsign(_arg_1:String) : void
      {
         server.checkUid(_arg_1);
      }
      
      public function setPreviewResource(_arg_1:ImageResource) : void
      {
         if(facade != null)
         {
            facade.magyj = _arg_1.data;
         }
      }
   }
}

