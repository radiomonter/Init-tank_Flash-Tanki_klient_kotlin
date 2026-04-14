package alternativa.tanks.gui.friends.list.dataprovider
{
   import alternativa.osgi.service.logging.LogService;
   import fl.data.DataProvider;
   import flash.utils.Dictionary;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle.BattleLinkData;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.online.ClientOnlineNotifierData;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoLabelUpdater;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class FriendsDataProvider extends DataProvider
   {
      
      [Inject]
      public static var friendInfoService:IFriendInfoService;
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var partnerService:IPartnerService;
      
      public static const IS_NEW:String = "isNew";
      
      public static const ID:String = "id";
      
      public static const ONLINE:String = "online";
      
      public static const IS_BATTLE:String = "isBattle";
      
      public static const UID:String = "uid";
      
      public static const AVAILABLE_INVITE:String = "availableInvite";
      
      public static const AVAILABLE_BATTLE:String = "availableBattle";
      
      private static var _escapePattern:RegExp = /\-|\./;
      
      private static var _globSearchPattern:RegExp = /\*/g;
      
      private var _getItemAtHandler:Function;
      
      private var _store:Dictionary = new Dictionary();
      
      private var _filterPropertyName:String;
      
      private var _filterString:String = "";
      
      private var _filterPattern:RegExp;
      
      private var _sortFields:Object;
      
      private var _sortFieldsProperties:Object;
      
      public function FriendsDataProvider()
      {
         super();
      }
      
      private static function prepareSearchPattern(_arg_1:String) : RegExp
      {
         _arg_1 = _arg_1.replace(_escapePattern,"\\$&").replace(_globSearchPattern,".*");
         _arg_1 = "^" + _arg_1;
         return new RegExp(_arg_1,"i");
      }
      
      public function get getItemAtHandler() : Function
      {
         return this._getItemAtHandler;
      }
      
      public function set getItemAtHandler(_arg_1:Function) : void
      {
         this._getItemAtHandler = _arg_1;
      }
      
      override public function getItemAt(_arg_1:uint) : Object
      {
         var _local_2:Object = super.getItemAt(_arg_1);
         if(this.getItemAtHandler != null)
         {
            this.getItemAtHandler(_local_2);
         }
         return _local_2;
      }
      
      public function setUserAsNew(_arg_1:String, _arg_2:Boolean = true) : int
      {
         var _local_3:int = this.setPropertiesById(_arg_1,IS_NEW,true);
         if(_arg_2 && _local_3 != -1)
         {
            this.reSort();
         }
         return _local_3;
      }
      
      public function setOnlineUser(_arg_1:ClientOnlineNotifierData, _arg_2:Boolean = true) : int
      {
         var _local_3:int = this.setPropertiesById(_arg_1.userId,ONLINE,_arg_1.online);
         if(_arg_2 && _local_3 != -1)
         {
            this.reSort();
         }
         return _local_3;
      }
      
      public function setBattleUser(_arg_1:BattleLinkData, _arg_2:Boolean = true) : int
      {
         var _local_3:int = this.setPropertiesById(_arg_1.userId,IS_BATTLE,_arg_1.isShowBattle());
         if(_local_3 != -1)
         {
            this.setPropertiesById(_arg_1.userId,AVAILABLE_BATTLE,_arg_1.availableRank());
         }
         if(_arg_2 && _local_3 != -1)
         {
            this.reSort();
         }
         return _local_3;
      }
      
      public function updatePropertyAvailableInvite() : void
      {
         var _local_1:Object = null;
         var _local_3:int = 0;
         var _local_2:int = int(this.length);
         while(_local_3 < _local_2)
         {
            _local_1 = super.getItemAt(_local_3);
            _local_1.availableInvite = battleInfoService.availableRank(_local_1.rank);
            super.replaceItemAt(_local_1,_local_3);
            super.invalidateItemAt(_local_3);
            _local_3++;
         }
      }
      
      public function updatePropertyAvailableInviteById(_arg_1:String) : void
      {
         var _local_2:Object = null;
         var _local_3:int = this.setPropertiesById(_arg_1,AVAILABLE_INVITE,false);
         if(_local_3 != -1)
         {
            _local_2 = super.getItemAt(_local_3);
            _local_2.availableInvite = battleInfoService.availableRank(_local_2.rank);
            super.replaceItemAt(_local_2,_local_3);
            super.invalidateItemAt(_local_3);
         }
      }
      
      public function clearBattleUser(_arg_1:String, _arg_2:Boolean = true) : int
      {
         var _local_3:int = this.setPropertiesById(_arg_1,IS_BATTLE,false);
         if(_local_3 != -1)
         {
            this.setPropertiesById(_arg_1,AVAILABLE_BATTLE,false);
         }
         if(_arg_2 && _local_3 != -1)
         {
            this.reSort();
         }
         return _local_3;
      }
      
      public function addUser(_arg_1:String, _arg_2:Boolean = true) : void
      {
         var _local_3:BattleLinkData = null;
         var _local_4:IUserInfoLabelUpdater = userInfoService.getOrCreateUpdater(_arg_1);
         var _local_5:Object = {};
         _local_5.id = _arg_1;
         _local_5.uid = _arg_1;
         var _local_6:int = _local_4.rank;
         _local_5.rank = _local_6;
         _local_5.online = _local_4.online;
         _local_5.isNew = friendInfoService.isNewFriend(_arg_1);
         _local_5.availableInvite = false;
         _local_5.isBattle = false;
         _local_5.availableBattle = false;
         if(_local_4.hasBattleLink())
         {
            _local_3 = _local_4.battleLink;
            _local_5.isBattle = _local_3.isShowBattle();
            _local_5.availableBattle = _local_3.availableRank();
         }
         super.addItem(_local_5);
         this._store[_arg_1] = _local_5;
         if(_arg_2)
         {
            this.refresh();
         }
      }
      
      public function removeUser(_arg_1:String) : void
      {
         var _local_2:int = this.getItemIndexByProperty(ID,_arg_1);
         if(_local_2 >= 0)
         {
            super.removeItemAt(_local_2);
         }
         delete this._store[_arg_1];
      }
      
      override public function removeAll() : void
      {
         this._store = new Dictionary();
         super.removeAll();
      }
      
      public function refresh() : void
      {
         this.filter();
         this.reSort();
      }
      
      override public function sortOn(_arg_1:Object, _arg_2:Object = null) : *
      {
         this._sortFields = _arg_1;
         this._sortFieldsProperties = _arg_2;
         super.sortOn(this._sortFields,this._sortFieldsProperties);
      }
      
      public function reSort() : void
      {
         super.sortOn(this._sortFields,this._sortFieldsProperties);
      }
      
      public function setFilter(_arg_1:String, _arg_2:String) : void
      {
         if(_arg_2 == "" && this._filterString != "")
         {
            this.resetFilter();
            return;
         }
         this._filterPropertyName = _arg_1;
         this._filterString = _arg_2;
         this._filterPattern = prepareSearchPattern(this._filterString);
         this.filter();
      }
      
      public function filter() : void
      {
         var _local_1:Object = null;
         if(this._filterString != "")
         {
            super.removeAll();
            for each(_local_1 in this._store)
            {
               if(this.isFilteredItem(_local_1))
               {
                  super.addItem(_local_1);
               }
            }
         }
         this.reSort();
      }
      
      public function resetFilter(_arg_1:Boolean = true) : void
      {
         var _local_2:Object = null;
         this._filterString = "";
         if(!_arg_1)
         {
            return;
         }
         super.removeAll();
         for each(_local_2 in this._store)
         {
            super.addItem(_local_2);
         }
         this.reSort();
      }
      
      private function isFilteredItem(_arg_1:Object) : Boolean
      {
         return _arg_1.hasOwnProperty(this._filterPropertyName) && _arg_1[this._filterPropertyName].search(this._filterPattern) != -1;
      }
      
      public function setPropertiesById(_arg_1:String, _arg_2:String, _arg_3:Object) : int
      {
         var _local_4:Object = null;
         var _local_5:int = this.getItemIndexByProperty(ID,_arg_1);
         if(_local_5 != -1)
         {
            _local_4 = super.getItemAt(_local_5);
            _local_4[_arg_2] = _arg_3;
            super.replaceItemAt(_local_4,_local_5);
            super.invalidateItemAt(_local_5);
         }
         if(_arg_1 in this._store)
         {
            this._store[_arg_1][_arg_2] = _arg_3;
         }
         return _local_5;
      }
      
      public function getItemIndexByProperty(_arg_1:String, _arg_2:*, _arg_3:Boolean = false) : int
      {
         var _local_4:Object = null;
         var _local_7:int = 0;
         var _local_5:* = undefined;
         var _local_6:int = int(this.length);
         while(_local_7 < _local_6)
         {
            _local_4 = super.getItemAt(_local_7);
            if(Boolean(_local_4) && Boolean(_local_4.hasOwnProperty(_arg_1)) && _local_4[_arg_1] == _arg_2)
            {
               return _local_7;
            }
            _local_7++;
         }
         if(_arg_3)
         {
            for(_local_5 in this._store)
            {
               _local_4 = this._store[_local_5];
               if(_local_4.hasOwnProperty(_arg_1) && _local_4[_arg_1] == _arg_2)
               {
                  return _local_7;
               }
            }
         }
         return -1;
      }
   }
}

