package alternativa.tanks.tracker
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class TrackerService implements ITrackerService
   {
      
      private static var clientLog:IClientLog;
      
      private static var actions:Dictionary;
      
      private var commands:Vector.<TrackerCommand>;
      
      private var timer:Timer;
      
      private var available:Boolean = false;
      
      public function TrackerService()
      {
         super();
         this.available = ExternalInterface.available && Boolean(ExternalInterface.call("checkGALoaded"));
         clientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
         if(this.available)
         {
            this.commands = new Vector.<TrackerCommand>();
            this.timer = new Timer(1000);
            this.timer.addEventListener(TimerEvent.TIMER,this.timer_timerHandler);
            actions = new Dictionary();
            this.trackPageView("initTracker");
         }
      }
      
      public function trackPageView(_arg_1:String) : void
      {
         var _local_2:int = 0;
         if(this.available)
         {
            _local_2 = int(getTimer() / 100);
            actions[_arg_1] = _local_2;
            this.commands.push(new TrackerCommand("GATrackPageView","/" + _arg_1));
            this.timer.start();
         }
      }
      
      public function trackEvent(_arg_1:String, _arg_2:String, _arg_3:String) : void
      {
         var _local_4:int = 0;
         if(this.available)
         {
            _local_4 = int(getTimer() / 100);
            actions[_arg_2] = _local_4;
            this.commands.push(new TrackerCommand("GATrackEvent",_arg_1,_arg_2,_arg_3));
            this.timer.start();
         }
      }
      
      public function trackEventAfter(_arg_1:String, _arg_2:String, _arg_3:String) : void
      {
         var _local_4:int = 0;
         if(this.available)
         {
            _local_4 = int(getTimer() / 100);
            if(actions[_arg_3] != null)
            {
               this.trackEvent(_arg_1,_arg_2 + "<=" + _arg_3,String((_local_4 - actions[_arg_3]) / 10));
            }
            else
            {
               this.trackEvent(_arg_1,_arg_2 + "<=" + _arg_3,"action not logged");
            }
         }
      }
      
      private function timer_timerHandler(_arg_1:TimerEvent) : void
      {
         var _local_3:TrackerCommand = null;
         var _local_4:Boolean = false;
         if(this.commands.length > 0)
         {
            if(this.available)
            {
               _local_3 = this.commands.shift();
               _local_4 = _local_3.arguments.length == 1 ? Boolean(ExternalInterface.call(_local_3.command,_local_3.arguments[0])) : Boolean(ExternalInterface.call(_local_3.command,_local_3.arguments[0],_local_3.arguments[1],_local_3.arguments[2]));
            }
         }
         else
         {
            this.timer.stop();
         }
      }
   }
}

class TrackerCommand
{
   
   internal var _command:String;
   
   internal var _arguments:Array;
   
   public function TrackerCommand(_arg_1:String, ... _args)
   {
      super();
      this._command = _arg_1;
      this._arguments = _args;
   }
   
   public function get command() : String
   {
      return this._command;
   }
   
   public function set command(_arg_1:String) : void
   {
      this._command = _arg_1;
   }
   
   public function get arguments() : Array
   {
      return this._arguments;
   }
   
   public function set arguments(_arg_1:Array) : void
   {
      this._arguments = _arg_1;
   }
}
