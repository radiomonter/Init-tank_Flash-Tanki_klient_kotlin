package utils.preview
{
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class ImageResourceLoadingWrapper implements IResourceLoadingListener
   {
      
      private var previewModel:IImageResource;
      
      public function ImageResourceLoadingWrapper(_arg_1:IImageResource)
      {
         super();
         this.previewModel = _arg_1;
      }
      
      public function onResourceLoadingStart(_arg_1:Resource) : void
      {
      }
      
      public function onResourceLoadingProgress(_arg_1:Resource, _arg_2:int) : void
      {
      }
      
      public function onResourceLoadingComplete(_arg_1:Resource) : void
      {
         this.previewModel.setPreviewResource(ImageResource(_arg_1));
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

