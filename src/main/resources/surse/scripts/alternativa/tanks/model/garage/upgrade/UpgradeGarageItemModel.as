package alternativa.tanks.model.garage.upgrade
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.tanks.gui.GarageWindow;
   import alternativa.tanks.gui.GarageWindowEvent;
   import alternativa.tanks.gui.upgrade.ItemPropertyUpgradeEvent;
   import alternativa.tanks.model.item.upgradable.UpgradableItem;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import alternativa.tanks.service.garage.GarageService;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.item.upgradable.speedup.SpeedUpCostCalculatorService;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.upgradingitems.UpgradingItemsService;
   import controls.timer.CountDownTimer;
   import controls.timer.CountDownTimerOnCompleteBefore;
   import flash.events.Event;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.garage.upgrade.IUpgradeGarageItemModelBase;
   import projects.tanks.client.garage.models.garage.upgrade.UpgradeGarageItemModelBase;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   [ModelInfo]
   public class UpgradeGarageItemModel extends UpgradeGarageItemModelBase implements IUpgradeGarageItemModelBase, UpgradeGarageItem, ObjectLoadPostListener, CountDownTimerOnCompleteBefore, ObjectUnloadListener, ObjectLoadListener, FlushUpgrades
   {
      
      [Inject]
      public static var upgradingItemsService:UpgradingItemsService;
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      [Inject]
      public static var garageService:GarageService;
      
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var speedUpCostCalculator:SpeedUpCostCalculatorService;
      
      [Inject]
      public static var clientLog:IClientLog;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private var garageWindow:GarageWindow;
      
      private var selectedTimer:CountDownTimer;
      
      private var selectedItem:IGameObject;
      
      private var delayUpgrades:DelayUpgrades;
      
      public function UpgradeGarageItemModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         speedUpCostCalculator.init(getInitParam().speedUpCoeff);
         this.selectedTimer = null;
         this.delayUpgrades = new DelayUpgrades(FlushUpgrades(object.adapt(FlushUpgrades)));
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.onBeginLayoutSwitch);
      }
      
      private function onBeginLayoutSwitch(param1:LobbyLayoutServiceEvent) : void
      {
         if(this.delayUpgrades.isDelayed())
         {
            this.delayUpgrades.flushToServer();
         }
      }
      
      public function objectLoadedPost() : void
      {
         this.garageWindow = garageService.tolycavu();
         this.garageWindow.itemInfoPanel.addEventListener(ItemPropertyUpgradeEvent.SPEED_UP,getFunctionWrapper(this.onSpeedUp));
         this.garageWindow.itemInfoPanel.addEventListener(ItemPropertyUpgradeEvent.UPGRADE_STARTED,getFunctionWrapper(this.onUpgradeStarted));
         this.garageWindow.itemInfoPanel.addEventListener(ItemPropertyUpgradeEvent.FLUSH_UPGRADES,getFunctionWrapper(this.onFlushUpgrades));
         this.garageWindow.addEventListener(GarageWindowEvent.STORE_ITEM_SELECTED,getFunctionWrapper(this.onStoreListSelect));
         this.garageWindow.addEventListener(GarageWindowEvent.WAREHOUSE_ITEM_SELECTED,getFunctionWrapper(this.onDepotListSelect));
      }
      
      public function objectUnloaded() : void
      {
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.onBeginLayoutSwitch);
         this.deselectTimer();
         this.delayUpgrades = null;
      }
      
      public function isUpgradesEnabled() : Boolean
      {
         return getInitParam().enabledUpgrades;
      }
      
      public function itemAlreadyUpgraded(param1:int) : void
      {
      }
      
      private function onSpeedUp(param1:ItemPropertyUpgradeEvent) : void
      {
         var _loc2_:UpgradableItemPropertyValue = param1.getPropertyValue();
         var _loc3_:int = _loc2_.getSpeedUpCost();
         this.selectedTimer.stop();
         if(this.delayUpgrades.isDelayedProperty(this.selectedItem,_loc2_.getProperty()))
         {
            this.delayUpgrades.speedUp(_loc3_);
         }
         else
         {
            server.speedUp(this.selectedItem,_loc3_);
         }
      }
      
      private function onUpgradeStarted(param1:ItemPropertyUpgradeEvent) : void
      {
         var _loc2_:CountDownTimer = param1.getTimer();
         var _loc3_:UpgradableItemPropertyValue = param1.getPropertyValue();
         var _loc4_:ItemGarageProperty = _loc3_.getProperty();
         var _loc5_:int = _loc3_.getCost();
         this.selectTimer(_loc2_);
         var _loc6_:UpgradableItem = UpgradableItem(this.selectedItem.adapt(UpgradableItem));
         _loc6_.setUpgradingProperty(_loc3_,_loc2_);
         this.delayUpgrades.startUpgrade(this.selectedItem,_loc4_,_loc5_,_loc3_.getTimeInSeconds());
      }
      
      public function onCompleteBefore(param1:CountDownTimer, param2:Boolean) : void
      {
         var _loc3_:UpgradableItem = null;
         var _loc4_:UpgradableItemPropertyValue = null;
         if(this.selectedTimer == param1)
         {
            _loc3_ = UpgradableItem(this.selectedItem.adapt(UpgradableItem));
            _loc4_ = _loc3_.getUpgradingValue();
            this.selectedTimer = null;
            _loc3_.speedUp();
            upgradingItemsService.remove(this.selectedItem);
            if(!param2)
            {
               upgradingItemsService.informServerAboutUpgradedItem(this.selectedItem);
            }
            this.garageWindow.itemInfoPanel.propertyUpgraded(_loc4_);
         }
      }
      
      private function selectTimer(param1:CountDownTimer) : void
      {
         this.deselectTimer();
         if(param1 != null)
         {
            this.selectedTimer = param1;
            this.selectedTimer.addListener(CountDownTimerOnCompleteBefore,this);
         }
      }
      
      private function deselectTimer() : void
      {
         if(this.selectedTimer != null)
         {
            this.selectedTimer.removeListener(CountDownTimerOnCompleteBefore,this);
            this.selectedTimer = null;
         }
      }
      
      private function onDepotListSelect(param1:GarageWindowEvent) : void
      {
         this.onItemSelected(param1.item,true);
      }
      
      private function onStoreListSelect(param1:GarageWindowEvent) : void
      {
         this.onItemSelected(param1.item,false);
      }
      
      private function onItemSelected(param1:IGameObject, param2:Boolean) : void
      {
         if(this.selectedItem != param1)
         {
            this.deselectTimer();
            this.selectedItem = param1;
            if(param2)
            {
               if(this.selectedItem.hasModel(UpgradableItem))
               {
                  this.selectTimer(UpgradableItem(this.selectedItem.adapt(UpgradableItem)).getCountDownTimer());
               }
            }
         }
      }
      
      private function onFlushUpgrades(param1:Event) : void
      {
         if(this.delayUpgrades.isDelayed())
         {
            this.delayUpgrades.flushToServer();
         }
      }
      
      public function flushToServer(param1:DelayUpgrades, param2:IGameObject) : void
      {
         var _loc3_:int = 0;
         if(param1.isDelayed())
         {
            _loc3_ = param1.getNumLevels();
            if(_loc3_ > 0)
            {
               server.instantUpgrade(param2,param1.getProperty(),_loc3_,param1.getCost());
            }
            if(param1.isUpgradeStarted())
            {
               server.upgradeItem(param2,param1.getProperty(),param1.getStartUpgradeCost(),param1.getUpgradeTime());
            }
         }
      }
   }
}

