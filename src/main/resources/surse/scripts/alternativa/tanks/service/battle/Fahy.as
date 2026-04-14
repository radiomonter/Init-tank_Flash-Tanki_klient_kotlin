package alternativa.tanks.service.battle
{
   import alternativa.tanks.model.item.BattleItem;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.FriendStateChangeEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   
   public class Fahy
   {
      
      [Inject]
      public static var friendsInfoService:IFriendInfoService;
      
      [Inject]
      public static var battleUserInfoService:IBattleUserInfoService;
      
      public function Fahy()
      {
         super();
         friendsInfoService.addEventListener(FriendStateChangeEvent.CHANGE,this.onChangeFriendState);
      }
      
      public function destroy() : void
      {
         friendsInfoService.removeEventListener(FriendStateChangeEvent.CHANGE,this.onChangeFriendState);
      }
      
      private function onChangeFriendState(_arg_1:FriendStateChangeEvent) : void
      {
         var _local_2:BattleItem = null;
         var _local_3:String = _arg_1.userId;
         var _local_4:FriendState = _arg_1.state;
         var _local_5:FriendState = _arg_1.prevState;
         if(battleUserInfoService.fitaqo(_local_3))
         {
            _local_2 = BattleItem(battleUserInfoService.debet(_local_3).adapt(BattleItem));
            if(_local_4 == FriendState.ACCEPTED)
            {
               _local_2.onAddFriend(_local_3);
            }
            if(_local_4 == FriendState.UNKNOWN && _local_5 == FriendState.ACCEPTED)
            {
               _local_2.onDeleteFriend(_local_3);
            }
         }
      }
   }
}

