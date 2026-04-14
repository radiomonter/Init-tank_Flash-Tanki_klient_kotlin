package platform.client.fp10.core.logging.serverlog
{
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import flash.display.Loader;
   import flash.events.ErrorEvent;
   import flash.events.UncaughtErrorEvent;
   import platform.client.fp10.core.network.ICommandSender;
   
   public class UncaughtErrorServerLogImpl implements UncaughtErrorServerLog
   {
      
      [Inject]
      public static var loggerService:LogService;
      
      private static var channel:String = "UncaughtError";
      
      private var logger:Logger;
      
      public function UncaughtErrorServerLogImpl(_arg_1:ICommandSender)
      {
         super();
         loggerService.addLogTarget(new ServerLogTarget(_arg_1,channel + ":i"));
         this.logger = loggerService.getLogger(channel);
      }
      
      public function addLoader(_arg_1:Loader) : void
      {
         _arg_1.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.eventHandler);
      }
      
      private function eventHandler(_arg_1:UncaughtErrorEvent) : void
      {
         var _local_2:String = null;
         if(_arg_1.error is Error)
         {
            _local_2 = Error(_arg_1.error).message;
         }
         else if(_arg_1.error is ErrorEvent)
         {
            _local_2 = ErrorEvent(_arg_1.error).text;
         }
         else
         {
            _local_2 = _arg_1.error.toString();
         }
         this.logger.info(_local_2);
      }
   }
}

