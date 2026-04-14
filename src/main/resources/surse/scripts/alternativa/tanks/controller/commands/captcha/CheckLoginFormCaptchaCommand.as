package alternativa.tanks.controller.commands.captcha
{
   import alternativa.tanks.controller.events.LoginEvent;
   import alternativa.tanks.service.Tud;
   import org.robotlegs.mvcs.Command;
   
   public class CheckLoginFormCaptchaCommand extends Command
   {
      
      [Inject]
      public var captchaService:Tud;
      
      [Inject]
      public var event:LoginEvent;
      
      public function CheckLoginFormCaptchaCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _local_1:LoginEvent = new LoginEvent(LoginEvent.LOGIN_AFTER_CAPTCHA_CHECKED,this.event.callsign,this.event.password,this.event.rememberMe,this.event.captchaAnswer);
         dispatch(_local_1);
      }
   }
}

