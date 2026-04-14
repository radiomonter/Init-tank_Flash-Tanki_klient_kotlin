package alternativa.tanks.model.item.droppablegold
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.item.actionpanel.SingleActionWithCheckBoxPanel;
   import alternativa.tanks.model.panel.PanelModel;
   import alternativa.tanks.service.item.ItemService;
   import flash.display.DisplayObjectContainer;
   import flash.events.IEventDispatcher;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.item.droppablegold.DroppableGoldItemModelBase;
   import projects.tanks.client.garage.models.item.droppablegold.IDroppableGoldItemModelBase;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   [ModelInfo]
   public class DroppableGoldItemModel extends DroppableGoldItemModelBase implements IDroppableGoldItemModelBase, ObjectLoadListener
   {
      
      [Inject]
      public static var itemService:ItemService = ItemService(OSGi.getInstance().getService(ItemService));
      
      [Inject]
      public static var userProperties:IUserPropertiesService = IUserPropertiesService(OSGi.getInstance().getService(IUserPropertiesService));
      
      private var panel:SingleActionWithCheckBoxPanel;
      
      public var _object:IGameObject;
      
      public function DroppableGoldItemModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _local_1:SingleActionWithCheckBoxPanel = new SingleActionWithCheckBoxPanel(TanksLocale.TEXT_GARAGE_INFO_PANEL_BUTTON_BUY_TEXT,this.openPayment);
         _local_1.initCheckBox(TanksLocale.TEXT_GOLD_CHECKBOX,getInitParam().showDroppableGoldAuthor,getFunctionWrapper(this.setShowGoldAuthor));
         this.panel = _local_1;
      }
      
      private function setShowGoldAuthor() : void
      {
         server.setShowGoldAuthor(this.getActionPanel().isChecked());
      }
      
      public function updateActionElements(_arg_1:DisplayObjectContainer, _arg_2:IEventDispatcher) : void
      {
         var _local_3:SingleActionWithCheckBoxPanel = this.getActionPanel();
         _local_3.updateActionElements(_arg_1);
         _local_3.enabled = userProperties.rank >= itemService.ruma(this._object);
      }
      
      public function handleDoubleClickOnItemPreview() : void
      {
         this.openPayment();
      }
      
      private function openPayment() : void
      {
         PanelModel.switchPayment();
      }
      
      private function getActionPanel() : SingleActionWithCheckBoxPanel
      {
         return this.panel;
      }
   }
}

