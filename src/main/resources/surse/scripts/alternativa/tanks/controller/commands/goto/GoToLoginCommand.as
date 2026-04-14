package alternativa.tanks.controller.commands.goto
{
   import alternativa.tanks.controller.events.showform.ShowLoginFormEvent;
   import alternativa.tanks.model.EntranceServerParamsModel;
   import alternativa.tanks.model.EntranceUrlParamsModel;
   import alternativa.tanks.service.AccountService;
   import alternativa.tanks.service.Tud;
   import org.robotlegs.mvcs.Command;
   
   public class GoToLoginCommand extends Command
   {
      
      [Inject]
      public var entranceUrlParamsModel:EntranceUrlParamsModel;
      
      [Inject]
      public var sharedObjectsService:AccountService;
      
      [Inject]
      public var serverParamsModel:EntranceServerParamsModel;
      
      [Inject]
      public var captchaService:Tud;
      
      public function GoToLoginCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _local_1:Boolean = false;
         if(this.serverParamsModel.loginCaptchaEnabled)
         {
            _local_1 = true;
         }
         else
         {
            _local_1 = this.captchaService.loginCaptchaEnabled;
         }
         dispatch(new ShowLoginFormEvent(this.entranceUrlParamsModel.passedCallsign || this.sharedObjectsService.bylitef,true,_local_1,this.entranceUrlParamsModel.passedPassword));
      }
   }
}

