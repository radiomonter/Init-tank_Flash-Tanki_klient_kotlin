package obfuscation.huqibunob
{
   import alternativa.model.IModel;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.services.ping.PingService;
   import com.alternativaplatform.client.models.core.users.model.timechecker.ITimeCheckerModelBase;
   import com.alternativaplatform.client.models.core.users.model.timechecker.TimeCheckerModelBase;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import services.alertservice.Alert;
   import services.alertservice.AlertAnswer;
   
   public class Gema extends TimeCheckerModelBase implements ITimeCheckerModelBase
   {
      
      [Inject]
      public static var rutiwofy:PingService;
      
      private var lastTime:int;
      
      public function Gema()
      {
         super();
         _interfaces.push(IModel);
         _interfaces.push(ITimeCheckerModelBase);
      }
      
      public function ping() : void
      {
         this.lastTime = getTimer();
         Network(OSGi.getInstance().getService(INetworker)).send("battle;ping");
      }
      
      public function pong() : void
      {
         var timer:Timer;
         var ping_:int = getTimer() - this.lastTime;
         rutiwofy.suz(ping_);
         timer = new Timer(500,1);
         timer.addEventListener(TimerEvent.TIMER_COMPLETE,function(_arg_1:TimerEvent):void
         {
            ping();
         });
         timer.start();
      }
      
      public function jema(_arg_1:ClientObject, _arg_2:String) : void
      {
         var _local_3:Alert = new Alert();
         _local_3.showAlert(_arg_2,Vector.<String>([AlertAnswer.OK]));
      }
   }
}

