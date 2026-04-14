package alternativa.tanks.view
{
   import alternativa.tanks.controller.events.CaptchaAnswerIsIncorrectEvent;
   import alternativa.tanks.controller.events.EntranceErrorEvent;
   import alternativa.tanks.controller.events.showform.ShowBlockValidationAlertEvent;
   import alternativa.tanks.controller.events.showform.ShowChangeEmailAndPasswordFormEvent;
   import alternativa.tanks.controller.events.showform.ShowConfirmEmailAlertEvent;
   import alternativa.tanks.controller.events.showform.ShowExternalEntranceFormEvent;
   import alternativa.tanks.controller.events.showform.ShowFormEvent;
   import alternativa.tanks.controller.events.showform.ShowLoginFormEvent;
   import alternativa.tanks.controller.events.showform.ShowPartnersFormEvent;
   import alternativa.tanks.controller.events.showform.ShowRegistrationFormEvent;
   import alternativa.tanks.view.forms.primitives.Alert;
   import alternativa.tanks.view.layers.EntranceView;
   import org.robotlegs.core.IInjector;
   import org.robotlegs.mvcs.Mediator;
   
   public class EntranceViewMediator extends Mediator
   {
      
      [Inject]
      public var layer:EntranceView;
      
      [Inject]
      public var injector:IInjector;
      
      public function EntranceViewMediator()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         this.injector.injectInto(this.layer);
         addContextListener(ShowRegistrationFormEvent.SHOW,this.onShowRegistrationForm,ShowRegistrationFormEvent);
         addContextListener(ShowChangeEmailAndPasswordFormEvent.SHOW,this.onShowChangeEmailAndPassword,ShowChangeEmailAndPasswordFormEvent);
         addContextListener(ShowLoginFormEvent.SHOW,this.onShowLoginForm,ShowLoginFormEvent);
         addContextListener(ShowConfirmEmailAlertEvent.SHOW,this.onShowConfirmEmailStatusAlert,ShowConfirmEmailAlertEvent);
         addContextListener(CaptchaAnswerIsIncorrectEvent.EVENT_TYPE,this.onCaptchaFailed);
         addContextListener(ShowFormEvent.SHOW_RESTORE_PASSWORD_FORM,this.onShowRestorePasswordForm,ShowFormEvent);
         addContextListener(ShowFormEvent.SHOW_INVITE_FORM,this.onShowInviteForm,ShowFormEvent);
         addContextListener(ShowFormEvent.SHOW_STAND_ALONE_CAPTCHA,this.onShowStandAloneCaptcha,ShowFormEvent);
         addContextListener(ShowFormEvent.SHOW_IFENG_FORM,this.onShowIfeng,ShowFormEvent);
         addContextListener(ShowFormEvent.SHOW_RECOVERY_HASH_IS_WRONG_ALERT,this.onShowRecoveryHashIsWrongAlert,ShowFormEvent);
         addContextListener(ShowPartnersFormEvent.REGISTRATION_FORM,this.onShowPartnersRegistration,ShowPartnersFormEvent);
         addContextListener(ShowPartnersFormEvent.LOGIN_FORM,this.onShowPartnersLogin,ShowPartnersFormEvent);
         addContextListener(ShowBlockValidationAlertEvent.YOU_WERE_KICKED,this.onShowKickAlert,ShowBlockValidationAlertEvent);
         addContextListener(ShowBlockValidationAlertEvent.YOU_WERE_BLOCKED,this.onShowBlockAlert,ShowBlockValidationAlertEvent);
         addContextListener(ShowExternalEntranceFormEvent.REGISTRATION_FORM,this.onShowExternalRegistrationForm,ShowExternalEntranceFormEvent);
         addContextListener(ShowExternalEntranceFormEvent.LOGIN_FORM,this.onShowExternalLoginForm,ShowExternalEntranceFormEvent);
         addContextListener(EntranceErrorEvent.SERVER_FROZEN,this.onServerFrozen);
         addContextListener(EntranceErrorEvent.SERVER_HALT,this.onServerHalt);
      }
      
      private function onServerFrozen(_arg_1:EntranceErrorEvent) : void
      {
         this.layer.showAlertServerIsFrozen();
      }
      
      private function onServerHalt(_arg_1:EntranceErrorEvent) : void
      {
         this.layer.showAlertServerIsHalt();
      }
      
      private function onShowBlockAlert(_arg_1:ShowBlockValidationAlertEvent) : void
      {
         this.layer.showBlockAlert(_arg_1.reason);
      }
      
      private function onShowKickAlert(_arg_1:ShowBlockValidationAlertEvent) : void
      {
         this.layer.showKickAlert(_arg_1.reason,_arg_1.minutes,_arg_1.hours,_arg_1.days);
      }
      
      private function onCaptchaFailed(_arg_1:CaptchaAnswerIsIncorrectEvent) : void
      {
         this.layer.showErrorWindow(Alert.CAPTCHA_INCORRECT);
      }
      
      private function onShowChangeEmailAndPassword(_arg_1:ShowChangeEmailAndPasswordFormEvent) : void
      {
         this.layer.showChangeEmailAndPassword(_arg_1.email);
      }
      
      private function onShowRegistrationForm(_arg_1:ShowRegistrationFormEvent) : void
      {
         this.layer.showRegistrationForm(_arg_1.backgroundImage,_arg_1.captchaEnabled,_arg_1.antiAddictionEnabled,_arg_1.skipRegistrationEnabled,_arg_1.goToLoginPageEnabled,_arg_1.registrationThroughEmail);
      }
      
      private function onShowLoginForm(_arg_1:ShowLoginFormEvent) : void
      {
         this.layer.showLoginForm(_arg_1.uid,_arg_1.registrationEnabled,_arg_1.loginCaptchaEnabled,_arg_1.password);
      }
      
      private function onShowConfirmEmailStatusAlert(_arg_1:ShowConfirmEmailAlertEvent) : void
      {
         this.layer.showConfirmEmailStatusAlert(_arg_1.status);
      }
      
      private function onShowStandAloneCaptcha(_arg_1:ShowFormEvent) : void
      {
         this.layer.showStandAloneCaptcha();
      }
      
      private function onShowInviteForm(_arg_1:ShowFormEvent) : void
      {
         this.layer.showInviteForm();
      }
      
      private function onShowIfeng(_arg_1:ShowFormEvent) : void
      {
         this.layer.showIfengForm();
      }
      
      private function onShowPartnersRegistration(_arg_1:ShowPartnersFormEvent) : void
      {
         this.layer.showPartnersRegistrationForm(_arg_1.backgroundImage,_arg_1.allowExternalLogin);
      }
      
      private function onShowPartnersLogin(_arg_1:ShowPartnersFormEvent) : void
      {
         this.layer.showPartnerLoginForm(_arg_1.backgroundImage,_arg_1.loginCaptchaEnabled);
      }
      
      private function onShowRestorePasswordForm(_arg_1:ShowFormEvent) : void
      {
         this.layer.showRestorePasswordForm();
      }
      
      private function onShowRecoveryHashIsWrongAlert(_arg_1:ShowFormEvent) : void
      {
         this.layer.showRecoveryHashIsWrongAlert();
      }
      
      private function onShowExternalRegistrationForm(_arg_1:ShowExternalEntranceFormEvent) : void
      {
         this.layer.showExternalRegistrationForm(_arg_1.socialNetworkId);
      }
      
      private function onShowExternalLoginForm(_arg_1:ShowExternalEntranceFormEvent) : void
      {
         this.layer.showExternalLoginForm(_arg_1.socialNetworkId,_arg_1.presetCallsign,_arg_1.loginCaptchaEnabled);
      }
   }
}

