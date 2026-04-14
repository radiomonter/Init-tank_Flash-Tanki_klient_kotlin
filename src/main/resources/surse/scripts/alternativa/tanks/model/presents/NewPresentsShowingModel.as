package alternativa.tanks.model.presents
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.presents.NewPresentsAlert;
   import alternativa.tanks.gui.presents.NewPresentsAlertEvent;
   import alternativa.tanks.service.notificationcategories.INotificationGarageCategoriesService;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   
   public class NewPresentsShowingModel
   {
      
      [Inject]
      public static var notificationGarageCategoriesService:INotificationGarageCategoriesService;
      
      public function NewPresentsShowingModel()
      {
         super();
      }
      
      public function showAlert() : void
      {
         var _local_1:NewPresentsAlert = new NewPresentsAlert();
         _local_1.addEventListener(NewPresentsAlertEvent.ACCEPT,this.accept);
         _local_1.addEventListener(NewPresentsAlertEvent.CANCEL,this.cancel);
         notificationGarageCategoriesService.kyqese(ItemViewCategoryEnum.GIVEN_PRESENTS);
      }
      
      private function cancel(_arg_1:NewPresentsAlertEvent) : void
      {
         this.closeDialog(NewPresentsAlert(_arg_1.target));
      }
      
      private function accept(_arg_1:NewPresentsAlertEvent) : void
      {
         this.closeDialog(NewPresentsAlert(_arg_1.target));
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;showPresents");
      }
      
      private function closeDialog(_arg_1:NewPresentsAlert) : void
      {
         _arg_1.removeEventListener(NewPresentsAlertEvent.ACCEPT,this.accept);
         _arg_1.removeEventListener(NewPresentsAlertEvent.CANCEL,this.cancel);
      }
   }
}

