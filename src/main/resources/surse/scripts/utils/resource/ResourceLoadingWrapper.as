package utils.resource
{
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   
   public class ResourceLoadingWrapper implements IResourceLoadingListener
   {
      
      private var listener:IResourceLoadingComplete;
      
      public function ResourceLoadingWrapper(_arg_1:IResourceLoadingComplete)
      {
         super();
         this.listener = _arg_1;
      }
      
      public function onResourceLoadingStart(_arg_1:Resource) : void
      {
      }
      
      public function onResourceLoadingProgress(_arg_1:Resource, _arg_2:int) : void
      {
      }
      
      public function onResourceLoadingComplete(_arg_1:Resource) : void
      {
         this.listener.onLoadingComplete(_arg_1);
      }
      
      public function onResourceLoadingError(_arg_1:Resource, _arg_2:String) : void
      {
         throw new Error("Ошибка загрузки ресурса (id: " + _arg_1.id + ")");
      }
      
      public function onResourceLoadingFatalError(_arg_1:Resource, _arg_2:String) : void
      {
         throw new Error("Ошибка загрузки ресурса (id: " + _arg_1.id + ")");
      }
   }
}

