package projects.tanks.clients.fp10.libraries.tanksservices.model.friends.accepted
{
   import projects.tanks.client.users.model.friends.container.UserContainerCC;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   
   public class FriendsAcceptedModel
   {
      
      [Inject]
      public static var friendsInfoService:IFriendInfoService;
      
      public function FriendsAcceptedModel()
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
            friendsInfoService.setFriendState(_local_3,FriendState.ACCEPTED);
         }
      }
      
      public function onAdding(_arg_1:String) : void
      {
         friendsInfoService.setFriendState(_arg_1,FriendState.ACCEPTED);
      }
      
      public function onRemoved(_arg_1:String) : void
      {
         friendsInfoService.deleteFriend(_arg_1,FriendState.ACCEPTED);
      }
   }
}

