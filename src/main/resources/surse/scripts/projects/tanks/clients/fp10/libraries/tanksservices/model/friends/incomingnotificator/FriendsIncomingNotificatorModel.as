package projects.tanks.clients.fp10.libraries.tanksservices.model.friends.incomingnotificator
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.LogService;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import projects.tanks.client.users.model.friends.container.UserContainerCC;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.NewFriendRemoveEvent;
   
   public class FriendsIncomingNotificatorModel
   {
      
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var friendsInfoService:IFriendInfoService;
      
      public function FriendsIncomingNotificatorModel()
      {
         super();
      }
      
      public function objectLoaded(_arg_1:UserContainerCC) : void
      {
         var _local_2:UserContainerCC = null;
         var _local_3:String = null;
         _local_2 = _arg_1;
         for each(_local_3 in _local_2.users)
         {
            logService.getLogger("fcounter").debug("FriendsIncomingNotificatorModel newFriendsIncoming userId=%1",[_local_3]);
            friendsInfoService.onAddNewIncomingFriend(_local_3);
         }
         friendsInfoService.addEventListener(NewFriendRemoveEvent.INCOMING,this.remove);
      }
      
      public function remove(_arg_1:NewFriendRemoveEvent) : void
      {
         logService.getLogger("fcounter").debug("FriendsIncomingNotificatorModel remove userId=%1",[_arg_1.userId]);
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;remove_new_incoming_friend;" + _arg_1.userId);
      }
      
      public function onAdding(_arg_1:String) : void
      {
         logService.getLogger("fcounter").debug("FriendsIncomingNotificatorModel onAdding userId=%1",[_arg_1]);
         friendsInfoService.onAddNewIncomingFriend(_arg_1);
      }
      
      public function onRemoved(_arg_1:String) : void
      {
         logService.getLogger("fcounter").debug("FriendsIncomingNotificatorModel onRemoved userId=%1",[_arg_1]);
         friendsInfoService.onRemoveNewIncomingFriend(_arg_1);
      }
      
      public function objectUnloaded() : void
      {
         logService.getLogger("fcounter").debug("FriendsIncomingNotificatorModel objectUnloaded");
         friendsInfoService.removeEventListener(NewFriendRemoveEvent.INCOMING,this.remove);
      }
   }
}

