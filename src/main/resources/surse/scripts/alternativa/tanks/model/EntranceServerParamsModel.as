package alternativa.tanks.model
{
   import org.robotlegs.mvcs.Actor;
   
   public class EntranceServerParamsModel extends Actor
   {
      
      private var _inviteEnabled:Boolean;
      
      private var _serverHalt:Boolean;
      
      private var _serverFrozen:Boolean;
      
      private var _standAloneCaptchaEnabled:Boolean;
      
      private var _antiAddictionEnabled:Boolean;
      
      private var _registrationCaptchaEnabled:Boolean;
      
      private var _loginCaptchaEnabled:Boolean;
      
      private var _inGameRegistration:Boolean;
      
      private var _skipRegistrationEnabled:Boolean;
      
      private var _registrationThroughEmail:Boolean;
      
      public function EntranceServerParamsModel()
      {
         super();
      }
      
      public function get inviteEnabled() : Boolean
      {
         return this._inviteEnabled;
      }
      
      public function set inviteEnabled(_arg_1:Boolean) : void
      {
         this._inviteEnabled = _arg_1;
      }
      
      public function get serverHalt() : Boolean
      {
         return this._serverHalt;
      }
      
      public function set serverHalt(_arg_1:Boolean) : void
      {
         this._serverHalt = _arg_1;
      }
      
      public function get serverFrozen() : Boolean
      {
         return this._serverFrozen;
      }
      
      public function set serverFrozen(_arg_1:Boolean) : void
      {
         this._serverFrozen = _arg_1;
      }
      
      public function get standAloneCaptchaEnabled() : Boolean
      {
         return this._standAloneCaptchaEnabled;
      }
      
      public function set standAloneCaptchaEnabled(_arg_1:Boolean) : void
      {
         this._standAloneCaptchaEnabled = _arg_1;
      }
      
      public function get antiAddictionEnabled() : Boolean
      {
         return this._antiAddictionEnabled;
      }
      
      public function set antiAddictionEnabled(_arg_1:Boolean) : void
      {
         this._antiAddictionEnabled = _arg_1;
      }
      
      public function get registrationCaptchaEnabled() : Boolean
      {
         return this._registrationCaptchaEnabled;
      }
      
      public function set registrationCaptchaEnabled(_arg_1:Boolean) : void
      {
         this._registrationCaptchaEnabled = _arg_1;
      }
      
      public function get inGameRegistration() : Boolean
      {
         return this._inGameRegistration;
      }
      
      public function set inGameRegistration(_arg_1:Boolean) : void
      {
         this._inGameRegistration = _arg_1;
      }
      
      public function get loginCaptchaEnabled() : Boolean
      {
         return this._loginCaptchaEnabled;
      }
      
      public function set loginCaptchaEnabled(_arg_1:Boolean) : void
      {
         this._loginCaptchaEnabled = _arg_1;
      }
      
      public function get skipRegistrationEnabled() : Boolean
      {
         return this._skipRegistrationEnabled;
      }
      
      public function set skipRegistrationEnabled(_arg_1:Boolean) : void
      {
         this._skipRegistrationEnabled = _arg_1;
      }
      
      public function get registrationThroughEmail() : Boolean
      {
         return this._registrationThroughEmail;
      }
      
      public function set registrationThroughEmail(_arg_1:Boolean) : void
      {
         this._registrationThroughEmail = _arg_1;
      }
   }
}

