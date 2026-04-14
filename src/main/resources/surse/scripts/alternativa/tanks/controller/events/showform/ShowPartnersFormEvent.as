package alternativa.tanks.controller.events.showform
{
   import flash.display.Bitmap;
   import flash.events.Event;
   
   public class ShowPartnersFormEvent extends Event
   {
      
      public static const REGISTRATION_FORM:String = "ShowPartnersFormEvent.REGISTRATION_FORM";
      
      public static const LOGIN_FORM:String = "ShowPartnersFormEvent.LOGIN_FORM";
      
      private var _loginCaptchaEnabled:Boolean;
      
      private var _allowExternalLogin:Boolean;
      
      private var _backgroundImage:Bitmap;
      
      public function ShowPartnersFormEvent(_arg_1:String, _arg_2:Bitmap, _arg_3:Boolean = true, _arg_4:Boolean = false)
      {
         super(_arg_1);
         this._backgroundImage = _arg_2;
         this._allowExternalLogin = _arg_3;
         this._loginCaptchaEnabled = _arg_4;
      }
      
      public function get allowExternalLogin() : Boolean
      {
         return this._allowExternalLogin;
      }
      
      public function get backgroundImage() : Bitmap
      {
         return this._backgroundImage;
      }
      
      override public function clone() : Event
      {
         return new ShowPartnersFormEvent(this.type,this.backgroundImage,this.allowExternalLogin,this.loginCaptchaEnabled);
      }
      
      public function get loginCaptchaEnabled() : Boolean
      {
         return this._loginCaptchaEnabled;
      }
   }
}

