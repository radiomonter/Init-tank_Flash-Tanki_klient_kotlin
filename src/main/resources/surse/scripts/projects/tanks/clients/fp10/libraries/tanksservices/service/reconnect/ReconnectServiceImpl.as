package projects.tanks.clients.fp10.libraries.tanksservices.service.reconnect
{
   public class ReconnectServiceImpl implements ReconnectService
   {
      
      public function ReconnectServiceImpl()
      {
         super();
      }
      
      public function isLocalServer(_arg_1:int) : Boolean
      {
         return true;
      }
      
      public function isEnabled() : Boolean
      {
         return false;
      }
      
      public function isEnabledChooseServerByRank() : Boolean
      {
         return false;
      }
      
      public function getCurrentServerNumber() : int
      {
         return 1;
      }
   }
}

