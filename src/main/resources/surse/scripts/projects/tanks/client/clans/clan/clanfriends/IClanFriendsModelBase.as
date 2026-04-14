package projects.tanks.client.clans.clan.clanfriends
{
   public interface IClanFriendsModelBase
   {
      
      function onUserAdd(param1:String) : void;
      
      function onUserRemove(param1:String) : void;
      
      function userJoinClan(param1:Vector.<String>) : void;
   }
}

