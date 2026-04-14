package alternativa.tanks.model.friends.battleinvite
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.blur.IBlurService;
   import alternativa.tanks.gui.friends.battleinvite.BattleInviteNotification;
   import alternativa.tanks.gui.friends.battleinvite.ResponseBattleInviteNotification;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.SoundResource;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.client.panel.model.battleinvite.BattleInviteMessage;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.BattleLinkActivatorServiceEvent;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.BattleLinkAliveEvent;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.IBattleLinkActivatorService;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.flash.commons.services.notification.sound.INotificationSoundService;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.FriendStateChangeEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.BattleInviteServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoLabelUpdater;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import services.alertservice.AlertAnswer;
   
   public class BattleInviteModel
   {
      
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      [Inject]
      public static var notificationService:INotificationService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var battleLinkActivatorService:IBattleLinkActivatorService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var friendInfoService:IFriendInfoService;
      
      [Inject]
      public static var myzywak:INotificationSoundService;
      
      private var inviteList:Dictionary;
      
      private var userId:String;
      
      private var battleId:String;
      
      private var battleUrl:String;
      
      private var isRemoteBattleUrl:Boolean;
      
      private var inviteUserId:String;
      
      public function BattleInviteModel()
      {
         super();
      }
      
      private static function addNotificationAlreadyInvite(_arg_1:String) : void
      {
         var _local_2:String = localeService.getText(TextConst.STRING_IS_CONSIDERING_YOUR_INVITE_LABEL);
         if(!notificationService.hasNotification(_arg_1,_local_2))
         {
            notificationService.addNotification(new ResponseBattleInviteNotification(_arg_1,_local_2));
         }
      }
      
      private static function createInviteBattleMessage(_arg_1:BattleInviteMessage) : String
      {
         var _local_2:* = localeService.getText(TextConst.STRING_INVITES_YOU_TO_A_BATTLE_LABEL) + "\n";
         if(_arg_1.availableRank)
         {
            if(_arg_1.availableSlot)
            {
               _local_2 += "\n" + localeService.getText(TextConst.STRING_THERE_ARE_PLACES_AVAILABLE_LABEL);
            }
            else
            {
               _local_2 += "\n" + setGreyColor(localeService.getText(TextConst.STRING_NO_PLACES_AVAILABLE_LABEL));
            }
         }
         else
         {
            _local_2 += "\n" + setGreyColor(localeService.getText(TextConst.STRING_BATTLE_IS_UNAVAILABLE_AT_YOUR_RANK_LABEL));
         }
         return _local_2;
      }
      
      private static function createMapAndServerNumberString(_arg_1:BattleInviteMessage) : String
      {
         var _local_2:String = _arg_1.serverNumber + " " + localeService.getText(TextConst.STRING_SERVER_LABEL);
         if(localeService.language == "en" || localeService.language == "de")
         {
            _local_2 = localeService.getText(TextConst.STRING_SERVER_LABEL) + " " + _arg_1.serverNumber;
         }
         return _arg_1.mapName + " " + _arg_1.mode.name + " (" + _local_2 + ")";
      }
      
      private static function setGreyColor(_arg_1:String) : String
      {
         return "<font color=\'#" + "b1b1b1" + "\'>" + _arg_1 + "</font>";
      }
      
      private static function addNotificationBattleNotFound(_arg_1:String) : void
      {
         notificationService.addNotification(new ResponseBattleInviteNotification(_arg_1,localeService.getText(TextConst.STRING_BATTLE_CANNOT_BE_FOUND_LABEL)));
      }
      
      public function objectLoaded() : void
      {
         this.inviteList = new Dictionary();
         var _local_1:SoundResource = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,106777)));
         if(_local_1 != null && _local_1.isLoaded)
         {
            myzywak.notificationSound = _local_1.sound;
         }
         battleInviteService.addEventListener(BattleInviteServiceEvent.INVITE,this.onBattleInvite);
         battleInviteService.addEventListener(BattleInviteServiceEvent.ACCEPT,this.onAccept);
         battleInviteService.addEventListener(BattleInviteServiceEvent.REJECT,this.onReject);
         battleLinkActivatorService.addEventListener(BattleLinkAliveEvent.ALIVE,this.onAlive);
         battleLinkActivatorService.addEventListener(BattleLinkAliveEvent.DEAD,this.onDead);
         friendInfoService.addEventListener(FriendStateChangeEvent.CHANGE,this.onChangeFriendState);
      }
      
      private function onBattleInvite(_arg_1:BattleInviteServiceEvent) : void
      {
         var _local_2:IUserInfoLabelUpdater = null;
         this.inviteUserId = _arg_1.userId;
         if(this.inviteUserId in this.inviteList)
         {
            addNotificationAlreadyInvite(this.inviteUserId);
         }
         else if(battleInfoService.hasCurrentSelectionBattleId())
         {
            _local_2 = userInfoService.getOrCreateUpdater(this.inviteUserId);
            if(battleInfoService.availableRank(_local_2.rank))
            {
               this.sendInviteToServer();
            }
            else
            {
               alertService.showAlert(localeService.getText(TextConst.STRING_ALERT_INVITE_TO_BATTLE_IS_UNAVAILABLE_RANK),Vector.<String>([localeService.getText(AlertAnswer.YES),localeService.getText(AlertAnswer.NO)]));
               alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onBattleInviteAlertClick);
            }
         }
         else
         {
            addNotificationBattleNotFound(this.inviteUserId);
         }
      }
      
      private function sendInviteToServer() : void
      {
         this.inviteList[this.inviteUserId] = true;
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;invite_to_battle;" + battleInfoService.currentSelectionBattleId + ";" + this.inviteUserId);
         this.inviteUserId = null;
      }
      
      private function onBattleInviteAlertClick(_arg_1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onBattleInviteAlertClick);
         if(_arg_1.typeButton == localeService.getText(AlertAnswer.YES))
         {
            this.sendInviteToServer();
         }
         else if(_arg_1.typeButton == localeService.getText(AlertAnswer.NO) && dialogWindowsDispatcherService.isOpen())
         {
            blurService.blur();
         }
      }
      
      private function onAccept(_arg_1:BattleInviteServiceEvent) : void
      {
         this.userId = _arg_1.userId;
         this.battleId = _arg_1.battleId;
         this.battleUrl = _arg_1.battleUrl;
         this.isRemoteBattleUrl = _arg_1.isRemoteBattleUrl;
         battleLinkActivatorService.isAlive(_arg_1.battleId);
      }
      
      private function onAlive(_arg_1:BattleLinkAliveEvent) : void
      {
         if(this.battleId != _arg_1.battleId)
         {
            return;
         }
         if(lobbyLayoutService.getCurrentState() == LayoutState.BATTLE && !battleInfoService.spectator)
         {
            battleLinkActivatorService.addEventListener(BattleLinkActivatorServiceEvent.CONFIRMED_NAVIGATE,this.onConfirmedNavigate);
            battleLinkActivatorService.addEventListener(BattleLinkActivatorServiceEvent.NOT_CONFIRMED_NAVIGATE,this.onNotConfirmedNavigate);
         }
         else
         {
            Network(OSGi.getInstance().getService(INetworker)).send("lobby;accept_invite;" + this.userId);
         }
         battleLinkActivatorService.navigateToBattleUrlWithoutAvailableBattle(this.battleUrl,this.isRemoteBattleUrl);
      }
      
      private function onConfirmedNavigate(_arg_1:BattleLinkActivatorServiceEvent) : void
      {
         this.removeConfirmedNavigateEvent();
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;accept_invite;" + this.userId);
      }
      
      private function removeConfirmedNavigateEvent() : void
      {
         battleLinkActivatorService.removeEventListener(BattleLinkActivatorServiceEvent.CONFIRMED_NAVIGATE,this.onConfirmedNavigate);
         battleLinkActivatorService.removeEventListener(BattleLinkActivatorServiceEvent.NOT_CONFIRMED_NAVIGATE,this.onNotConfirmedNavigate);
      }
      
      private function onNotConfirmedNavigate(_arg_1:BattleLinkActivatorServiceEvent) : void
      {
         this.removeConfirmedNavigateEvent();
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;reject_invite;" + this.userId);
      }
      
      private function onDead(_arg_1:BattleLinkAliveEvent) : void
      {
         if(this.battleId != _arg_1.battleId)
         {
            return;
         }
         alertService.showAlert(localeService.getText(TextConst.STRING_BATTLE_CANNOT_BE_FOUND_ALERT),Vector.<String>([localeService.getText(AlertAnswer.OK)]));
      }
      
      private function onReject(_arg_1:BattleInviteServiceEvent) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;reject_invite;" + _arg_1.userId);
      }
      
      public function objectUnloaded() : void
      {
         battleInviteService.removeEventListener(BattleInviteServiceEvent.INVITE,this.onBattleInvite);
         battleInviteService.removeEventListener(BattleInviteServiceEvent.ACCEPT,this.onAccept);
         battleInviteService.removeEventListener(BattleInviteServiceEvent.REJECT,this.onReject);
         battleLinkActivatorService.removeEventListener(BattleLinkAliveEvent.ALIVE,this.onAlive);
         battleLinkActivatorService.removeEventListener(BattleLinkAliveEvent.DEAD,this.onDead);
         friendInfoService.removeEventListener(FriendStateChangeEvent.CHANGE,this.onChangeFriendState);
      }
      
      public function notify(_arg_1:String, _arg_2:BattleInviteMessage) : void
      {
         var _local_3:String = null;
         notificationService.addNotification(new BattleInviteNotification(_arg_1,createInviteBattleMessage(_arg_2),_arg_2.battleId,_arg_2.battleId,_arg_2.remote,createMapAndServerNumberString(_arg_2),_arg_2.noSuppliesBattle));
      }
      
      private function onChangeFriendState(_arg_1:FriendStateChangeEvent) : void
      {
         var _local_2:Boolean = _arg_1.prevState == FriendState.ACCEPTED && _arg_1.state != FriendState.ACCEPTED;
         if(_local_2)
         {
            if(_arg_1.userId in this.inviteList)
            {
               this.rejected(_arg_1.userId);
            }
         }
      }
      
      public function accepted(_arg_1:String) : void
      {
         this.removeInvite(_arg_1);
         notificationService.addNotification(new ResponseBattleInviteNotification(_arg_1,localeService.getText(TextConst.STRING_IS_JOINING_THE_BATTLE_AT_YOUR_INVITATION_LABEL)));
      }
      
      private function removeInvite(_arg_1:String) : void
      {
         delete this.inviteList[_arg_1];
         battleInviteService.removeInvite(_arg_1);
      }
      
      public function rejected(_arg_1:String) : void
      {
         this.removeInvite(_arg_1);
         notificationService.addNotification(new ResponseBattleInviteNotification(_arg_1,localeService.getText(TextConst.STRING_REFUSED_TO_JOIN_THE_BATTLE_AT_YOUR_INVITATION_LABEL)));
      }
      
      public function rejectedBattleNotFound(_arg_1:String) : void
      {
         this.removeInvite(_arg_1);
         addNotificationBattleNotFound(_arg_1);
      }
      
      public function rejectedInvitationToBattleDisabled(_arg_1:String) : void
      {
         this.removeInvite(_arg_1);
         notificationService.addNotification(new ResponseBattleInviteNotification(_arg_1,localeService.getText(TextConst.STRING_YOUR_FRIEND_DISABLED_INVITES_LABEL)));
      }
      
      public function rejectedPanelNotLoaded(_arg_1:String) : void
      {
         this.removeInvite(_arg_1);
         notificationService.addNotification(new ResponseBattleInviteNotification(_arg_1,localeService.getText(TextConst.STRING_YOUR_FRIEND_IS_ENTERING_THE_GAME_LABEL)));
      }
      
      public function rejectedUserAlreadyInBattle(_arg_1:String) : void
      {
         this.removeInvite(_arg_1);
         notificationService.addNotification(new ResponseBattleInviteNotification(_arg_1,localeService.getText(TextConst.STRING_YOUR_FRIEND_IS_ALREADY_IN_THIS_BATTLE_LABEL)));
      }
      
      public function rejectedUserOffline(_arg_1:String) : void
      {
         this.removeInvite(_arg_1);
         notificationService.addNotification(new ResponseBattleInviteNotification(_arg_1,localeService.getText(TextConst.STRING_YOUR_FRIEND_IS_OFFLINE_LABEL)));
      }
   }
}

