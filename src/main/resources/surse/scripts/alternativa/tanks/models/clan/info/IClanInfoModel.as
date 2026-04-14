package alternativa.tanks.models.clan.info
{
   import projects.tanks.client.clans.clan.clanflag.ClanFlag;
   
   [ModelInterface]
   public interface IClanInfoModel
   {
      
      function getClanName() : String;
      
      function getClanTag() : String;
      
      function getDescription() : String;
      
      function getClanFlag() : ClanFlag;
      
      function getRankIndexForAddClan() : int;
      
      function incomingRequestEnabled() : Boolean;
      
      function getCreatorId() : String;
      
      function getCreateTime() : String;
      
      function getUsersCount() : int;
   }
}

