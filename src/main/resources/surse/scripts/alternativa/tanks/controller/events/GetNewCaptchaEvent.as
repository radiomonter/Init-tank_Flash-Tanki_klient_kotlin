package alternativa.tanks.controller.events
{
   import flash.events.Event;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class GetNewCaptchaEvent extends Event
   {
      
      public static const GET_CAPTCHA:String = "GetNewCaptchaEvent.GET_CAPTCHA";
      
      private var _location:CaptchaLocation;
      
      public function GetNewCaptchaEvent(_arg_1:CaptchaLocation)
      {
         super(GET_CAPTCHA);
         this._location = _arg_1;
      }
      
      public function get location() : CaptchaLocation
      {
         return this._location;
      }
   }
}

