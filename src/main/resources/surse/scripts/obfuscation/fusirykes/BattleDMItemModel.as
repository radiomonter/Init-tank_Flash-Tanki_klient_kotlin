package obfuscation.fusirykes
{
   import alternativa.tanks.controllers.BattleSelectVectorUtil;
   import alternativa.tanks.model.item.BattleItem;
   import alternativa.tanks.service.battle.IBattleUserInfoService;
   import alternativa.tanks.service.battlelist.IBattleListFormService;
   import obfuscation.pysuzi.Kecuwy;
   import obfuscation.pysuzi.Lozuwyzu;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   
   public class BattleDMItemModel extends Lozuwyzu implements Kecuwy, Hyv, BattleItem, ObjectLoadListener
   {
      
      [Inject]
      public static var battleListFormService:IBattleListFormService;
      
      [Inject]
      public static var friendsInfoService:IFriendInfoService;
      
      [Inject]
      public static var battleUserInfoService:IBattleUserInfoService;
      
      public function BattleDMItemModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _local_1:String = null;
         var _local_2:BattleDMData = this.data();
         var _local_3:Vector.<String> = getInitParam().users;
         var _local_4:int = _local_3.length - 1;
         while(_local_4 >= 0)
         {
            _local_1 = _local_3[_local_4];
            _local_2.users.push(_local_1);
            battleUserInfoService.connect(_local_1,object);
            if(friendsInfoService.isFriendsInState(_local_1,FriendState.ACCEPTED))
            {
               _local_2.friends.push(_local_1);
            }
            _local_4--;
         }
      }
      
      public function getUsersCount() : int
      {
         return this.data().users.length;
      }
      
      public function getFriendsCount() : int
      {
         return this.data().friends.length;
      }
      
      public function onReserveSlot(_arg_1:String) : void
      {
         this.data().users.push(_arg_1);
         battleUserInfoService.connect(_arg_1,object);
         if(friendsInfoService.isFriendsInState(_arg_1,FriendState.ACCEPTED))
         {
            this.onAddFriend(_arg_1);
         }
         this.dywilufaf();
      }
      
      public function onReleaseSlot(_arg_1:String) : void
      {
         BattleSelectVectorUtil.deleteElementInLongsVector(this.data().users,_arg_1);
         battleUserInfoService.disconnect(_arg_1);
         if(friendsInfoService.isFriendsInState(_arg_1,FriendState.ACCEPTED))
         {
            this.onDeleteFriend(_arg_1);
         }
         this.dywilufaf();
      }
      
      private function dywilufaf() : void
      {
         battleListFormService.updateUsersCountDm(object.name,this.data().users.length,this.data().friends.length);
      }
      
      private function data() : BattleDMData
      {
         var _local_1:BattleDMData = BattleDMData(getData(BattleDMData));
         if(_local_1 == null)
         {
            _local_1 = new BattleDMData();
            putData(BattleDMData,_local_1);
         }
         return _local_1;
      }
      
      public function onAddFriend(_arg_1:String) : void
      {
         this.data().friends.push(_arg_1);
         this.dywilufaf();
      }
      
      public function onDeleteFriend(_arg_1:String) : void
      {
         BattleSelectVectorUtil.deleteElementInLongsVector(this.data().friends,_arg_1);
         this.dywilufaf();
      }
   }
}

class BattleDMData
{
   
   public var users:Vector.<String> = new Vector.<String>();
   
   public var friends:Vector.<String> = new Vector.<String>();
   
   public function BattleDMData()
   {
      super();
   }
}
