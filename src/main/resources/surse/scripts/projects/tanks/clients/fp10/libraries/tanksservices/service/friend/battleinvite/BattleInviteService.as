package projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite
{
   import flash.events.EventDispatcher;
   import flash.media.Sound;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   
   public class BattleInviteService extends EventDispatcher implements IBattleInviteService
   {
      
      [Inject]
      public static var friendInfoService:IFriendInfoService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      private var _receiveBattleInvite:Boolean;
      
      private var _notificationSound:Sound;
      
      public function BattleInviteService()
      {
         super();
      }
      
      public function getAvailabilityInviteBattle(_arg_1:String) : Boolean
      {
         return battleInfoService.hasCurrentSelectionBattleId() && friendInfoService.isFriendsInState(_arg_1,FriendState.ACCEPTED);
      }
      
      public function invite(_arg_1:String) : void
      {
         dispatchEvent(new BattleInviteServiceEvent(BattleInviteServiceEvent.INVITE,_arg_1));
      }
      
      public function accept(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:Boolean) : void
      {
         var _local_5:BattleInviteServiceEvent = new BattleInviteServiceEvent(BattleInviteServiceEvent.ACCEPT,_arg_1);
         _local_5.battleId = _arg_2;
         _local_5.battleUrl = _arg_3;
         _local_5.isRemoteBattleUrl = _arg_4;
         dispatchEvent(_local_5);
      }
      
      public function reject(_arg_1:String) : void
      {
         dispatchEvent(new BattleInviteServiceEvent(BattleInviteServiceEvent.REJECT,_arg_1));
      }
      
      public function get receiveBattleInvite() : Boolean
      {
         return this._receiveBattleInvite;
      }
      
      public function set receiveBattleInvite(_arg_1:Boolean) : void
      {
         if(this._receiveBattleInvite != _arg_1)
         {
            dispatchEvent(new BattleInviteEnableEvent(BattleInviteEnableEvent.UPDATE,_arg_1));
         }
         this._receiveBattleInvite = _arg_1;
      }
      
      public function set notificationSound(_arg_1:Sound) : void
      {
         this._notificationSound = _arg_1;
      }
      
      public function removeInvite(_arg_1:String) : void
      {
         dispatchEvent(new BattleInviteServiceEvent(BattleInviteServiceEvent.REMOVE_INVITE,_arg_1));
      }
      
      public function playNotificationSound() : void
      {
         if(this._notificationSound != null)
         {
            this._notificationSound.play();
         }
      }
   }
}

