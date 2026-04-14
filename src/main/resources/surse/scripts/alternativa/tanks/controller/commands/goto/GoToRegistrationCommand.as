package alternativa.tanks.controller.commands.goto
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.controller.events.showform.ShowRegistrationFormEvent;
   import alternativa.tanks.model.EntranceServerParamsModel;
   import alternativa.tanks.model.EntranceUrlParamsModel;
   import alternativa.tanks.model.RegistrationBackgroundModel;
   import alternativa.tanks.service.IEntranceServerFacade;
   import alternativa.types.Long;
   import flash.display.Bitmap;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import org.robotlegs.mvcs.Command;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class GoToRegistrationCommand extends Command
   {
      
      [Inject]
      public var backgroundModel:RegistrationBackgroundModel;
      
      [Inject]
      public var serverParams:EntranceServerParamsModel;
      
      [Inject]
      public var serverFacade:IEntranceServerFacade;
      
      [Inject]
      public var paramsModel:EntranceUrlParamsModel;
      
      public function GoToRegistrationCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("registration;set_state");
         var _local_1:Bitmap = new Bitmap(ImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,122842))).data);
         dispatch(new ShowRegistrationFormEvent(_local_1,this.serverParams.antiAddictionEnabled,true,this.serverParams.skipRegistrationEnabled,this.paramsModel.tutorialHash == null,this.serverParams.registrationThroughEmail));
      }
   }
}

