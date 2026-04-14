package alternativa.tanks.controller.events.showform
{
   import flash.display.Bitmap;
   import flash.events.Event;
   
   public class ShowRegistrationFormEvent extends Event
   {
      
      public static const SHOW:String = "ShowRegistrationFormEvent.SHOW";
      
      private var _antiAddictionEnabled:Boolean;
      
      private var _captchaEnabled:Boolean;
      
      private var _skipRegistrationEnabled:Boolean;
      
      private var _goToLoginPageEnabled:Boolean;
      
      private var _backgroundImage:Bitmap;
      
      private var _registrationThroughEmail:Boolean;
      
      public function ShowRegistrationFormEvent(_arg_1:Bitmap = null, _arg_2:Boolean = false, _arg_3:Boolean = false, _arg_4:Boolean = true, _arg_5:Boolean = true, _arg_6:Boolean = true)
      {
         super(SHOW);
         this._backgroundImage = _arg_1;
         this._antiAddictionEnabled = _arg_2;
         this._captchaEnabled = _arg_3;
         this._skipRegistrationEnabled = _arg_4;
         this._goToLoginPageEnabled = _arg_5;
         this._registrationThroughEmail = _arg_6;
      }
      
      public function get antiAddictionEnabled() : Boolean
      {
         return this._antiAddictionEnabled;
      }
      
      public function get captchaEnabled() : Boolean
      {
         return this._captchaEnabled;
      }
      
      public function get backgroundImage() : Bitmap
      {
         return this._backgroundImage;
      }
      
      public function get skipRegistrationEnabled() : Boolean
      {
         return this._skipRegistrationEnabled;
      }
      
      public function get goToLoginPageEnabled() : Boolean
      {
         return this._goToLoginPageEnabled;
      }
      
      public function get registrationThroughEmail() : Boolean
      {
         return this._registrationThroughEmail;
      }
   }
}

