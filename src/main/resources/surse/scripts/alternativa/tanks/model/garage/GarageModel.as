package alternativa.tanks.model.garage
{
   import alternativa.engine3d.materials.TextureResourcesRegistry;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.command.FormattedOutput;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.dump.IDumpService;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.blur.IBlurService;
   import alternativa.tanks.gui.ConfirmAlert;
   import alternativa.tanks.gui.GarageWindow;
   import alternativa.tanks.gui.GarageWindowEvent;
   import alternativa.tanks.gui.GiftWindow;
   import alternativa.tanks.gui.GiftWindowEvent;
   import alternativa.tanks.gui.Nebaqyce;
   import alternativa.tanks.help.FirstMoneyHelper;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.model.item.ItemDumper;
   import alternativa.tanks.model.item.category.IItemCategory;
   import alternativa.tanks.model.item.category.IItemViewCategory;
   import alternativa.tanks.model.item.item.IItem;
   import alternativa.tanks.model.item.kit.GarageKit;
   import alternativa.tanks.model.item.temporary.ITemporaryItem;
   import alternativa.tanks.model.item.upgradable.UpgradableItem;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.service.delaymountcategory.IDelayMountCategoryService;
   import alternativa.tanks.service.garage.GarageService;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.item3d.ITank3DViewer;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.temporaryitem.ITemporaryItemService;
   import alternativa.tanks.service.temporaryitemnotify.Ceqibavub;
   import alternativa.tanks.service.temporaryitemnotify.ITemporaryItemNotifyService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.forms.ChangeUidForm;
   import controls.timer.CountDownTimer;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.display.StageQuality;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import obfuscation.myrudatof.Nafoh;
   import obfuscation.myrudatof.Nebizo;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.garage.models.garage.GarageModelBase;
   import projects.tanks.client.garage.models.garage.IGarageModelBase;
   import projects.tanks.client.garage.models.item.kit.KitGiftItem;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.UserPropertiesServiceEvent;
   import services.alertservice.Alert;
   import services.alertservice.AlertAnswer;
   
   public class GarageModel extends GarageModelBase implements IGarageModelBase, ObjectLoadListener, ObjectUnloadListener, IResourceLoadingListener, Ceqibavub, Voku
   {
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      [Inject]
      public static var dumpService:IDumpService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      [Inject]
      public static var helpService:IHelpService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var clientLog:IClientLog;
      
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var temporaryItemService:ITemporaryItemService;
      
      [Inject]
      public static var temporaryItemNotifyService:ITemporaryItemNotifyService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var tank3DViewer:ITank3DViewer;
      
      [Inject]
      public static var achievementService:IAchievementService;
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      [Inject]
      public static var loaderWindowService:ILoaderWindowService;
      
      [Inject]
      public static var garageService:GarageService;
      
      [Inject]
      public static var commandService:CommandService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var cazygova:IDelayMountCategoryService;
      
      private static const GA_CATEGORY:String = "garage";
      
      private const HELPER_STORE:int = 2;
      
      private const HELPER_WAREHOUSE:int = 3;
      
      private const HELPER_MONEY_FIRST:int = 700;
      
      private const HELPER_GROUP_KEY:String = "GarageModel";
      
      private var itemDumper:ItemDumper;
      
      private var garageWindow:GarageWindow;
      
      private var warehouseSelectedItem:IGameObject;
      
      private var itemWaitingForConfirmation:IGameObject;
      
      private var confirmAlert:ConfirmAlert;
      
      private var changeUidForm:ChangeUidForm;
      
      private var selectedItem:IGameObject;
      
      private var items:Vector.<IGameObject>;
      
      private var giftWindow:GiftWindow;
      
      private var firstMoneyHelper:FirstMoneyHelper;
      
      public function GarageModel()
      {
         super();
      }
      
      private function onUpdateRank(_arg_1:UserPropertiesServiceEvent) : void
      {
         var _local_2:IGameObject = null;
         var _local_4:int = 0;
         var _local_3:Vector.<IGameObject> = this.garageWindow.itemsInStore.slice();
         while(_local_4 < _local_3.length)
         {
            _local_2 = _local_3[_local_4];
            this.garageWindow.removeItemFromStore(_local_2);
            this.garageWindow.addItemToMarket(_local_2);
            _local_4++;
         }
         var _local_5:IGameObject = this.garageWindow.selectedItem;
         this.garageWindow.selectItemInStore(_local_5);
         this.garageWindow.scrollToItemInStore(_local_5);
         this.garageWindow.updateStore();
      }
      
      public function objectLoaded() : void
      {
         this.garageWindow = new GarageWindow(getInitParam().garageBox,false);
         garageService.fizyt(this.garageWindow);
      }
      
      public function objectUnloaded() : void
      {
         if(this.garageWindow != null)
         {
            this.unregisterDumpers();
            temporaryItemNotifyService.removeListener(this);
            this.destroyGarageWindow();
            this.unregisterHelpers();
         }
         this.items = null;
         itemService.reset();
         if(!battleInfoService.isInBattle())
         {
            TextureResourcesRegistry.releaseTextureResources();
         }
      }
      
      private function registerHelpers() : void
      {
         this.firstMoneyHelper = new FirstMoneyHelper();
         helpService.registerHelper(this.HELPER_GROUP_KEY,this.HELPER_MONEY_FIRST,this.firstMoneyHelper,false);
         display.stage.addEventListener(Event.RESIZE,this.alignHelpers);
         this.alignHelpers();
      }
      
      private function unregisterHelpers() : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.alignHelpers);
         helpService.hideHelp();
         helpService.unregisterHelper(this.HELPER_GROUP_KEY,this.HELPER_MONEY_FIRST);
         this.firstMoneyHelper = null;
      }
      
      public function reloadGarage(_arg_1:String, _arg_2:int) : void
      {
         loaderWindowService.showLoaderWindow();
         CountDownTimer.resetAllTimers();
         itemService.reset();
         moneyService.sym(_arg_2 - moneyService.crystal);
         var _local_3:Alert = new Alert();
         _local_3.showAlert(_arg_1,Vector.<String>([AlertAnswer.OK]));
         display.dialogsLayer.addChild(_local_3);
         this.destroyGarageWindow();
         this.unregisterDumpers();
      }
      
      private function initGarageWindow() : void
      {
         var _local_1:DisplayObjectContainer = display.systemLayer;
         display.mainContainer.blendMode = BlendMode.LAYER;
         _local_1.addChild(this.garageWindow);
         this.alignWindow();
         this.setEvents();
      }
      
      private function setEvents() : void
      {
         display.stage.addEventListener(Event.RESIZE,this.alignWindow);
         userPropertiesService.addEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
      }
      
      private function removeEvents() : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.alignWindow);
         userPropertiesService.removeEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
      }
      
      private function destroyGarageWindow() : void
      {
         this.removeEvents();
         var _local_1:DisplayObjectContainer = display.systemLayer;
         if(_local_1.contains(this.garageWindow))
         {
            display.mainContainer.blendMode = BlendMode.NORMAL;
            this.garageWindow.destroy();
            _local_1.removeChild(this.garageWindow);
         }
         tank3DViewer.resetView();
         garageService.tisybek();
         this.garageWindow = null;
      }
      
      private function alignWindow(_arg_1:Event = null) : void
      {
         var _local_2:Stage = display.stage;
         var _local_3:int = int(Math.max(1000,_local_2.stageWidth));
         this.garageWindow.x = Math.round(_local_3 / 3);
         this.garageWindow.y = 60;
         this.garageWindow.resize(Math.round(_local_3 * 2 / 3),Math.max(display.stage.stageHeight - 60,530));
      }
      
      private function alignHelpers(_arg_1:Event = null) : void
      {
         var _local_2:int = int(Math.max(1000,display.stage.stageWidth));
         var _local_3:int = int(Math.max(600,display.stage.stageHeight));
         this.firstMoneyHelper.targetPoint = new Point(_local_2 - 350,30);
         this.updateAchievementPositions();
      }
      
      public function initMounted(_arg_1:Vector.<IGameObject>) : void
      {
         var _local_2:IGameObject = null;
         var _local_3:int = 0;
         while(_local_3 < _arg_1.length)
         {
            _local_2 = _arg_1[_local_3];
            itemService.cunybuwoq(itemService.getCategory(_local_2));
            this.mountItem(_local_2);
            _local_3++;
         }
      }
      
      public function initDepot(_arg_1:Vector.<IGameObject>) : void
      {
         this.checkAllItemsLoaded(_arg_1,"depot");
         this.initGarage();
         this.garageWindow.initDepot(_arg_1);
         this.garageWindow.addEventListener(GarageWindowEvent.WAREHOUSE_ITEM_SELECTED,this.onDepotListSelect);
         this.garageWindow.addEventListener(GarageWindowEvent.SETUP_ITEM,this.onSetupClick);
         this.garageWindow.addEventListener(GarageWindowEvent.UPGRADE_ITEM,this.onUpgradeClick);
      }
      
      private function checkAllItemsLoaded(_arg_1:Vector.<IGameObject>, _arg_2:String) : void
      {
         var _local_3:IGameObject = null;
         for each(_local_3 in _arg_1)
         {
            if(_local_3 == null)
            {
               throw new Error("Not all items have been loaded into the " + _arg_2);
            }
         }
      }
      
      private function initGarage() : void
      {
         this.registerDumpers();
         display.stage.quality = StageQuality.HIGH;
         this.registerHelpers();
         temporaryItemNotifyService.addListener(this);
      }
      
      public function initMarket(_arg_1:Vector.<IGameObject>) : void
      {
         this.checkAllItemsLoaded(_arg_1,"market");
         this.garageWindow.initStore(_arg_1);
         this.garageWindow.addEventListener(GarageWindowEvent.STORE_ITEM_SELECTED,this.onStoreListSelect);
         this.garageWindow.addEventListener(GarageWindowEvent.BUY_ITEM,this.onBuyClick);
         this.garageWindow.addEventListener(GarageWindowEvent.DELETE_PRESENT,getFunctionWrapper(this.komym));
         this.initGarageWindow();
      }
      
      private function komym(_arg_1:GarageWindowEvent) : void
      {
         Nebizo(object.adapt(Nebizo)).removePresent(_arg_1.item);
      }
      
      public function select(_arg_1:IGameObject) : void
      {
         var _local_2:IGameObject = null;
         if(itemService.cacum(_arg_1))
         {
            _local_2 = itemService.nemofoni(_arg_1);
            if(_local_2 != null)
            {
               _arg_1 = _local_2;
            }
         }
         if(this.garageWindow.isItemInStore(_arg_1))
         {
            this.garageWindow.selectItemInStore(_arg_1);
            this.garageWindow.scrollToItemInStore(_arg_1);
         }
         else
         {
            this.garageWindow.selectItemInWarehouse(_arg_1);
            this.garageWindow.scrollToItemInWarehouse(_arg_1);
         }
      }
      
      public function selectFirstItemInDepot() : void
      {
         this.garageWindow.showDefaultCategory();
      }
      
      private function loadItemPreview(_arg_1:IGameObject) : void
      {
         var _local_2:ImageResource = IItem(_arg_1.adapt(IItem)).getPreviewResource();
         if(!_local_2.isLoaded)
         {
            _local_2.loadLazyResource(this);
         }
      }
      
      private function onDepotListSelect(_arg_1:GarageWindowEvent) : void
      {
         var _local_2:IGameObject = null;
         var _local_3:IGameObject = _arg_1.item;
         var _local_4:ItemCategoryEnum = itemService.getCategory(_local_3);
         this.warehouseSelectedItem = _local_3;
         if(_local_4 == ItemCategoryEnum.WEAPON || _local_4 == ItemCategoryEnum.ARMOR)
         {
            _local_2 = itemService.nyr(_local_3);
            if(_local_2 != null)
            {
               this.loadItemPreview(_local_2);
            }
         }
         this.garageWindow.showItemInfo(_local_3,false);
         this.updateAchievementPositions();
         if(this.selectedItem != _local_3)
         {
            this.selectedItem = _local_3;
         }
      }
      
      private function onStoreListSelect(_arg_1:GarageWindowEvent) : void
      {
         var _local_2:IGameObject = _arg_1.item;
         this.garageWindow.showItemInfo(_local_2,true);
         this.updateAchievementPositions();
         if(this.selectedItem != _local_2)
         {
            this.selectedItem = _local_2;
         }
      }
      
      private function onSetupClick(_arg_1:GarageWindowEvent) : void
      {
         this.mountItem(this.warehouseSelectedItem);
         server.itemMounted(this.warehouseSelectedItem);
      }
      
      private function onUpgradeClick(_arg_1:GarageWindowEvent) : void
      {
         this.itemWaitingForConfirmation = _arg_1.item;
      }
      
      private function mountItem(_arg_1:IGameObject) : void
      {
         itemService.mountItem(_arg_1);
      }
      
      public function showConfirmAlert(_arg_1:String, _arg_2:int, _arg_3:BitmapData, _arg_4:Boolean, _arg_5:int, _arg_6:int = -1) : void
      {
         blurService.blur();
         this.confirmAlert = new ConfirmAlert(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,!_arg_4 ? localeService.getText(TanksLocale.TEXT_GARAGE_CONFIRM_ALERT_UPGRADE_QEUSTION_TEXT) : localeService.getText(TanksLocale.TEXT_GARAGE_CONFIRM_ALERT_BUY_QEUSTION_TEXT),_arg_6);
         display.dialogsLayer.addChild(this.confirmAlert);
         this.confirmAlert.confirmButton.addEventListener(MouseEvent.CLICK,this.onBuyAlertConfirm);
         this.confirmAlert.cancelButton.addEventListener(MouseEvent.CLICK,this.hideConfirmAlert);
         this.alignConfirmAlert();
         display.stage.addEventListener(Event.RESIZE,this.alignConfirmAlert);
      }
      
      private function alignConfirmAlert(_arg_1:Event = null) : void
      {
         this.confirmAlert.x = Math.round((display.stage.stageWidth - this.confirmAlert.width) * 0.5);
         this.confirmAlert.y = Math.round((display.stage.stageHeight - this.confirmAlert.height) * 0.5);
      }
      
      private function buyNextModification() : void
      {
         var _local_1:IGameObject = itemService.nyr(this.itemWaitingForConfirmation);
         var _local_2:IGameObject = itemService.ducecyra(_local_1);
         var _local_3:int = itemService.getPrice(_local_1);
         moneyService.wuc(itemService.getPrice(_local_1));
         server.nextModificationBought(_local_2,_local_3);
         this.forceUpgradePreviosModifications(_local_1);
         this.upgradeItem(_local_2,_local_1);
      }
      
      private function onBuyAlertConfirm(_arg_1:MouseEvent) : void
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         this.hideConfirmAlert();
         if(itemService.zereqyj(this.itemWaitingForConfirmation))
         {
            this.buyKit();
            this.showGiftWindow(this.itemWaitingForConfirmation);
            if(!itemService.canBuy(this.itemWaitingForConfirmation))
            {
               this.zakutaded(this.itemWaitingForConfirmation);
            }
            return;
         }
         if(itemService.cacum(this.itemWaitingForConfirmation) && itemService.jihosis(this.itemWaitingForConfirmation))
         {
            this.buyNextModification();
         }
         else
         {
            _local_3 = itemService.getPrice(this.itemWaitingForConfirmation);
            if(itemService.isCountable(this.itemWaitingForConfirmation))
            {
               _local_2 = this.garageWindow.itemInfoPanel.inventoryNumStepper.value;
               _local_3 *= _local_2;
            }
            else
            {
               _local_2 = 1;
            }
            moneyService.wuc(_local_3);
            if(itemService.capaq(this.itemWaitingForConfirmation))
            {
               Nafoh(this.itemWaitingForConfirmation.adapt(Nafoh)).confirmPresentPurchase(this.itemWaitingForConfirmation);
               return;
            }
            server.itemBought(this.itemWaitingForConfirmation,_local_2,_local_3);
            this.buyItem(this.itemWaitingForConfirmation,_local_2);
            this.garageWindow.updateKitsContainsItem(this.itemWaitingForConfirmation);
         }
      }
      
      private function buyKit() : void
      {
         var _local_1:KitItem = null;
         var _local_2:IGameObject = null;
         var _local_3:GarageKit = GarageKit(this.itemWaitingForConfirmation.adapt(GarageKit));
         var _local_4:int = _local_3.getPrice();
         if(moneyService.crystal < _local_4)
         {
            return;
         }
         moneyService.wuc(_local_4);
         server.kitBought(this.itemWaitingForConfirmation,_local_4);
         for each(_local_1 in _local_3.getItems())
         {
            _local_2 = _local_1.item;
            this.myg(_local_2,_local_1.count,_local_1.mount);
            if(!itemService.isCountable(_local_2))
            {
               this.garageWindow.updateKitsContainsItem(_local_2);
            }
         }
         this.garageWindow.showItemInCategory(this.itemWaitingForConfirmation);
      }
      
      private function showGiftWindow(_arg_1:IGameObject) : void
      {
         var _local_5:KitGiftItem = null;
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_2:Vector.<KitGiftItem> = GarageKit(_arg_1.adapt(GarageKit)).getGiftItems();
         while(_local_4 < _local_2.length)
         {
            _local_5 = _local_2[_local_4];
            if(!itemService.jihosis(_local_5.item) || itemService.isCountable(_local_5.item) || _local_5.item.hasModel(ITemporaryItem))
            {
               _local_3++;
            }
            _local_4++;
         }
         if(_local_3 > 0)
         {
            this.giftWindow = new GiftWindow(_arg_1);
            this.giftWindow.addEventListener(GiftWindowEvent.GIFT_RECEIVED,this.onGiftReceived);
         }
      }
      
      private function onGiftReceived(_arg_1:GiftWindowEvent) : void
      {
         var _local_3:KitGiftItem = null;
         this.giftWindow.removeEventListener(GiftWindowEvent.GIFT_RECEIVED,this.onGiftReceived);
         var _local_2:Vector.<KitGiftItem> = GarageKit(this.itemWaitingForConfirmation.adapt(GarageKit)).getGiftItems();
         for each(_local_3 in _local_2)
         {
            this.myg(_local_3.item,_local_3.count,false);
         }
         this.giftWindow = null;
      }
      
      private function zakutaded(_arg_1:IGameObject) : void
      {
         var _local_2:Nebaqyce = null;
         for each(_local_2 in this.garageWindow.vegyl)
         {
            if(_arg_1 == _local_2.item)
            {
               _local_2.removeListener();
            }
         }
      }
      
      private function myg(_arg_1:IGameObject, _arg_2:int, _arg_3:Boolean) : void
      {
         var _local_5:IGameObject = null;
         var _local_4:Number = NaN;
         if(itemService.canBuy(_arg_1))
         {
            this.buyItem(_arg_1,_arg_2,_arg_3);
            this.mountItem(_arg_1);
            server.itemMounted(_arg_1);
         }
      }
      
      private function forceUpgradePreviosModifications(_arg_1:IGameObject) : void
      {
         var _local_2:IGameObject = null;
         var _local_3:UpgradableItem = null;
         var _local_4:Vector.<IGameObject> = itemService.muceraqe(_arg_1);
         for each(_local_2 in _local_4)
         {
            _local_3 = UpgradableItem(_local_2.adapt(UpgradableItem));
            if(_local_3.isUpgrading())
            {
               _local_3.getCountDownTimer().stop();
            }
         }
      }
      
      private function buyItem(_arg_1:IGameObject, _arg_2:int, _arg_3:Boolean = true) : void
      {
         var _local_4:int = 0;
         var _local_5:ItemCategoryEnum = itemService.getCategory(_arg_1);
         if(_arg_1.hasModel(ITemporaryItem) && itemService.getCategory(_arg_1) == ItemCategoryEnum.PLUGIN)
         {
            ITemporaryItem(_arg_1.adapt(ITemporaryItem)).startTiming(0);
         }
         if(_local_5 != ItemCategoryEnum.INVENTORY && _local_5 != ItemCategoryEnum.LOOT_BOX)
         {
            if(itemService.cacum(_arg_1))
            {
               this.garageWindow.removeAllModifications(_arg_1);
            }
            else
            {
               this.garageWindow.removeItemFromStore(_arg_1);
            }
            this.garageWindow.addItemToDepot(_arg_1);
         }
         else if(_arg_1.name != "1000_scores_m0")
         {
            _local_4 = itemService.getCount(_arg_1);
            if(_arg_2 > 0)
            {
               itemService.setCount(_arg_1,_local_4 + _arg_2);
               this.garageWindow.updateCount(_arg_1);
            }
         }
         if(_arg_3 && itemService.joso(_arg_1) && this.tazy(_arg_1))
         {
            this.mountItem(_arg_1);
            server.itemMounted(_arg_1);
         }
      }
      
      public function tazy(_arg_1:IGameObject) : Boolean
      {
         if(!lobbyLayoutService.inBattle())
         {
            return true;
         }
         if(!battleInfoService.reArmorEnabled)
         {
            return false;
         }
         if(itemService.getCategory(_arg_1) == ItemCategoryEnum.COLOR)
         {
            return true;
         }
         var _local_2:CountDownTimer = cazygova.vyjyjyr(_arg_1);
         return _local_2.getRemainingSeconds() <= 0;
      }
      
      private function hideConfirmAlert(_arg_1:MouseEvent = null) : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.alignConfirmAlert);
         display.dialogsLayer.removeChild(this.confirmAlert);
         blurService.unblur();
         this.confirmAlert = null;
      }
      
      private function upgradeItem(_arg_1:IGameObject, _arg_2:IGameObject) : void
      {
         this.garageWindow.addItemToDepot(_arg_2);
         this.garageWindow.selectItemInWarehouse(_arg_2);
         if(!itemService.zelima(_arg_2))
         {
            this.mountItem(_arg_2);
            server.itemMounted(_arg_2);
         }
         this.garageWindow.removeItemFromDepot(_arg_1);
         this.garageWindow.updateKitsContainsItem(_arg_2);
      }
      
      private function createChangeUidForm(_arg_1:Boolean) : void
      {
         blurService.blur();
         this.changeUidForm = new ChangeUidForm(_arg_1);
         this.changeUidForm.init();
         display.dialogsLayer.addChild(this.changeUidForm);
      }
      
      private function onBuyClick(_arg_1:GarageWindowEvent) : void
      {
         var _local_2:BitmapData = null;
         var _local_3:ItemCategoryEnum = null;
         var _local_4:int = 0;
         var _local_5:Boolean = false;
         this.itemWaitingForConfirmation = _arg_1.item;
         var _local_6:int = this.getPrice(itemService.jihosis(_arg_1.item) && itemService.cacum(_arg_1.item) ? itemService.nyr(_arg_1.item) : _arg_1.item);
         if(moneyService.dic(_local_6))
         {
            if(itemService.capaq(this.itemWaitingForConfirmation))
            {
               Nafoh(_arg_1.item.adapt(Nafoh)).preparePresent(this.itemWaitingForConfirmation);
               return;
            }
            if(_arg_1.item.name == "changeUid_m0")
            {
               this.createChangeUidForm(false);
               return;
            }
            if(itemService.jihosis(this.itemWaitingForConfirmation) && itemService.cacum(this.itemWaitingForConfirmation))
            {
               _local_2 = itemService.getPreviewResource(itemService.nyr(this.itemWaitingForConfirmation)).data;
               _local_3 = itemService.getCategory(itemService.nyr(this.itemWaitingForConfirmation));
               _local_4 = itemService.getPrice(itemService.nyr(this.itemWaitingForConfirmation));
               _local_5 = itemService.isCountable(itemService.nyr(this.itemWaitingForConfirmation));
               this.showConfirmAlert(itemService.getName(itemService.nyr(this.itemWaitingForConfirmation)),_local_4,_local_2,false,_local_3 == ItemCategoryEnum.ARMOR || _local_3 == ItemCategoryEnum.WEAPON ? int(itemService.getModificationIndex(itemService.nyr(_arg_1.item))) : int(-1),!_local_5 ? int(-1) : int(this.garageWindow.itemInfoPanel.inventoryNumStepper.value));
            }
            else
            {
               _local_2 = itemService.getPreviewResource(this.itemWaitingForConfirmation).data;
               _local_3 = itemService.getCategory(this.itemWaitingForConfirmation);
               _local_4 = itemService.getPrice(this.itemWaitingForConfirmation);
               _local_5 = itemService.isCountable(this.itemWaitingForConfirmation);
               this.showConfirmAlert(itemService.getName(this.itemWaitingForConfirmation),_local_6,_local_2,true,_local_3 == ItemCategoryEnum.ARMOR || _local_3 == ItemCategoryEnum.WEAPON ? int(itemService.getModificationIndex(_arg_1.item)) : int(-1),!_local_5 ? int(-1) : int(this.garageWindow.itemInfoPanel.inventoryNumStepper.value));
            }
         }
         else
         {
            trackerService.trackEvent(GA_CATEGORY,GarageWindowEvent.ADD_CRYSTALS,itemService.getName(this.selectedItem));
         }
      }
      
      public function jezy(_arg_1:Vector.<IGameObject>) : void
      {
         var _local_2:Boolean = false;
         var _local_3:IGameObject = null;
         for each(_local_3 in _arg_1)
         {
            IItemCategory(_local_3.adapt(IItemCategory)).setCategory(ItemCategoryEnum.GIVEN_PRESENT);
            IItemViewCategory(_local_3.adapt(IItemViewCategory)).setCategory(ItemViewCategoryEnum.GIVEN_PRESENTS);
            this.garageWindow.addItemToDepot(_local_3);
            _local_2 = true;
         }
         this.garageWindow.setCategoryButtonVisibility(ItemViewCategoryEnum.GIVEN_PRESENTS,_local_2);
      }
      
      public function showCategory(_arg_1:ItemViewCategoryEnum) : void
      {
         this.garageWindow.showCategory(_arg_1);
      }
      
      private function updateAchievementPositions() : void
      {
         var _local_1:int = 0;
         if(this.garageWindow.itemInfoPanel.buyButton.enabled && this.garageWindow.itemInfoPanel.buyButton.visible)
         {
            _local_1 = this.garageWindow.x + this.garageWindow.itemInfoPanel.x;
            achievementService.setGarageBuyButtonTargetPoint(new Point(this.garageWindow.itemInfoPanel.buyButton.x + _local_1,this.garageWindow.itemInfoPanel.buyButton.y + 75));
         }
         else
         {
            achievementService.setGarageBuyButtonTargetPoint(new Point(0,0));
         }
      }
      
      public function temporaryItemTimeIsUp(_arg_1:IGameObject) : void
      {
         if(this.garageWindow != null)
         {
            this.garageWindow.removeItemFromDepot(_arg_1);
            if(itemService.getPrice(_arg_1) > 0 && itemService.isBuyable(_arg_1))
            {
               this.garageWindow.addItemToMarket(_arg_1);
            }
            else
            {
               this.garageWindow.updateSelection();
            }
         }
      }
      
      private function getPrice(_arg_1:IGameObject) : int
      {
         var _local_2:int = itemService.getPrice(_arg_1);
         if(itemService.isCountable(_arg_1))
         {
            _local_2 *= this.garageWindow.itemInfoPanel.inventoryNumStepper.value;
         }
         return _local_2;
      }
      
      private function registerDumpers() : void
      {
         this.itemDumper = new ItemDumper();
         dumpService.registerDumper(this.itemDumper);
      }
      
      private function traceUpgrades(_arg_1:FormattedOutput) : void
      {
         var _local_2:IGameObject = null;
         for each(_local_2 in this.items)
         {
            if(_local_2.hasModel(UpgradableItem))
            {
               UpgradableItem(_local_2.adapt(UpgradableItem)).traceUpgrades();
            }
         }
         _arg_1.addText("смотреть в flashlog.txt");
      }
      
      private function unregisterDumpers() : void
      {
         dumpService.unregisterDumper(this.itemDumper.dumperName);
         this.itemDumper = null;
      }
      
      public function onResourceLoadingStart(_arg_1:Resource) : void
      {
      }
      
      public function onResourceLoadingProgress(_arg_1:Resource, _arg_2:int) : void
      {
      }
      
      public function onResourceLoadingComplete(_arg_1:Resource) : void
      {
      }
      
      public function onResourceLoadingError(_arg_1:Resource, _arg_2:String) : void
      {
      }
      
      public function onResourceLoadingFatalError(_arg_1:Resource, _arg_2:String) : void
      {
      }
   }
}

