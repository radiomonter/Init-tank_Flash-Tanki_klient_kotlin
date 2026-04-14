package projects.tanks.clients.fp10.libraries.tanksservices.service.clan
{
   public interface ClanFunctionsService
   {
      
      function invite(param1:String) : void;
      
      function leave() : void;
      
      function exclude(param1:String) : void;
      
      function revokeRequest(param1:String) : void;
      
      function acceptRequest(param1:String) : void;
      
      function rejectRequest(param1:String) : void;
      
      function rejectAllRequests() : void;
   }
}

