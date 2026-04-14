package projects.tanks.clients.fp10.libraries.tanksservices.service.reconnect
{
   public interface ReconnectService
   {
      
      function isLocalServer(param1:int) : Boolean;
      
      function isEnabled() : Boolean;
      
      function isEnabledChooseServerByRank() : Boolean;
      
      function getCurrentServerNumber() : int;
   }
}

