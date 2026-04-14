package projects.tanks.clients.fp10.libraries.tanksservices.model.friends.acceptednotificator
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.LogService;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import projects.tanks.client.users.model.friends.container.UserContainerCC;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.NewFriendRemoveEvent;
   
   public class FriendsAcceptedNotificatorModel
   {
      
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var friendsInfoService:IFriendInfoService;
      
      public function FriendsAcceptedNotificatorModel()
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
            friendsInfoService.onAddNewAcceptedFriend(_local_3);
         }
         friendsInfoService.addEventListener(NewFriendRemoveEvent.ACCEPTED,this.remove);
      }
      
      private function remove(_arg_1:NewFriendRemoveEvent) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;remove_new_accepted_friend;" + _arg_1.userId);
      }
      
      public function onAdding(_arg_1:String) : void
      {
         friendsInfoService.onAddNewAcceptedFriend(_arg_1);
      }
      
      public function onRemoved(_arg_1:String) : void
      {
         friendsInfoService.onRemoveNewAcceptedFriend(_arg_1);
      }
      
      public function objectUnloaded() : void
      {
         friendsInfoService.removeEventListener(NewFriendRemoveEvent.ACCEPTED,this.remove);
      }
   }
}

