package alternativa.tanks.controller.events
{
   import flash.events.Event;
   
   public class LoginEvent extends Event
   {
      
      public static const CHECK_CAPTCHA_AND_LOGIN:String = "LoginEvent.CHECK_CAPTCHA_AND_LOGIN";
      
      public static const LOGIN_AFTER_CAPTCHA_CHECKED:String = "LoginEvent.LOGIN_AFTER_CAPTCHA_CHECKED";
      
      private var _callsign:String;
      
      private var _password:String;
      
      private var _rememberMe:Boolean;
      
      private var _captchaAnswer:String;
      
      public function LoginEvent(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:Boolean, _arg_5:String)
      {
         super(_arg_1);
         this._callsign = _arg_2;
         this._password = _arg_3;
         this._rememberMe = _arg_4;
         this._captchaAnswer = _arg_5;
      }
      
      public function get callsign() : String
      {
         return this._callsign;
      }
      
      public function get password() : String
      {
         return this._password;
      }
      
      public function get rememberMe() : Boolean
      {
         return this._rememberMe;
      }
      
      public function get captchaAnswer() : String
      {
         return this._captchaAnswer;
      }
   }
}

