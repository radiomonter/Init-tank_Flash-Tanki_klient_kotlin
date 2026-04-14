package alternativa.tanks.controller.commands
{
   import alternativa.tanks.controller.events.Degagi;
   import alternativa.tanks.service.IEntranceServerFacade;
   import org.robotlegs.mvcs.Command;
   
   public class Qypopa extends Command
   {
      
      [Inject]
      public var event:Degagi;
      
      [Inject]
      public var entranceGateway:IEntranceServerFacade;
      
      public function Qypopa()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.entranceGateway.qolatap(this.event.vody);
      }
   }
}

