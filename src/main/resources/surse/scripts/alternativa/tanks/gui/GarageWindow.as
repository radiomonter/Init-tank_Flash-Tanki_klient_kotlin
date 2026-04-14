package alternativa.tanks.gui
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.category.CategoryButtonsList;
   import alternativa.tanks.gui.garagelist.GarageList;
   import alternativa.tanks.gui.garagelist.GarageListController;
   import alternativa.tanks.gui.tankpreview.TankPreviewWindow;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.item3d.ITank3DViewer;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.utils.removeDisplayObject;
   import controls.TankWindow;
   import controls.TankWindowInner;
   import controls.buttons.ButtonStates;
   import controls.timer.CountDownTimer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.getTimer;
   import forms.events.PartsListEvent;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import services.alertservice.AlertAnswer;
   
   public class GarageWindow extends Sprite implements Jec
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var clientLog:IClientLog;
      
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var tank3DViewer:ITank3DViewer;
      
      private const windowMargin:int = 11;
      
      private const buttonSize:Point = new Point(104,33);
      
      public const itemInfoPanelWidth:int = 412;
      
      private var localeService:ILocaleService;
      
      private var windowSize:Point;
      
      private var myItemsWindow:TankWindow;
      
      private var myItemsInner:TankWindowInner;
      
      private var shopItemsWindow:TankWindow;
      
      private var shopItemsInner:TankWindowInner;
      
      public var itemInfoPanel:ItemInfoPanel;
      
      public var inventorySelected:Boolean;
      
      public var storeItemSelected:Boolean;
      
      public var selectedItemId:String;
      
      public var selectedItem:IGameObject;
      
      private var _itemsInWarehouse:Vector.<IGameObject>;
      
      private var _itemsInStore:Vector.<IGameObject>;
      
      public var tankPreview:TankPreviewWindow;
      
      private var _garageListWindow:TankWindow;
      
      private var _garageListInner:TankWindowInner;
      
      private var _garageList:GarageList;
      
      private var _categoryButtons:CategoryButtonsList;
      
      private var _garageListController:GarageListController;
      
      public var vegyl:Vector.<Nebaqyce>;
      
      public function GarageWindow(_arg_1:Tanks3DSResource, _arg_2:Boolean)
      {
         super();
         this.vegyl = new Vector.<Nebaqyce>();
         this._itemsInWarehouse = new Vector.<IGameObject>();
         this._itemsInStore = new Vector.<IGameObject>();
         this.windowSize = new Point(880,737);
         if(!battleInfoService.isInBattle())
         {
            this.tankPreview = new TankPreviewWindow(_arg_1);
            addChild(this.tankPreview);
            tank3DViewer.setView(this.tankPreview);
         }
         this.itemInfoPanel = new ItemInfoPanel(_arg_2,this.itemInfoPanelWidth);
         addChild(this.itemInfoPanel);
         this._garageListWindow = new TankWindow();
         addChild(this._garageListWindow);
         this._garageListInner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this._garageListInner.showBlink = true;
         addChild(this._garageListInner);
         this._garageList = new GarageList();
         addChild(this._garageList);
         this._categoryButtons = new CategoryButtonsList();
         addChild(this._categoryButtons);
         this._garageListController = new GarageListController(this._garageList,this._categoryButtons);
         this.setEvents();
      }
      
      public function destroy() : void
      {
         if(this.tankPreview != null)
         {
            removeDisplayObject(this.tankPreview);
            this.tankPreview.destroy();
            this.tankPreview = null;
         }
         this.itemInfoPanel.destroy();
         this.itemInfoPanel = null;
         this.myItemsWindow = null;
         this.myItemsInner = null;
         this.shopItemsWindow = null;
         this.shopItemsInner = null;
         this.selectedItemId = null;
         this._itemsInWarehouse = null;
         this._itemsInStore = null;
         removeDisplayObject(this._garageListWindow);
         this._garageListWindow = null;
         removeDisplayObject(this._garageListInner);
         this._garageListInner = null;
         this._garageListController.destroy();
         this._garageListController = null;
         this._garageList = null;
         this._categoryButtons = null;
         this.poloha();
      }
      
      private function setEvents() : void
      {
         this._garageList.addEventListener(PartsListEvent.SELECT_PARTS_LIST_ITEM,this.onSelectGarageListItem);
         this._garageList.addEventListener(PartsListEvent.ITEM_DOUBLE_CLICK,this.onGarageItemDoubleClick);
         this.itemInfoPanel.buyButton.addEventListener(MouseEvent.CLICK,this.onButtonBuyClick);
         this.itemInfoPanel.equipButton.addEventListener(MouseEvent.CLICK,this.onButtonEquipClick);
         this.itemInfoPanel.robog.addEventListener(MouseEvent.CLICK,this.nyku);
      }
      
      private function poloha() : void
      {
         var _local_1:Nebaqyce = null;
         for each(_local_1 in this.vegyl)
         {
            _local_1.removeListener();
         }
      }
      
      public function initDepot(_arg_1:Vector.<IGameObject>) : void
      {
         this._garageListController.initDepot(_arg_1);
      }
      
      public function resize(_arg_1:int, _arg_2:int) : void
      {
         var leftHeaderWidth:int = 0;
         this.windowSize = new Point(_arg_1,_arg_2);
         leftHeaderWidth = int(int(Math.max(100,IDisplay(OSGi.getInstance().getService(IDisplay)).stage.stageWidth)) / 3);
         this._garageListWindow.height = 205;
         if(!battleInfoService.isInBattle())
         {
            this._garageListWindow.width = _arg_1;
            this._garageListWindow.x = 0;
            this._garageListWindow.y = _arg_2 - this._garageListWindow.height;
            this._garageListInner.width = _arg_1 - this.windowMargin * 2;
            this._garageListInner.x = this.windowMargin;
            this._garageListInner.y = this._garageListWindow.y + this.windowMargin;
            this._garageList.width = this._garageListWindow.width - this.windowMargin * 2 - 8;
            this._garageList.x = this.windowMargin + 4;
            this._garageList.y = this._garageListWindow.y + this.windowMargin + 4;
            this._categoryButtons.y = this._garageList.y + this._garageList.height;
            this._categoryButtons.x = this.windowMargin;
         }
         else
         {
            this._garageListWindow.width = _arg_1 + leftHeaderWidth;
            this._garageListWindow.x = -leftHeaderWidth;
            this._garageListWindow.y = _arg_2 - this._garageListWindow.height;
            this._garageListInner.width = _arg_1 - this.windowMargin * 2 + leftHeaderWidth;
            this._garageListInner.x = this.windowMargin - leftHeaderWidth;
            this._garageListInner.y = this._garageListWindow.y + this.windowMargin;
            this._garageList.width = this._garageListWindow.width - this.windowMargin * 2 - 8;
            this._garageList.x = this.windowMargin + 4 - leftHeaderWidth;
            this._garageList.y = this._garageListWindow.y + this.windowMargin + 4;
            this._categoryButtons.y = this._garageList.y + this._garageList.height;
            this._categoryButtons.x = this.windowMargin - leftHeaderWidth;
         }
         if(this.tankPreview != null)
         {
            this.tankPreview.resize(_arg_1 - this.itemInfoPanelWidth,_arg_2 - this._garageListWindow.height);
         }
         this._garageList.height = 169 - this.windowMargin * 2 + 1;
         this._garageListInner.height = 169 - this.windowMargin * 2;
         this.itemInfoPanel.resize(this.itemInfoPanelWidth,_arg_2 - this._garageListWindow.height);
         this._categoryButtons.y = this._garageList.y + this._garageList.height;
         this.itemInfoPanel.x = _arg_1 - this.itemInfoPanelWidth;
         this._categoryButtons.width = _arg_1 - this.windowMargin * 2 - 8;
      }
      
      public function updateDiscount(_arg_1:IGameObject) : void
      {
         if(this.selectedItem == _arg_1)
         {
            this.showItemInfo(this.selectedItem,this.isItemInStore(this.selectedItem));
         }
         this._garageListController.updateDiscount(_arg_1);
      }
      
      public function qufomo() : IGameObject
      {
         return this.selectedItem;
      }
      
      public function calepyz() : ItemInfoPanel
      {
         return this.itemInfoPanel;
      }
      
      private function onGarageItemDoubleClick(_arg_1:PartsListEvent) : void
      {
         this.onSelectGarageListItem(_arg_1);
         if(this.itemInfoPanel.equipButton.visible && this.itemInfoPanel.equipButton.getState() == ButtonStates.UP)
         {
            this.equip();
         }
         else if(this.itemInfoPanel.buyButton.visible && this.itemInfoPanel.buyButton.getState() == ButtonStates.UP)
         {
            this.onButtonBuyClickInternal();
         }
         else if(this.itemInfoPanel.robog.visible && this.itemInfoPanel.robog.getState() == ButtonStates.UP)
         {
            this.dype();
         }
      }
      
      private function dype() : void
      {
         alertService.showAlert(this.localeService.getText(TanksLocale.TEXT_PRESENT_WILL_BE_REMOVED_ALERT),Vector.<String>([AlertAnswer.OK,AlertAnswer.CANCEL]));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.tapojo);
      }
      
      private function nyku(_arg_1:MouseEvent) : void
      {
         this.dype();
      }
      
      private function tapojo(_arg_1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.tapojo);
         if(_arg_1.typeButton == AlertAnswer.OK)
         {
            dispatchEvent(new GarageWindowEvent(GarageWindowEvent.DELETE_PRESENT,this.selectedItem));
            this.removeItemFromDepot(this.selectedItem);
            if(this._garageListController.getCurrentCategoryItemsCount() > 0)
            {
               this.updateSelection();
            }
            else
            {
               this._categoryButtons.setCategoryButtonVisibility(ItemViewCategoryEnum.GIVEN_PRESENTS,false);
               this.showDefaultCategory();
            }
         }
      }
      
      private function onButtonBuyClickInternal() : void
      {
         dispatchEvent(new GarageWindowEvent(GarageWindowEvent.BUY_ITEM,this.selectedItem));
      }
      
      private function equip() : void
      {
         dispatchEvent(new GarageWindowEvent(GarageWindowEvent.SETUP_ITEM,this.selectedItem));
      }
      
      public function selectFirstItemInWarehouse() : void
      {
         this.showDefaultCategory();
      }
      
      public function selectItemInWarehouse(_arg_1:IGameObject) : void
      {
      }
      
      public function unselectInWarehouse() : void
      {
      }
      
      public function selectItemInStore(_arg_1:IGameObject) : void
      {
      }
      
      public function unselectInStore() : void
      {
      }
      
      public function isItemInStore(_arg_1:IGameObject) : Boolean
      {
         return this._garageListController.isItemInStore(_arg_1);
      }
      
      public function isItemInDepot(_arg_1:IGameObject) : Boolean
      {
         return this._garageListController.isItemInDepot(_arg_1);
      }
      
      private function onSelectGarageListItem(_arg_1:PartsListEvent) : void
      {
         this.selectedItem = this._garageList.selectedItem;
         var _local_2:Boolean = this._garageListController.isItemInDepot(this.selectedItem);
         if(_local_2)
         {
            dispatchEvent(new GarageWindowEvent(GarageWindowEvent.WAREHOUSE_ITEM_SELECTED,this.selectedItem));
         }
         else
         {
            dispatchEvent(new GarageWindowEvent(GarageWindowEvent.STORE_ITEM_SELECTED,this.selectedItem));
         }
      }
      
      public function initStore(_arg_1:Vector.<IGameObject>) : void
      {
         this.socolulu(_arg_1);
         this._garageListController.initStore(_arg_1);
      }
      
      private function socolulu(_arg_1:Vector.<IGameObject>) : void
      {
         var _local_2:IGameObject = null;
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_5:uint = 0;
         var _local_6:CountDownTimer = null;
         var _local_8:int = 0;
         var _local_7:int = int(_arg_1.length);
         while(_local_8 < _local_7)
         {
            _local_2 = _arg_1[_local_8];
            if(itemService.zereqyj(_local_2) && itemService.canBuy(_local_2) && itemService.konyqa(_local_2))
            {
               _local_3 = itemService.getTimeLeftInSeconds(_local_2);
               _local_4 = 2592000;
               if(!itemService.vogacamy(_local_2) && _local_3 > 0 && _local_3 <= _local_4)
               {
                  _local_5 = _local_3 * 1000;
                  _local_6 = new CountDownTimer();
                  _local_6.start(_local_5 + getTimer());
                  this.vegyl.push(new Nebaqyce(_local_2,_local_6,this));
               }
            }
            _local_8++;
         }
      }
      
      public function tofafo(_arg_1:IGameObject) : void
      {
         var _local_2:IGameObject = null;
         if(itemService.cacum(this.selectedItem))
         {
            _local_2 = itemService.nyr(_arg_1);
            if(_local_2 != null)
            {
               this.updateDiscount(_local_2);
            }
         }
      }
      
      public function addItemToMarket(_arg_1:IGameObject) : void
      {
         this._itemsInStore.push(_arg_1);
         this._garageListController.addItemToStore(_arg_1);
      }
      
      public function updateKitsContainsItem(_arg_1:IGameObject) : void
      {
         this._garageListController.updateKitsContainsItem(_arg_1);
      }
      
      public function removeItemFromStore(_arg_1:IGameObject) : void
      {
         this._garageListController.removeItemFromStore(_arg_1);
      }
      
      public function removeAllModifications(_arg_1:IGameObject) : void
      {
         var _local_2:IGameObject = null;
         var _local_3:Vector.<IGameObject> = itemService.muceraqe(_arg_1);
         for each(_local_2 in _local_3)
         {
            if(this.isItemInDepot(_local_2))
            {
               this.removeItemFromDepot(_local_2);
            }
            if(this.isItemInStore(_local_2))
            {
               this.removeItemFromStore(_local_2);
            }
         }
      }
      
      public function get itemsInWarehouse() : Vector.<IGameObject>
      {
         return this._itemsInWarehouse;
      }
      
      public function get itemsInStore() : Vector.<IGameObject>
      {
         return this._itemsInStore;
      }
      
      public function lockItemInWarehouse(_arg_1:String) : void
      {
      }
      
      public function unlockItemInWarehouse(_arg_1:String) : void
      {
      }
      
      public function lockItemInStore(_arg_1:String) : void
      {
      }
      
      public function unlockItemInStore(_arg_1:String) : void
      {
      }
      
      public function unmountItem(_arg_1:IGameObject) : void
      {
         this._garageList.unmount(_arg_1);
      }
      
      public function mountItem(_arg_1:IGameObject) : void
      {
         this._garageList.mount(_arg_1);
      }
      
      public function showItemInfo(_arg_1:IGameObject, _arg_2:Boolean) : void
      {
         this.storeItemSelected = _arg_2;
         this.inventorySelected = itemService.getCategory(_arg_1) == ItemCategoryEnum.INVENTORY;
         if((itemService.getCategory(_arg_1) == ItemCategoryEnum.INVENTORY || itemService.getCategory(_arg_1) == ItemCategoryEnum.LOOT_BOX) && !_arg_2)
         {
            this._garageList.updateCount(_arg_1,itemService.getCount(_arg_1));
         }
         this.itemInfoPanel.showItemInfo(_arg_1,_arg_2);
         this.itemInfoPanel.resize(this.itemInfoPanelWidth,this.windowSize.y - this._garageListWindow.height);
      }
      
      public function addItemToDepot(_arg_1:IGameObject) : void
      {
         this._garageListController.addItemToDepot(_arg_1);
      }
      
      public function removeItemFromDepot(_arg_1:IGameObject) : void
      {
         this._garageListController.removeItemFromDepot(_arg_1);
      }
      
      public function scrollToItemInWarehouse(_arg_1:IGameObject) : void
      {
      }
      
      public function scrollToItemInStore(_arg_1:IGameObject) : void
      {
      }
      
      public function updateStore() : void
      {
         this._garageListController.updateSelection();
      }
      
      public function lockMountButton() : void
      {
         if(!this.storeItemSelected && !this.inventorySelected)
         {
            this.itemInfoPanel.equipButton.enabled = false;
         }
      }
      
      public function unlockBuyButton() : void
      {
      }
      
      public function unlockUpgradeButton() : void
      {
      }
      
      public function unlockMountButton() : void
      {
         if(!this.storeItemSelected && !this.inventorySelected)
         {
            this.itemInfoPanel.equipButton.enabled = true;
         }
      }
      
      public function setBuyButtonInfo(_arg_1:Boolean, _arg_2:int = 0, _arg_3:int = 0) : void
      {
         if(_arg_1)
         {
            this.itemInfoPanel.buyButton.icon = null;
         }
         else
         {
            this.itemInfoPanel.buyButton.setInfo(_arg_2,_arg_3);
         }
      }
      
      private function onWarehouseItemSelect(_arg_1:Event) : void
      {
         dispatchEvent(new GarageWindowEvent(GarageWindowEvent.WAREHOUSE_ITEM_SELECTED,this.selectedItem));
      }
      
      private function onStoreItemSelect(_arg_1:Event) : void
      {
         dispatchEvent(new GarageWindowEvent(GarageWindowEvent.STORE_ITEM_SELECTED,this.selectedItem));
      }
      
      private function onButtonBuyClick(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new GarageWindowEvent(GarageWindowEvent.BUY_ITEM,this.selectedItem));
      }
      
      private function onButtonBuyCrystalsClick(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new GarageWindowEvent(GarageWindowEvent.ADD_CRYSTALS,this.selectedItem));
      }
      
      private function onButtonEquipClick(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new GarageWindowEvent(GarageWindowEvent.SETUP_ITEM,this.selectedItem));
      }
      
      private function onModButtonClick(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new GarageWindowEvent(GarageWindowEvent.UPGRADE_ITEM,this.selectedItem));
      }
      
      public function showDefaultCategory() : void
      {
         this._garageListController.showDefaultCategory();
      }
      
      public function showCategory(_arg_1:ItemViewCategoryEnum) : void
      {
         this._garageListController.showCategory(_arg_1);
      }
      
      public function showItemInCategory(_arg_1:IGameObject) : void
      {
         this._garageListController.showItemInCategory(_arg_1);
      }
      
      public function updateSelection() : void
      {
         this._garageListController.updateSelection();
      }
      
      public function nobam() : Vector.<Nebaqyce>
      {
         return this.vegyl;
      }
      
      public function updateCount(_arg_1:IGameObject) : void
      {
         this._garageList.updateCount(_arg_1,itemService.getCount(_arg_1));
      }
      
      public function setCategoryButtonVisibility(_arg_1:ItemViewCategoryEnum, _arg_2:Boolean) : void
      {
         this._categoryButtons.setCategoryButtonVisibility(_arg_1,_arg_2);
      }
   }
}

