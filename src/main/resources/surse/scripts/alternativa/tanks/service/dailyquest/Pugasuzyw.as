package alternativa.tanks.service.dailyquest
{
   import obfuscation.fador.Howevono;
   import obfuscation.fador.Jenapery;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadPostListener;
   
   public class Pugasuzyw extends Howevono implements Jenapery, ObjectLoadPostListener, ObjectUnloadPostListener
   {
      
      [Inject]
      public static var ziwifeve:DailyQuestNotifierService;
      
      public function Pugasuzyw()
      {
         super();
      }
      
      public function notifyDailyQuestCompleted() : void
      {
         ziwifeve.showNotification();
      }
      
      public function objectLoadedPost() : void
      {
         ziwifeve.addEventListener(Jomejov.fuhy,this.bad);
      }
      
      private function bad(_arg_1:Jomejov) : void
      {
         server.lep();
      }
      
      public function objectUnloadedPost() : void
      {
         ziwifeve.removeEventListener(Jomejov.fuhy,this.bad);
      }
      
      public function notifyDailyQuestGenerated() : void
      {
         ziwifeve.showNotification();
      }
   }
}

