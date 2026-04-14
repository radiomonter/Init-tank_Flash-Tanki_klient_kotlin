package obfuscation.fubyt
{
   import alternativa.tanks.controllers.BattleSelectVectorUtil;
   import alternativa.tanks.model.item.BattleItem;
   import alternativa.tanks.service.battle.IBattleUserInfoService;
   import alternativa.tanks.service.battlelist.IBattleListFormService;
   import obfuscation.bude.BattleTeam;
   import obfuscation.fut.Qaza;
   import obfuscation.fut.Zyv;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   
   public class BattleTeamItemModel extends Qaza implements Zyv, Batopa, BattleItem, ObjectLoadListener
   {
      
      [Inject]
      public static var battleListFormService:IBattleListFormService;
      
      [Inject]
      public static var friendsInfoService:IFriendInfoService;
      
      [Inject]
      public static var battleUserInfoService:IBattleUserInfoService;
      
      public function BattleTeamItemModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _local_1:BattleTeamData = this.data();
         var _local_2:Vector.<String> = getInitParam().usersRed;
         this.padu(_local_2,_local_1.usersRed,_local_1.friendsRed);
         var _local_3:Vector.<String> = getInitParam().usersBlue;
         this.padu(_local_3,_local_1.usersBlue,_local_1.friendsBlue);
      }
      
      private function padu(_arg_1:Vector.<String>, _arg_2:Vector.<String>, _arg_3:Vector.<String>) : void
      {
         var _local_4:int = _arg_1.length - 1;
         while(_local_4 >= 0)
         {
            _arg_2.push(_arg_1[_local_4]);
            battleUserInfoService.connect(_arg_1[_local_4],object);
            if(friendsInfoService.isFriendsInState(_arg_1[_local_4],FriendState.ACCEPTED))
            {
               _arg_3.push(_arg_1[_local_4]);
            }
            _local_4--;
         }
      }
      
      private function lywipuk(_arg_1:String, _arg_2:Vector.<String>, _arg_3:Vector.<String>) : void
      {
         if(BattleSelectVectorUtil.containsElementInVector(_arg_2,_arg_1))
         {
            BattleSelectVectorUtil.deleteElementInLongsVector(_arg_3,_arg_1);
         }
      }
      
      private function nyruhatyg(_arg_1:String, _arg_2:Vector.<String>, _arg_3:Vector.<String>) : void
      {
         if(BattleSelectVectorUtil.containsElementInVector(_arg_2,_arg_1))
         {
            _arg_3.push(_arg_1);
         }
      }
      
      public function getUsersCountBlue() : int
      {
         return this.data().usersBlue.length;
      }
      
      public function getUsersCountRed() : int
      {
         return this.data().usersRed.length;
      }
      
      public function getFriendsCountBlue() : int
      {
         return this.data().friendsBlue.length;
      }
      
      public function getFriendsCountRed() : int
      {
         return this.data().friendsRed.length;
      }
      
      public function onReserveSlot(_arg_1:String, _arg_2:BattleTeam) : void
      {
         switch(_arg_2)
         {
            case BattleTeam.RED:
               this.toziheba(_arg_1,this.data().usersRed,this.data().friendsRed);
               break;
            case BattleTeam.BLUE:
               this.toziheba(_arg_1,this.data().usersBlue,this.data().friendsBlue);
         }
         battleUserInfoService.connect(_arg_1,object);
         if(friendsInfoService.isFriendsInState(_arg_1,FriendState.ACCEPTED))
         {
            this.onAddFriend(_arg_1);
         }
         battleListFormService.updateUsersCountTeam(object.name,this.data().usersRed.length,this.data().usersBlue.length,this.data().friendsRed.length,this.data().friendsBlue.length);
      }
      
      private function toziheba(_arg_1:String, _arg_2:Vector.<String>, _arg_3:Vector.<String>) : void
      {
         _arg_2.push(_arg_1);
      }
      
      public function onReleaseSlot(_arg_1:String) : void
      {
         BattleSelectVectorUtil.deleteElementInLongsVector(this.data().usersBlue,_arg_1);
         BattleSelectVectorUtil.deleteElementInLongsVector(this.data().usersRed,_arg_1);
         BattleSelectVectorUtil.deleteElementInLongsVector(this.data().friendsRed,_arg_1);
         BattleSelectVectorUtil.deleteElementInLongsVector(this.data().friendsBlue,_arg_1);
         battleUserInfoService.disconnect(_arg_1);
         if(friendsInfoService.isFriendsInState(_arg_1,FriendState.ACCEPTED))
         {
            this.onDeleteFriend(_arg_1);
         }
         battleListFormService.updateUsersCountTeam(object.name,this.data().usersRed.length,this.data().usersBlue.length,this.data().friendsRed.length,this.data().friendsBlue.length);
      }
      
      public function swapTeams() : void
      {
         var _local_1:Vector.<String> = this.data().usersBlue;
         this.data().usersBlue = this.data().usersRed;
         this.data().usersRed = _local_1;
         var _local_2:Vector.<String> = this.data().friendsBlue;
         this.data().friendsBlue = this.data().friendsRed;
         this.data().friendsRed = _local_2;
         battleListFormService.swapTeams(object.name);
      }
      
      private function data() : BattleTeamData
      {
         var _local_1:BattleTeamData = BattleTeamData(getData(BattleTeamData));
         if(_local_1 == null)
         {
            _local_1 = new BattleTeamData();
            putData(BattleTeamData,_local_1);
         }
         return _local_1;
      }
      
      public function onAddFriend(_arg_1:String) : void
      {
         this.nyruhatyg(_arg_1,this.data().usersRed,this.data().friendsRed);
         this.nyruhatyg(_arg_1,this.data().usersBlue,this.data().friendsBlue);
         battleListFormService.updateUsersCountTeam(object.name,this.data().usersRed.length,this.data().usersBlue.length,this.data().friendsRed.length,this.data().friendsBlue.length);
      }
      
      public function onDeleteFriend(_arg_1:String) : void
      {
         this.lywipuk(_arg_1,this.data().usersRed,this.data().friendsRed);
         this.lywipuk(_arg_1,this.data().usersBlue,this.data().friendsBlue);
         battleListFormService.updateUsersCountTeam(object.name,this.data().usersRed.length,this.data().usersBlue.length,this.data().friendsRed.length,this.data().friendsBlue.length);
      }
   }
}

class BattleTeamData
{
   
   public var usersRed:Vector.<String> = new Vector.<String>();
   
   public var usersBlue:Vector.<String> = new Vector.<String>();
   
   public var friendsRed:Vector.<String> = new Vector.<String>();
   
   public var friendsBlue:Vector.<String> = new Vector.<String>();
   
   public function BattleTeamData()
   {
      super();
   }
}
