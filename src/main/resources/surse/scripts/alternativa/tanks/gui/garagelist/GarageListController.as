package alternativa.tanks.gui.garagelist
{
   import alternativa.tanks.gui.Nebaqyce;
   import alternativa.tanks.gui.category.CategoryButtonsList;
   import alternativa.tanks.gui.category.CategoryButtonsListEvent;
   import alternativa.tanks.model.item.kit.GarageKit;
   import alternativa.tanks.model.item.present.PresentItem;
   import alternativa.tanks.service.garage.GarageService;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.notificationcategories.INotificationGarageCategoriesService;
   import alternativa.tanks.service.notificationcategories.NotificationGarageCategoriesEvent;
   import alternativa.utils.removeDisplayObject;
   import controls.timer.CountDownTimer;
   import flash.events.Event;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import obfuscation.kugoj.Nur;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.UserPropertiesServiceEvent;
   
   public class GarageListController
   {
      
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var premiumService:PremiumService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var notificationGarageCategoriesService:INotificationGarageCategoriesService;
      
      [Inject]
      public static var garageService:GarageService;
      
      private static const DEFAULT_CATEGORY_TO_SHOW:ItemViewCategoryEnum = ItemViewCategoryEnum.WEAPON;
      
      private static const LAST_SHOWED_GARAGE_CATEGORY_SHARED_KEY:String = "LAST_SHOWED_GARAGE_CATEGORY";
      
      private static const UPDATE_VISIBILITY_DISCOUNT_INDICATORS_DELAY:int = 1000;
      
      private var _garageList:GarageList;
      
      private var _categoryButtons:CategoryButtonsList;
      
      private var _itemsInDepot:Vector.<IGameObject>;
      
      private var _itemsInStore:Vector.<IGameObject>;
      
      private var _itemsInStoreFromServer:Vector.<IGameObject>;
      
      private var _currentShowingCategory:ItemViewCategoryEnum;
      
      private var satutiro:Nur;
      
      private var _updateVisibilityDiscountIndicatorsTimeoutId:uint;
      
      public function GarageListController(_arg_1:GarageList, _arg_2:CategoryButtonsList)
      {
         super();
         this._garageList = _arg_1;
         this._categoryButtons = _arg_2;
         this.init();
      }
      
      private function init() : void
      {
         this._itemsInDepot = new Vector.<IGameObject>();
         this._itemsInStore = new Vector.<IGameObject>();
         userPropertiesService.addEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onRankChange);
         notificationGarageCategoriesService.addEventListener(NotificationGarageCategoriesEvent.NOTIFICATION_CHANGE,this.onChangeNotificationGarageCategory);
         this._categoryButtons.addEventListener(CategoryButtonsListEvent.CATEGORY_SELECTED,this.onCategoryButtonsSelected);
         premiumService.addEventListener(Event.CHANGE,this.onSelfPremiumChanged);
         this.updateVisibilityNotificationIconOnCategories();
      }
      
      private function onRankChange(_arg_1:UserPropertiesServiceEvent) : void
      {
         this.updateStore();
         this.showCategory(this._currentShowingCategory);
      }
      
      private function onCategoryButtonsSelected(_arg_1:CategoryButtonsListEvent) : void
      {
         if(this._currentShowingCategory != _arg_1.getCategory())
         {
            this.showCategory(_arg_1.getCategory());
         }
      }
      
      private function onSelfPremiumChanged(_arg_1:Event) : void
      {
         var _local_2:IGameObject = null;
         var _local_3:int = this._garageList.itemsCount() - 1;
         while(_local_3 >= 0)
         {
            _local_2 = this._garageList.getItemAt(_local_3);
            if(itemService.miqysi(_local_2) && this.isItemInStore(_local_2))
            {
               this._garageList.updateShowLockPremium(_local_2,!premiumService.hasPremium());
            }
            _local_3--;
         }
         this._garageList.sort();
         this.selectAndScrollToItemInCategory(this._garageList.selectedItem);
      }
      
      private function onChangeNotificationGarageCategory(_arg_1:NotificationGarageCategoriesEvent) : void
      {
         this.updateVisibilityNotificationIconOnCategories();
      }
      
      private function updateVisibilityNotificationIconOnCategories() : void
      {
         var _local_1:ItemViewCategoryEnum = null;
         var _local_4:int = 0;
         var _local_2:Vector.<ItemViewCategoryEnum> = ItemViewCategoryEnum.values;
         var _local_3:int = int(_local_2.length);
         while(_local_4 < _local_3)
         {
            _local_1 = _local_2[_local_4];
            if(notificationGarageCategoriesService.mizedi(_local_1))
            {
               if(this._currentShowingCategory == _local_1)
               {
                  notificationGarageCategoriesService.wefe(_local_1);
               }
               else
               {
                  this._categoryButtons.hideDiscountIndicator(_local_1);
                  this._categoryButtons.showNewItemIndicator(_local_1);
               }
            }
            _local_4++;
         }
      }
      
      public function initDepot(_arg_1:Vector.<IGameObject>) : void
      {
         this._itemsInDepot = _arg_1;
         this.addItemToItemService(_arg_1);
         this.excludeInventoryFromDepot();
      }
      
      private function addItemToItemService(_arg_1:Vector.<IGameObject>) : void
      {
         var _local_3:int = 0;
         var _local_2:int = int(_arg_1.length);
         while(_local_3 < _local_2)
         {
            itemService.addItem(_arg_1[_local_3]);
            _local_3++;
         }
      }
      
      private function excludeInventoryFromDepot() : void
      {
         var _local_1:IGameObject = null;
         var _local_4:int = 0;
         var _local_2:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _local_3:int = int(this._itemsInDepot.length);
         while(_local_4 < _local_3)
         {
            _local_1 = this._itemsInDepot[_local_4];
            if(itemService.getCategory(_local_1) != ItemCategoryEnum.INVENTORY && itemService.getCategory(_local_1) != ItemCategoryEnum.LOOT_BOX)
            {
               _local_2.push(_local_1);
            }
            else
            {
               this._itemsInStore.push(_local_1);
            }
            _local_4++;
         }
         this._itemsInDepot = _local_2;
      }
      
      private function excludeRepeatingModificationFromDepot() : void
      {
         var _local_1:IGameObject = null;
         var _local_4:int = 0;
         var _local_2:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _local_3:int = int(this._itemsInDepot.length);
         while(_local_4 < _local_3)
         {
            _local_1 = this._itemsInDepot[_local_4];
            if(itemService.cacum(_local_1))
            {
               if(_local_1 == itemService.nemofoni(_local_1))
               {
                  _local_2.push(_local_1);
               }
            }
            else
            {
               _local_2.push(_local_1);
            }
            _local_4++;
         }
         this._itemsInDepot = _local_2;
      }
      
      public function initStore(_arg_1:Vector.<IGameObject>) : void
      {
         this._itemsInStoreFromServer = _arg_1;
         this.updateStore();
      }
      
      private function updateStore() : void
      {
         this.addBuyableItemToStore();
         this.excludeNotBuyableModificationItemFromStore();
         this.updateKitsFromStore();
      }
      
      private function updateKitsFromStore() : void
      {
         var _local_1:IGameObject = null;
         var _local_2:Vector.<KitItem> = null;
         var _local_3:KitItem = null;
         var _local_5:int = 0;
         this.satutiro = new Nur();
         var _local_4:int = int(this._itemsInStore.length);
         while(_local_5 < _local_4)
         {
            _local_1 = this._itemsInStore[_local_5];
            if(itemService.zereqyj(_local_1))
            {
               _local_2 = GarageKit(_local_1.adapt(GarageKit)).getItems();
               for each(_local_3 in _local_2)
               {
                  this.satutiro.put(_local_3.item,_local_1);
               }
            }
            _local_5++;
         }
      }
      
      public function updateKitsContainsItem(_arg_1:IGameObject) : void
      {
         var _local_2:IGameObject = null;
         if(this.satutiro == null)
         {
            return;
         }
         var _local_3:Vector.<IGameObject> = this.satutiro.getValues(_arg_1);
         var _local_4:int = _local_3.length - 1;
         while(_local_4 >= 0)
         {
            _local_2 = _local_3[_local_4];
            if(!itemService.canBuy(_local_2))
            {
               this.removeSingleItemFromStore(_local_2);
            }
            else
            {
               this._garageList.updateCost(_local_2,itemService.getPrice(_local_2));
            }
            _local_4--;
         }
      }
      
      private function addBuyableItemToStore() : void
      {
         var _local_1:IGameObject = null;
         var _local_3:int = 0;
         var _local_2:int = int(this._itemsInStoreFromServer.length);
         while(_local_3 < _local_2)
         {
            _local_1 = this._itemsInStoreFromServer[_local_3];
            if(itemService.canBuy(_local_1) && this.availableInPartner(_local_1))
            {
               this._itemsInStore.push(_local_1);
            }
            _local_3++;
         }
      }
      
      private function availableInPartner(_arg_1:IGameObject) : Boolean
      {
         return true;
      }
      
      private function excludeNotBuyableModificationItemFromStore() : void
      {
         var _local_1:IGameObject = null;
         var _local_2:IGameObject = null;
         var _local_3:IGameObject = null;
         var _local_6:int = 0;
         var _local_4:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _local_5:int = int(this._itemsInStore.length);
         while(_local_6 < _local_5)
         {
            _local_1 = this._itemsInStore[_local_6];
            if(itemService.cacum(_local_1))
            {
               if(itemService.miqysi(_local_1))
               {
                  _local_4.push(_local_1);
               }
               else
               {
                  _local_2 = itemService.nemofoni(_local_1);
                  if(_local_2 == null && itemService.getModificationIndex(_local_1) == 0)
                  {
                     _local_4.push(_local_1);
                  }
               }
            }
            else
            {
               _local_4.push(_local_1);
            }
            _local_6++;
         }
         this._itemsInStore = _local_4;
      }
      
      public function showCategory(_arg_1:ItemViewCategoryEnum, _arg_2:IGameObject = null) : void
      {
         var _local_3:ItemViewCategoryEnum = null;
         var _local_4:IGameObject = null;
         var _local_5:IGameObject = null;
         var _local_6:int = 0;
         var _local_10:int = 0;
         if(!this._categoryButtons.getCategoryButtonVisibility(_arg_1))
         {
            _local_3 = this._categoryButtons.findVisibleCategory();
            this.showCategory(_local_3);
            return;
         }
         this._currentShowingCategory = _arg_1;
         this._categoryButtons.select(_arg_1);
         var _local_7:Vector.<IGameObject> = this.getItemsByCategory(this._itemsInDepot,_arg_1);
         var _local_8:Vector.<IGameObject> = this.getItemsByCategory(this._itemsInStore,_arg_1);
         this._garageList.clearList();
         var _local_9:int = int(_local_7.length);
         while(_local_10 < _local_9)
         {
            this._garageList.addItem(this.createData(_local_7[_local_10],true));
            _local_10++;
         }
         _local_9 = int(_local_8.length);
         _local_10 = 0;
         while(_local_10 < _local_9)
         {
            this._garageList.addItem(this.createData(_local_8[_local_10],false));
            _local_10++;
         }
         this._garageList.sort();
         storageService.getStorage().data[LAST_SHOWED_GARAGE_CATEGORY_SHARED_KEY] = _arg_1.value;
         if(this._garageList.itemsCount() > 0)
         {
            _local_4 = this._garageList.getItemAt(0);
            if(_arg_2 == null)
            {
               _local_5 = this.getMountedItemInCategory(_local_7);
               if(_local_5 == null)
               {
                  this.selectAndScrollToItemInCategory(_local_4);
               }
               else
               {
                  this._garageList.scrollTo(_local_4);
                  this._garageList.select(_local_5);
               }
            }
            else
            {
               _local_6 = this._garageList.indexById(_arg_2);
               if(_local_6 == -1)
               {
                  this.selectAndScrollToItemInCategory(_local_4);
               }
               else
               {
                  this.selectAndScrollToItemInCategory(_arg_2);
               }
            }
         }
         this.resetNotificationCategory(_arg_1);
         this.updateVisibilityDiscountIndicators();
      }
      
      private function getMountedItemInCategory(_arg_1:Vector.<IGameObject>) : IGameObject
      {
         var _local_2:IGameObject = null;
         var _local_3:IGameObject = null;
         var _local_5:int = 0;
         var _local_4:int = int(_arg_1.length);
         while(_local_5 < _local_4)
         {
            _local_3 = _arg_1[_local_5];
            if(itemService.zelima(_local_3))
            {
               _local_2 = _local_3;
               break;
            }
            _local_5++;
         }
         return _local_2;
      }
      
      private function resetNotificationCategory(_arg_1:ItemViewCategoryEnum) : void
      {
         this._categoryButtons.hideNewItemIndicator(_arg_1);
         notificationGarageCategoriesService.wefe(_arg_1);
      }
      
      private function selectAndScrollToItemInCategory(_arg_1:IGameObject) : void
      {
         this._garageList.unselect();
         this._garageList.select(_arg_1);
         this._garageList.scrollTo(_arg_1);
      }
      
      private function createData(_arg_1:IGameObject, _arg_2:Boolean) : GarageListRendererData
      {
         var _local_3:GarageListRendererData = new GarageListRendererData();
         _local_3.id = _arg_1;
         _local_3.name = itemService.getName(_arg_1);
         _local_3.type = itemService.getCategory(_arg_1);
         _local_3.mod = itemService.getModificationIndex(_arg_1);
         _local_3.crystalPrice = itemService.getPrice(_arg_1);
         if(_arg_2)
         {
            _local_3.rank = -1;
            _local_3.showLockPremium = false;
            _local_3.discount = this.getDiscountForDepotItem(_arg_1);
         }
         else
         {
            _local_3.rank = this.determineShowingRankIndex(_arg_1);
            _local_3.showLockPremium = itemService.miqysi(_arg_1) && !premiumService.hasPremium();
            _local_3.discount = itemService.getDiscount(_arg_1);
         }
         _local_3.installed = itemService.zelima(_arg_1);
         _local_3.garageElement = _arg_2;
         _local_3.count = itemService.getCount(_arg_1);
         _local_3.preview = itemService.getPreviewResource(_arg_1);
         _local_3.sort = itemService.getPosition(_arg_1);
         _local_3.timerDiscount = this.getEndDiscountTimer(_arg_1,_arg_2);
         if(itemService.gotol(_arg_1))
         {
            _local_3.appearanceTime = PresentItem(_arg_1.adapt(PresentItem)).getDate().time;
         }
         return _local_3;
      }
      
      private function getDiscountForDepotItem(_arg_1:IGameObject) : int
      {
         var _local_2:IGameObject = null;
         var _local_3:int = 0;
         if(itemService.isCountable(_arg_1))
         {
            _local_3 = itemService.getDiscount(_arg_1);
         }
         else if(itemService.cacum(_arg_1) && itemService.hasNextModification(_arg_1))
         {
            _local_2 = itemService.hefigiv(_arg_1);
            _local_3 = itemService.getDiscount(_local_2);
         }
         return _local_3;
      }
      
      private function determineShowingRankIndex(_arg_1:IGameObject) : int
      {
         var _local_2:int = itemService.ruma(_arg_1);
         var _local_3:int = itemService.hun(_arg_1);
         var _local_4:int = userPropertiesService.rank;
         if(_local_4 < _local_2)
         {
            return _local_2;
         }
         if(_local_4 > _local_3)
         {
            return _local_3;
         }
         return 0;
      }
      
      private function getEndDiscountTimer(_arg_1:IGameObject, _arg_2:Boolean) : CountDownTimer
      {
         if(itemService.zereqyj(_arg_1))
         {
            return this.getEndDiscountTimerForKit(_arg_1);
         }
         var _local_3:IGameObject = _arg_1;
         if(itemService.cacum(_arg_1) && _arg_2)
         {
            if(!itemService.hasNextModification(_arg_1))
            {
               return null;
            }
            _local_3 = itemService.hefigiv(_arg_1);
         }
         return itemService.getEndDiscountTimer(_local_3);
      }
      
      private function getEndDiscountTimerForKit(_arg_1:IGameObject) : CountDownTimer
      {
         var _local_2:CountDownTimer = null;
         var _local_3:Nebaqyce = null;
         var _local_6:int = 0;
         var _local_4:Vector.<Nebaqyce> = garageService.tolycavu().nobam();
         var _local_5:int = int(_local_4.length);
         while(_local_6 < _local_5)
         {
            _local_3 = _local_4[_local_6];
            if(_local_3.item == _arg_1)
            {
               _local_2 = _local_3.timer;
               break;
            }
            _local_6++;
         }
         return _local_2;
      }
      
      public function getItemsByCategory(_arg_1:Vector.<IGameObject>, _arg_2:ItemViewCategoryEnum) : Vector.<IGameObject>
      {
         var _local_3:IGameObject = null;
         var _local_6:int = 0;
         var _local_4:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _local_5:int = int(_arg_1.length);
         while(_local_6 < _local_5)
         {
            _local_3 = _arg_1[_local_6];
            if(itemService.rivozip(_local_3) == _arg_2)
            {
               _local_4.push(_local_3);
            }
            _local_6++;
         }
         return _local_4;
      }
      
      public function destroy() : void
      {
         userPropertiesService.removeEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onRankChange);
         notificationGarageCategoriesService.removeEventListener(NotificationGarageCategoriesEvent.NOTIFICATION_CHANGE,this.onChangeNotificationGarageCategory);
         this._categoryButtons.removeEventListener(CategoryButtonsListEvent.CATEGORY_SELECTED,this.onCategoryButtonsSelected);
         premiumService.removeEventListener(Event.CHANGE,this.onSelfPremiumChanged);
         clearTimeout(this._updateVisibilityDiscountIndicatorsTimeoutId);
         removeDisplayObject(this._garageList);
         removeDisplayObject(this._categoryButtons);
         this._garageList.destroy();
         this._categoryButtons.destroy();
         this._garageList = null;
         this._categoryButtons = null;
         this._itemsInDepot = null;
         this._itemsInStore = null;
      }
      
      public function isItemInDepot(_arg_1:IGameObject) : Boolean
      {
         if(this._itemsInDepot == null)
         {
            return false;
         }
         return this._itemsInDepot.indexOf(_arg_1) != -1;
      }
      
      public function isItemInStore(_arg_1:IGameObject) : Boolean
      {
         if(this._itemsInStore == null)
         {
            return false;
         }
         return this._itemsInStore.indexOf(_arg_1) != -1;
      }
      
      public function addItemToDepot(_arg_1:IGameObject) : void
      {
         if(this.isItemInDepot(_arg_1))
         {
            return;
         }
         itemService.addItem(_arg_1);
         this._itemsInDepot.push(_arg_1);
         this.updateVisibilityDiscountIndicatorsWithDelay();
         if(this._currentShowingCategory == itemService.rivozip(_arg_1))
         {
            this._garageList.addItem(this.createData(_arg_1,true));
            this._garageList.sort();
            this.selectAndScrollToItemInCategory(_arg_1);
         }
      }
      
      public function removeItemFromDepot(_arg_1:IGameObject) : void
      {
         var _local_2:int = this._itemsInDepot.indexOf(_arg_1);
         if(_local_2 != -1)
         {
            itemService.removeItem(_arg_1);
            this._itemsInDepot.splice(_local_2,1);
         }
         if(this._garageList.indexById(_arg_1) != -1)
         {
            this._garageList.deleteItem(_arg_1);
         }
         this.updateSelection();
      }
      
      public function addItemToStore(_arg_1:IGameObject) : void
      {
         if(this.isItemInStore(_arg_1) || !itemService.canBuy(_arg_1))
         {
            return;
         }
         this._itemsInStore.push(_arg_1);
         if(this._currentShowingCategory == itemService.rivozip(_arg_1))
         {
            this._garageList.addItem(this.createData(_arg_1,false));
            this._garageList.sort();
            this.selectAndScrollToItemInCategory(_arg_1);
         }
      }
      
      public function removeSingleItemFromStore(_arg_1:IGameObject) : void
      {
         var _local_2:Vector.<KitItem> = null;
         var _local_3:KitItem = null;
         var _local_4:int = this._itemsInStore.indexOf(_arg_1);
         if(_local_4 != -1)
         {
            this._itemsInStore.splice(_local_4,1);
         }
         if(this._garageList.indexById(_arg_1) != -1)
         {
            this._garageList.deleteItem(_arg_1);
         }
         if(itemService.zereqyj(_arg_1))
         {
            _local_2 = GarageKit(_arg_1.adapt(GarageKit)).getItems();
            for each(_local_3 in _local_2)
            {
               this.satutiro.remove(_local_3.item,_arg_1);
            }
         }
      }
      
      public function removeItemFromStore(_arg_1:IGameObject) : void
      {
         this.removeSingleItemFromStore(_arg_1);
         this.updateSelection();
      }
      
      private function removeGroupedItemsFromStore(_arg_1:IGameObject) : void
      {
      }
      
      public function get itemsInDepot() : Vector.<IGameObject>
      {
         return this._itemsInDepot;
      }
      
      public function showDefaultCategory() : void
      {
         this.showCategory(this.getCategoryFromShared());
      }
      
      private function getCategoryFromShared() : ItemViewCategoryEnum
      {
         var _local_1:int = 0;
         if(storageService.getStorage().data.hasOwnProperty(LAST_SHOWED_GARAGE_CATEGORY_SHARED_KEY))
         {
            _local_1 = int(storageService.getStorage().data[LAST_SHOWED_GARAGE_CATEGORY_SHARED_KEY]);
            if(_local_1 < 0 || _local_1 >= ItemViewCategoryEnum.values.length)
            {
               return DEFAULT_CATEGORY_TO_SHOW;
            }
            return ItemViewCategoryEnum.values[_local_1];
         }
         return DEFAULT_CATEGORY_TO_SHOW;
      }
      
      public function showItemInCategory(_arg_1:IGameObject) : void
      {
         var _local_2:IGameObject = null;
         var _local_3:IGameObject = _arg_1;
         if(itemService.cacum(_arg_1))
         {
            _local_2 = itemService.nemofoni(_arg_1);
            if(_local_2 != null)
            {
               _local_3 = _local_2;
            }
            else
            {
               _local_3 = itemService.mepuge(_arg_1);
            }
         }
         this.showCategory(itemService.rivozip(_local_3),_local_3);
      }
      
      public function updateSelection() : void
      {
         if(this._garageList.selectedItem == null && this._garageList.itemsCount() > 0)
         {
            this.selectAndScrollToItemInCategory(this._garageList.getItemAt(0));
         }
      }
      
      public function updateDiscount(_arg_1:IGameObject) : void
      {
         var _local_2:IGameObject = null;
         this.updateKitsContainsItem(_arg_1);
         this.updateVisibilityDiscountIndicatorsWithDelay();
         if(this.isItemInStore(_arg_1))
         {
            this._garageList.updateDiscountAndCost(_arg_1,itemService.getDiscount(_arg_1),itemService.getEndDiscountTimer(_arg_1),itemService.getPrice(_arg_1));
            return;
         }
         if(itemService.cacum(_arg_1))
         {
            _local_2 = itemService.nemofoni(_arg_1);
            if(_local_2 != null && itemService.hefigiv(_local_2) == _arg_1)
            {
               this._garageList.updateDiscountWithTimer(_local_2,itemService.getDiscount(_arg_1),itemService.getEndDiscountTimer(_arg_1));
            }
            return;
         }
         if(itemService.isCountable(_arg_1))
         {
            this._garageList.updateDiscountAndCost(_arg_1,itemService.getDiscount(_arg_1),itemService.getEndDiscountTimer(_arg_1),itemService.getPrice(_arg_1));
         }
      }
      
      private function updateVisibilityDiscountIndicatorsWithDelay() : void
      {
         clearTimeout(this._updateVisibilityDiscountIndicatorsTimeoutId);
         this._updateVisibilityDiscountIndicatorsTimeoutId = setTimeout(this.updateVisibilityDiscountIndicators,UPDATE_VISIBILITY_DISCOUNT_INDICATORS_DELAY);
      }
      
      private function updateVisibilityDiscountIndicators() : void
      {
         var _local_1:ItemViewCategoryEnum = null;
         var _local_2:Boolean = false;
         var _local_5:int = 0;
         var _local_3:Vector.<ItemViewCategoryEnum> = ItemViewCategoryEnum.values;
         var _local_4:int = int(_local_3.length);
         while(_local_5 < _local_4)
         {
            _local_1 = _local_3[_local_5];
            _local_2 = false;
            if(_local_1 != ItemViewCategoryEnum.KIT && !notificationGarageCategoriesService.mizedi(_local_1))
            {
               if(this.hasAvailableTemporaryDiscounts(_local_1))
               {
                  _local_2 = true;
               }
            }
            if(_local_2)
            {
               this._categoryButtons.showDiscountIndicator(_local_1);
            }
            else
            {
               this._categoryButtons.hideDiscountIndicator(_local_1);
            }
            _local_5++;
         }
      }
      
      private function hasAvailableTemporaryDiscounts(_arg_1:ItemViewCategoryEnum) : Boolean
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         var _local_4:IGameObject = null;
         var _local_5:IGameObject = null;
         var _local_6:Vector.<IGameObject> = this.getItemsByCategory(this._itemsInDepot,_arg_1);
         _local_3 = int(_local_6.length);
         _local_2 = 0;
         while(_local_2 < _local_3)
         {
            _local_4 = _local_6[_local_2];
            if(this.isAvailableTemporaryDiscount(_local_4,true))
            {
               return true;
            }
            _local_2++;
         }
         var _local_7:Vector.<IGameObject> = this.getItemsByCategory(this._itemsInStore,_arg_1);
         _local_3 = int(_local_7.length);
         _local_2 = 0;
         while(_local_2 < _local_3)
         {
            _local_5 = _local_7[_local_2];
            if(this.isAvailableTemporaryDiscount(_local_5,false))
            {
               return true;
            }
            _local_2++;
         }
         return false;
      }
      
      private function isAvailableTemporaryDiscount(_arg_1:IGameObject, _arg_2:Boolean) : Boolean
      {
         var _local_3:Boolean = false;
         var _local_4:CountDownTimer = null;
         if(_arg_2)
         {
            if(this.getDiscountForDepotItem(_arg_1) > 0)
            {
               _local_4 = this.getEndDiscountTimer(_arg_1,_arg_2);
            }
         }
         else if(userPropertiesService.rank >= itemService.ruma(_arg_1))
         {
            _local_4 = itemService.getEndDiscountTimer(_arg_1);
         }
         if(_local_4 != null)
         {
            _local_3 = _local_4.getEndTime() > getTimer();
         }
         return _local_3;
      }
      
      public function getCurrentCategoryItemsCount() : int
      {
         return this._garageList.itemsCount();
      }
   }
}

