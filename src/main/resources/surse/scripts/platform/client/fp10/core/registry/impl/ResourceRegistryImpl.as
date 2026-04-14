package platform.client.fp10.core.registry.impl
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import alternativa.protocol.IProtocol;
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.ILockableResource;
   import platform.client.fp10.core.resource.IResourceLoader;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceLogChannel;
   import platform.client.fp10.core.resource.ResourcePriority;
   import platform.client.fp10.core.service.loadingprogress.ILoadingProgressListener;
   import platform.client.fp10.core.service.loadingprogress.ILoadingProgressService;
   
   public class ResourceRegistryImpl implements ResourceRegistry, ILoadingProgressService
   {
      
      [Inject]
      public static var resourceLoader:IResourceLoader;
      
      private var _lock:int;
      
      private var protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      private var resourceGetterCodec:ResourceGetterCodec;
      
      private var resourceById:Dictionary = new Dictionary();
      
      private var _resources:Vector.<Resource> = new Vector.<Resource>();
      
      private var packetListeners:ProgressListeners = new ProgressListeners();
      
      private var lockedResources:Vector.<ILockableResource> = new Vector.<ILockableResource>();
      
      private var logger:Logger;
      
      private var type2class:Vector.<Class> = new Vector.<Class>(512,true);
      
      public function ResourceRegistryImpl(_arg_1:OSGi)
      {
         super();
         var _local_2:LogService = LogService(_arg_1.getService(LogService));
         this.logger = _local_2.getLogger(ResourceLogChannel.NAME);
      }
      
      public function registerTypeClasses(_arg_1:int, _arg_2:Class) : void
      {
         this.type2class[_arg_1] = _arg_2;
      }
      
      public function getResourceClass(_arg_1:int) : Class
      {
         return this.type2class[_arg_1];
      }
      
      public function isRegistered(_arg_1:Long) : Boolean
      {
         return this.resourceById[_arg_1] != null;
      }
      
      public function registerResource(_arg_1:Resource) : void
      {
         this.resourceById[_arg_1.id.low] = _arg_1;
         this._resources.push(_arg_1);
      }
      
      public function unregisterResource(_arg_1:Long) : void
      {
         var _local_2:Resource = this.resourceById[_arg_1];
         if(_local_2 == null)
         {
            return;
         }
         delete this.resourceById[_arg_1.low];
         this._resources.splice(this._resources.indexOf(_local_2),1);
      }
      
      public function getResource(_arg_1:Long) : Resource
      {
         return this.resourceById[_arg_1.low];
      }
      
      public function get resources() : Vector.<Resource>
      {
         return this._resources;
      }
      
      public function loadLazyResource(_arg_1:Resource, _arg_2:IResourceLoadingListener) : void
      {
         if(!_arg_1.isLoaded)
         {
            resourceLoader.loadResource(_arg_1,_arg_2,ResourcePriority.LAZY);
         }
      }
      
      public function removeLazyListener(_arg_1:Resource, _arg_2:IResourceLoadingListener) : void
      {
         resourceLoader.removeResourceListener(_arg_1,_arg_2);
      }
      
      public function addLazyListener(_arg_1:Resource, _arg_2:IResourceLoadingListener) : void
      {
         resourceLoader.addResourceListener(_arg_1,_arg_2);
      }
      
      public function onPacketLoadingStart() : void
      {
         this.packetListeners.onLoadingStart();
      }
      
      public function onPacketLoadingStop() : void
      {
         this.packetListeners.onLoadingStop();
      }
      
      public function addPacketListener(_arg_1:ILoadingProgressListener) : void
      {
         this.packetListeners.addListener(_arg_1);
      }
      
      public function removePacketListener(_arg_1:ILoadingProgressListener) : void
      {
         this.packetListeners.removeListener(_arg_1);
      }
      
      public function isTypeClassRegistered(_arg_1:int) : Boolean
      {
         return this.type2class[_arg_1] != null;
      }
      
      public function isLocked() : Boolean
      {
         return this._lock > 0;
      }
      
      public function addLockedResource(_arg_1:ILockableResource) : void
      {
         this.lockedResources.push(_arg_1);
      }
      
      public function stopLoadingResources() : void
      {
         ++this._lock;
      }
      
      public function continueLoadingResources() : void
      {
         var _local_1:ILockableResource = null;
         --this._lock;
         if(this._lock == 0)
         {
            for each(_local_1 in this.lockedResources)
            {
               _local_1.unlockResourceLoading();
            }
            this.lockedResources.length = 0;
         }
      }
   }
}

import alternativa.protocol.ICodec;
import alternativa.protocol.IProtocol;
import alternativa.protocol.ProtocolBuffer;
import alternativa.protocol.info.TypeCodecInfo;
import alternativa.types.Long;
import platform.client.fp10.core.registry.ResourceRegistry;
import platform.client.fp10.core.resource.Resource;
import platform.client.fp10.core.service.loadingprogress.ILoadingProgressListener;

class ResourceGetterCodec implements ICodec
{
   
   internal var resourceRegistry:ResourceRegistry;
   
   internal var longCodec:ICodec;
   
   public function ResourceGetterCodec(_arg_1:ResourceRegistry)
   {
      super();
      this.resourceRegistry = _arg_1;
   }
   
   public function init(_arg_1:IProtocol) : void
   {
      this.longCodec = _arg_1.getCodec(new TypeCodecInfo(Long,false));
   }
   
   public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
   {
   }
   
   public function decode(_arg_1:ProtocolBuffer) : Object
   {
      var _local_2:Long = Long(this.longCodec.decode(_arg_1));
      var _local_3:Resource = this.resourceRegistry.getResource(_local_2);
      if(_local_3 == null)
      {
         throw new Error("Resource " + _local_2 + " not found");
      }
      return _local_3;
   }
}

class ProgressListeners
{
   
   public var listeners:Vector.<ILoadingProgressListener> = new Vector.<ILoadingProgressListener>();
   
   internal var added:Vector.<ILoadingProgressListener> = new Vector.<ILoadingProgressListener>();
   
   internal var removed:Vector.<ILoadingProgressListener> = new Vector.<ILoadingProgressListener>();
   
   internal var locked:Boolean;
   
   public function ProgressListeners()
   {
      super();
   }
   
   public function addListener(_arg_1:ILoadingProgressListener) : void
   {
      var _local_2:int = 0;
      if(this.locked)
      {
         _local_2 = int(this.removed.indexOf(_arg_1));
         if(_local_2 > -1)
         {
            this.removeByIndex(_local_2,this.removed);
         }
         else if(this.listeners.indexOf(_arg_1) < 0 && this.added.indexOf(_arg_1) < 0)
         {
            this.added.push(_arg_1);
         }
      }
      else if(this.listeners.indexOf(_arg_1) < 0)
      {
         this.listeners.push(_arg_1);
      }
   }
   
   public function removeListener(_arg_1:ILoadingProgressListener) : void
   {
      var _local_2:int = 0;
      if(this.locked)
      {
         _local_2 = int(this.added.indexOf(_arg_1));
         if(_local_2 > -1)
         {
            this.removeByIndex(_local_2,this.added);
         }
         else if(this.listeners.indexOf(_arg_1) > -1 && this.removed.indexOf(_arg_1) < 0)
         {
            this.removed.push(_arg_1);
         }
      }
      else
      {
         _local_2 = int(this.listeners.indexOf(_arg_1));
         if(_local_2 > -1)
         {
            this.removeByIndex(_local_2,this.listeners);
         }
      }
   }
   
   public function onLoadingStart() : void
   {
      var _local_1:ILoadingProgressListener = null;
      this.lock();
      for each(_local_1 in this.listeners)
      {
         _local_1.onLoadingStart();
      }
      this.unlock();
   }
   
   public function onLoadingStop() : void
   {
      var _local_1:ILoadingProgressListener = null;
      this.lock();
      for each(_local_1 in this.listeners)
      {
         _local_1.onLoadingStop();
      }
      this.unlock();
   }
   
   internal function lock() : void
   {
      this.locked = true;
   }
   
   internal function unlock() : void
   {
      var _local_1:ILoadingProgressListener = null;
      this.locked = false;
      if(this.removed.length > 0)
      {
         for each(_local_1 in this.removed)
         {
            this.removeByIndex(this.listeners.indexOf(_local_1),this.listeners);
         }
         this.removed.length = 0;
      }
      if(this.added.length > 0)
      {
         for each(_local_1 in this.added)
         {
            this.listeners.push(_local_1);
         }
         this.added.length = 0;
      }
   }
   
   internal function removeByIndex(_arg_1:int, _arg_2:Vector.<ILoadingProgressListener>) : void
   {
      var _local_3:uint = _arg_2.length;
      _arg_2[_arg_1] = _arg_2[--_local_3];
      _arg_2.length = _local_3;
   }
}
