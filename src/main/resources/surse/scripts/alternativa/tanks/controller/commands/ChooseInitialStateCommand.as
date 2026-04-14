package alternativa.tanks.controller.commands
{
   import alternativa.tanks.controller.events.EntranceErrorEvent;
   import alternativa.tanks.controller.events.NavigationEvent;
   import alternativa.tanks.model.EntranceServerParamsModel;
   import alternativa.tanks.model.EntranceUrlParamsModel;
   import alternativa.tanks.service.AccountService;
   import alternativa.tanks.service.IEntranceServerFacade;
   import org.robotlegs.mvcs.Command;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   
   public class ChooseInitialStateCommand extends Command
   {
      
      [Inject]
      public var serverFacade:IEntranceServerFacade;
      
      [Inject]
      public var urlParams:EntranceUrlParamsModel;
      
      [Inject]
      public var sharedObjectsService:AccountService;
      
      [Inject]
      public var serverParams:EntranceServerParamsModel;
      
      [Inject]
      public var partnerService:IPartnerService;
      
      public function ChooseInitialStateCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _local_1:String = null;
         if(this.serverParams.serverHalt)
         {
            dispatch(new EntranceErrorEvent(EntranceErrorEvent.SERVER_HALT));
         }
         else if(this.serverParams.inviteEnabled)
         {
            dispatch(new NavigationEvent(NavigationEvent.GO_TO_INVITE_FORM));
         }
         else if(Boolean(this.urlParams.entranceHash) || Boolean(this.sharedObjectsService.entranceHash))
         {
            _local_1 = this.urlParams.entranceHash || this.sharedObjectsService.entranceHash;
            this.serverFacade.loginByHash(_local_1);
         }
         else if(this.sharedObjectsService.bylige)
         {
            dispatch(new NavigationEvent(NavigationEvent.GO_TO_LOGIN_FORM));
         }
         else
         {
            this.sharedObjectsService.bylige = true;
            dispatch(new NavigationEvent(NavigationEvent.GO_TO_REGISTRATION_FORM));
         }
      }
   }
}

