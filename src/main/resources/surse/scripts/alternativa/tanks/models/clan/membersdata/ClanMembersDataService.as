package alternativa.tanks.models.clan.membersdata
{
   import alternativa.types.Long;
   import projects.tanks.client.clans.clan.clanmembersdata.UserData;
   import projects.tanks.client.clans.clan.permissions.ClanPermission;
   
   public interface ClanMembersDataService
   {
      
      function getKills(param1:String) : int;
      
      function getScore(param1:String) : int;
      
      function getDeaths(param1:String) : int;
      
      function getKillDeathRatio(param1:String) : Number;
      
      function getDateInClanInSec(param1:String) : int;
      
      function getPermission(param1:String) : ClanPermission;
      
      function setData(param1:UserData) : void;
      
      function getLastVisitDateInSec(param1:String) : Long;
      
      function getClanMemberData(param1:String) : Object;
   }
}

