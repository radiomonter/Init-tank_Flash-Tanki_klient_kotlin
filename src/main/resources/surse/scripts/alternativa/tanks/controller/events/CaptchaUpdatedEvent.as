package alternativa.tanks.controller.events
{
   import flash.display.Bitmap;
   import flash.events.Event;
   
   public class CaptchaUpdatedEvent extends Event
   {
      
      public static const STAND_ALONE_CAPTCHA_UPDATED:String = "CaptchaUpdatedEvent.STAND_ALONE_CAPTCHA_UPDATED";
      
      public static const LOGIN_FORM_CAPTCHA_UPDATED:String = "CaptchaUpdatedEvent.LOGIN_FORM_CAPTCHA_UPDATED";
      
      public static const REGISTRATION_FORM_CAPTCHA_UPDATED:String = "CaptchaUpdatedEvent.REGISTRATION_FORM_CAPTCHA_UPDATED";
      
      public static const RESTORE_PASSWORD_FORM_CAPTCHA_UPDATED:String = "CaptchaUpdatedEvent.RESTORE_PASSWORD_FORM_CAPTCHA_UPDATED";
      
      private var _image:Bitmap;
      
      public function CaptchaUpdatedEvent(_arg_1:String, _arg_2:Bitmap)
      {
         super(_arg_1);
         this._image = _arg_2;
      }
      
      public function get image() : Bitmap
      {
         return this._image;
      }
   }
}

