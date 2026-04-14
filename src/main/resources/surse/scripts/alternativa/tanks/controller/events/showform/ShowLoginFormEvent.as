package alternativa.tanks.controller.events.showform
{
   import flash.events.Event;
   
   public class ShowLoginFormEvent extends Event
   {
      
      public static const SHOW:String = "ShowLoginFormEvent.SHOW";
      
      private var _uid:String;
      
      private var _registrationEnabled:Boolean;
      
      private var _loginCaptchaEnabled:Boolean;
      
      private var _password:String;
      
      public function ShowLoginFormEvent(_arg_1:String, _arg_2:Boolean, _arg_3:Boolean, _arg_4:String = null)
      {
         super(SHOW);
         this._uid = _arg_1;
         this._registrationEnabled = _arg_2;
         this._loginCaptchaEnabled = _arg_3;
         this._password = _arg_4;
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function get registrationEnabled() : Boolean
      {
         return this._registrationEnabled;
      }
      
      public function get loginCaptchaEnabled() : Boolean
      {
         return this._loginCaptchaEnabled;
      }
      
      public function get password() : String
      {
         return this._password;
      }
   }
}

