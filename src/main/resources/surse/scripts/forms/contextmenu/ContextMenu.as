package forms.contextmenu
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.TankWindow;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.System;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.ColorConstants;
   import forms.ranks.SmallRankIcon;
   import forms.userlabel.UserLabel;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.IBlockUserService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendActionService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.IOnlineNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoLabelUpdater;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.UserInfoLabelUpdaterEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import services.contextmenu.IContextMenuService;
   
   public class ContextMenu extends Sprite
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var friendsActionService:IFriendActionService;
      
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      [Inject]
      public static var contextMenuService:IContextMenuService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var onlineNotifierService:IOnlineNotifierService;
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var blockUserService:IBlockUserService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private static const WINDOW_MARGIN:int = 11;
      
      private static const HIDE_DELAY_IN_MSEC:int = 10000;
      
      private static const LINE_COLOR:uint = 1723412;
      
      private var _window:TankWindow;
      
      private var _windowInner:TankWindowInner;
      
      private var _uidLabel:LabelBase;
      
      private var _onlineLabel:LabelBase;
      
      private var _addToFriendsLabel:ContextMenuLabel;
      
      private var _acceptRequestLabel:ContextMenuLabel;
      
      private var _rejectRequestLabel:ContextMenuLabel;
      
      private var _cancelRequestLabel:ContextMenuLabel;
      
      private var _copyUidLabel:ContextMenuLabel;
      
      private var _writeInChatLabel:ContextMenuLabel;
      
      private var _blockUserLabel:ContextMenuLabel;
      
      private var _unblockUserLabel:ContextMenuLabel;
      
      private var _inviteBattleLabel:BattleInviteContextMenuLabel;
      
      private var _focusOnUserLabel:ContextMenuLabel;
      
      private var _profileLink:ContextMenuLabel;
      
      private var _labels:Vector.<ContextMenuLabel>;
      
      private var _visibleLabels:Vector.<ContextMenuLabel>;
      
      private var _userId:String;
      
      private var _uid:String;
      
      private var _rank:int;
      
      private var _rankIcon:SmallRankIcon;
      
      private var _hideTimeOut:uint;
      
      private var _setEventTimeOut:uint;
      
      private var _isOver:Boolean;
      
      private var _hasEventListener:Boolean;
      
      private var _isInit:Boolean;
      
      private var _line:Shape;
      
      private var _userInfoUpdater:IUserInfoLabelUpdater;
      
      public function ContextMenu()
      {
         super();
      }
      
      public function show(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:String, _arg_6:Boolean, _arg_7:Boolean, _arg_8:Boolean, _arg_9:Boolean, _arg_10:Boolean, _arg_11:Boolean, _arg_12:Boolean, _arg_13:Boolean, _arg_14:Boolean) : void
      {
         var _local_15:Boolean = false;
         var _local_17:int = 0;
         if(!this._isInit)
         {
            this._isInit = true;
            this.init();
         }
         this.x = _arg_1;
         this.y = _arg_2;
         this._userId = _arg_3;
         this._uid = _arg_5;
         this._rank = _arg_4;
         this._rankIcon.setDefaultAccount(_arg_4);
         this._uidLabel.text = _arg_5;
         this._uidLabel.color = !_arg_7 ? uint(ColorConstants.GREEN_LABEL) : uint(ColorConstants.FRIEND_COLOR);
         if(_arg_7)
         {
            this.updateOnlineStatus();
            this._userInfoUpdater = userInfoService.getOrCreateUpdater(this._userId);
         }
         this._onlineLabel.visible = _arg_7;
         this._addToFriendsLabel.visible = _arg_6;
         this._acceptRequestLabel.visible = _arg_8;
         this._rejectRequestLabel.visible = _arg_9;
         this._cancelRequestLabel.visible = _arg_10;
         this._writeInChatLabel.visible = _arg_11;
         if(_arg_14)
         {
            _local_15 = blockUserService.isBlocked(_arg_3);
            this._blockUserLabel.visible = !_local_15;
            this._unblockUserLabel.visible = _local_15;
         }
         else
         {
            this._blockUserLabel.visible = false;
            this._unblockUserLabel.visible = false;
         }
         this._inviteBattleLabel.visible = _arg_12 && battleInviteService.getAvailabilityInviteBattle(_arg_3);
         this._focusOnUserLabel.visible = _arg_13;
         this._visibleLabels.length = 0;
         var _local_16:int = int(this._labels.length);
         while(_local_17 < _local_16)
         {
            if(this._labels[_local_17].visible)
            {
               this._visibleLabels.push(this._labels[_local_17]);
            }
            _local_17++;
         }
         this.resize();
         display.noticesLayer.addChild(this);
         clearTimeout(this._hideTimeOut);
         this._hideTimeOut = setTimeout(this.onHideTimeOut,HIDE_DELAY_IN_MSEC);
         clearTimeout(this._setEventTimeOut);
         this._setEventTimeOut = setTimeout(this.setEvent,0);
      }
      
      private function updateOnlineStatus() : void
      {
         var _local_1:Boolean = onlineNotifierService.hasUserOnlineData(this._userId) && onlineNotifierService.getUserOnlineData(this._userId).online;
         this._onlineLabel.color = !_local_1 ? uint(ColorConstants.ACCESS_LABEL) : uint(ColorConstants.CHAT_LABEL);
         if(_local_1)
         {
            this._uidLabel.color = ColorConstants.FRIEND_COLOR;
            this._onlineLabel.color = ColorConstants.CHAT_LABEL;
            this._onlineLabel.text = localeService.getText(TextConst.STRING_ONLINE_LABEL);
         }
         else
         {
            this._uidLabel.color = ColorConstants.ACCESS_LABEL;
            this._onlineLabel.color = ColorConstants.ACCESS_LABEL;
            this._onlineLabel.text = localeService.getText(TextConst.STRING_OFFLINE_LABEL);
         }
         this.updateInviteBattleAvailability(_local_1);
      }
      
      private function updateInviteBattleAvailability(_arg_1:Boolean) : void
      {
         if(_arg_1)
         {
            this._inviteBattleLabel.locked = !battleInfoService.availableRank(this._rank);
         }
         else
         {
            this._inviteBattleLabel.locked = true;
         }
      }
      
      private function init() : void
      {
         tabEnabled = false;
         tabChildren = false;
         this._window = new TankWindow();
         addChild(this._window);
         this._windowInner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         addChild(this._windowInner);
         this._uidLabel = new LabelBase();
         this._uidLabel.mouseEnabled = false;
         addChild(this._uidLabel);
         this._rankIcon = new SmallRankIcon();
         addChild(this._rankIcon);
         this._onlineLabel = new LabelBase();
         addChild(this._onlineLabel);
         this._labels = new Vector.<ContextMenuLabel>();
         this._visibleLabels = new Vector.<ContextMenuLabel>();
         this._addToFriendsLabel = new ContextMenuLabel();
         this._addToFriendsLabel.text = localeService.getText(TextConst.STRING_FRIENDS_ADD);
         addChild(this._addToFriendsLabel);
         this._acceptRequestLabel = new ContextMenuLabel();
         this._acceptRequestLabel.text = localeService.getText(TextConst.STRING_FRIENDS_CONFIRM_REQUEST);
         addChild(this._acceptRequestLabel);
         this._rejectRequestLabel = new ContextMenuLabel();
         this._rejectRequestLabel.text = localeService.getText(TextConst.STRING_FRIENDS_DECLINE_REQUEST);
         addChild(this._rejectRequestLabel);
         this._cancelRequestLabel = new ContextMenuLabel();
         this._cancelRequestLabel.text = localeService.getText(TextConst.STRING_FRIENDS_CANCEL_REQUEST);
         addChild(this._cancelRequestLabel);
         this._copyUidLabel = new ContextMenuLabel();
         this._copyUidLabel.text = localeService.getText(TextConst.STRING_FRIENDS_COPY_NAME);
         addChild(this._copyUidLabel);
         this._writeInChatLabel = new ContextMenuLabel();
         this._writeInChatLabel.text = localeService.getText(TextConst.STRING_FRIENDS_WRITE);
         addChild(this._writeInChatLabel);
         this._blockUserLabel = new ContextMenuLabel();
         this._blockUserLabel.text = localeService.getText(TanksLocale.TEXT_BLOCK_USER_CONTEXT_MENU_LABEL);
         addChild(this._blockUserLabel);
         this._unblockUserLabel = new ContextMenuLabel();
         this._unblockUserLabel.text = localeService.getText(TanksLocale.TEXT_UNBLOCK_USER_CONTEXT_MENU_LABEL);
         addChild(this._unblockUserLabel);
         this._inviteBattleLabel = new BattleInviteContextMenuLabel();
         this._inviteBattleLabel.text = localeService.getText(TextConst.STRING_INVITE_TO_BATTLE_LABEL);
         addChild(this._inviteBattleLabel);
         this._focusOnUserLabel = new ContextMenuLabel();
         this._focusOnUserLabel.text = localeService.getText(TextConst.TEXT_SPECTATE_TEXT);
         addChild(this._focusOnUserLabel);
         this._profileLink = new ContextMenuLabel();
         this._profileLink.text = localeService.getText(TextConst.TEXT_PROFILE);
         addChild(this._profileLink);
         this._labels.push(this._writeInChatLabel);
         this._labels.push(this._copyUidLabel);
         this._labels.push(this._addToFriendsLabel);
         this._labels.push(this._acceptRequestLabel);
         this._labels.push(this._rejectRequestLabel);
         this._labels.push(this._cancelRequestLabel);
         this._labels.push(this._inviteBattleLabel);
         this._labels.push(this._blockUserLabel);
         this._labels.push(this._unblockUserLabel);
         this._labels.push(this._focusOnUserLabel);
         this._labels.push(this._profileLink);
         this._line = new Shape();
         addChild(this._line);
         this.resize();
         display.stage.addEventListener(MouseEvent.CLICK,this.onContextMenuClickStage);
         display.stage.addEventListener(Event.DEACTIVATE,this.onContextMenuDeactivate);
      }
      
      private function resize() : void
      {
         var _local_1:int = 0;
         var _local_3:ContextMenuLabel = null;
         var _local_4:int = 0;
         var _local_7:int = 0;
         var _local_8:int = 0;
         var _local_2:Number = NaN;
         this._rankIcon.x = WINDOW_MARGIN + 7;
         this._rankIcon.y = WINDOW_MARGIN + 8;
         this._uidLabel.x = this._rankIcon.x + this._rankIcon.width;
         this._uidLabel.y = WINDOW_MARGIN + 5;
         this._onlineLabel.x = WINDOW_MARGIN + 5;
         this._onlineLabel.y = this._uidLabel.y + this._uidLabel.height - 1;
         var _local_5:int = this._uidLabel.x + this._uidLabel.width;
         var _local_6:int = int(this._visibleLabels.length);
         while(_local_7 < _local_6)
         {
            _local_3 = this._visibleLabels[_local_7];
            _local_3.x = WINDOW_MARGIN + 5;
            if(_local_7 == 0)
            {
               _local_3.y = !this._onlineLabel.visible ? Number(42) : Number(59);
            }
            else
            {
               _local_3.y = this._visibleLabels[_local_7 - 1].y + 18;
            }
            _local_1 = _local_3.y + 18;
            _local_4 = _local_3.x + _local_3.width;
            if(_local_4 > _local_5)
            {
               _local_5 = _local_4;
            }
            _local_7++;
         }
         _local_6 = int(this._labels.length);
         while(_local_8 < _local_6)
         {
            if(!this._labels[_local_8].visible)
            {
               this._labels[_local_8].y = 0;
            }
            _local_8++;
         }
         this._line.graphics.clear();
         this._line.graphics.beginFill(LINE_COLOR,1);
         if(this._onlineLabel.visible)
         {
            _local_2 = this._onlineLabel.y + this._onlineLabel.height + 5;
         }
         else
         {
            _local_2 = this._uidLabel.y + this._uidLabel.height + 4;
         }
         this._line.graphics.drawRect(WINDOW_MARGIN + 7,_local_2,_local_5 - WINDOW_MARGIN - 8,1);
         this._line.graphics.endFill();
         this._window.width = _local_5 + WINDOW_MARGIN + 7;
         this._window.height = _local_1 + WINDOW_MARGIN + 8;
         this._windowInner.x = WINDOW_MARGIN;
         this._windowInner.y = WINDOW_MARGIN;
         this._windowInner.width = this._window.width - WINDOW_MARGIN * 2;
         this._windowInner.height = this._window.height - WINDOW_MARGIN * 2;
         if(this.x + this._window.width > display.stage.stageWidth)
         {
            this.x = display.stage.stageWidth - this._window.width;
         }
         if(this.y + this._window.height > display.stage.stageHeight)
         {
            this.y = display.stage.stageHeight - this._window.height;
         }
      }
      
      private function onHideTimeOut() : void
      {
         if(!this._isOver)
         {
            this.hide();
         }
      }
      
      private function setEvent() : void
      {
         if(!this._hasEventListener)
         {
            this._hasEventListener = true;
            this._addToFriendsLabel.addEventListener(MouseEvent.CLICK,this.onAddToFriendClick);
            this._acceptRequestLabel.addEventListener(MouseEvent.CLICK,this.onAcceptRequestClick);
            this._rejectRequestLabel.addEventListener(MouseEvent.CLICK,this.onRejectRequestClick);
            this._cancelRequestLabel.addEventListener(MouseEvent.CLICK,this.onCancelRequestClick);
            this._copyUidLabel.addEventListener(MouseEvent.CLICK,this.onCopyUidClick);
            this._writeInChatLabel.addEventListener(MouseEvent.CLICK,this.onWriteInChatClick);
            this._blockUserLabel.addEventListener(MouseEvent.CLICK,this.onBlockUserClick);
            this._unblockUserLabel.addEventListener(MouseEvent.CLICK,this.onUnblockUserClick);
            this._inviteBattleLabel.addEventListener(MouseEvent.CLICK,this.onInvitationToBattleClick);
            this._focusOnUserLabel.addEventListener(MouseEvent.CLICK,this.onFocusOnUserClick);
            this._profileLink.addEventListener(MouseEvent.CLICK,this.onProfileLinkClick);
            if(this._userInfoUpdater != null)
            {
               this._userInfoUpdater.addEventListener(UserInfoLabelUpdaterEvent.CHANGE_ONLINE,this.onChangeOnline);
            }
            this.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
            this.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         }
      }
      
      private function onAddToFriendClick(_arg_1:MouseEvent) : void
      {
         contextMenuService.addToFriend(this._userId);
         this.hide();
      }
      
      private function onAcceptRequestClick(_arg_1:MouseEvent) : void
      {
         contextMenuService.acceptRequest(this._userId,this._uid);
         this.hide();
      }
      
      private function onRejectRequestClick(_arg_1:MouseEvent) : void
      {
         contextMenuService.rejectRequest(this._userId,this._uid);
         this.hide();
      }
      
      private function onCancelRequestClick(_arg_1:MouseEvent) : void
      {
         contextMenuService.cancelRequest(this._userId,this._uid);
         this.hide();
      }
      
      private function onProfileLinkClick(_arg_1:MouseEvent) : void
      {
         var _local_2:URLRequest = new URLRequest(userPropertiesService.getUserProfileUrl(this._uidLabel.text));
         navigateToURL(_local_2,"_blank");
      }
      
      private function onCopyUidClick(_arg_1:MouseEvent) : void
      {
         System.setClipboard(this._uidLabel.text);
         this.hide();
      }
      
      private function onWriteInChatClick(_arg_1:MouseEvent) : void
      {
         contextMenuService.writeInChat(this._userId,this._uid);
         this.hide();
      }
      
      private function onBlockUserClick(_arg_1:MouseEvent) : void
      {
         blockUserService.blockUser(this._uid);
         this.hide();
      }
      
      private function onUnblockUserClick(_arg_1:MouseEvent) : void
      {
         blockUserService.unblockUser(this._uid);
         this.hide();
      }
      
      private function onInvitationToBattleClick(_arg_1:MouseEvent) : void
      {
         battleInviteService.invite(this._userId);
         this.hide();
      }
      
      private function onFocusOnUserClick(_arg_1:MouseEvent) : void
      {
         contextMenuService.focusOnUser(this._userId,this._uid);
         this.hide();
      }
      
      private function onChangeOnline(_arg_1:UserInfoLabelUpdaterEvent) : void
      {
         this.updateOnlineStatus();
      }
      
      private function onRollOver(_arg_1:MouseEvent) : void
      {
         this._isOver = true;
         clearTimeout(this._hideTimeOut);
      }
      
      private function onRollOut(_arg_1:MouseEvent) : void
      {
         this._isOver = false;
         clearTimeout(this._hideTimeOut);
         this._hideTimeOut = setTimeout(this.onHideTimeOut,HIDE_DELAY_IN_MSEC);
      }
      
      private function onContextMenuClickStage(_arg_1:MouseEvent) : void
      {
         if(!this._hasEventListener || this._isOver)
         {
            return;
         }
         var _local_2:UserLabel = _arg_1.target as UserLabel;
         if(_local_2 == null || _local_2.self)
         {
            this.hide();
         }
      }
      
      private function onContextMenuDeactivate(_arg_1:Event) : void
      {
         this.hide();
      }
      
      private function hide() : void
      {
         this._userInfoUpdater = null;
         clearTimeout(this._hideTimeOut);
         clearTimeout(this._setEventTimeOut);
         if(display.noticesLayer.contains(this))
         {
            display.noticesLayer.removeChild(this);
         }
         this.removeEvents();
      }
      
      private function removeEvents() : void
      {
         if(this._hasEventListener)
         {
            this._hasEventListener = false;
            this._addToFriendsLabel.removeEventListener(MouseEvent.CLICK,this.onAddToFriendClick);
            this._acceptRequestLabel.removeEventListener(MouseEvent.CLICK,this.onAcceptRequestClick);
            this._rejectRequestLabel.removeEventListener(MouseEvent.CLICK,this.onRejectRequestClick);
            this._cancelRequestLabel.removeEventListener(MouseEvent.CLICK,this.onCancelRequestClick);
            this._copyUidLabel.removeEventListener(MouseEvent.CLICK,this.onCopyUidClick);
            this._writeInChatLabel.removeEventListener(MouseEvent.CLICK,this.onWriteInChatClick);
            this._blockUserLabel.removeEventListener(MouseEvent.CLICK,this.onBlockUserClick);
            this._unblockUserLabel.removeEventListener(MouseEvent.CLICK,this.onUnblockUserClick);
            this._inviteBattleLabel.removeEventListener(MouseEvent.CLICK,this.onInvitationToBattleClick);
            this._focusOnUserLabel.removeEventListener(MouseEvent.CLICK,this.onFocusOnUserClick);
            this._profileLink.removeEventListener(MouseEvent.CLICK,this.onProfileLinkClick);
            if(this._userInfoUpdater != null)
            {
               this._userInfoUpdater.removeEventListener(UserInfoLabelUpdaterEvent.CHANGE_ONLINE,this.onChangeOnline);
            }
            this.removeEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
            this.removeEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         }
      }
   }
}

