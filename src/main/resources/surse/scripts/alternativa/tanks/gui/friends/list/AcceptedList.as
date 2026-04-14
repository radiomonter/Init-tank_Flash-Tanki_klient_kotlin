package alternativa.tanks.gui.friends.list
{
   import alternativa.tanks.gui.friends.IFriendsListState;
   import alternativa.tanks.gui.friends.list.dataprovider.FriendsDataProvider;
   import alternativa.tanks.gui.friends.list.renderer.FriendsAcceptedListRenderer;
   import alternativa.tanks.gui.friends.list.renderer.HeaderAcceptedList;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle.BattleLinkData;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.online.ClientOnlineNotifierData;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.BattleInfoServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.FriendStateChangeEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.NewFriendEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.BattleInviteServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle.IBattleNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle.LeaveBattleNotifierServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle.SetBattleNotifierServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.IOnlineNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.OnlineNotifierServiceEvent;
   import services.contextmenu.ContextMenuServiceEvent;
   import services.contextmenu.IContextMenuService;
   
   public class AcceptedList extends FriendsList implements IFriendsListState
   {
      
      [Inject]
      public static var contextMenuService:IContextMenuService;
      
      [Inject]
      public static var onlineNotifierService:IOnlineNotifierService;
      
      [Inject]
      public static var battleNotifierService:IBattleNotifierService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      public static var SCROLL_ON:Boolean;
      
      private var _header:HeaderAcceptedList;
      
      public function AcceptedList()
      {
         super();
         init(FriendsAcceptedListRenderer);
         _dataProvider.getItemAtHandler = this.markAsViewed;
         this._header = new HeaderAcceptedList();
         addChild(this._header);
      }
      
      private function markAsViewed(_arg_1:Object) : void
      {
         if(!isViewed(_arg_1) && Boolean(_arg_1.isNew))
         {
            friendInfoService.removeNewAcceptedFriend(_arg_1.id);
            setAsViewed(_arg_1);
         }
      }
      
      public function initList() : void
      {
         friendInfoService.addEventListener(FriendStateChangeEvent.CHANGE,this.onChangeFriendState);
         friendInfoService.addEventListener(NewFriendEvent.ACCEPTED_CHANGE,this.onNewFriendChange);
         contextMenuService.addEventListener(ContextMenuServiceEvent.REMOVE_FROM_FRIENDS,this.onRemoveFromFriends);
         onlineNotifierService.addEventListener(OnlineNotifierServiceEvent.SET_ONLINE,this.onSetOnline);
         battleNotifierService.addEventListener(SetBattleNotifierServiceEvent.SET_BATTLE,this.onSetBattle);
         battleNotifierService.addEventListener(LeaveBattleNotifierServiceEvent.LEAVE,this.onLeaveBattle);
         battleInfoService.addEventListener(BattleInfoServiceEvent.SELECTION_BATTLE,this.onSelectBattleInfo);
         battleInfoService.addEventListener(BattleInfoServiceEvent.RESET_SELECTION_BATTLE,this.onResetSelectBattleInfo);
         battleInviteService.addEventListener(BattleInviteServiceEvent.REMOVE_INVITE,this.onRemoveInvite);
         _dataProvider.sortOn([FriendsDataProvider.IS_NEW,FriendsDataProvider.ONLINE,FriendsDataProvider.IS_BATTLE,FriendsDataProvider.UID],[Array.NUMERIC | Array.DESCENDING,Array.NUMERIC | Array.DESCENDING,Array.NUMERIC | Array.DESCENDING,Array.CASEINSENSITIVE]);
         _list.scrollToIndex(0);
         this.resize(_width,_height);
         fillFriendsList(FriendState.ACCEPTED);
      }
      
      private function onNewFriendChange(_arg_1:NewFriendEvent) : void
      {
         _dataProvider.setUserAsNew(_arg_1.userId);
      }
      
      private function onChangeFriendState(_arg_1:FriendStateChangeEvent) : void
      {
         if(_arg_1.state != FriendState.ACCEPTED)
         {
            _dataProvider.removeUser(_arg_1.userId);
            this.resize(_width,_height);
            return;
         }
         if(_dataProvider.getItemIndexByProperty("id",_arg_1.userId,true) == -1)
         {
            _dataProvider.addUser(_arg_1.userId);
            this.resize(_width,_height);
         }
      }
      
      private function onRemoveFromFriends(_arg_1:ContextMenuServiceEvent) : void
      {
         _dataProvider.removeUser(_arg_1.userId);
         this.resize(_width,_height);
      }
      
      private function onSetOnline(_arg_1:OnlineNotifierServiceEvent) : void
      {
         var _local_2:int = 0;
         var _local_3:Boolean = false;
         var _local_6:int = 0;
         var _local_4:Vector.<ClientOnlineNotifierData> = _arg_1.users;
         var _local_5:int = int(_local_4.length);
         while(_local_6 < _local_5)
         {
            _local_2 = _dataProvider.setOnlineUser(_local_4[_local_6],false);
            _local_3 = _local_3 ? Boolean(false) : Boolean(_local_2 != -1);
            _local_6++;
         }
         if(_local_3)
         {
            _dataProvider.reSort();
         }
      }
      
      private function onSetBattle(_arg_1:SetBattleNotifierServiceEvent) : void
      {
         var _local_2:int = 0;
         var _local_3:Boolean = false;
         var _local_6:int = 0;
         var _local_4:Vector.<BattleLinkData> = _arg_1.users;
         var _local_5:int = int(_local_4.length);
         while(_local_6 < _local_5)
         {
            _local_2 = _dataProvider.setBattleUser(_local_4[_local_6],false);
            _local_3 = _local_3 ? Boolean(false) : Boolean(_local_2 != -1);
            _local_6++;
         }
         if(_local_3 > 0)
         {
            _dataProvider.reSort();
         }
      }
      
      private function onLeaveBattle(_arg_1:LeaveBattleNotifierServiceEvent) : void
      {
         _dataProvider.clearBattleUser(_arg_1.userId);
      }
      
      private function onResetSelectBattleInfo(_arg_1:BattleInfoServiceEvent) : void
      {
         _dataProvider.updatePropertyAvailableInvite();
      }
      
      private function onSelectBattleInfo(_arg_1:BattleInfoServiceEvent) : void
      {
         _dataProvider.updatePropertyAvailableInvite();
      }
      
      private function onRemoveInvite(_arg_1:BattleInviteServiceEvent) : void
      {
         _dataProvider.updatePropertyAvailableInviteById(_arg_1.userId);
      }
      
      override public function resize(_arg_1:Number, _arg_2:Number) : void
      {
         _width = _arg_1;
         _height = _arg_2;
         AcceptedList.SCROLL_ON = _list.maxVerticalScrollPosition > 0;
         this._header.width = _width;
         _list.y = 20;
         _list.width = !AcceptedList.SCROLL_ON ? Number(_width) : Number(_width + 6);
         _list.height = _height - 20;
      }
      
      public function hide() : void
      {
         contextMenuService.removeEventListener(ContextMenuServiceEvent.REMOVE_FROM_FRIENDS,this.onRemoveFromFriends);
         friendInfoService.removeEventListener(FriendStateChangeEvent.CHANGE,this.onChangeFriendState);
         friendInfoService.removeEventListener(NewFriendEvent.ACCEPTED_CHANGE,this.onNewFriendChange);
         onlineNotifierService.removeEventListener(OnlineNotifierServiceEvent.SET_ONLINE,this.onSetOnline);
         battleNotifierService.removeEventListener(SetBattleNotifierServiceEvent.SET_BATTLE,this.onSetBattle);
         battleNotifierService.removeEventListener(LeaveBattleNotifierServiceEvent.LEAVE,this.onLeaveBattle);
         battleInfoService.removeEventListener(BattleInfoServiceEvent.SELECTION_BATTLE,this.onSelectBattleInfo);
         battleInfoService.removeEventListener(BattleInfoServiceEvent.RESET_SELECTION_BATTLE,this.onResetSelectBattleInfo);
         battleInviteService.removeEventListener(BattleInviteServiceEvent.REMOVE_INVITE,this.onRemoveInvite);
         if(parent.contains(this))
         {
            parent.removeChild(this);
            _dataProvider.removeAll();
         }
      }
      
      public function filter(_arg_1:String, _arg_2:String) : void
      {
         filterByProperty(_arg_1,_arg_2);
         this.resize(_width,_height);
      }
      
      public function resetFilter() : void
      {
         _dataProvider.resetFilter();
         this.resize(_width,_height);
      }
   }
}

