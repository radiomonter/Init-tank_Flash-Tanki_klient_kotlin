package projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.network.connection.ConnectionCloseStatus;
   import platform.client.fp10.core.network.handler.OnConnectionClosedServiceListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.online.ClientOnlineNotifierData;
   
   public class OnlineNotifierService extends EventDispatcher implements IOnlineNotifierService, OnConnectionClosedServiceListener
   {
      
      private var usersOnlineStatus:Dictionary = new Dictionary();
      
      public function OnlineNotifierService()
      {
         super();
      }
      
      public function onConnectionClosed(_arg_1:ConnectionCloseStatus) : void
      {
         this.usersOnlineStatus = new Dictionary();
      }
      
      public function setOnline(_arg_1:Vector.<ClientOnlineNotifierData>) : void
      {
         dispatchEvent(new OnlineNotifierServiceEvent(OnlineNotifierServiceEvent.SET_ONLINE,_arg_1));
      }
      
      public function addUserOnlineData(_arg_1:ClientOnlineNotifierData) : void
      {
         this.usersOnlineStatus[_arg_1.userId] = _arg_1;
      }
      
      public function removeUserOnlineData(_arg_1:String) : void
      {
         delete this.usersOnlineStatus[_arg_1];
      }
      
      public function hasUserOnlineData(_arg_1:String) : Boolean
      {
         return _arg_1 in this.usersOnlineStatus;
      }
      
      public function getUserOnlineData(_arg_1:String) : ClientOnlineNotifierData
      {
         return this.usersOnlineStatus[_arg_1];
      }
   }
}

