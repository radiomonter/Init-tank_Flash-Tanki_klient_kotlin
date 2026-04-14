package platform.client.fp10.core.resource.types
{
   import platform.client.fp10.core.resource.ILockableResource;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceInfo;
   
   public class SWFLibraryResource extends Resource implements ILockableResource
   {
      
      public function SWFLibraryResource(_arg_1:ResourceInfo)
      {
         super(_arg_1);
      }
      
      override public function get description() : String
      {
         return "Library";
      }
      
      override public function load(_arg_1:String, _arg_2:IResourceLoadingListener) : void
      {
         super.load(_arg_1,_arg_2);
         completeLoading();
      }
      
      public function unlockResourceLoading() : void
      {
         completeLoading();
      }
   }
}

