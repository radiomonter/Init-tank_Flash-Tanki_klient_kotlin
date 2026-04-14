package projects.tanks.clients.fp10.libraries.tanksservices.model
{
   import alternativa.osgi.OSGi;
   import fominskiy.networking.INetworkListener;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import fominskiy.networking.commands.Command;
   import fominskiy.networking.commands.Type;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.FriendActionServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.FriendActionServiceUidEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendActionService;
   
   public class FriendsModel implements IFriends, INetworkListener
   {
      
      [Inject]
      public static var friendsActionService:IFriendActionService;
      
      public function FriendsModel()
      {
         super();
      }
      
      public function onData(_arg_1:Command) : void
      {
         if(_arg_1.type == Type.LOBBY)
         {
            switch(_arg_1.args[0])
            {
               case "friend_check_exist":
                  this.uidExist();
                  return;
               case "friend_check_not_exist":
                  this.uidNotExist();
                  return;
               case "friend_alreadyInAcceptedFriends":
                  this.alreadyInAcceptedFriends(_arg_1.args[1]);
                  return;
               case "friend_alreadyInIncomingFriends":
                  this.alreadyInIncomingFriends(_arg_1.args[1],_arg_1.args[1]);
                  return;
               case "friend_alreadyInOutgoingFriends":
                  this.alreadyInOutgoingFriends(_arg_1.args[1]);
                  return;
            }
         }
      }
      
      public function objectLoaded() : void
      {
         friendsActionService.addEventListener(FriendActionServiceEvent.ACCEPT,this.onAccept);
         friendsActionService.addEventListener(FriendActionServiceEvent.ADD,this.onAdd);
         friendsActionService.addEventListener(FriendActionServiceUidEvent.ADD,this.onAddByUid);
         friendsActionService.addEventListener(FriendActionServiceEvent.BREAK_OFF,this.onBreakItOff);
         friendsActionService.addEventListener(FriendActionServiceEvent.REJECT,this.onReject);
         friendsActionService.addEventListener(FriendActionServiceEvent.REJECT_ALL_INCOMING,this.onRejectAllIncoming);
         friendsActionService.addEventListener(FriendActionServiceEvent.REVOKE,this.onRevoke);
         friendsActionService.addEventListener(FriendActionServiceUidEvent.CHECK,this.onCheck);
      }
      
      private function onAccept(_arg_1:FriendActionServiceEvent) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;friend_accept;" + _arg_1.userId);
      }
      
      private function onAddByUid(_arg_1:FriendActionServiceUidEvent) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;friend_add;" + _arg_1.uid);
      }
      
      private function onAdd(_arg_1:FriendActionServiceEvent) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;friend_add;" + _arg_1.userId);
      }
      
      private function onBreakItOff(_arg_1:FriendActionServiceEvent) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;friend_breakItOff;" + _arg_1.userId);
      }
      
      private function onReject(_arg_1:FriendActionServiceEvent) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;friend_reject;" + _arg_1.userId);
      }
      
      private function onRejectAllIncoming(_arg_1:FriendActionServiceEvent) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;friend_rejectAllIncoming");
      }
      
      private function onRevoke(_arg_1:FriendActionServiceEvent) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;friend_revoke;" + _arg_1.userId);
      }
      
      private function onCheck(_arg_1:FriendActionServiceUidEvent) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;friend_check;" + _arg_1.uid);
      }
      
      public function objectUnloaded() : void
      {
         friendsActionService.removeEventListener(FriendActionServiceEvent.ACCEPT,this.onAccept);
         friendsActionService.removeEventListener(FriendActionServiceEvent.ADD,this.onAdd);
         friendsActionService.removeEventListener(FriendActionServiceUidEvent.ADD,this.onAddByUid);
         friendsActionService.removeEventListener(FriendActionServiceEvent.BREAK_OFF,this.onBreakItOff);
         friendsActionService.removeEventListener(FriendActionServiceEvent.REJECT,this.onReject);
         friendsActionService.removeEventListener(FriendActionServiceEvent.REJECT_ALL_INCOMING,this.onRejectAllIncoming);
         friendsActionService.removeEventListener(FriendActionServiceEvent.REVOKE,this.onRevoke);
         friendsActionService.removeEventListener(FriendActionServiceUidEvent.CHECK,this.onCheck);
      }
      
      public function isLocal() : Boolean
      {
         return true;
      }
      
      public function alreadyInAcceptedFriends(_arg_1:String) : void
      {
         friendsActionService.alreadyInAcceptedFriends(_arg_1);
      }
      
      public function alreadyInIncomingFriends(_arg_1:String, _arg_2:String) : void
      {
         friendsActionService.alreadyInIncomingFriends(_arg_1,_arg_2);
      }
      
      public function alreadyInOutgoingFriends(_arg_1:String) : void
      {
         friendsActionService.alreadyInOutgoingFriends(_arg_1);
      }
      
      public function uidExist() : void
      {
         friendsActionService.uidExist();
      }
      
      public function uidNotExist() : void
      {
         friendsActionService.uidNotExist();
      }
   }
}

