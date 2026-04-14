package alternativa.tanks.model.lootboxes
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.item.countable.ICountableItem;
   import alternativa.tanks.model.panel.PanelModel;
   import flash.display.DisplayObjectContainer;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import projects.tanks.client.garage.models.item.lootbox.ILootBoxModelBase;
   import projects.tanks.client.garage.models.item.lootbox.LootBoxModelBase;
   import projects.tanks.client.garage.models.item.lootbox.LootBoxReward;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   
   [ModelInfo]
   public class LootBoxModel extends LootBoxModelBase implements ILootBoxModelBase, ObjectLoadListener
   {
      
      [Inject]
      public static var dialogService:IDialogsService = IDialogsService(OSGi.getInstance().getService(IDialogsService));
      
      private var lootBoxDialog:LootBoxOpenDialog;
      
      private var panel:LootBoxPanel;
      
      public function LootBoxModel()
      {
         super();
      }
      
      private static function getLootsCount() : int
      {
         return ICountableItem(object.adapt(ICountableItem)).getCount();
      }
      
      public function objectLoaded() : void
      {
         var _local_1:LootBoxPanel = new LootBoxPanel();
         _local_1.setOpenButtonEnabled(getLootsCount() > 0);
         _local_1.openButton.addEventListener(MouseEvent.CLICK,getFunctionWrapper(this.onOpenClick),false,0,true);
         this.panel = _local_1;
      }
      
      public function updateActionElements(_arg_1:DisplayObjectContainer, _arg_2:IEventDispatcher) : void
      {
         var _local_3:LootBoxPanel = this.getPanel();
         _local_3.updateActionElements(_arg_1);
         _local_3.setOpenButtonEnabled(getLootsCount() > 0);
      }
      
      private function onOpenClick(_arg_1:MouseEvent) : void
      {
         this.lootBoxDialog = new LootBoxOpenDialog(getInitParam(),getLootsCount());
         this.lootBoxDialog.addEventListener(LootBoxEvent.OPEN,getFunctionWrapper(this.onOpenLootBox),false,0,true);
         dialogService.enqueueDialog(this.lootBoxDialog);
      }
      
      private function onOpenLootBox(_arg_1:LootBoxEvent) : void
      {
         server.open(_arg_1.count);
      }
      
      public function handleDoubleClickOnItemPreview() : void
      {
         PanelModel.switchPayment();
      }
      
      public function openSuccessful(_arg_1:Vector.<LootBoxReward>) : void
      {
         this.lootBoxDialog.openLoots(_arg_1);
         this.getPanel().setOpenButtonEnabled(getLootsCount() > 0);
      }
      
      private function getPanel() : LootBoxPanel
      {
         return this.panel;
      }
      
      public function updateCount(_arg_1:int) : void
      {
         this.getPanel().setOpenButtonEnabled(_arg_1 > 0);
      }
   }
}

