package alternativa.tanks.battle
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Qub;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class SpeedHackChecker
   {
      
      [Inject]
      public static var clientLog:IClientLog;
      
      private const sadakyfan:EncryptedInt = new EncryptedIntImpl(15000);
      
      private const threshold:EncryptedInt = new EncryptedIntImpl(300);
      
      private const hyty:EncryptedInt = new EncryptedIntImpl(3);
      
      private const makyvewe:EncryptedInt = new EncryptedIntImpl(0);
      
      private var battleEventDispatcher:BattleEventDispatcher;
      
      private var timer:Timer;
      
      private var pyko:int;
      
      private var tason:Number;
      
      private var fok:Array = [];
      
      public function SpeedHackChecker(_arg_1:BattleEventDispatcher)
      {
         super();
         this.battleEventDispatcher = _arg_1;
         this.pyko = getTimer();
         this.tason = new Date().time;
         this.timer = new Timer(this.sadakyfan.getInt());
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this.timer.start();
      }
      
      public function stop() : void
      {
         this.timer.stop();
      }
      
      private function onTimer(_arg_1:TimerEvent) : void
      {
         var _local_2:int = getTimer();
         var _local_3:Number = new Date().time;
         var _local_4:Number = _local_2 - this.pyko - _local_3 + this.tason;
         if(Math.abs(_local_4) > this.threshold.getInt())
         {
            this.fok.push(_local_4);
            this.makyvewe.setInt(this.makyvewe.getInt() + 1);
            if(this.makyvewe.getInt() >= this.hyty.getInt())
            {
               this.stop();
               this.battleEventDispatcher.dispatchEvent(new Qub(this.fok));
            }
         }
         else
         {
            this.makyvewe.setInt(0);
            this.fok.length = 0;
         }
         this.pyko = _local_2;
         this.tason = _local_3;
      }
   }
}

