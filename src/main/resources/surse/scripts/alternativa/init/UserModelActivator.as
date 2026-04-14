package alternativa.init
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.service.IModelService;
   import alternativa.tanks.service.IEntranceClientFacade;
   import alternativa.tanks.service.IEntranceServerFacade;
   import obfuscation.huqibunob.Gema;
   
   public class UserModelActivator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
      
      private var timeCheckerModel:Gema;
      
      private var _context:EntranceContext;
      
      public function UserModelActivator()
      {
         super();
      }
      
      public static function registerClientFacade(_arg_1:IEntranceClientFacade) : void
      {
         if(osgi.getService(IEntranceClientFacade) != null)
         {
            osgi.unregisterService(IEntranceClientFacade);
         }
         osgi.registerService(IEntranceClientFacade,_arg_1);
      }
      
      public static function registerServerFacade(_arg_1:IEntranceServerFacade) : void
      {
         if(osgi.getService(IEntranceServerFacade) != null)
         {
            osgi.unregisterService(IEntranceServerFacade);
         }
         osgi.registerService(IEntranceServerFacade,_arg_1);
      }
      
      public static function unregisterClientFacade() : void
      {
         osgi.unregisterService(IEntranceClientFacade);
      }
      
      public static function unregisterServerFacade() : void
      {
         osgi.unregisterService(IEntranceServerFacade);
      }
      
      public function start(_arg_1:OSGi) : void
      {
         UserModelActivator.osgi = _arg_1;
         this._context = new EntranceContext((_arg_1.getService(IDisplay) as IDisplay).contentUILayer);
      }
      
      public function stop(_arg_1:OSGi) : void
      {
         var _local_2:IModelService = _arg_1.getService(IModelService) as IModelService;
         UserModelActivator.osgi = null;
      }
   }
}

