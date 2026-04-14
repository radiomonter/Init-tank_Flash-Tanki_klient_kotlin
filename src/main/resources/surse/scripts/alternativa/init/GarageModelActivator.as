package alternativa.init
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.tanks.model.garage.Tank3DViewer;
   import alternativa.tanks.service.delaymountcategory.IDelayMountCategoryService;
   import alternativa.tanks.service.delaymountcategory.Mylafisu;
   import alternativa.tanks.service.garage.GarageService;
   import alternativa.tanks.service.garage.Ribokeny;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.item.Vihew;
   import alternativa.tanks.service.item.upgradable.speedup.Cuqen;
   import alternativa.tanks.service.item.upgradable.speedup.SpeedUpCostCalculatorService;
   import alternativa.tanks.service.item3d.ITank3DViewer;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import alternativa.tanks.service.itempropertyparams.Nijazote;
   import alternativa.tanks.service.temporaryitem.ITemporaryItemService;
   import alternativa.tanks.service.temporaryitem.Kogom;
   import alternativa.tanks.service.temporaryitemnotify.ITemporaryItemNotifyService;
   import alternativa.tanks.service.temporaryitemnotify.Revab;
   
   public class GarageModelActivator implements IBundleActivator
   {
      
      public function GarageModelActivator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         _arg_1.registerService(ItemService,new Vihew());
         _arg_1.registerService(ItemPropertyParamsService,new Nijazote());
         _arg_1.registerService(ITemporaryItemService,new Kogom());
         _arg_1.registerService(ITemporaryItemNotifyService,new Revab());
         _arg_1.registerService(SpeedUpCostCalculatorService,new Cuqen());
         _arg_1.registerService(GarageService,new Ribokeny());
         _arg_1.registerService(ITank3DViewer,new Tank3DViewer());
         _arg_1.registerService(IDelayMountCategoryService,new Mylafisu());
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

