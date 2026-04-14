package alternativa.tanks.controllers.battlelist
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.controllers.BattleSelectVectorUtil;
   import alternativa.tanks.model.battleselect.BattleSelectModel;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.view.battlelist.IBattleListView;
   import alternativa.types.Long;
   import flash.events.EventDispatcher;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import obfuscation.fabuqy.Nukoki;
   import obfuscation.fabuqy.Suvozimi;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.UserPropertiesServiceEvent;
   
   public class BattleListController extends EventDispatcher implements IBattleListViewControllerCallBack
   {
      
      [Inject]
      public static var battleInfoFormService:IBattleInfoFormService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private static var _lastShowedItem:String;
      
      private static const FILTER_BY_DM:String = "FILTER_BY_DM";
      
      private static const FILTER_BY_TDM:String = "FILTER_BY_TDM";
      
      private static const FILTER_BY_CTF:String = "FILTER_BY_CTF";
      
      private static const FILTER_BY_CP:String = "FILTER_BY_CP";
      
      private static const RESPONSE_TIMEOUT:int = 400;
      
      private var _filterByDmBattle:Boolean;
      
      private var _filterByTdmBattle:Boolean;
      
      private var _filterByCtfBattle:Boolean;
      
      private var _filterByCpBattle:Boolean;
      
      private var _currentLockedBattleMode:Suvozimi;
      
      private var _view:IBattleListView;
      
      private var _selectedItem:String;
      
      private var _timeOutChangeBattleItem:uint;
      
      private var _allItems:Vector.<BattleListItemParams>;
      
      private var _itemsAwaitPacketJoinSuccess:Array;
      
      private var _isItemsPacketJoinSuccess:Boolean;
      
      public function BattleListController(_arg_1:IBattleListView)
      {
         super();
         this._view = _arg_1;
         this.init();
      }
      
      private static function getBoolean(_arg_1:String, _arg_2:Boolean) : Boolean
      {
         var _local_3:* = storageService.getStorage().data[_arg_1];
         return _local_3 == null ? Boolean(_arg_2) : Boolean(_local_3);
      }
      
      private static function storeBoolean(_arg_1:String, _arg_2:Boolean) : void
      {
         storageService.getStorage().data[_arg_1] = _arg_2;
      }
      
      private function init() : void
      {
         this._allItems = new Vector.<BattleListItemParams>();
         this._itemsAwaitPacketJoinSuccess = new Array();
         this._view.setCallBack(this);
         this.setFilterBattleModeFormStorage();
      }
      
      private function setFilterBattleModeFormStorage() : void
      {
         this._filterByDmBattle = getBoolean(FILTER_BY_DM,true);
         this._filterByTdmBattle = getBoolean(FILTER_BY_TDM,true);
         this._filterByCtfBattle = getBoolean(FILTER_BY_CTF,true);
         this._filterByCpBattle = getBoolean(FILTER_BY_CP,true);
         if(!this._filterByDmBattle && !this._filterByTdmBattle && !this._filterByCtfBattle && !this._filterByCpBattle)
         {
            this._filterByDmBattle = true;
            this._filterByTdmBattle = true;
            this._filterByCtfBattle = true;
            this._filterByCpBattle = true;
         }
         this.updatePressedBattleMode();
      }
      
      public function destroy() : void
      {
         if(!lobbyLayoutService.inBattle())
         {
         }
         clearTimeout(this._timeOutChangeBattleItem);
         this.removeEvents();
         this._view.destroy();
         this._view = null;
         this._selectedItem = null;
         this._allItems = null;
         this._itemsAwaitPacketJoinSuccess = null;
         this._isItemsPacketJoinSuccess = false;
      }
      
      public function showForm() : void
      {
         this._view.show(this._filterByDmBattle,this._filterByTdmBattle,this._filterByCtfBattle,this._filterByCpBattle);
         this.setEvents();
      }
      
      private function setEvents() : void
      {
         userPropertiesService.addEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
      }
      
      private function onUpdateRank(_arg_1:UserPropertiesServiceEvent) : void
      {
         this._view.updateAvailableItems(_arg_1.userProperties.rank);
      }
      
      private function selectBattleItemById(_arg_1:String) : void
      {
         var _local_2:BattleListItemParams = this.findBattleListItem(_arg_1);
         if(_local_2 == null)
         {
            this.resetSelectedItem();
            dispatchEvent(new BattleByURLNotFoundEvent(BattleByURLNotFoundEvent.BATTLE_BY_URL_NOT_FOUND,_arg_1));
         }
         else if(_local_2.id != this._selectedItem)
         {
            this.selectBattleItem(_local_2.id,true,true);
         }
      }
      
      private function findBattleListItem(_arg_1:String) : BattleListItemParams
      {
         var _local_2:BattleListItemParams = null;
         var _local_4:int = 0;
         var _local_3:int = int(this._allItems.length);
         while(_local_4 < _local_3)
         {
            if(this.getIdBattlePart(this._allItems[_local_4].id) == _arg_1)
            {
               _local_2 = this._allItems[_local_4];
               break;
            }
            _local_4++;
         }
         return _local_2;
      }
      
      private function selectBattleItem(_arg_1:String, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Number = 0) : void
      {
         var _local_5:BattleListItemParams = null;
         clearTimeout(this._timeOutChangeBattleItem);
         this._selectedItem = _arg_1;
         if(_arg_2)
         {
            if(this._view.getItemIndex(_arg_1) < 0)
            {
               _local_5 = BattleSelectVectorUtil.findElementInVector(this._allItems,_arg_1);
               if(_local_5 != null)
               {
                  this._view.createItem(_local_5,true);
                  if(_local_5.id == battleInfoFormService.getBattleItemId())
                  {
                     battleInfoFormService.vamo();
                  }
               }
            }
            this._view.setSelect(this._selectedItem);
         }
         if(_arg_3)
         {
            if(_arg_4 == 0)
            {
               dispatchEvent(new BattleSelectedEvent(BattleSelectedEvent.BATTLE_SELECTED,this._selectedItem));
            }
            else
            {
               this._timeOutChangeBattleItem = setTimeout(this.battleItemListChangeDelay,_arg_4);
            }
         }
         if(_lastShowedItem == this._selectedItem)
         {
            battleInfoFormService.vamo();
         }
         _lastShowedItem = this._selectedItem;
      }
      
      private function getIdBattlePart(_arg_1:String) : String
      {
         return _arg_1;
      }
      
      public function onBattleListItemClick(_arg_1:String) : void
      {
         this.selectBattleItem(_arg_1,false,true);
      }
      
      public function onBattleListItemChange(_arg_1:String) : void
      {
         if(this._selectedItem != null)
         {
            if(this._selectedItem != _arg_1)
            {
               this.selectBattleItem(_arg_1,false,true,RESPONSE_TIMEOUT);
            }
         }
         else
         {
            this.selectBattleItem(_arg_1,false,true);
         }
      }
      
      public function selectBattleItemFromServer(_arg_1:String) : void
      {
         clearTimeout(this._timeOutChangeBattleItem);
         if(_arg_1 == null)
         {
            this.resetSelectedItem();
         }
         else
         {
            this.selectBattleItem(_arg_1,true,false);
         }
      }
      
      private function battleItemListChangeDelay() : void
      {
         dispatchEvent(new BattleSelectedEvent(BattleSelectedEvent.BATTLE_SELECTED,this._selectedItem));
      }
      
      private function resetSelectedItem() : void
      {
         if(this._selectedItem != null)
         {
            this._selectedItem = null;
            this._view.resetSelectedItem();
         }
      }
      
      public function hideForm() : void
      {
         this.removeEvents();
         this._view.hide();
      }
      
      private function removeEvents() : void
      {
         userPropertiesService.removeEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
      }
      
      public function battleItemRecord(_arg_1:IGameObject, _arg_2:Suvozimi, _arg_3:String, _arg_4:Boolean = true, _arg_5:int = 0, _arg_6:int = 0, _arg_7:int = 0, _arg_8:int = 0, _arg_9:int = 0, _arg_10:int = 0, _arg_11:int = 0, _arg_12:String = "", _arg_13:Nukoki = null, _arg_14:Boolean = false, _arg_15:Boolean = false, _arg_16:Boolean = false, _arg_17:Boolean = false, _arg_18:Boolean = false, _arg_19:String = "", _arg_20:int = 0) : void
      {
         var _local_20:BattleListItemParams = new BattleListItemParams();
         if(_arg_15)
         {
            _local_20.gamename = "[Private] " + this.cefemilek(_arg_3,_arg_18,_arg_19);
         }
         else
         {
            _local_20.gamename = this.cefemilek(_arg_3,_arg_18,_arg_19);
         }
         _local_20.battleItemGO = _arg_1;
         _local_20.battleMode = _arg_2;
         _local_20.id = _arg_1.name;
         _local_20.dmatch = _arg_4;
         _local_20.reds = _arg_5;
         _local_20.blues = _arg_6;
         _local_20.friendsReds = _arg_7;
         _local_20.friendsBlues = _arg_8;
         _local_20.all = _arg_9;
         _local_20.friends = _arg_10;
         _local_20.maxPeople = _arg_11;
         _local_20.nmap = _arg_12;
         _local_20.rankRange = _arg_13;
         _local_20.accessible = userPropertiesService.rank >= _arg_13.min && userPropertiesService.rank <= _arg_13.max;
         _local_20.noSupplies = _arg_14;
         _local_20.proBattle = _arg_17;
         _local_20.timeLeft = _arg_20;
         _local_20.suspicious = _arg_16;
         _local_20.friends = Math.max(_arg_10,_arg_8 + _arg_7);
         _local_20.capin = _arg_18;
         _local_20.kagalo = _arg_19;
         if(this._isItemsPacketJoinSuccess)
         {
            this._allItems.push(_local_20);
            if(this.isVisibleItem(_arg_2))
            {
               this._view.createItem(_local_20,true);
            }
         }
         else
         {
            this._itemsAwaitPacketJoinSuccess.push(_local_20);
         }
      }
      
      private function cefemilek(_arg_1:String, _arg_2:Boolean, _arg_3:String) : String
      {
         if(_arg_2)
         {
            _arg_1 = _arg_1 + " " + _arg_3;
         }
         return _arg_1;
      }
      
      private function isVisibleItem(_arg_1:Suvozimi) : Boolean
      {
         if(_arg_1 == Suvozimi.DM)
         {
            return this._filterByDmBattle;
         }
         if(_arg_1 == Suvozimi.TDM)
         {
            return this._filterByTdmBattle;
         }
         if(_arg_1 == Suvozimi.CTF)
         {
            return this._filterByCtfBattle;
         }
         if(_arg_1 == Suvozimi.CP)
         {
            return this._filterByCpBattle;
         }
         return true;
      }
      
      public function removeBattle(_arg_1:String) : void
      {
         this._view.removeItem(_arg_1);
         BattleSelectVectorUtil.deleteElementInVector(this._allItems,_arg_1);
         BattleSelectVectorUtil.deleteElementInArray(this._itemsAwaitPacketJoinSuccess,_arg_1);
      }
      
      public function onShowCreateBattleFormButtonClick() : void
      {
         this.resetSelectedItem();
         dispatchEvent(new CreateBattleClickEvent(CreateBattleClickEvent.CREATE_BATTLE_CLICK,null));
      }
      
      public function updateName(_arg_1:String, _arg_2:String) : void
      {
         var _local_3:BattleListItemParams = BattleSelectVectorUtil.findElementInVector(this._allItems,_arg_1);
         _local_3.gamename = _arg_2;
         this._view.updateName(_arg_1,_arg_2);
      }
      
      public function madePrivate(_arg_1:String, _arg_2:String) : void
      {
         this.updateName(_arg_1,"[Private] " + _arg_2);
      }
      
      public function updateSuspicious(_arg_1:String, _arg_2:Boolean) : void
      {
         var _local_3:BattleListItemParams = BattleSelectVectorUtil.findElementInVector(this._allItems,_arg_1);
         _local_3.suspicious = _arg_2;
         this._view.updateSuspicious(_arg_1,_arg_2);
      }
      
      public function updateUsersCountTeam(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int) : void
      {
         var _local_6:BattleListItemParams = BattleSelectVectorUtil.findElementInVector(this._allItems,_arg_1);
         _local_6.reds = _arg_2;
         _local_6.blues = _arg_3;
         _local_6.friendsBlues = _arg_5;
         _local_6.friendsReds = _arg_4;
         this._view.updateUsersCountTeam(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
      }
      
      public function updateUsersCountDm(_arg_1:String, _arg_2:int, _arg_3:int) : void
      {
         var _local_4:BattleListItemParams = BattleSelectVectorUtil.findElementInVector(this._allItems,_arg_1);
         _local_4.all = _arg_2;
         this._view.updateUsersCountDm(_arg_1,_arg_2,_arg_3);
      }
      
      public function swapTeams(_arg_1:String) : void
      {
         var _local_2:BattleListItemParams = BattleSelectVectorUtil.findElementInVector(this._allItems,_arg_1);
         var _local_3:int = _local_2.reds;
         _local_2.reds = _local_2.blues;
         _local_2.blues = _local_3;
         var _local_4:int = _local_2.friendsReds;
         _local_2.friendsReds = _local_2.friendsBlues;
         _local_2.friendsBlues = _local_4;
         this._view.swapTeams(_arg_1,_local_2.reds,_local_2.blues,_local_2.friendsReds,_local_2.friendsBlues);
      }
      
      public function battleItemsPacketJoinSuccess() : void
      {
         var _local_1:BattleListItemParams = null;
         var _local_2:int = 0;
         var _local_3:BattleListItemParams = null;
         var _local_4:Long = null;
         this._isItemsPacketJoinSuccess = true;
         var _local_5:int = getTimer();
         logService.getLogger(BattleSelectModel.CHANNEL).info("battleItemsPacketJoinSuccess item=%1, await=%2",[this._allItems.length,this._itemsAwaitPacketJoinSuccess.length]);
         var _local_6:int = int(this._itemsAwaitPacketJoinSuccess.length);
         if(_local_6 != 0)
         {
            this._itemsAwaitPacketJoinSuccess.sortOn(["suspicious","accessible","friends","id"],[Array.NUMERIC | Array.DESCENDING,Array.DESCENDING,Array.NUMERIC | Array.DESCENDING,Array.DESCENDING]);
            if(!lobbyLayoutService.inBattle())
            {
               _local_1 = this.getRecommendedFriendsBattle();
            }
            _local_2 = 0;
            while(_local_2 < _local_6)
            {
               _local_3 = this._itemsAwaitPacketJoinSuccess[_local_2];
               this._allItems.push(_local_3);
               if(this.isVisibleItem(_local_3.battleMode))
               {
                  this._view.createItem(_local_3,false);
               }
               _local_2++;
            }
            this._view.sortBattleList();
         }
         this._itemsAwaitPacketJoinSuccess.length = 0;
         this._view.resize();
         if(_lastShowedItem != null && !lobbyLayoutService.inBattle())
         {
            _local_1 = BattleSelectVectorUtil.findElementInVector(this._allItems,_lastShowedItem);
         }
         else if(_local_1 != null)
         {
            this.selectBattleItem(_local_1.id,true,true,RESPONSE_TIMEOUT);
         }
         logService.getLogger(BattleSelectModel.CHANNEL).info("battleItemsPacketJoinSuccess runtime=%1",[getTimer() - _local_5]);
      }
      
      private function getRecommendedFriendsBattle() : BattleListItemParams
      {
         var _local_1:BattleListItemParams = null;
         var _local_5:int = 0;
         var _local_2:BattleListItemParams = this._itemsAwaitPacketJoinSuccess[0];
         var _local_3:int = this.getFreePlaces(_local_2);
         var _local_4:uint = this._itemsAwaitPacketJoinSuccess.length;
         while(_local_5 < _local_4)
         {
            _local_1 = this._itemsAwaitPacketJoinSuccess[_local_5];
            if(_local_1.friends > _local_2.friends && this.getFreePlaces(_local_1) > _local_3)
            {
               _local_2 = _local_1;
            }
            _local_5++;
         }
         return _local_2;
      }
      
      private function getFreePlaces(_arg_1:BattleListItemParams) : int
      {
         return _arg_1.maxPeople - Math.max(_arg_1.all,_arg_1.reds + _arg_1.blues);
      }
      
      public function onBattleModeChange(_arg_1:Suvozimi, _arg_2:Boolean) : void
      {
         switch(_arg_1)
         {
            case Suvozimi.DM:
               this._filterByDmBattle = _arg_2;
               storeBoolean(FILTER_BY_DM,_arg_2);
               break;
            case Suvozimi.TDM:
               this._filterByTdmBattle = _arg_2;
               storeBoolean(FILTER_BY_TDM,_arg_2);
               break;
            case Suvozimi.CTF:
               this._filterByCtfBattle = _arg_2;
               storeBoolean(FILTER_BY_CTF,_arg_2);
               break;
            case Suvozimi.CP:
               this._filterByCpBattle = _arg_2;
               storeBoolean(FILTER_BY_CP,_arg_2);
         }
         if(_arg_2)
         {
            this.showBattleByType(_arg_1);
         }
         else
         {
            this.hideBattleByType(_arg_1);
         }
         this.updatePressedBattleMode();
      }
      
      private function showBattleByType(_arg_1:Suvozimi) : void
      {
         var _local_2:int = 0;
         var _local_4:int = 0;
         var _local_3:int = int(this._allItems.length);
         while(_local_4 < _local_3)
         {
            if(this._allItems[_local_4].battleMode == _arg_1)
            {
               this._view.createItem(this._allItems[_local_4],false);
               _local_2++;
            }
            _local_4++;
         }
         if(_local_2 != 0)
         {
            this._view.sortBattleList();
            if(this._selectedItem != null)
            {
               this.selectBattleItem(this._selectedItem,true,false);
            }
            this._view.resize();
         }
      }
      
      private function hideBattleByType(_arg_1:Suvozimi) : void
      {
         var _local_2:int = 0;
         var _local_4:int = 0;
         var _local_3:int = int(this._allItems.length);
         while(_local_4 < _local_3)
         {
            if(this._allItems[_local_4].battleMode == _arg_1)
            {
               this._view.removeItem(this._allItems[_local_4].id);
               _local_2++;
            }
            _local_4++;
         }
         if(_local_2 != 0)
         {
            this._view.resize();
         }
         if(this._selectedItem != null)
         {
            if(this._view.getItemIndex(this._selectedItem) == -1)
            {
               battleInfoFormService.removeFormFromStage();
               this.resetSelectedItem();
            }
         }
      }
      
      private function updatePressedBattleMode() : void
      {
         var _local_1:Boolean = false;
         if(this._filterByDmBattle && !this._filterByTdmBattle && !this._filterByCtfBattle && !this._filterByCpBattle)
         {
            _local_1 = true;
            this.lockBattleMode(Suvozimi.DM);
         }
         if(!this._filterByDmBattle && this._filterByTdmBattle && !this._filterByCtfBattle && !this._filterByCpBattle)
         {
            _local_1 = true;
            this.lockBattleMode(Suvozimi.TDM);
         }
         if(!this._filterByDmBattle && !this._filterByTdmBattle && this._filterByCtfBattle && !this._filterByCpBattle)
         {
            _local_1 = true;
            this.lockBattleMode(Suvozimi.CTF);
         }
         if(!this._filterByDmBattle && !this._filterByTdmBattle && !this._filterByCtfBattle && this._filterByCpBattle)
         {
            _local_1 = true;
            this.lockBattleMode(Suvozimi.CP);
         }
         if(!_local_1)
         {
            this.unLockCurrentBattleMode();
         }
      }
      
      private function lockBattleMode(_arg_1:Suvozimi) : void
      {
         this.unLockCurrentBattleMode();
         this._currentLockedBattleMode = _arg_1;
         this._view.lockFilter(this._currentLockedBattleMode);
      }
      
      private function unLockCurrentBattleMode() : void
      {
         if(this._currentLockedBattleMode != null)
         {
            this._view.unLockFilter(this._currentLockedBattleMode);
            this._currentLockedBattleMode = null;
         }
      }
   }
}

