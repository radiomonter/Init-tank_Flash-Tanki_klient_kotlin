package alternativa.tanks.servermodels.blockvalidator
{
   import alternativa.tanks.service.IEntranceClientFacade;
   import alternativa.tanks.tracker.ITrackerService;
   import flash.net.SharedObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class BlockValidatorModel
   {
      
      [Inject]
      public static var clientFacade:IEntranceClientFacade;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      public function BlockValidatorModel()
      {
         super();
      }
      
      public function youAreBlocked(_arg_1:String) : void
      {
         clientFacade.visizecub(_arg_1);
         var _local_2:SharedObject = storageService.getStorage();
         _local_2.data.userHash = null;
         _local_2.flush();
         trackerService.trackEvent("entrance","youAreBlocked","");
      }
      
      public function youWereKicked(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int) : void
      {
         clientFacade.mimycaleg(_arg_1,_arg_2,_arg_3,_arg_4);
         var _local_5:SharedObject = storageService.getStorage();
         _local_5.data.userHash = null;
         _local_5.flush();
         trackerService.trackEvent("entrance","youWereKicked","");
      }
   }
}

