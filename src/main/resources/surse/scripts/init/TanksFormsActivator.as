package init
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import services.alertservice.AlertService;
   import services.buttonbar.ButtonBarService;
   import services.buttonbar.IButtonBarService;
   import services.contextmenu.ContextMenuService;
   import services.contextmenu.IContextMenuService;
   
   public class TanksFormsActivator implements IBundleActivator
   {
      
      public function TanksFormsActivator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         _arg_1.registerService(IContextMenuService,new ContextMenuService());
         _arg_1.registerService(IButtonBarService,new ButtonBarService());
         _arg_1.registerService(IAlertService,new AlertService());
      }
      
      public function stop(_arg_1:OSGi) : void
      {
         _arg_1.unregisterService(IContextMenuService);
         _arg_1.unregisterService(IButtonBarService);
         _arg_1.unregisterService(IAlertService);
      }
   }
}

