package projects.tanks.clients.fp10.libraries.tanksservices.service.friend
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.network.connection.ConnectionCloseStatus;
   import platform.client.fp10.core.network.handler.OnConnectionClosedServiceListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendInfoConsumer;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.TimeOutTruncateConsumers;
   
   public class FriendInfoService extends EventDispatcher implements IFriendInfoService, OnConnectionClosedServiceListener
   {
      
      private var consumers:Dictionary = new Dictionary();
      
      private var friends:Dictionary = new Dictionary();
      
      private var newAcceptedFriends:Dictionary = new Dictionary();
      
      private var newIncomingFriends:Dictionary = new Dictionary();
      
      private var truncateConsumers:TimeOutTruncateConsumers;
      
      public function FriendInfoService()
      {
         super();
         this.truncateConsumers = new TimeOutTruncateConsumers();
         this.truncateConsumers.consumers = this.consumers;
         this.truncateConsumers.truncateFunction = this.unSubscribe;
      }
      
      private static function getDictionaryLengthByValue(_arg_1:Dictionary, _arg_2:Object = null) : int
      {
         var _local_3:Object = null;
         var _local_4:int = 0;
         for each(_local_3 in _arg_1)
         {
            if(_arg_2 != null)
            {
               if(_local_3 == _arg_2)
               {
                  _local_4++;
               }
            }
            else
            {
               _local_4++;
            }
         }
         return _local_4;
      }
      
      private function subscribe(_arg_1:String, _arg_2:FriendInfoConsumer) : void
      {
         this.consumers[_arg_1] = _arg_2;
         if(_arg_1 in this.friends)
         {
            this.notifyConsumer(_arg_1,this.friends[_arg_1]);
         }
      }
      
      private function unSubscribe(_arg_1:Vector.<String>) : void
      {
         var _local_2:String = null;
         for each(_local_2 in _arg_1)
         {
            delete this.consumers[_local_2];
         }
      }
      
      public function setFriendState(_arg_1:String, _arg_2:FriendState) : void
      {
         var _local_3:FriendState = this.getFriendState(_arg_1);
         this.friends[_arg_1] = _arg_2;
         this.notifyConsumer(_arg_1,_arg_2);
         dispatchEvent(new FriendStateChangeEvent(FriendStateChangeEvent.CHANGE,_arg_1,_arg_2,_local_3));
      }
      
      public function getFriendsIdByState(_arg_1:FriendState) : Vector.<String>
      {
         var _local_2:* = undefined;
         var _local_3:Vector.<String> = new Vector.<String>();
         for(_local_2 in this.friends)
         {
            if(this.friends[_local_2] == _arg_1)
            {
               _local_3.push(_local_2);
            }
         }
         return _local_3;
      }
      
      public function onConnectionClosed(_arg_1:ConnectionCloseStatus) : void
      {
         this.consumers = new Dictionary();
         this.friends = new Dictionary();
         this.newAcceptedFriends = new Dictionary();
         this.newIncomingFriends = new Dictionary();
      }
      
      public function deleteFriend(_arg_1:String, _arg_2:FriendState) : void
      {
         var _local_3:FriendState = null;
         if(this.isFriendsInState(_arg_1,_arg_2))
         {
            _local_3 = this.getFriendState(_arg_1);
            delete this.friends[_arg_1];
            this.notifyConsumer(_arg_1,FriendState.UNKNOWN);
            dispatchEvent(new FriendStateChangeEvent(FriendStateChangeEvent.CHANGE,_arg_1,FriendState.UNKNOWN,_local_3));
         }
      }
      
      public function getConsumer(_arg_1:String) : FriendInfoConsumer
      {
         return this.consumers[_arg_1];
      }
      
      private function notifyConsumer(_arg_1:String, _arg_2:FriendState) : void
      {
         if(_arg_1 in this.consumers)
         {
            this.getConsumer(_arg_1).setFriendState(_arg_2);
         }
      }
      
      public function getOrCreateUpdater(_arg_1:String) : IFriendsInfoLabelUpdater
      {
         var _local_2:FriendsInfoLabelUpdater = null;
         this.truncateConsumers.updateLastAccessTime(_arg_1);
         if(_arg_1 in this.consumers)
         {
            _local_2 = this.consumers[_arg_1];
         }
         else
         {
            _local_2 = new FriendsInfoLabelUpdater();
            this.consumers[_arg_1] = _local_2;
            this.subscribe(_arg_1,_local_2);
         }
         _local_2.updateLastAccessTime();
         return _local_2;
      }
      
      public function hasUpdater(_arg_1:String) : Boolean
      {
         return _arg_1 in this.consumers;
      }
      
      public function isFriendsInState(_arg_1:String, _arg_2:FriendState) : Boolean
      {
         return this.friends[_arg_1] == _arg_2;
      }
      
      public function getFriendState(_arg_1:String) : FriendState
      {
         if(_arg_1 in this.friends)
         {
            return this.friends[_arg_1];
         }
         return FriendState.UNKNOWN;
      }
      
      public function get acceptedFriendsLength() : int
      {
         return getDictionaryLengthByValue(this.friends,FriendState.ACCEPTED);
      }
      
      public function get outgoingFriendsLength() : int
      {
         return getDictionaryLengthByValue(this.friends,FriendState.OUTGOING);
      }
      
      public function get incomingFriendsLength() : int
      {
         return getDictionaryLengthByValue(this.friends,FriendState.INCOMING);
      }
      
      public function onAddNewAcceptedFriend(_arg_1:String) : void
      {
         this.newAcceptedFriends[_arg_1] = true;
         this.dispatchChangeNewAcceptedFriend(_arg_1);
      }
      
      public function onRemoveNewAcceptedFriend(_arg_1:String) : void
      {
         delete this.newAcceptedFriends[_arg_1];
         this.dispatchChangeNewAcceptedFriend(_arg_1);
      }
      
      public function removeNewAcceptedFriend(_arg_1:String) : void
      {
         dispatchEvent(new NewFriendRemoveEvent(NewFriendRemoveEvent.ACCEPTED,_arg_1));
      }
      
      public function isNewAcceptedFriend(_arg_1:String) : Boolean
      {
         return _arg_1 in this.newAcceptedFriends;
      }
      
      public function get newAcceptedFriendsLength() : int
      {
         return getDictionaryLengthByValue(this.newAcceptedFriends);
      }
      
      private function dispatchChangeNewAcceptedFriend(_arg_1:String) : void
      {
         dispatchEvent(new NewFriendEvent(NewFriendEvent.ACCEPTED_CHANGE,_arg_1));
      }
      
      public function onAddNewIncomingFriend(_arg_1:String) : void
      {
         this.newIncomingFriends[_arg_1] = true;
         this.dispatchChangeNewIncommingFriend(_arg_1);
      }
      
      public function onRemoveNewIncomingFriend(_arg_1:String) : void
      {
         delete this.newIncomingFriends[_arg_1];
         this.dispatchChangeNewIncommingFriend(_arg_1);
      }
      
      public function removeNewIncomingFriend(_arg_1:String) : void
      {
         dispatchEvent(new NewFriendRemoveEvent(NewFriendRemoveEvent.INCOMING,_arg_1));
      }
      
      public function isNewIncomingFriend(_arg_1:String) : Boolean
      {
         return _arg_1 in this.newIncomingFriends;
      }
      
      public function get newIncomingFriendsLength() : int
      {
         return getDictionaryLengthByValue(this.newIncomingFriends);
      }
      
      private function dispatchChangeNewIncommingFriend(_arg_1:String) : void
      {
         dispatchEvent(new NewFriendEvent(NewFriendEvent.INCOMING_CHANGE,_arg_1));
      }
      
      public function isNewFriend(_arg_1:String) : Boolean
      {
         return this.isNewAcceptedFriend(_arg_1) || this.isNewIncomingFriend(_arg_1);
      }
   }
}

