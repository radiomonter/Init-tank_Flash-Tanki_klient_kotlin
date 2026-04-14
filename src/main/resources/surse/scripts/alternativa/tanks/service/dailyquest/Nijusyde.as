package alternativa.tanks.service.dailyquest
{
   import flash.events.EventDispatcher;
   
   public class Nijusyde extends EventDispatcher implements DailyQuestNotifierService
   {
      
      public function Nijusyde()
      {
         super();
      }
      
      public function showNotification() : void
      {
         dispatchEvent(new Jomejov(Jomejov.mokiqule));
      }
      
      public function hideNotification() : void
      {
         dispatchEvent(new Jomejov(Jomejov.fuhy));
      }
   }
}

