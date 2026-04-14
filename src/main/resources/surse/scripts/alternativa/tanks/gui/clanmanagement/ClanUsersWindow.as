package alternativa.tanks.gui.clanmanagement
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.members.ClanMembersList;
   import alternativa.tanks.gui.components.button.ClanButtonActionListener;
   import alternativa.tanks.gui.components.button.ClanIncomingRequestsButton;
   import alternativa.tanks.models.clan.ClanModel;
   import alternativa.tanks.models.clan.accepted.IClanAcceptedModel;
   import alternativa.tanks.models.clan.membersdata.ClanMembersDataService;
   import alternativa.tanks.models.service.ClanNotificationsManager;
   import alternativa.tanks.models.service.ClanService;
   import alternativa.tanks.service.clan.ClanMembersListEvent;
   import base.DiscreteSprite;
   import controls.TankWindow;
   import controls.windowinner.WindowInner;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.clans.clan.permissions.ClanAction;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanFunctionsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   
   public class ClanUsersWindow extends DiscreteSprite
   {
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var clanUserInfoService:ClanUserInfoService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var clanService:ClanService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var clanFunctionsService:ClanFunctionsService;
      
      [Inject]
      public static var clanMembersData:ClanMembersDataService;
      
      private static var currentUserId:String;
      
      private static var userIdToExclude:String;
      
      private static const MARGIN:int = 11;
      
      private static const FRAME:int = 7;
      
      private static const BUTTON_HEIGHT:int = 30;
      
      private var usersInner:WindowInner;
      
      private var usersWindow:TankWindow;
      
      private var list:ClanMembersList;
      
      private var outgoingButton:ClanButtonActionListener;
      
      private var incomingButton:ClanIncomingRequestsButton;
      
      private var _width:int;
      
      private var _height:int;
      
      private var clanObject:IGameObject;
      
      public function ClanUsersWindow(_arg_1:IGameObject)
      {
         var _local_4:String = null;
         super();
         this.clanObject = _arg_1;
         this.usersWindow = new TankWindow();
         addChild(this.usersWindow);
         this.usersInner = new WindowInner(this._width,this._height,WindowInner.GREEN);
         this.usersInner.showBlink = true;
         this.usersWindow.addChild(this.usersInner);
         var _local_2:IClanAcceptedModel = IClanAcceptedModel(_arg_1.adapt(IClanAcceptedModel));
         this.list = new ClanMembersList();
         var _local_3:Vector.<Object> = new Vector.<Object>();
         for each(_local_4 in _local_2.getAcceptedUsers())
         {
            _local_3.push(clanMembersData.getClanMemberData(_local_4));
         }
         this.list.fillData(_local_3);
         this.list.addEventListener(ClanMembersListEvent.REMOVE_USER,this.onRemoveUser);
         this.usersInner.addChild(this.list);
         this.outgoingButton = new ClanButtonActionListener(ClanAction.INVITE_TO_CLAN);
         this.incomingButton = new ClanIncomingRequestsButton(this.outgoingButton,this);
         this.outgoingButton.width = 120;
         this.incomingButton.width = 120;
         ClanActionsManager.addActionsUpdateListener(this.outgoingButton);
         this.outgoingButton.label = localeService.getText(TanksLocale.TEXT_CLAN_INVITE);
         this.outgoingButton.updateActions();
         this.outgoingButton.addEventListener(MouseEvent.CLICK,this.onClickOutgoingButton);
         addChild(this.outgoingButton);
         ClanActionsManager.addActionsUpdateListener(this.incomingButton);
         ClanNotificationsManager.addIncomingIndicatorListener(this.incomingButton);
         this.incomingButton.label = localeService.getText(TanksLocale.TEXT_CLAN_INCOMING);
         this.incomingButton.updateActions();
         this.incomingButton.updateNotifications();
         this.incomingButton.addEventListener(MouseEvent.CLICK,this.onClickIncomingButton);
         addChild(this.incomingButton);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddResizeListener);
      }
      
      private static function getCurrentUserId() : String
      {
         if(currentUserId == null)
         {
            currentUserId = userInfoService.getCurrentUserId();
         }
         return currentUserId;
      }
      
      private function onClickIncomingButton(_arg_1:MouseEvent) : void
      {
         new ClanIncomingRequestsDialog(this.clanObject);
      }
      
      private function onClickOutgoingButton(_arg_1:MouseEvent) : void
      {
         new ClanOutgoingRequestsDialog(this.clanObject);
      }
      
      private function onRemoveUser(_arg_1:ClanMembersListEvent) : void
      {
         if(_arg_1.userId == getCurrentUserId())
         {
            alertService.showAlert(localeService.getText(TanksLocale.TEXT_CLAN_ALERT_LEAVE_CLAN),Vector.<String>([localeService.getText(TanksLocale.TEXT_FRIENDS_YES),localeService.getText(TanksLocale.TEXT_FRIENDS_CANCEL_BUTTON_TEXT)]));
            alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onClanLeavingConfirm);
         }
         else
         {
            alertService.showAlert(localeService.getText(TanksLocale.TEXT_CLAN_ALERT_REMOVE_PLAYER).replace(ClanModel.USER_NAME_PATTERN,_arg_1.userUid),Vector.<String>([localeService.getText(TanksLocale.TEXT_FRIENDS_YES),localeService.getText(TanksLocale.TEXT_FRIENDS_CANCEL_BUTTON_TEXT)]));
            alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onExpelConfirm);
            userIdToExclude = _arg_1.userId;
         }
      }
      
      private function onClanLeavingConfirm(_arg_1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onClanLeavingConfirm);
         if(_arg_1.typeButton == localeService.getText(TanksLocale.TEXT_FRIENDS_YES))
         {
            clanFunctionsService.leave();
         }
      }
      
      private function onExpelConfirm(_arg_1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onExpelConfirm);
         if(_arg_1.typeButton == localeService.getText(TanksLocale.TEXT_FRIENDS_YES) && userIdToExclude != null)
         {
            clanFunctionsService.exclude(userIdToExclude);
            userIdToExclude = null;
         }
      }
      
      private function onAddResizeListener(_arg_1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddResizeListener);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize();
      }
      
      private function onRemoveFromStage(_arg_1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onRemoveFromStage);
         stage.removeEventListener(Event.RESIZE,this.onResize);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddResizeListener);
      }
      
      private function onResize(_arg_1:Event = null) : void
      {
         this.usersWindow.y = ClanTopManagementPanel.HEIGHT + MARGIN - 3;
         this.usersWindow.width = this.width;
         this.usersWindow.height = this.height - this.usersWindow.y;
         this.usersInner.x = MARGIN;
         this.usersInner.y = MARGIN;
         this.usersInner.width = this.usersWindow.width - 2 * MARGIN;
         this.usersInner.height = this.usersWindow.height - 2 * MARGIN - FRAME - BUTTON_HEIGHT;
         this.list.x = 3;
         this.list.y = 3;
         this.list.width = this.usersInner.width - 6;
         this.list.height = this.usersInner.height - 4;
         this.incomingButton.x = this.width - this.incomingButton.width - MARGIN;
         this.incomingButton.y = this.height - this.outgoingButton.height - MARGIN - 1;
         this.outgoingButton.x = (this.incomingButton.visible ? this.incomingButton.x : this.width - MARGIN) - FRAME - this.outgoingButton.width;
         this.outgoingButton.y = this.incomingButton.y;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = _arg_1;
         this.onResize();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set height(_arg_1:Number) : void
      {
         this._height = _arg_1;
         this.onResize();
      }
      
      public function addUser(_arg_1:String) : void
      {
         this.list.addUser(clanMembersData.getClanMemberData(_arg_1));
      }
      
      public function removeUser(_arg_1:String) : void
      {
         this.list.removeUser(_arg_1);
      }
      
      public function maxMembers() : void
      {
         alertService.showOkAlert(localeService.getText(TanksLocale.TEXT_CLAN_ALERT_CLAN_FULL));
      }
   }
}

