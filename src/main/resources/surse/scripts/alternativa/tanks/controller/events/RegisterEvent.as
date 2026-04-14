package alternativa.tanks.controller.events
{
   import flash.events.Event;
   
   public class RegisterEvent extends Event
   {
      
      public static const REGISTER_AFTER_CAPTCHA_CHECKED:String = "RegisterEvent.REGISTER_AFTER_CAPTCHA_CHECKED";
      
      public static const CHECK_CAPTCHA_AND_REGISTER:String = "RegisterEvent.CHECK_CAPTCHA_AND_REGISTER";
      
      private var _callsign:String;
      
      private var _email:String;
      
      private var _password:String;
      
      private var _rememberMe:Boolean;
      
      private var _realName:String;
      
      private var _idNumber:String;
      
      private var _captchaAnswer:String;
      
      public function RegisterEvent(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Boolean, _arg_6:String, _arg_7:String, _arg_8:String)
      {
         super(_arg_1);
         this._callsign = _arg_2;
         this._email = _arg_3;
         this._password = _arg_4;
         this._rememberMe = _arg_5;
         this._realName = _arg_6;
         this._idNumber = _arg_7;
         this._captchaAnswer = _arg_8;
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
      
      public function get realName() : String
      {
         return this._realName;
      }
      
      public function get idNumber() : String
      {
         return this._idNumber;
      }
      
      public function get captchaAnswer() : String
      {
         return this._captchaAnswer;
      }
      
      public function get email() : String
      {
         return this._email;
      }
   }
}

