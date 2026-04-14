package platform.clients.fp10.models.alternativaspacesmodelsflash
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.logging.LogService;
   import platform.client.core.general.spaces.loading.dispatcher.IDispatcherModelBase;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.loading.DispatcherModel;
   import platform.loading.codecs.ModelDataCodec;
   
   public class Activator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var modelRegister:ModelRegistry;
         var _osgi:OSGi = param1;
         osgi = _osgi;
         osgi.injectService(IClientLog,function(_arg_1:Object):void
         {
            ModelDataCodec.clientLog = IClientLog(_arg_1);
         },function():IClientLog
         {
            return ModelDataCodec.clientLog;
         });
         osgi.injectService(ModelRegistry,function(_arg_1:Object):void
         {
            ModelDataCodec.modelRegister = ModelRegistry(_arg_1);
         },function():ModelRegistry
         {
            return ModelDataCodec.modelRegister;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            DispatcherModel.logService = LogService(_arg_1);
         },function():LogService
         {
            return DispatcherModel.logService;
         });
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new DispatcherModel(),Vector.<Class>([IDispatcherModelBase]));
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

