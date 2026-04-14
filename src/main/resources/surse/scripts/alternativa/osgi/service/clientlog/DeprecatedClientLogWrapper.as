package alternativa.osgi.service.clientlog
{
   import alternativa.osgi.service.logging.LogService;
   
   public class DeprecatedClientLogWrapper implements IClientLogBase
   {
      
      private var logService:LogService;
      
      public function DeprecatedClientLogWrapper(_arg_1:LogService)
      {
         super();
         this.logService = _arg_1;
      }
      
      public function log(_arg_1:String, _arg_2:String, ... _args) : void
      {
         this.logService.getLogger(_arg_1).info(_arg_2,_args);
      }
   }
}

