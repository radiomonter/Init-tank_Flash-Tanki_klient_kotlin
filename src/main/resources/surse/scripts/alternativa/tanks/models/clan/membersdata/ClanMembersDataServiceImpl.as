package alternativa.tanks.models.clan.membersdata
{
   import alternativa.tanks.gui.clanmanagement.ClanPermissionsManager;
   import alternativa.tanks.models.service.ClanNotificationsManager;
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import projects.tanks.client.clans.clan.clanmembersdata.UserData;
   import projects.tanks.client.clans.clan.permissions.ClanPermission;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   
   public class ClanMembersDataServiceImpl implements ClanMembersDataService
   {
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      private var usersData:Dictionary = new Dictionary();
      
      public function ClanMembersDataServiceImpl()
      {
         super();
      }
      
      public function setData(_arg_1:UserData) : void
      {
         this.usersData[_arg_1.userId] = _arg_1;
         ClanPermissionsManager.updatePositions(_arg_1);
      }
      
      public function getKills(_arg_1:String) : int
      {
         return this.usersData[_arg_1].kills;
      }
      
      public function getScore(_arg_1:String) : int
      {
         return this.usersData[_arg_1].score;
      }
      
      public function getDeaths(_arg_1:String) : int
      {
         return this.usersData[_arg_1].deaths;
      }
      
      public function getKillDeathRatio(_arg_1:String) : Number
      {
         var _local_2:Number = Number(this.usersData[_arg_1].deaths);
         var _local_3:Number = Number(this.usersData[_arg_1].kills);
         if(_local_2 == 0)
         {
            return _local_3;
         }
         return _local_3 / _local_2;
      }
      
      public function getDateInClanInSec(_arg_1:String) : int
      {
         return this.usersData[_arg_1].dateInClanInSec;
      }
      
      public function getPermission(_arg_1:String) : ClanPermission
      {
         if(_arg_1 in this.usersData)
         {
            return this.usersData[_arg_1].permission;
         }
         return ClanPermission.NOVICE;
      }
      
      public function getLastVisitDateInSec(_arg_1:String) : Long
      {
         return this.usersData[_arg_1].lastVisitTime;
      }
      
      public function getClanMemberData(_arg_1:String) : Object
      {
         var _local_2:Object = {};
         _local_2.score = this.getScore(_arg_1).toString();
         _local_2.permission = this.getPermission(_arg_1);
         _local_2.kills = this.getKills(_arg_1).toString();
         _local_2.deaths = this.getDeaths(_arg_1).toString();
         _local_2.score = this.getScore(_arg_1).toString();
         _local_2.kd = this.getKillDeathRatio(_arg_1).toFixed(2).toString();
         _local_2.date = this.getDateInClanInSec(_arg_1);
         _local_2.lastOnlineDate = this.getLastVisitDateInSec(_arg_1);
         _local_2.id = _arg_1;
         var _local_3:String = userInfoService.getCurrentUserId();
         _local_2.currentUserId = _local_3;
         _local_2.currentUserPermission = this.getPermission(_local_3);
         _local_2.isNew = ClanNotificationsManager.userInAcceptedNotifications(_arg_1);
         return _local_2;
      }
   }
}

