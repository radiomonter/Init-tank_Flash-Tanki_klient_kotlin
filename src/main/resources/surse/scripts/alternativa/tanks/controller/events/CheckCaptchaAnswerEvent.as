package alternativa.tanks.controller.events
{
   import flash.events.Event;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class CheckCaptchaAnswerEvent extends Event
   {
      
      public static const EVENT_TYPE:String = "CheckCaptchaAnswerEvent.CHECK";
      
      private var _captchaAnswer:String;
      
      private var _location:CaptchaLocation;
      
      private var _onSuccessEvent:Event;
      
      public function CheckCaptchaAnswerEvent(_arg_1:String, _arg_2:CaptchaLocation, _arg_3:Event)
      {
         super(EVENT_TYPE);
         this._captchaAnswer = _arg_1;
         this._location = _arg_2;
         this._onSuccessEvent = _arg_3;
      }
      
      public function get captchaAnswer() : String
      {
         return this._captchaAnswer;
      }
      
      public function get location() : CaptchaLocation
      {
         return this._location;
      }
      
      public function get onSuccessEvent() : Event
      {
         return this._onSuccessEvent;
      }
   }
}

