package obfuscation.syfodi
{
   import alternativa.tanks.controller.events.CaptchaUpdatedEvent;
   import alternativa.tanks.servermodels.captcha.CaptchaParser;
   import alternativa.tanks.service.IEntranceServerFacade;
   import alternativa.tanks.service.Tud;
   import flash.display.Bitmap;
   import flash.utils.Dictionary;
   import org.robotlegs.mvcs.Actor;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class Wowyw extends Actor implements Tud
   {
      
      [Inject]
      public var serverFacade:IEntranceServerFacade;
      
      private var legiju:Dictionary = new Dictionary();
      
      private var qasik:Dictionary = new Dictionary();
      
      public function Wowyw()
      {
         super();
      }
      
      public function lajyriw(_arg_1:CaptchaLocation, _arg_2:String, _arg_3:Function) : void
      {
         this.legiju[_arg_1] = _arg_3;
         this.serverFacade.checkCaptcha(_arg_2,_arg_1);
      }
      
      public function gimuqini(_arg_1:CaptchaLocation) : void
      {
         this.legiju[_arg_1].apply();
      }
      
      public function neby(_arg_1:Vector.<int>, _arg_2:CaptchaLocation) : void
      {
         this.qasik[_arg_2] = true;
         CaptchaParser.parse(_arg_1,this.turigec,_arg_2);
      }
      
      private function turigec(_arg_1:Bitmap, _arg_2:CaptchaLocation) : void
      {
         switch(_arg_2)
         {
            case CaptchaLocation.CLIENT_STARTUP:
               dispatch(new CaptchaUpdatedEvent(CaptchaUpdatedEvent.STAND_ALONE_CAPTCHA_UPDATED,_arg_1));
               return;
            case CaptchaLocation.LOGIN_FORM:
               dispatch(new CaptchaUpdatedEvent(CaptchaUpdatedEvent.LOGIN_FORM_CAPTCHA_UPDATED,_arg_1));
               return;
            case CaptchaLocation.REGISTER_FORM:
               dispatch(new CaptchaUpdatedEvent(CaptchaUpdatedEvent.REGISTRATION_FORM_CAPTCHA_UPDATED,_arg_1));
         }
      }
      
      public function get loginCaptchaEnabled() : Boolean
      {
         return Boolean(this.qasik[CaptchaLocation.LOGIN_FORM]);
      }
   }
}

