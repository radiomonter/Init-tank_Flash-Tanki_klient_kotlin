package projects.tanks.clients.fp10.libraries.tanksservices.service.friend
{
   import flash.events.EventDispatcher;
   
   public class FriendActionService extends EventDispatcher implements IFriendActionService
   {
      
      public function FriendActionService()
      {
         super();
      }
      
      public function add(_arg_1:String) : void
      {
         dispatchEvent(new FriendActionServiceEvent(FriendActionServiceEvent.ADD,_arg_1));
      }
      
      public function accept(_arg_1:String) : void
      {
         dispatchEvent(new FriendActionServiceEvent(FriendActionServiceEvent.ACCEPT,_arg_1));
      }
      
      public function breakItOff(_arg_1:String) : void
      {
         dispatchEvent(new FriendActionServiceEvent(FriendActionServiceEvent.BREAK_OFF,_arg_1));
      }
      
      public function reject(_arg_1:String) : void
      {
         dispatchEvent(new FriendActionServiceEvent(FriendActionServiceEvent.REJECT,_arg_1));
      }
      
      public function rejectAllIncoming() : void
      {
         dispatchEvent(new FriendActionServiceEvent(FriendActionServiceEvent.REJECT_ALL_INCOMING,null));
      }
      
      public function revoke(_arg_1:String) : void
      {
         dispatchEvent(new FriendActionServiceEvent(FriendActionServiceEvent.REVOKE,_arg_1));
      }
      
      public function addByUid(_arg_1:String) : void
      {
         dispatchEvent(new FriendActionServiceUidEvent(FriendActionServiceUidEvent.ADD,_arg_1));
      }
      
      public function checkUid(_arg_1:String) : void
      {
         dispatchEvent(new FriendActionServiceUidEvent(FriendActionServiceUidEvent.CHECK,_arg_1));
      }
      
      public function uidExist() : void
      {
         dispatchEvent(new FriendActionServiceUidEvent(FriendActionServiceUidEvent.UID_EXIST,""));
      }
      
      public function uidNotExist() : void
      {
         dispatchEvent(new FriendActionServiceUidEvent(FriendActionServiceUidEvent.UID_NOT_EXIST,""));
      }
      
      public function alreadyInIncomingFriends(_arg_1:String, _arg_2:String) : void
      {
         dispatchEvent(new FriendActionServiceUidEvent(FriendActionServiceUidEvent.ALREADY_IN_INCOMING_FRIENDS,_arg_1,_arg_2));
      }
      
      public function alreadyInAcceptedFriends(_arg_1:String) : void
      {
         dispatchEvent(new FriendActionServiceUidEvent(FriendActionServiceUidEvent.ALREADY_IN_ACCEPTED_FRIENDS,_arg_1));
      }
      
      public function alreadyInOutgoingFriends(_arg_1:String) : void
      {
         dispatchEvent(new FriendActionServiceUidEvent(FriendActionServiceUidEvent.ALREADY_IN_OUTGOING_FRIENDS,_arg_1));
      }
   }
}

