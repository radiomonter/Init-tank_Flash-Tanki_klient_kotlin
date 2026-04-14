package projects.tanks.clients.flash.resources.resource
{
   import alternativa.engine3d.objects.Mesh;
   import alternativa.proplib.PropLibrary;
   import alternativa.proplib.objects.PropObject;
   import alternativa.proplib.types.PropData;
   import alternativa.proplib.types.PropGroup;
   import alternativa.proplib.utils.ByteArrayMap;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.IResourceSerializationListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceInfo;
   import platform.client.fp10.core.resource.ResourceStatus;
   import platform.client.fp10.core.resource.SafeURLLoader;
   import platform.client.fp10.core.resource.tara.TARAParser;
   import platform.client.fp10.core.service.localstorage.IResourceLocalStorage;
   
   public class PropLibResource extends Resource
   {
      
      [Inject]
      public static var resourceLocalStorage:IResourceLocalStorage;
      
      private static const PROP_LIB_FILE_NAME:String = "library.tara";
      
      public static const TYPE:int = 8;
      
      private var loader:SafeURLLoader;
      
      public var taraData:ByteArray;
      
      public var lib:PropLibrary;
      
      public function PropLibResource(_arg_1:ResourceInfo)
      {
         super(_arg_1);
      }
      
      private static function prepareMeshes(_arg_1:PropGroup) : void
      {
         var _local_2:PropGroup = null;
         var _local_3:PropData = null;
         var _local_4:PropObject = null;
         if(_arg_1.groups != null)
         {
            for each(_local_2 in _arg_1.groups)
            {
               prepareMeshes(_local_2);
            }
         }
         if(_arg_1.props != null)
         {
            for each(_local_3 in _arg_1.props)
            {
               _local_4 = _local_3.getDefaultState().getDefaultObject();
               if(_local_4.object is Mesh)
               {
                  Mesh(_local_4.object).calculateVerticesNormalsByAngle(ResourceParams.ANGLE_THRESHOLD,0.01);
               }
            }
         }
      }
      
      override public function get description() : String
      {
         return "Props library";
      }
      
      override public function load(_arg_1:String, _arg_2:IResourceLoadingListener) : void
      {
         super.load(_arg_1,_arg_2);
         this.doLoad();
      }
      
      private function doLoad() : void
      {
         this.loader = new SafeURLLoader();
         this.loader.dataFormat = URLLoaderDataFormat.BINARY;
         this.loader.addEventListener(Event.OPEN,this.onLoadingOpen);
         this.loader.addEventListener(ProgressEvent.PROGRESS,this.onLoadingProgress);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
         this.loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
         this.loader.addEventListener(Event.COMPLETE,this.onLoadingComplete);
         this.loader.load(new URLRequest(baseUrl + PROP_LIB_FILE_NAME));
         status = ResourceStatus.REQUESTED;
         startTimeoutTracking();
      }
      
      override public function loadBytes(_arg_1:ByteArray, _arg_2:IResourceLoadingListener) : Boolean
      {
         this.listener = _arg_2;
         this.createLibrary(_arg_1);
         setTimeout(completeLoading,0);
         return true;
      }
      
      override public function close() : void
      {
         this.loader.close();
         this.destroyLoader();
      }
      
      override public function serialize(_arg_1:IResourceSerializationListener) : void
      {
         var _local_2:ByteArray = null;
         if(this.taraData != null)
         {
            _local_2 = new ByteArray();
            _local_2.writeBytes(this.taraData);
            _arg_1.onSerializationComplete(this,_local_2);
            this.taraData = null;
         }
      }
      
      override protected function doReload() : void
      {
         this.loader.close();
         this.destroyLoader();
         this.doLoad();
      }
      
      private function destroyLoader() : void
      {
         this.loader.removeEventListener(Event.OPEN,this.onLoadingOpen);
         this.loader.removeEventListener(ProgressEvent.PROGRESS,this.onLoadingProgress);
         this.loader.removeEventListener(Event.COMPLETE,this.onLoadingComplete);
         this.loader.removeEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
         this.loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
         this.loader = null;
      }
      
      private function onLoadingOpen(_arg_1:Event) : void
      {
         updateLastActivityTime();
         listener.onResourceLoadingStart(this);
      }
      
      private function onLoadingComplete(_arg_1:Event) : void
      {
         stopTimeoutTracking();
         this.taraData = this.loader.data;
         this.destroyLoader();
         this.createLibrary(this.taraData);
         completeLoading();
      }
      
      private function onLoadingProgress(_arg_1:ProgressEvent) : void
      {
         updateLastActivityTime();
      }
      
      private function onLoadingError(_arg_1:ErrorEvent) : void
      {
         stopTimeoutTracking();
         listener.onResourceLoadingFatalError(this,_arg_1.toString());
      }
      
      private function createLibrary(param1:ByteArray) : void
      {
         var data:ByteArray = param1;
         try
         {
            this.lib = new PropLibrary(new ByteArrayMap(new TARAParser(data).data));
            prepareMeshes(this.lib.rootGroup);
            return;
         }
         catch(e:Error)
         {
            throw new Error("PropLibResource: not parsed" + " id:" + id + " baseUrl:" + baseUrl + " error: " + e.getStackTrace());
         }
      }
   }
}

