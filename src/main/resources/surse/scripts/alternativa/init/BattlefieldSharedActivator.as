package alternativa.init
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import flash.net.SharedObject;
   import obfuscation.gibo.Tegycolec;
   import obfuscation.tuwys.Wopatal;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class BattlefieldSharedActivator implements IBundleActivator
   {
      
      public function BattlefieldSharedActivator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         var _local_2:SharedObject = IStorageService(_arg_1.getService(IStorageService)).getStorage();
         _arg_1.registerService(Wopatal,new Tegycolec());
      }
      
      public function stop(_arg_1:OSGi) : void
      {
         _arg_1.unregisterService(Wopatal);
      }
   }
}

