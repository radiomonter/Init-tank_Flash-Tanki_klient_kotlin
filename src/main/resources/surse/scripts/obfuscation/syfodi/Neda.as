package obfuscation.syfodi
{
   import alternativa.tanks.controller.events.AuthorizationFailedEvent;
   import alternativa.tanks.controller.events.CallsignCheckResultEvent;
   import alternativa.tanks.controller.events.CaptchaAnswerIsIncorrectEvent;
   import alternativa.tanks.controller.events.EmailCheckResultEvent;
   import alternativa.tanks.controller.events.EntranceErrorEvent;
   import alternativa.tanks.controller.events.IfengEvent;
   import alternativa.tanks.controller.events.InviteCheckResultEvent;
   import alternativa.tanks.controller.events.NavigationEvent;
   import alternativa.tanks.controller.events.ParseUrlParamsEvent;
   import alternativa.tanks.controller.events.PartnersEvent;
   import alternativa.tanks.controller.events.PasswordRestoreResultEvent;
   import alternativa.tanks.controller.events.RegistrationFailedEvent;
   import alternativa.tanks.controller.events.SetPasswordChangeResultEvent;
   import alternativa.tanks.controller.events.showform.ShowBlockValidationAlertEvent;
   import alternativa.tanks.controller.events.showform.ShowChangeEmailAndPasswordFormEvent;
   import alternativa.tanks.controller.events.showform.ShowConfirmEmailAlertEvent;
   import alternativa.tanks.controller.events.showform.ShowFormEvent;
   import alternativa.tanks.controller.events.showform.ShowLoginFormEvent;
   import alternativa.tanks.controller.events.socialnetwork.NavigationExternalEvent;
   import alternativa.tanks.model.EntranceServerParamsModel;
   import alternativa.tanks.model.EntranceUrlParamsModel;
   import alternativa.tanks.model.RegistrationBackgroundModel;
   import alternativa.tanks.service.IEntranceClientFacade;
   import alternativa.tanks.service.Tud;
   import flash.display.BitmapData;
   import org.robotlegs.base.ContextEvent;
   import org.robotlegs.mvcs.Actor;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   import projects.tanks.client.entrance.model.entrance.emailconfirm.ConfirmEmailStatus;
   
   public class Neda extends Actor implements IEntranceClientFacade
   {
      
      [Inject]
      public var cesab:RegistrationBackgroundModel;
      
      [Inject]
      public var serverParams:EntranceServerParamsModel;
      
      [Inject]
      public var paramsModel:EntranceUrlParamsModel;
      
      [Inject]
      public var captchaService:Tud;
      
      public function Neda()
      {
         super();
      }
      
      public function set magyj(_arg_1:BitmapData) : void
      {
         this.cesab.rgbData = _arg_1;
      }
      
      public function set fef(_arg_1:IGameObject) : void
      {
         dispatch(new ParseUrlParamsEvent());
      }
      
      public function wrongPassword() : void
      {
         dispatch(new AuthorizationFailedEvent(AuthorizationFailedEvent.PASSWORD_AUTHORIZATION_FAILED));
      }
      
      public function pojelyhuj() : void
      {
         dispatch(new AuthorizationFailedEvent(AuthorizationFailedEvent.PASSWORD_EXTERNAL_AUTHORIZATION_FAILED));
      }
      
      public function externalLinkAlreadyExists() : void
      {
         dispatch(new AuthorizationFailedEvent(AuthorizationFailedEvent.EXTERNAL_LINK_ALREADY_EXISTS));
      }
      
      public function externalValidationFailed() : void
      {
         dispatch(new AuthorizationFailedEvent(AuthorizationFailedEvent.EXTERNAL_VALIDATION_FAILED));
      }
      
      public function inviteAlreadyActivated(_arg_1:String) : void
      {
         dispatch(new ShowLoginFormEvent(_arg_1,false,false));
      }
      
      public function heguqe() : void
      {
         dispatch(new ShowLoginFormEvent("",true,false));
      }
      
      public function goToLoginForm() : void
      {
         dispatch(new NavigationEvent(NavigationEvent.GO_TO_LOGIN_FORM));
      }
      
      public function citym(_arg_1:String) : void
      {
         dispatch(new NavigationExternalEvent(NavigationExternalEvent.GO_TO_EXTERNAL_REGISTRATION_FORM,_arg_1));
      }
      
      public function dityv(_arg_1:String) : void
      {
         dispatch(new NavigationExternalEvent(NavigationExternalEvent.GO_TO_EXTERNAL_LOGIN_FORM,_arg_1));
      }
      
      public function ropiqybuc() : void
      {
         dispatch(new CallsignCheckResultEvent(CallsignCheckResultEvent.CALLSIGN_IS_FREE));
      }
      
      public function cuvanosin(_arg_1:Vector.<String>) : void
      {
         var _local_2:CallsignCheckResultEvent = new CallsignCheckResultEvent(CallsignCheckResultEvent.CALLSIGN_IS_BUSY);
         _local_2.freeUids = _arg_1;
         dispatch(_local_2);
      }
      
      public function lofoju() : void
      {
         dispatch(new CallsignCheckResultEvent(CallsignCheckResultEvent.CALLSIGN_IS_INCORRECT));
      }
      
      public function inviteNotFound() : void
      {
         dispatch(new InviteCheckResultEvent(InviteCheckResultEvent.INVITE_CODE_DOES_NOT_EXIST));
      }
      
      public function gezoculir() : void
      {
         dispatch(new ContextEvent(ContextEvent.SHUTDOWN));
      }
      
      public function set inviteEnabled(_arg_1:Boolean) : void
      {
         this.serverParams.inviteEnabled = _arg_1;
      }
      
      public function set registrationThroughEmail(_arg_1:Boolean) : void
      {
         this.serverParams.registrationThroughEmail = _arg_1;
      }
      
      public function tykivaq() : void
      {
         dispatch(new PasswordRestoreResultEvent(PasswordRestoreResultEvent.RESTORE_MESSAGE_HAVE_BEEN_SENT));
      }
      
      public function kakeroge() : void
      {
         dispatch(new PasswordRestoreResultEvent(PasswordRestoreResultEvent.EMAIL_DOES_NOT_EXISTS));
      }
      
      public function cigekisuz(_arg_1:String) : void
      {
         dispatch(new ShowChangeEmailAndPasswordFormEvent(_arg_1));
      }
      
      public function cowolog() : void
      {
         dispatch(new ShowFormEvent(ShowFormEvent.SHOW_RECOVERY_HASH_IS_WRONG_ALERT));
      }
      
      public function captchaUpdated(_arg_1:CaptchaLocation, _arg_2:Vector.<int>) : void
      {
         this.captchaService.neby(_arg_2,_arg_1);
      }
      
      public function set antiAddictionEnabled(_arg_1:Boolean) : void
      {
         this.serverParams.antiAddictionEnabled = _arg_1;
      }
      
      public function set pitycodaq(_arg_1:Vector.<CaptchaLocation>) : void
      {
         this.serverParams.standAloneCaptchaEnabled = _arg_1.indexOf(CaptchaLocation.CLIENT_STARTUP) != -1;
         this.serverParams.registrationCaptchaEnabled = _arg_1.indexOf(CaptchaLocation.REGISTER_FORM) != -1;
         this.serverParams.loginCaptchaEnabled = _arg_1.indexOf(CaptchaLocation.LOGIN_FORM) != -1;
      }
      
      public function setPasswordChangeResult(_arg_1:Boolean, _arg_2:String) : void
      {
         dispatch(new SetPasswordChangeResultEvent(_arg_1,_arg_2));
      }
      
      public function confirmEmailStatus(_arg_1:ConfirmEmailStatus) : void
      {
         dispatch(new ShowConfirmEmailAlertEvent(_arg_1));
      }
      
      public function visizecub(_arg_1:String) : void
      {
         dispatch(new ShowBlockValidationAlertEvent(ShowBlockValidationAlertEvent.YOU_WERE_BLOCKED,_arg_1));
      }
      
      public function mimycaleg(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int) : void
      {
         dispatch(new ShowBlockValidationAlertEvent(ShowBlockValidationAlertEvent.YOU_WERE_KICKED,_arg_1,_arg_2,_arg_3,_arg_4));
      }
      
      public function captchaAnswerCorrect(_arg_1:CaptchaLocation) : void
      {
         this.captchaService.gimuqini(_arg_1);
      }
      
      public function bobawu(_arg_1:CaptchaLocation, _arg_2:Vector.<int>) : void
      {
         dispatch(new CaptchaAnswerIsIncorrectEvent());
         this.captchaService.neby(_arg_2,_arg_1);
      }
      
      public function qilesyke() : void
      {
         dispatch(new IfengEvent(IfengEvent.WRONG_URL_PARAMS));
      }
      
      public function tyrinakis() : void
      {
         dispatch(new IfengEvent(IfengEvent.REGISTRATION_FAILED));
      }
      
      public function myvypiri() : void
      {
         dispatch(new IfengEvent(IfengEvent.START_REGISTRATION));
      }
      
      public function nokul() : void
      {
         dispatch(new PartnersEvent(PartnersEvent.START_REGISTRATION));
      }
      
      public function komujojo() : void
      {
         dispatch(new AuthorizationFailedEvent(AuthorizationFailedEvent.PARTNER_LINK_ALREADY_EXISTS));
      }
      
      public function gotamure() : void
      {
         dispatch(new AuthorizationFailedEvent(AuthorizationFailedEvent.PARTNER_PASSWORD_AUTHORIZATION_FAILED));
      }
      
      public function gonele() : void
      {
         dispatch(new RegistrationFailedEvent(RegistrationFailedEvent.PASSWORD_IS_INCORRECT));
      }
      
      public function serverHalt() : void
      {
         if(!this.serverParams.serverHalt)
         {
            this.serverParams.serverHalt = true;
            dispatch(new EntranceErrorEvent(EntranceErrorEvent.SERVER_HALT));
         }
      }
      
      public function les() : void
      {
         dispatch(new EmailCheckResultEvent(EmailCheckResultEvent.EMAIL_IS_INVALID));
      }
      
      public function emailIsBusy() : void
      {
         dispatch(new EmailCheckResultEvent(EmailCheckResultEvent.EMAIL_IS_BUSY));
      }
      
      public function tujy() : void
      {
         dispatch(new EmailCheckResultEvent(EmailCheckResultEvent.EMAIL_IS_FREE));
      }
      
      public function emailDomainIsForbidden() : void
      {
         dispatch(new EmailCheckResultEvent(EmailCheckResultEvent.EMAIL_DOMAIN_IS_FORBIDDEN));
      }
      
      public function hedahywer(_arg_1:String) : void
      {
         this.paramsModel.passedCallsign = _arg_1;
         this.goToLoginForm();
      }
   }
}

