package alternativa.tanks.controller.commands.captcha
{
   import alternativa.tanks.controller.events.RegisterEvent;
   import alternativa.tanks.model.EntranceServerParamsModel;
   import org.robotlegs.mvcs.Command;
   
   public class CheckRegistrationCaptchaCommand extends Command
   {
      
      [Inject]
      public var event:RegisterEvent;
      
      [Inject]
      public var serverParams:EntranceServerParamsModel;
      
      public function CheckRegistrationCaptchaCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _local_1:RegisterEvent = new RegisterEvent(RegisterEvent.REGISTER_AFTER_CAPTCHA_CHECKED,this.event.callsign,this.event.email,this.event.password,this.event.rememberMe,this.event.realName,this.event.idNumber,this.event.captchaAnswer);
         dispatch(_local_1);
      }
   }
}

