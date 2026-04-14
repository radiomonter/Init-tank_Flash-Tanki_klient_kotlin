package obfuscation.gilapu
{
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import obfuscation.bifaja.Fyzojuruq;
   import obfuscation.bifaja.Rojifyw;
   import platform.client.fp10.core.model.IObjectLoadListener;
   
   public class Zuhidegod extends Fyzojuruq implements Rojifyw, Vosu, IObjectLoadListener
   {
      
      [Inject]
      public static var battleInfoFormService:IBattleInfoFormService;
      
      public function Zuhidegod()
      {
         super();
      }
      
      public function getEnterPrice() : int
      {
         return getInitParam().proBattleEnterPrice;
      }
      
      public function getTimeLeftInSec() : int
      {
         if(getInitParam() == null)
         {
            return 0;
         }
         return getInitParam().timeLeftInSec;
      }
      
      public function objectLoaded() : void
      {
      }
      
      public function objectLoadedPost() : void
      {
         var _local_1:Timer = null;
         var _local_2:int = this.getTimeLeftInSec();
      }
      
      public function objectUnloaded() : void
      {
         var _local_1:Timer = null;
         var _local_2:int = this.getTimeLeftInSec();
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      private function onTimer(_arg_1:TimerEvent) : void
      {
         var _local_2:Timer = null;
         var _local_3:int = int((getTimer() - int(getData(int))) / 1000);
         if(_local_3 > this.getTimeLeftInSec())
         {
            _local_2 = Timer(getData(Timer));
            _local_2.removeEventListener(TimerEvent.TIMER,getFunctionWrapper(this.onTimer));
            _local_2.stop();
            battleInfoFormService.wavol();
         }
      }
   }
}

