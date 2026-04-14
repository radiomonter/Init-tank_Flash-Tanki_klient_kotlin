package alternativa.tanks.servermodels
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.service.IEntranceClientFacade;
   import alternativa.tanks.service.IEntranceServerFacade;
   import flash.events.Event;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadPostListener;
   import projects.tanks.client.entrance.model.entrance.entrance.EntranceModelBase;
   import projects.tanks.client.entrance.model.entrance.entrance.IEntranceModelBase;
   
   public class EntranceModel extends EntranceModelBase implements IEntranceModelBase, ObjectLoadListener, ObjectLoadPostListener, ObjectUnloadPostListener
   {
      
      [Inject]
      public static var serverFacade:IEntranceServerFacade;
      
      [Inject]
      public static var clientFacade:IEntranceClientFacade;
      
      [Inject]
      public static var display:IDisplay;
      
      public function EntranceModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         clientFacade.antiAddictionEnabled = false;
         display.stage.dispatchEvent(new Event("EntranceModel.objectLoaded",true));
      }
      
      public function objectLoadedPost() : void
      {
         serverFacade.fef = object;
         clientFacade.fef = object;
      }
      
      public function objectUnloadedPost() : void
      {
         clientFacade.gezoculir();
      }
   }
}

