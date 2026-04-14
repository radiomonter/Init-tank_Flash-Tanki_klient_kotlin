package alternativa.tanks.controller.commands.socialnetwork
{
   import alternativa.tanks.controller.events.CheckCaptchaAnswerEvent;
   import alternativa.tanks.controller.events.socialnetwork.ExternalLoginEvent;
   import alternativa.tanks.service.Tud;
   import org.robotlegs.mvcs.Command;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class CheckExternalLoginFormCaptchaCommand extends Command
   {
      
      [Inject]
      public var captchaService:Tud;
      
      [Inject]
      public var event:ExternalLoginEvent;
      
      public function CheckExternalLoginFormCaptchaCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _local_1:ExternalLoginEvent = new ExternalLoginEvent(ExternalLoginEvent.LOGIN_AFTER_CAPTCHA_CHECKED,this.event.callsign,this.event.password,this.event.captchaAnswer);
         if(this.captchaService.loginCaptchaEnabled)
         {
            dispatch(new CheckCaptchaAnswerEvent(this.event.captchaAnswer,CaptchaLocation.LOGIN_FORM,_local_1));
         }
         else
         {
            dispatch(_local_1);
         }
      }
   }
}

