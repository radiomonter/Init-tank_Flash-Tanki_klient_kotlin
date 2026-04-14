package platform.client.fp10.core.resource
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.console.IConsole;
   import alternativa.osgi.service.launcherparams.ILauncherParams;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import platform.client.fp10.core.service.IResourceTimer;
   
   public class ResourceTimer implements IResourceTimer
   {
      
      private static const DEFAULT_TIMEOUT:int = 30000;
      
      private static const DEFAULT_RELOAD_ATTEMTS:int = 3;
      
      private static const MIN_TIMEOUT:int = 5000;
      
      private var timer:Timer;
      
      private var resources:Vector.<Resource>;
      
      private var numResources:int;
      
      private var timeout:int;
      
      private var maxReloadAttemts:int;
      
      public function ResourceTimer(_arg_1:OSGi)
      {
         super();
         var _local_2:ILauncherParams = ILauncherParams(_arg_1.getService(ILauncherParams));
         this.timeout = int(DEFAULT_TIMEOUT);
         if(this.timeout < MIN_TIMEOUT)
         {
            this.timeout = MIN_TIMEOUT;
         }
         this.maxReloadAttemts = int(DEFAULT_RELOAD_ATTEMTS);
         if(this.maxReloadAttemts < 0)
         {
            this.maxReloadAttemts = 0;
         }
         this.resources = new Vector.<Resource>();
         this.timer = new Timer(1000);
         var _local_3:IConsole = IConsole(_arg_1.getService(IConsole));
         _local_3.setCommandHandler("res_timer",this.onConsoleCommand);
      }
      
      public function getMaxReloadAttemts() : int
      {
         return this.maxReloadAttemts;
      }
      
      public function addResource(_arg_1:Resource) : void
      {
         var _local_2:* = undefined;
         if(this.resources.indexOf(_arg_1) < 0)
         {
            _local_2 = this.numResources++;
            this.resources[_local_2] = _arg_1;
            if(this.numResources == 1)
            {
               this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
               this.timer.start();
            }
         }
      }
      
      public function removeResource(_arg_1:Resource) : void
      {
         var _local_2:int = this.resources.indexOf(_arg_1);
         if(_local_2 >= 0)
         {
            this.resources[_local_2] = this.resources[--this.numResources];
            this.resources[this.numResources] = null;
            if(this.numResources == 0)
            {
               this.timer.stop();
               this.timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            }
         }
      }
      
      private function onTimer(_arg_1:TimerEvent) : void
      {
         var _local_2:Resource = null;
         var _local_4:int = 0;
         var _local_3:int = getTimer();
         while(_local_4 < this.numResources)
         {
            _local_2 = this.resources[_local_4];
            if(_local_3 - _local_2.lastActivityTime > this.timeout)
            {
               this.removeResource(_local_2);
               _local_4--;
               _local_2.reload();
            }
            _local_4++;
         }
      }
      
      private function onConsoleCommand(_arg_1:IConsole, _arg_2:Array) : void
      {
         if(_arg_2.length == 0)
         {
            _arg_1.addText("Available parameters:");
            _arg_1.addText("ls -- list currently tracked resources");
            return;
         }
         switch(_arg_2[0])
         {
            case "ls":
               this.listResources(_arg_1);
         }
      }
      
      private function listResources(_arg_1:IConsole) : void
      {
         var _local_2:Resource = null;
         var _local_3:int = 0;
         var _local_5:int = 0;
         var _local_4:int = getTimer();
         while(_local_5 < this.numResources)
         {
            _local_2 = this.resources[_local_5];
            _local_3 = int((_local_4 - _local_2.lastActivityTime) / 1000);
            _arg_1.addText(_local_5 + 1 + ". " + _local_2 + ", time: " + _local_3 + " second(s)");
            _local_5++;
         }
      }
   }
}

