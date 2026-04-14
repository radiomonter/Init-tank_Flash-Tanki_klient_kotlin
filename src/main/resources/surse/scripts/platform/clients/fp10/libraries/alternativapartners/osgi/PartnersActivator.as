package platform.clients.fp10.libraries.alternativapartners.osgi
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import platform.clients.fp10.libraries.alternativapartners.service.impl.PartnerService;
   
   public class PartnersActivator implements IBundleActivator
   {
      
      public function PartnersActivator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         var _local_2:IPartnerService = new PartnerService();
         _arg_1.registerService(IPartnerService,_local_2);
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

