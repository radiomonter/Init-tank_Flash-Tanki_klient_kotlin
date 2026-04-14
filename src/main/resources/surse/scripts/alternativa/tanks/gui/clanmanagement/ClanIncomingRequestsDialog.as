package alternativa.tanks.gui.clanmanagement
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.candidates.ClanIncomingListRenderer;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.candidates.HeaderClanCandidateList;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.list.ClanMembersDataProvider;
   import alternativa.tanks.gui.notinclan.dialogs.ClanDialog;
   import alternativa.tanks.models.clan.incoming.IClanIncomingModel;
   import alternativa.tanks.models.service.ClanNotificationsManager;
   import alternativa.tanks.service.clan.ClanMembersListEvent;
   import controls.base.DefaultButtonBase;
   import controls.windowinner.WindowInner;
   import fl.controls.List;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import forms.Styles;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.clans.clan.permissions.ClanAction;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanFunctionsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoLabelUpdater;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import utils.ScrollStyleUtils;
   
   public class ClanIncomingRequestsDialog extends ClanDialog
   {
      
      [Inject]
      public static var clanFunctionsService:ClanFunctionsService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      public static const WIDTH:Number = 550;
      
      public static const HEIGHT:Number = 450;
      
      private var viewed:Dictionary;
      
      private var inner:WindowInner;
      
      private var list:List;
      
      private var dataProvider:ClanMembersDataProvider;
      
      private var _header:HeaderClanCandidateList;
      
      private var rejectAllButton:DefaultButtonBase;
      
      private var incomingModel:IClanIncomingModel;
      
      public function ClanIncomingRequestsDialog(_arg_1:IGameObject)
      {
         super();
         this.viewed = new Dictionary();
         this.incomingModel = IClanIncomingModel(_arg_1.adapt(IClanIncomingModel));
         this.incomingModel.setClanIncomingWindow(this);
         this.inner = new WindowInner(WIDTH,HEIGHT,WindowInner.GREEN);
         window.addChild(this.inner);
         this._header = new HeaderClanCandidateList();
         this.inner.addChild(this._header);
         this.dataProvider = new ClanMembersDataProvider();
         this.dataProvider.getItemAtHandler = this.markAsViewed;
         this.list = new List();
         this.list.rowHeight = 20;
         this.list.setStyle(Styles.CELL_RENDERER,ClanIncomingListRenderer);
         this.list.focusEnabled = true;
         this.list.selectable = false;
         this.list.dataProvider = this.dataProvider;
         ScrollStyleUtils.setGreenStyle(this.list);
         this.inner.addChild(this.list);
         ScrollStyleUtils.setGreenStyle(this.list);
         this.fillData();
         this.rejectAllButton = new DefaultButtonBase();
         this.rejectAllButton.label = localeService.getText(TanksLocale.TEXT_FRIENDS_DECLINE_ALL_BUTTON);
         window.addChild(this.rejectAllButton);
         this.list.addEventListener(ClanMembersListEvent.REJECT_USER,this.onRejectUser);
         this.list.addEventListener(ClanMembersListEvent.ACCEPTED_USER,this.onAcceptedUser);
         this.rejectAllButton.addEventListener(MouseEvent.CLICK,this.onRejectAll);
         this.resize();
      }
      
      private function markAsViewed(_arg_1:Object) : void
      {
         if(!this.isViewed(_arg_1))
         {
            this.setAsViewed(_arg_1);
         }
      }
      
      public function removeAllViewed() : void
      {
         var _local_1:Object = null;
         for(_local_1 in this.viewed)
         {
            ClanNotificationsManager.removeIncomingNotification(_local_1.id);
         }
      }
      
      protected function isViewed(_arg_1:Object) : Boolean
      {
         return _arg_1 in this.viewed;
      }
      
      protected function setAsViewed(_arg_1:Object) : void
      {
         this.viewed[_arg_1] = true;
      }
      
      private function onRejectAll(_arg_1:MouseEvent) : void
      {
         clanFunctionsService.rejectAllRequests();
      }
      
      private function onAcceptedUser(_arg_1:ClanMembersListEvent) : void
      {
         clanFunctionsService.acceptRequest(_arg_1.userId);
      }
      
      private function onRejectUser(_arg_1:ClanMembersListEvent) : void
      {
         clanFunctionsService.rejectRequest(_arg_1.userId);
      }
      
      public function resize() : void
      {
         this.inner.x = MARGIN;
         this.inner.y = MARGIN;
         this.inner.width = WIDTH - 2 * MARGIN;
         this.inner.height = closeButton.y - MARGIN - SMALL_MARGIN;
         this._header.x = 3;
         this._header.y = 3;
         this._header.width = this.inner.width - 6;
         this.list.x = 3;
         this.list.y = 23;
         this.list.height = this.inner.height - 24;
         var _local_1:Boolean = this.list.maxVerticalScrollPosition > 0;
         this.list.width = _local_1 ? this.inner.width + 2 : this.inner.width - 6;
         if(this.rejectAllButton != null)
         {
            this.rejectAllButton.x = MARGIN;
            this.rejectAllButton.y = this.height - MARGIN - this.rejectAllButton.height;
         }
      }
      
      public function fillData() : void
      {
         var _local_1:String = null;
         var _local_2:IUserInfoLabelUpdater = null;
         var _local_3:Object = null;
         this.dataProvider.removeAll();
         for each(_local_1 in this.incomingModel.getUsers())
         {
            _local_2 = userInfoService.getOrCreateUpdater(_local_1);
            _local_3 = {};
            _local_3.id = _local_1;
            _local_3.isNew = ClanNotificationsManager.userInIncomingNotifications(_local_1);
            _local_3.uid = _local_2.uid;
            this.dataProvider.addItem(_local_3);
         }
         this.sort();
         this.resize();
      }
      
      private function sort() : void
      {
         this.dataProvider.sortOn(["isNew","uid"],[Array.NUMERIC | Array.DESCENDING,Array.CASEINSENSITIVE]);
      }
      
      public function addUser(_arg_1:String) : void
      {
         this.dataProvider.addItem({"id":_arg_1});
         this.sort();
         this.resize();
      }
      
      public function removeUser(_arg_1:String) : void
      {
         var _local_2:int = this.dataProvider.getItemIndexById(_arg_1);
         if(_local_2 >= 0)
         {
            this.dataProvider.removeItemAt(_local_2);
         }
         this.sort();
         this.resize();
      }
      
      override protected function onCloseClick(_arg_1:MouseEvent) : void
      {
         this.removeAllViewed();
         super.onCloseClick(_arg_1);
      }
      
      override public function updateActions() : void
      {
         if(!clanUserInfoService.hasAction(ClanAction.ADDING_TO_CLAN))
         {
            destroy();
         }
      }
      
      override public function get height() : Number
      {
         return HEIGHT;
      }
      
      override public function get width() : Number
      {
         return WIDTH;
      }
      
      override protected function getImageHeaderId() : String
      {
         return "SYSTEM_MESSAGE";
      }
   }
}

