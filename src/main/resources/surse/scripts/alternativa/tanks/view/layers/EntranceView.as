package alternativa.tanks.view.layers
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.utils.TimeUtil;
   import alternativa.tanks.view.StandAloneCaptchaForm;
   import alternativa.tanks.view.forms.ExternalRegistrationForm;
   import alternativa.tanks.view.forms.LinkExternalLoginForm;
   import alternativa.tanks.view.forms.LoginForm;
   import alternativa.tanks.view.forms.Nacufus;
   import alternativa.tanks.view.forms.PasswordRestoreForm;
   import alternativa.tanks.view.forms.RegistrationForm;
   import alternativa.tanks.view.forms.primitives.Alert;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import forms.events.AlertEvent;
   import org.robotlegs.core.IInjector;
   import projects.tanks.client.entrance.model.entrance.emailconfirm.ConfirmEmailStatus;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import services.alertservice.AlertAnswer;
   
   public class EntranceView extends Sprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public var injector:IInjector;
      
      private var alert:Alert;
      
      private var _currentView:DisplayObject;
      
      private var _rememberCallsign:String = "";
      
      private var _rememberPassword:String = "";
      
      private var _rememberVerificationPassword:String = "";
      
      private var _emailText:String = "";
      
      public function EntranceView()
      {
         super();
      }
      
      public function showInviteForm() : void
      {
         this.changeViewTo(new Nacufus());
      }
      
      public function showLoginForm(_arg_1:String, _arg_2:Boolean, _arg_3:Boolean, _arg_4:String = null) : void
      {
         var _local_5:LoginForm = this.injector.instantiate(LoginForm);
         _local_5.callsign = _arg_1;
         if(Boolean(_arg_4))
         {
            _local_5.password = _arg_4;
         }
         _local_5.enableRegistration = _arg_2;
         this.changeViewTo(_local_5);
         if(_arg_3)
         {
            _local_5.showCaptchaSection();
         }
      }
      
      public function showAlertServerIsHalt() : void
      {
         this.removeAllForms();
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_SERVER_IS_RESTARTING_LOGIN_TEXT),Vector.<String>([localeService.getText(AlertAnswer.OK)]));
      }
      
      public function showAlertServerIsFrozen() : void
      {
      }
      
      public function showExternalLoginForm(_arg_1:String, _arg_2:String, _arg_3:Boolean) : void
      {
         var _local_4:LinkExternalLoginForm = this.injector.instantiate(LinkExternalLoginForm);
         _local_4.callsign = _arg_2;
         _local_4.socialNetworkId = _arg_1;
         this.changeViewTo(_local_4);
         if(_arg_3)
         {
            _local_4.showCaptchaSection();
         }
      }
      
      public function showExternalRegistrationForm(_arg_1:String) : void
      {
         this.injector.mapValue(EntranceView,this);
         var _local_2:ExternalRegistrationForm = this.injector.instantiate(ExternalRegistrationForm);
         this.injector.injectInto(_local_2);
         this.changeViewTo(_local_2);
         this.injector.unmap(EntranceView);
      }
      
      public function showRegistrationForm(_arg_1:Bitmap, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean) : void
      {
         this.injector.mapValue(EntranceView,this);
         var _local_7:RegistrationForm = new RegistrationForm(_arg_6,_arg_2,_arg_3,_arg_1,_arg_4,_arg_5,this._rememberCallsign,this._rememberPassword,this._rememberVerificationPassword,this._emailText);
         this.injector.injectInto(_local_7);
         this.changeViewTo(_local_7);
         this.injector.unmap(EntranceView);
      }
      
      public function showChangeEmailAndPassword(_arg_1:String) : void
      {
      }
      
      public function showRecoveryHashIsWrongAlert() : void
      {
      }
      
      private function onWrongChangePasswordAlertButtonPressed(_arg_1:AlertEvent) : void
      {
      }
      
      public function showRestorePasswordForm() : void
      {
         this.changeViewTo(this.injector.instantiate(PasswordRestoreForm));
      }
      
      public function showStandAloneCaptcha() : void
      {
         this.changeViewTo(this.injector.instantiate(StandAloneCaptchaForm));
      }
      
      public function showIfengForm() : void
      {
      }
      
      public function showPartnersRegistrationForm(_arg_1:Bitmap, _arg_2:Boolean) : void
      {
      }
      
      public function showPartnerLoginForm(_arg_1:Bitmap, _arg_2:Boolean) : void
      {
      }
      
      private function changeViewTo(_arg_1:DisplayObject) : void
      {
         var _local_2:RegistrationForm = null;
         if(Boolean(this._currentView))
         {
            _local_2 = this._currentView as RegistrationForm;
            if(_local_2 != null)
            {
               this._rememberCallsign = _local_2.callsign;
               this._rememberPassword = _local_2.password;
               this._rememberVerificationPassword = _local_2.verificationPassword;
               this._emailText = _local_2.emailText;
            }
            removeChild(this._currentView);
         }
         this._currentView = _arg_1;
         addChild(this._currentView);
      }
      
      public function removeAllForms() : void
      {
         while(numChildren > 0)
         {
            removeChildAt(0);
         }
      }
      
      public function get currentView() : DisplayObject
      {
         return this._currentView;
      }
      
      public function showConfirmEmailStatusAlert(_arg_1:ConfirmEmailStatus) : void
      {
         this.alert = new Alert();
         switch(_arg_1)
         {
            case ConfirmEmailStatus.ERROR:
               this.alert = new Alert(Alert.ERROR_CONFIRM_EMAIL);
               break;
            case ConfirmEmailStatus.OK:
               this.alert = new Alert(Alert.ALERT_CONFIRM_EMAIL);
               break;
            case ConfirmEmailStatus.OK_EXISTS:
               this.alert = new Alert(Alert.ALERT_CONFIRM_EMAIL);
         }
         this.alert.addEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.goToLoginAfterAlertClosed);
         this.changeViewTo(this.alert);
      }
      
      public function showErrorWindow(_arg_1:int) : void
      {
         addChild(new Alert(_arg_1));
      }
      
      public function showBlockAlert(_arg_1:String) : void
      {
         this.alert = new Alert();
         this.alert.addEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.goToLoginAfterAlertClosed);
         this.alert.showAlert(_arg_1,Vector.<String>([AlertAnswer.OK]));
         this.changeViewTo(this.alert);
      }
      
      private function goToLoginAfterAlertClosed(_arg_1:AlertEvent) : void
      {
         this.alert.removeEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.goToLoginAfterAlertClosed);
         this.showLoginForm("",true,false);
      }
      
      public function showKickAlert(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int) : void
      {
         this.alert = new Alert();
         var _local_5:String = localeService.getText(TextConst.STRING_YOU_WERE_KICKED_LOGIN_TEXT);
         this.alert.addEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.goToLoginAfterAlertClosed);
         _local_5 = _local_5.replace("{0}",_arg_1);
         _local_5 = _local_5.replace("{1}",TimeUtil.getLocalazedPeriodForKickAlert(localeService.language.toLowerCase(),_arg_2,_arg_3,_arg_4));
         this.alert.showAlert(_local_5,Vector.<String>([AlertAnswer.OK]));
         this.changeViewTo(this.alert);
      }
   }
}

