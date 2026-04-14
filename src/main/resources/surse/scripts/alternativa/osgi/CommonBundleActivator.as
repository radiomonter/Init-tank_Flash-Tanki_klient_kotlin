package alternativa.osgi
{
   import alternativa.model.IModel;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.service.IModelService;
   
   public class CommonBundleActivator implements IBundleActivator
   {
      
      protected var models:Vector.<IModel> = new Vector.<IModel>();
      
      public function CommonBundleActivator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
      }
      
      public function stop(_arg_1:OSGi) : void
      {
         var _local_3:IModel = null;
         var _local_4:IBundleListener = null;
         var _local_2:IModelService = IModelService(_arg_1.getService(IModelService));
         while(true)
         {
            _local_3 = this.models.pop();
            if(_local_3 == null)
            {
               break;
            }
            _local_4 = _local_3 as IBundleListener;
            if(_local_4 != null)
            {
               _local_4.bundleStop();
            }
            _local_2.remove(_local_3.id);
         }
      }
      
      protected function registerModel(_arg_1:IModel, _arg_2:OSGi) : void
      {
         var _local_3:IModelService = IModelService(_arg_2.getService(IModelService));
         _local_3.add(_arg_1);
         this.models.push(_arg_1);
         var _local_4:IBundleListener = _arg_1 as IBundleListener;
         if(_local_4 != null)
         {
            _local_4.bundleStart();
         }
      }
   }
}

