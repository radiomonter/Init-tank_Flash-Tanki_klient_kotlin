package platform.client.fp10.core.resource
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import alternativa.osgi.service.network.INetworkService;
   import alternativa.utils.LoaderUtils;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.service.localstorage.IResourceLocalStorage;
   
   public class ResourceLoader implements IResourceLoader, IResourceLoadingListener, IResourceSerializationListener
   {
      
      [Inject]
      public static var localStorage:IResourceLocalStorage;
      
      [Inject]
      public static var networkSerice:INetworkService;
      
      private var logger:Logger;
      
      private var localStorageInternal:IResourceLocalStorageInternal;
      
      private var maxParallelLoadings:int = 4;
      
      private var numLoadingsInProgress:int;
      
      private var resourceQueue:PriorityQueue;
      
      private var resourceEntries:Dictionary;
      
      public function ResourceLoader(_arg_1:OSGi)
      {
         super();
         var _local_2:LogService = LogService(_arg_1.getService(LogService));
         this.logger = _local_2.getLogger(ResourceLogChannel.NAME);
         this.resourceQueue = new PriorityQueue();
         this.resourceEntries = new Dictionary();
         this.localStorageInternal = IResourceLocalStorageInternal(_arg_1.getService(IResourceLocalStorageInternal));
      }
      
      public function loadResource(_arg_1:Resource, _arg_2:IResourceLoadingListener, _arg_3:int) : void
      {
         this.addResourceListener(_arg_1,_arg_2);
         if(!_arg_1.isLoading)
         {
            _arg_1.setFlags(ResourceFlags.IS_LOADING);
            _arg_1.status = ResourceStatus.QUEUED;
            this.resourceQueue.putData(_arg_1,_arg_3);
            this.loadResources();
         }
      }
      
      public function removeResourceListener(_arg_1:Resource, _arg_2:IResourceLoadingListener) : void
      {
         var _local_3:ResourceEntry = this.resourceEntries[_arg_1];
         if(_local_3 != null)
         {
            _local_3.removeListener(_arg_2);
         }
      }
      
      public function addResourceListener(_arg_1:Resource, _arg_2:IResourceLoadingListener) : void
      {
         var _local_3:ResourceEntry = this.resourceEntries[_arg_1];
         if(_local_3 == null)
         {
            _local_3 = new ResourceEntry(_arg_1,_arg_2);
            this.resourceEntries[_arg_1] = _local_3;
         }
         else
         {
            _local_3.addListener(_arg_2);
         }
      }
      
      public function onResourceLoadingStart(_arg_1:Resource) : void
      {
         var _local_2:IResourceLoadingListener = null;
         var _local_3:ResourceEntry = this.resourceEntries[_arg_1];
         _local_3.loadingStarted = true;
         for each(_local_2 in _local_3.listeners)
         {
            _local_2.onResourceLoadingStart(_arg_1);
         }
      }
      
      public function onResourceLoadingComplete(param1:Resource) : void
      {
         var listener:IResourceLoadingListener = null;
         var resource:Resource = param1;
         var entry:ResourceEntry = this.processLoadedResource(resource);
         if(entry != null)
         {
            for each(listener in entry.listeners)
            {
               try
               {
                  listener.onResourceLoadingComplete(resource);
               }
               catch(e:Error)
               {
                  logger.error("ResourceLoader::onResourceLoadingComplete() loadingComplete listener invocation error: %1",[e.getStackTrace()]);
               }
            }
         }
         this.loadResources();
      }
      
      public function onResourceLoadingError(param1:Resource, param2:String) : void
      {
         var entry:ResourceEntry;
         var resource:Resource = null;
         var listener:IResourceLoadingListener = null;
         resource = param1;
         var errorDescription:String = param2;
         resource.setFlags(ResourceFlags.DUMMY_DATA);
         entry = this.processLoadedResource(resource);
         try
         {
            for each(listener in entry.listeners)
            {
               listener.onResourceLoadingError(resource,errorDescription);
            }
         }
         catch(e:Error)
         {
            logger.error("ResourceLoader::onResourceLoadingError() %1 %2",[e.getStackTrace(),resource.id]);
         }
         this.loadResources();
      }
      
      public function onResourceLoadingFatalError(_arg_1:Resource, _arg_2:String) : void
      {
         var _local_3:IResourceLoadingListener = null;
         var _local_4:ResourceEntry = this.removeResourceFromLoading(_arg_1);
         this.loadResources();
         for each(_local_3 in _local_4.listeners)
         {
            _local_3.onResourceLoadingFatalError(_arg_1,_arg_2);
         }
      }
      
      public function onSerializationComplete(_arg_1:Resource, _arg_2:ByteArray) : void
      {
         this.localStorageInternal.setResourceData(_arg_1.id,_arg_1.version.low,_arg_2,_arg_1.description,_arg_1.classifier);
      }
      
      private function loadResources() : void
      {
         var _local_1:Resource = null;
         while(this.resourceQueue.size > 0 && this.numLoadingsInProgress < this.maxParallelLoadings)
         {
            _local_1 = Resource(this.resourceQueue.getData());
            ++this.numLoadingsInProgress;
            if(_local_1.isLoaded)
            {
               this.onResourceLoadingComplete(_local_1);
            }
            else if(localStorage != null && localStorage.enabled)
            {
               this.loadResourceFromLocalStorage(_local_1);
            }
            else
            {
               this.loadResourceFromNetwork(_local_1);
            }
         }
      }
      
      private function loadResourceFromLocalStorage(_arg_1:Resource) : void
      {
         var _local_2:ByteArray = this.localStorageInternal.getResourceData(_arg_1.id,_arg_1.version.low,_arg_1.classifier);
         _arg_1.setFlags(ResourceFlags.LOCAL);
         if(_local_2 == null || !_arg_1.loadBytes(_local_2,this))
         {
            this.loadResourceFromNetwork(_arg_1);
         }
      }
      
      private function loadResourceFromNetwork(_arg_1:Resource) : void
      {
         _arg_1.clearFlags(ResourceFlags.LOCAL);
         var _local_2:String = this.getResourceUrl(_arg_1);
         _arg_1.load(_local_2,this);
      }
      
      protected function getResourceUrl(_arg_1:Resource) : String
      {
         return networkSerice.resourcesRootUrl + LoaderUtils.getResourcePath(_arg_1.id.toByteArray(),_arg_1.version.toByteArray());
      }
      
      private function processLoadedResource(_arg_1:Resource) : ResourceEntry
      {
         _arg_1.status = ResourceStatus.LOADED;
         var _local_2:ResourceEntry = this.removeResourceFromLoading(_arg_1);
         if(!_arg_1.hasAnyFlags(ResourceFlags.LOCAL | ResourceFlags.DUMMY_DATA))
         {
            this.storeResourceLocally(_arg_1);
         }
         return _local_2;
      }
      
      private function storeResourceLocally(_arg_1:Resource) : void
      {
         if(localStorage != null && localStorage.enabled)
         {
            _arg_1.serialize(this);
         }
      }
      
      private function removeResourceFromLoading(_arg_1:Resource) : ResourceEntry
      {
         _arg_1.clearFlags(ResourceFlags.IS_LOADING);
         --this.numLoadingsInProgress;
         var _local_2:ResourceEntry = this.resourceEntries[_arg_1];
         delete this.resourceEntries[_arg_1];
         return _local_2;
      }
   }
}

class ResourceEntry
{
   
   public var resource:Resource;
   
   public var listeners:Vector.<IResourceLoadingListener>;
   
   public var loadingStarted:Boolean;
   
   public function ResourceEntry(_arg_1:Resource, _arg_2:IResourceLoadingListener)
   {
      super();
      this.resource = _arg_1;
      this.listeners = new Vector.<IResourceLoadingListener>(1);
      this.listeners[0] = _arg_2;
   }
   
   public function addListener(_arg_1:IResourceLoadingListener) : void
   {
      if(this.listeners.indexOf(_arg_1) < 0)
      {
         this.listeners.push(_arg_1);
         if(this.loadingStarted)
         {
            _arg_1.onResourceLoadingStart(this.resource);
         }
      }
   }
   
   public function removeListener(_arg_1:IResourceLoadingListener) : void
   {
      var _local_2:int = int(this.listeners.indexOf(_arg_1));
      if(_local_2 >= 0)
      {
         this.listeners.splice(_local_2,1);
      }
   }
}

class QueueItem
{
   
   public var data:Object;
   
   public var priority:int;
   
   public var next:QueueItem;
   
   public var prev:QueueItem;
   
   public function QueueItem(_arg_1:Object, _arg_2:int)
   {
      super();
      this.data = _arg_1;
      this.priority = _arg_2;
   }
}

class PriorityQueue
{
   
   internal var head:QueueItem;
   
   internal var tail:QueueItem;
   
   internal var _size:int;
   
   public function PriorityQueue()
   {
      super();
      this.head = new QueueItem(null,0);
      this.tail = new QueueItem(null,0);
      this.head.next = this.tail;
      this.tail.prev = this.head;
   }
   
   public function get size() : int
   {
      return this._size;
   }
   
   public function putData(_arg_1:Object, _arg_2:int) : void
   {
      var _local_3:QueueItem = this.tail.prev;
      while(_local_3 != this.head && _local_3.priority < _arg_2)
      {
         _local_3 = _local_3.prev;
      }
      var _local_4:QueueItem = new QueueItem(_arg_1,_arg_2);
      _local_4.next = _local_3.next;
      _local_4.prev = _local_3;
      _local_4.next.prev = _local_4;
      _local_3.next = _local_4;
      ++this._size;
   }
   
   public function getData() : Object
   {
      if(this._size == 0)
      {
         return null;
      }
      var _local_1:QueueItem = this.head.next;
      _local_1.next.prev = _local_1.prev;
      _local_1.prev.next = _local_1.next;
      _local_1.next = null;
      _local_1.prev = null;
      --this._size;
      return _local_1.data;
   }
}
