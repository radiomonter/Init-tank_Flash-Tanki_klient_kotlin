package alternativa.tanks.controller.commands.goto
{
   import alternativa.tanks.controller.events.showform.ShowExternalEntranceFormEvent;
   import alternativa.tanks.controller.events.socialnetwork.NavigationExternalEvent;
   import alternativa.tanks.model.EntranceServerParamsModel;
   import alternativa.tanks.model.EntranceUrlParamsModel;
   import alternativa.tanks.service.AccountService;
   import alternativa.tanks.service.Tud;
   import org.robotlegs.mvcs.Command;
   
   public class GoToExternalLoginCommand extends Command
   {
      
      [Inject]
      public var entranceUrlParamsModel:EntranceUrlParamsModel;
      
      [Inject]
      public var serverParamsModel:EntranceServerParamsModel;
      
      [Inject]
      public var sharedObjectsService:AccountService;
      
      [Inject]
      public var event:NavigationExternalEvent;
      
      [Inject]
      public var captchaService:Tud;
      
      public function GoToExternalLoginCommand()
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
         dispatch(new ShowExternalEntranceFormEvent(ShowExternalEntranceFormEvent.LOGIN_FORM,this.event.socialNetworkId,this.entranceUrlParamsModel.passedCallsign || this.sharedObjectsService.bylitef,_local_1));
      }
   }
}

