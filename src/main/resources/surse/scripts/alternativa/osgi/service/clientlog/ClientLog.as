package alternativa.osgi.service.clientlog
{
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   
   public class ClientLog implements IClientLog
   {
      
      private var logService:LogService;
      
      public function ClientLog(_arg_1:LogService)
      {
         super();
         this.logService = _arg_1;
      }
      
      public function logInternal(_arg_1:String, _arg_2:String, _arg_3:Array = null) : void
      {
         this.getLogger(_arg_1).info(_arg_2,_arg_3);
      }
      
      public function log(_arg_1:String, _arg_2:String, ... _args) : void
      {
         this.getLogger(_arg_1).debug(_arg_2,_args);
      }
      
      public function logError(_arg_1:String, _arg_2:String, ... _args) : void
      {
         this.getLogger(_arg_1).error(_arg_2,_args);
      }
      
      private function getLogger(_arg_1:String) : Logger
      {
         return this.logService.getLogger(_arg_1);
      }
      
      public function getChannelStrings(_arg_1:String) : Vector.<String>
      {
         return null;
      }
      
      public function addLogListener(_arg_1:IClientLogChannelListener) : void
      {
      }
      
      public function removeLogListener(_arg_1:IClientLogChannelListener) : void
      {
      }
      
      public function addLogChannelListener(_arg_1:String, _arg_2:IClientLogChannelListener) : void
      {
      }
      
      public function removeLogChannelListener(_arg_1:String, _arg_2:IClientLogChannelListener) : void
      {
      }
      
      public function getChannelNames() : Vector.<String>
      {
         return null;
      }
   }
}

