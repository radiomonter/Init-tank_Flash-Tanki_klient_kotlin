package alternativa.tanks.gui.friends.list
{
   import alternativa.tanks.gui.friends.IFriendsListState;
   import alternativa.tanks.gui.friends.IRejectAllIncomingButtonEnabled;
   import alternativa.tanks.gui.friends.list.renderer.FriendsIncomingListRenderer;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.FriendStateChangeEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.NewFriendEvent;
   import services.contextmenu.ContextMenuServiceEvent;
   import services.contextmenu.IContextMenuService;
   
   public class IncomingList extends FriendsList implements IFriendsListState
   {
      
      [Inject]
      public static var friendInfoService:IFriendInfoService;
      
      [Inject]
      public static var contextMenuService:IContextMenuService;
      
      private var _rejectAllIncomingButton:IRejectAllIncomingButtonEnabled;
      
      public function IncomingList(_arg_1:IRejectAllIncomingButtonEnabled)
      {
         super();
         this._rejectAllIncomingButton = _arg_1;
         init(FriendsIncomingListRenderer);
         _dataProvider.getItemAtHandler = this.markAsViewed;
      }
      
      public function initList() : void
      {
         friendInfoService.addEventListener(FriendStateChangeEvent.CHANGE,this.onChangeFriendState);
         friendInfoService.addEventListener(NewFriendEvent.INCOMING_CHANGE,this.onNewFriendChange);
         contextMenuService.addEventListener(ContextMenuServiceEvent.ACCEPT_REQUEST,this.onAcceptRequest);
         contextMenuService.addEventListener(ContextMenuServiceEvent.REJECT_REQUEST,this.onRejectRequest);
         _dataProvider.sortOn(["isNew","uid"],[Array.NUMERIC | Array.DESCENDING,Array.CASEINSENSITIVE]);
         fillFriendsList(FriendState.INCOMING);
         this.updateEnableRejectButton();
         _list.scrollToIndex(0);
         resize(_width,_height);
      }
      
      private function updateEnableRejectButton() : void
      {
         this._rejectAllIncomingButton.setEnable(_dataProvider.length != 0);
      }
      
      private function onNewFriendChange(_arg_1:NewFriendEvent) : void
      {
         _dataProvider.setUserAsNew(_arg_1.userId);
      }
      
      private function markAsViewed(_arg_1:Object) : void
      {
         if(!isViewed(_arg_1) && Boolean(_arg_1.isNew))
         {
            friendInfoService.removeNewIncomingFriend(_arg_1.id);
            setAsViewed(_arg_1);
         }
      }
      
      private function onChangeFriendState(_arg_1:FriendStateChangeEvent) : void
      {
         if(_arg_1.state != FriendState.INCOMING)
         {
            _dataProvider.removeUser(_arg_1.userId);
            this.updateEnableRejectButton();
            resize(_width,_height);
            return;
         }
         if(_dataProvider.getItemIndexByProperty("id",_arg_1.userId,true) == -1)
         {
            _dataProvider.addUser(_arg_1.userId);
            this.updateEnableRejectButton();
            resize(_width,_height);
         }
      }
      
      private function onAcceptRequest(_arg_1:ContextMenuServiceEvent) : void
      {
         _dataProvider.removeUser(_arg_1.userId);
         this.updateEnableRejectButton();
         resize(_width,_height);
      }
      
      private function onRejectRequest(_arg_1:ContextMenuServiceEvent) : void
      {
         _dataProvider.removeUser(_arg_1.userId);
         this.updateEnableRejectButton();
         resize(_width,_height);
      }
      
      public function hide() : void
      {
         contextMenuService.removeEventListener(ContextMenuServiceEvent.ACCEPT_REQUEST,this.onAcceptRequest);
         contextMenuService.removeEventListener(ContextMenuServiceEvent.REJECT_REQUEST,this.onRejectRequest);
         friendInfoService.removeEventListener(FriendStateChangeEvent.CHANGE,this.onChangeFriendState);
         friendInfoService.removeEventListener(NewFriendEvent.INCOMING_CHANGE,this.onNewFriendChange);
         if(parent.contains(this))
         {
            parent.removeChild(this);
            _dataProvider.removeAll();
         }
      }
      
      public function filter(_arg_1:String, _arg_2:String) : void
      {
         filterByProperty(_arg_1,_arg_2);
         resize(_width,_height);
      }
      
      public function resetFilter() : void
      {
         _dataProvider.resetFilter();
         resize(_width,_height);
      }
   }
}

