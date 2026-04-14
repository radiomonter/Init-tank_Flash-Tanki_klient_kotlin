package projects.tanks.clients.flash.resources.resource
{
   import alternativa.proplib.PropLibRegistry;
   import alternativa.types.Long;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.IResourceSerializationListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceInfo;
   import platform.client.fp10.core.resource.ResourceStatus;
   import platform.client.fp10.core.resource.SafeURLLoader;
   
   public class MapResource extends Resource
   {
      
      [Inject]
      public static var resourceRegistry:ResourceRegistry;
      
      public static const TYPE:int = 7;
      
      private static const BINARY_HEADER:Vector.<int> = Vector.<int>([77,65,80,1]);
      
      private static const LOADING_STATE_IDLE:int = 0;
      
      private static const LOADING_STATE_INFO:int = 1;
      
      private static const LOADING_STATE_PROPLIB_INFO:int = LOADING_STATE_INFO + 1;
      
      private static const LOADING_STATE_MAP:int = LOADING_STATE_INFO + 2;
      
      private static const LIBS_FILE_NAME:String = "proplibs.xml";
      
      private static const MAP_FILE_NAME:String = "map.xml";
      
      public var libRegistry:PropLibRegistry;
      
      public var proplibsData:ByteArray;
      
      public var mapData:ByteArray;
      
      public var libIds:Vector.<Long>;
      
      private var loader:SafeURLLoader;
      
      private var loadingState:int = -1;
      
      public function MapResource(_arg_1:ResourceInfo)
      {
         super(_arg_1);
      }
      
      override public function get description() : String
      {
         return "Map";
      }
      
      override public function load(_arg_1:String, _arg_2:IResourceLoadingListener) : void
      {
         super.load(_arg_1,_arg_2);
         this.loadProplibsInfo();
      }
      
      private function loadProplibsInfo() : void
      {
         this.createUrlLoader(this.onPropLibsInfoLoadingOpen,this.onPropLibsInfoLoadingComplete);
         this.loader.load(new URLRequest(baseUrl + LIBS_FILE_NAME));
         this.loadingState = LOADING_STATE_PROPLIB_INFO;
         status = ResourceStatus.REQUESTED;
         startTimeoutTracking();
      }
      
      override public function close() : void
      {
         if(this.loadingState != LOADING_STATE_IDLE)
         {
            this.loader.close();
         }
         this.destroyLoader();
         this.proplibsData = null;
         this.mapData = null;
      }
      
      override protected function doReload() : void
      {
         switch(this.loadingState)
         {
            case LOADING_STATE_PROPLIB_INFO:
               this.loader.close();
               this.destroyLoader();
               this.loadProplibsInfo();
               return;
            case LOADING_STATE_MAP:
               this.loader.close();
               this.destroyLoader();
               this.loadMap();
         }
      }
      
      override public function loadBytes(_arg_1:ByteArray, _arg_2:IResourceLoadingListener) : Boolean
      {
         var _local_3:int = 0;
         this.listener = _arg_2;
         if(_arg_1 == null || _arg_1.length < BINARY_HEADER.length)
         {
            return false;
         }
         while(_local_3 < BINARY_HEADER.length)
         {
            if(_arg_1.readUnsignedByte() != BINARY_HEADER[_local_3])
            {
               return false;
            }
            _local_3++;
         }
         var _local_4:int = _arg_1.readInt();
         this.proplibsData = new ByteArray();
         _arg_1.readBytes(this.proplibsData,0,_local_4);
         _local_4 = _arg_1.readInt();
         this.mapData = new ByteArray();
         _arg_1.readBytes(this.mapData,0,_local_4);
         this.buildMap();
         setTimeout(completeLoading,0);
         return true;
      }
      
      override public function serialize(_arg_1:IResourceSerializationListener) : void
      {
         var _local_3:int = 0;
         var _local_2:ByteArray = new ByteArray();
         while(_local_3 < BINARY_HEADER.length)
         {
            _local_2.writeByte(BINARY_HEADER[_local_3]);
            _local_3++;
         }
         _local_2.writeInt(this.proplibsData.length);
         _local_2.writeBytes(this.proplibsData);
         _local_2.writeInt(this.mapData.length);
         _local_2.writeBytes(this.mapData);
         _arg_1.onSerializationComplete(this,_local_2);
      }
      
      private function onPropLibsInfoLoadingOpen(_arg_1:Event) : void
      {
         updateLastActivityTime();
      }
      
      private function onPropLibsInfoLoadingComplete(_arg_1:Event) : void
      {
         this.proplibsData = this.loader.data;
         this.destroyLoader();
         this.loadMap();
      }
      
      private function parsePropLibsInfo(_arg_1:XML) : void
      {
         var _local_2:XML = null;
         var _local_3:int = 0;
         var _local_4:Long = null;
         var _local_5:PropLibResource = null;
         this.libRegistry = new PropLibRegistry();
         this.libIds = new Vector.<Long>();
         for each(_local_2 in _arg_1.library)
         {
            _local_3 = int("0x" + _local_2.attribute("resource-id").toString());
            _local_4 = Long.getLong(0,_local_3);
            this.libIds.push(_local_4);
            _local_5 = PropLibResource(resourceRegistry.getResource(_local_4));
            if(_local_5 == null)
            {
               throw new Error("Prop library resource [id=" + _local_4 + "] not found");
            }
            this.libRegistry.addLibrary(_local_5.lib);
         }
      }
      
      private function loadMap() : void
      {
         this.createUrlLoader(this.onMapLoadingOpen,this.onMapLoadingComplete);
         this.loader.load(new URLRequest(baseUrl + MAP_FILE_NAME));
         this.loadingState = LOADING_STATE_MAP;
         startTimeoutTracking();
      }
      
      private function onMapLoadingOpen(_arg_1:Event) : void
      {
         updateLastActivityTime();
      }
      
      private function onMapLoadingComplete(_arg_1:Event) : void
      {
         this.mapData = this.loader.data;
         this.destroyLoader();
         this.buildMap();
         completeLoading();
      }
      
      private function buildMap() : void
      {
         try
         {
            this.parsePropLibsInfo(XML(this.proplibsData.toString()));
            return;
         }
         catch(e:Error)
         {
            listener.onResourceLoadingFatalError(this,e.message + " " + e.getStackTrace());
            return;
         }
      }
      
      private function onLoadingError(_arg_1:ErrorEvent) : void
      {
         listener.onResourceLoadingFatalError(this,_arg_1.text);
      }
      
      private function createUrlLoader(_arg_1:Function, _arg_2:Function) : void
      {
         this.loader = new SafeURLLoader();
         this.loader.dataFormat = URLLoaderDataFormat.BINARY;
         this.loader.addEventListener(Event.OPEN,_arg_1);
         this.loader.addEventListener(Event.COMPLETE,_arg_2);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
         this.loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
      }
      
      private function destroyLoader() : void
      {
         if(this.loader == null)
         {
            return;
         }
         this.loader.removeEventListener(Event.OPEN,this.onPropLibsInfoLoadingOpen);
         this.loader.removeEventListener(Event.COMPLETE,this.onPropLibsInfoLoadingComplete);
         this.loader.removeEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
         this.loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
         this.loader = null;
      }
   }
}

