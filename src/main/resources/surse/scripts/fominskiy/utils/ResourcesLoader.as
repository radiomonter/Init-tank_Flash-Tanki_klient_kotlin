package fominskiy.utils
{
   import alternativa.osgi.OSGi;
   import alternativa.types.Long;
   import platform.client.core.general.spaces.loading.dispatcher.types.ObjectsDependencies;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceInfo;
   import platform.client.fp10.core.type.impl.GameObject;
   import platform.core.general.resource.types.image.ResourceImageParams;
   import platform.core.general.resource.types.imageframe.ResourceImageFrameParams;
   
   public class ResourcesLoader
   {
      
      private var resourceRegistry:ResourceRegistry = OSGi.getInstance().getService(ResourceRegistry) as ResourceRegistry;
      
      public function ResourcesLoader()
      {
         super();
      }
      
      public function makeDependencies(_arg_1:String, _arg_2:int) : ObjectsDependencies
      {
         Model.object = new GameObject(Long.getLong(1,1),null,"ResourceObject",null);
         return new ObjectsDependencies(_arg_2,this.readResources(_arg_1));
      }
      
      private function readResources(_arg_1:String) : Vector.<Resource>
      {
         var _local_11:* = undefined;
         var _local_3:Resource = null;
         var _local_4:Boolean = false;
         var _local_5:int = 0;
         var _local_6:int = 0;
         var _local_7:Long = null;
         var _local_8:Resource = null;
         var _local_10:int = 0;
         var _local_2:Object = JSON.parse(_arg_1);
         var _local_9:Vector.<Resource> = new Vector.<Resource>();
         for each(_local_11 in _local_2.resources)
         {
            _local_3 = this.getResource(this.readResourceInfo(_local_11));
            _local_4 = !_local_3.isLazy && _local_3.status == null;
            if(_local_4)
            {
               _local_9.push(_local_3);
            }
         }
         return _local_9;
      }
      
      private function getResource(_arg_1:ResourceInfo) : Resource
      {
         var _local_4:Resource = null;
         var _local_2:Long = _arg_1.id;
         if(this.resourceRegistry.isRegistered(_local_2))
         {
            return this.resourceRegistry.getResource(_local_2);
         }
         if(!this.resourceRegistry.isTypeClassRegistered(_arg_1.type))
         {
            throw new Error("Unknown resource type");
         }
         var _local_3:Class = this.resourceRegistry.getResourceClass(_arg_1.type);
         if(_arg_1.resourceParams == null)
         {
            _local_4 = Resource(new _local_3(_arg_1));
         }
         else
         {
            _local_4 = Resource(new _local_3(_arg_1,_arg_1.resourceParams));
         }
         this.resourceRegistry.registerResource(_local_4);
         return _local_4;
      }
      
      private function readResourceInfo(_arg_1:*) : ResourceInfo
      {
         var _local_6:Object = null;
         var _local_2:Long = new Long(_arg_1.idhigh,_arg_1.idlow);
         var _local_3:int = int(_arg_1.type);
         var _local_4:Long = new Long(_arg_1.versionhigh,_arg_1.versionlow);
         var _local_5:Boolean = Boolean(_arg_1.lazy);
         if(_local_3 == 10)
         {
            _local_6 = new ResourceImageParams(_arg_1.alpha);
         }
         else if(_local_3 == 11)
         {
            _local_6 = new ResourceImageFrameParams(_arg_1.fps,_arg_1.height,_arg_1.weight,_arg_1.numFrames);
         }
         return new ResourceInfo(_local_3,_local_2,_local_4,_local_5,_local_6);
      }
   }
}

