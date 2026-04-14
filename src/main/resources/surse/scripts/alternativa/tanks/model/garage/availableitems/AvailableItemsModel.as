package alternativa.tanks.model.garage.availableitems
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.AvailableItemsAlert;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.service.notificationcategories.INotificationGarageCategoriesService;
   import flash.events.Event;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import forms.events.PartsListEvent;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.client.panel.model.garage.GarageItemInfo;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class AvailableItemsModel
   {
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var notificationGarageCategoriesService:INotificationGarageCategoriesService;
      
      public static const CHANNEL:String = "available";
      
      private var items:Vector.<GarageItemInfo> = new Vector.<GarageItemInfo>();
      
      private var alert:AvailableItemsAlert;
      
      public function AvailableItemsModel()
      {
         super();
      }
      
      public function showAvailableItems(_arg_1:Vector.<GarageItemInfo>) : void
      {
         if(lobbyLayoutService.getCurrentState() == LayoutState.GARAGE)
         {
            this.showAlert(_arg_1);
         }
         else
         {
            this.items = new Vector.<GarageItemInfo>();
            this.items = _arg_1;
            if(!lobbyLayoutService.inBattle())
            {
            }
            lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
         }
         notificationGarageCategoriesService.jusosyv(_arg_1);
      }
      
      private function onEndLayoutSwitch(_arg_1:LobbyLayoutServiceEvent) : void
      {
         var _local_2:Boolean = false;
         var _local_3:Vector.<GarageItemInfo> = null;
         if(_arg_1.state != LayoutState.BATTLE)
         {
            if(this.items != null)
            {
               _local_3 = this.items;
               this.showAlert(_local_3);
            }
         }
      }
      
      private function showAlert(_arg_1:Vector.<GarageItemInfo>) : void
      {
         var _local_2:AvailableItemsAlert = this.alert;
         if(_local_2 != null)
         {
            this.destroyAlert();
         }
         var _local_3:AvailableItemsAlert = new AvailableItemsAlert(_arg_1,null,TextConst.TEXT_GARAGE_NEW_ITEMS_ALERT);
         _local_3.addEventListener(Event.CANCEL,this.onClickCloseButton);
         _local_3.addEventListener(PartsListEvent.SELECT_PARTS_LIST_ITEM,this.onItemSelect);
         this.alert = _local_3;
      }
      
      private function onItemSelect(_arg_1:PartsListEvent) : void
      {
         var _local_2:AvailableItemsAlert = this.alert;
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;show_item_info;" + _local_2.partsList.selectedItem.name);
         this.destroyAlert();
      }
      
      private function onClickCloseButton(_arg_1:Event) : void
      {
         this.destroyAlert();
      }
      
      private function destroyAlert() : void
      {
         if(lobbyLayoutService.hasEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH))
         {
            lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
         }
         var _local_1:AvailableItemsAlert = this.alert;
         _local_1.removeEventListener(Event.CANCEL,this.onClickCloseButton);
         _local_1.removeEventListener(PartsListEvent.SELECT_PARTS_LIST_ITEM,this.onItemSelect);
         this.items = null;
         this.alert = null;
      }
   }
}

