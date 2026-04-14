package alternativa.tanks.models.clan
{
   [ModelInterface]
   public interface IClanModel
   {
      
      function leaveClan() : void;
      
      function addClanMember(param1:String) : void;
      
      function excludeClanMember(param1:String) : void;
      
      function rejectRequest(param1:String) : void;
      
      function acceptRequest(param1:String) : void;
      
      function rejectAllRequests() : void;
      
      function inviteByUid(param1:String) : void;
      
      function revokeRequest(param1:String) : void;
   }
}

