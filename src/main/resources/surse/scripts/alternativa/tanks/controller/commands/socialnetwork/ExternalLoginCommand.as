package alternativa.tanks.controller.commands.socialnetwork
{
   import alternativa.tanks.controller.events.socialnetwork.ExternalLoginEvent;
   import alternativa.tanks.service.AccountService;
   import alternativa.tanks.service.IEntranceServerFacade;
   import org.robotlegs.mvcs.Command;
   
   public class ExternalLoginCommand extends Command
   {
      
      [Inject]
      public var entranceGateway:IEntranceServerFacade;
      
      [Inject]
      public var loginEvent:ExternalLoginEvent;
      
      [Inject]
      public var sharedObjects:AccountService;
      
      public function ExternalLoginCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.sharedObjects.bylitef = this.loginEvent.callsign;
         this.entranceGateway.pasica(this.loginEvent.callsign,this.loginEvent.password);
      }
   }
}

