package alternativa.init
{
   import alternativa.model.IModel;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.engine3d.Cutal;
   import alternativa.tanks.engine3d.Cyqav;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.Gutebyh;
   import alternativa.tanks.engine3d.Kyraraquj;
   import alternativa.tanks.engine3d.Poco;
   import alternativa.tanks.engine3d.Qelen;
   import alternativa.tanks.engine3d.Risi;
   import alternativa.tanks.models.battle.battlefield.BattleLoadEvent;
   import alternativa.tanks.models.battle.battlefield.BattlefieldModel;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.services.battlereadiness.BattleReadinessService;
   import alternativa.tanks.services.battlereadiness.Lenadet;
   import alternativa.tanks.services.colortransform.ColorTransformService;
   import alternativa.tanks.services.initialeffects.IInitialEffectsService;
   import alternativa.tanks.services.initialeffects.Vudopybyc;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.tanks.services.lightingeffects.Quhusan;
   import alternativa.tanks.services.mipmapping.MipMappingService;
   import alternativa.tanks.services.spectatorservice.Hyhyjac;
   import alternativa.tanks.services.spectatorservice.SpectatorService;
   import alternativa.tanks.services.tankregistry.Cosocyton;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import alternativa.tanks.utils.DataValidator;
   import alternativa.tanks.utils.DataValidatorImpl;
   import alternativa.utils.TextureMaterialRegistry;
   import obfuscation.kek.Nanuj;
   import obfuscation.likohot.Niqyvu;
   import obfuscation.likohot.Pahu;
   import obfuscation.lin.Gacisucy;
   import obfuscation.lin.Zyhogy;
   import obfuscation.tuvawebag.Duwolata;
   import obfuscation.tuvawebag.Vusywer;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class BattlefieldModelActivator implements IBundleActivator
   {
      
      public var models:Vector.<IModel> = new Vector.<IModel>();
      
      public var bm:BattlefieldModel;
      
      private var osgi:OSGi;
      
      public function BattlefieldModelActivator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         this.osgi = _arg_1;
         var _local_2:IModelService = _arg_1.getService(IModelService) as IModelService;
         this.bm = new BattlefieldModel();
         _arg_1.registerService(IInitialEffectsService,new Vudopybyc());
         new TankModel();
         _arg_1.registerService(ILightingEffectsService,new Quhusan());
         _arg_1.registerService(Pahu,new Niqyvu());
         _arg_1.registerService(TankUsersRegistry,new Cosocyton());
         _arg_1.registerService(BattleReadinessService,new Lenadet());
         _arg_1.registerService(SpectatorService,new Hyhyjac());
         _arg_1.registerService(Zyhogy,new Gacisucy());
         this.registerMipMappingService();
         this.registerColorTransformService();
         this.registerColorCorrectedTextureService();
         this.registerEffectsMaterialService();
         this.registerTextureMaterialService();
         _arg_1.registerService(DataValidator,new DataValidatorImpl(_arg_1));
      }
      
      private function registerMipMappingService() : void
      {
         this.osgi.registerService(MipMappingService,new Nanuj());
      }
      
      private function registerColorTransformService() : void
      {
         if(!GPUCapabilities.gpuEnabled || GPUCapabilities.constrained)
         {
            this.osgi.registerService(ColorTransformService,new Duwolata());
         }
         else
         {
            this.osgi.registerService(ColorTransformService,new Vusywer());
         }
      }
      
      private function registerColorCorrectedTextureService() : void
      {
         var _local_1:Poco = new Qelen();
         this.osgi.registerService(Poco,_local_1);
         this.registerBattleEventListener(BattleLoadEvent,new Risi(_local_1));
         var _local_2:ColorTransformService = ColorTransformService(this.osgi.getService(ColorTransformService));
         _local_2.zawora(_local_1);
      }
      
      private function registerEffectsMaterialService() : void
      {
         var _local_1:Cutal = new Cutal();
         this.osgi.registerService(EffectsMaterialRegistry,_local_1);
         this.enableMipMappingControl(_local_1);
         this.registerBattleEventListener(BattleLoadEvent,new Cyqav(_local_1));
      }
      
      private function registerTextureMaterialService() : void
      {
         var _local_1:Poco = Poco(this.osgi.getService(Poco));
         var _local_2:Kyraraquj = new Kyraraquj(new Gutebyh(),_local_1);
         this.osgi.registerService(TextureMaterialRegistry,_local_2);
         this.enableMipMappingControl(_local_2);
         this.registerBattleEventListener(BattleLoadEvent,new Cyqav(_local_2));
      }
      
      private function registerBattleEventListener(_arg_1:Class, _arg_2:BattleEventListener) : void
      {
         var _local_3:BattleEventDispatcher = BattleEventDispatcher(this.osgi.getService(BattleEventDispatcher));
         _local_3.pugu(_arg_1,_arg_2);
      }
      
      private function enableMipMappingControl(_arg_1:TextureMaterialRegistry) : void
      {
         var _local_2:MipMappingService = MipMappingService(this.osgi.getService(MipMappingService));
         _local_2.taronyvyn(_arg_1);
      }
      
      public function stop(_arg_1:OSGi) : void
      {
         var _local_3:IModel = null;
         var _local_2:IModelService = _arg_1.getService(IModelService) as IModelService;
         while(this.models.length > 0)
         {
            _local_3 = this.models.pop();
            _local_2.remove(_local_3.id);
         }
      }
      
      private function addModel(_arg_1:IModelService, _arg_2:IModel) : void
      {
         _arg_1.add(_arg_2);
         this.models.push(_arg_2);
      }
   }
}

