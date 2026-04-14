package projects.tanks.clients.flash.resources.resource.loaders
{
   import alternativa.engine3d.loaders.events.LoaderEvent;
   import alternativa.engine3d.loaders.events.LoaderProgressEvent;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.SafeURLLoader;
   
   public class TextureLoader extends EventDispatcher
   {
      
      private static const IDLE:int = 0;
      
      private static const LOADING_DIFFUSE_MAP:int = 1;
      
      private static const LOADING_OPACITY_MAP:int = 2;
      
      public var diffuseData:ByteArray;
      
      public var opacityData:ByteArray;
      
      private var state:int = 0;
      
      private var urlLoader:SafeURLLoader;
      
      private var diffuseTextureUrl:String;
      
      private var opacityTextureUrl:String;
      
      public function TextureLoader()
      {
         super();
      }
      
      public function load(_arg_1:String, _arg_2:String = null) : void
      {
         this.unload();
         this.diffuseTextureUrl = _arg_1;
         this.opacityTextureUrl = _arg_2;
         this.loadPart(LOADING_DIFFUSE_MAP,_arg_1);
      }
      
      public function reload() : void
      {
         switch(this.state)
         {
            case LOADING_DIFFUSE_MAP:
               this.destroyLoader();
               this.loadPart(LOADING_DIFFUSE_MAP,this.diffuseTextureUrl);
               return;
            case LOADING_OPACITY_MAP:
               this.destroyLoader();
               this.loadPart(LOADING_OPACITY_MAP,this.opacityTextureUrl);
               return;
            default:
               throw new Error("Wrong loader state: " + this.state);
         }
      }
      
      public function close() : void
      {
         if(this.state == IDLE)
         {
            return;
         }
         this.state = IDLE;
         this.urlLoader.close();
         this.cleanup();
      }
      
      public function unload() : void
      {
         this.close();
         this.diffuseData = null;
         this.opacityData = null;
      }
      
      private function cleanup() : void
      {
         this.destroyLoader();
         this.diffuseTextureUrl = null;
         this.opacityTextureUrl = null;
      }
      
      private function loadPart(_arg_1:int, _arg_2:String) : void
      {
         this.state = _arg_1;
         this.createLoader();
         this.urlLoader.load(new URLRequest(_arg_2));
      }
      
      private function onPartLoadingOpen(_arg_1:Event) : void
      {
         if(this.diffuseData == null && hasEventListener(Event.OPEN))
         {
            dispatchEvent(new Event(Event.OPEN));
         }
         if(hasEventListener(LoaderEvent.PART_OPEN))
         {
            dispatchEvent(new LoaderEvent(LoaderEvent.PART_OPEN,2,this.state == LOADING_DIFFUSE_MAP ? int(0) : int(1)));
         }
      }
      
      private function onPartLoadingProgress(_arg_1:ProgressEvent) : void
      {
         var _local_2:int = 0;
         var _local_3:Number = NaN;
         if(hasEventListener(LoaderProgressEvent.LOADER_PROGRESS))
         {
            _local_2 = this.state == LOADING_DIFFUSE_MAP ? int(0) : int(1);
            _local_3 = 0.5 * (_local_2 + _arg_1.bytesLoaded / _arg_1.bytesTotal);
            dispatchEvent(new LoaderProgressEvent(LoaderProgressEvent.LOADER_PROGRESS,2,_local_2,_local_3,_arg_1.bytesLoaded,_arg_1.bytesTotal));
         }
      }
      
      private function onPartLoadingComplete(_arg_1:Event) : void
      {
         switch(this.state)
         {
            case LOADING_DIFFUSE_MAP:
               this.diffuseData = this.urlLoader.data;
               this.destroyLoader();
               this.dispatchPartComplete(0);
               if(Boolean(this.opacityTextureUrl))
               {
                  this.loadPart(LOADING_OPACITY_MAP,this.opacityTextureUrl);
               }
               else
               {
                  this.complete();
               }
               return;
            case LOADING_OPACITY_MAP:
               this.opacityData = this.urlLoader.data;
               this.destroyLoader();
               this.dispatchPartComplete(1);
               this.complete();
         }
      }
      
      private function dispatchPartComplete(_arg_1:int) : void
      {
         if(hasEventListener(LoaderEvent.PART_COMPLETE))
         {
            dispatchEvent(new LoaderEvent(LoaderEvent.PART_COMPLETE,2,_arg_1));
         }
      }
      
      private function onLoadingError(_arg_1:ErrorEvent) : void
      {
         this.state = IDLE;
         this.cleanup();
         dispatchEvent(_arg_1);
      }
      
      private function complete() : void
      {
         this.state = IDLE;
         this.cleanup();
         if(hasEventListener(Event.COMPLETE))
         {
            dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      private function createLoader() : void
      {
         this.urlLoader = new SafeURLLoader();
         this.urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
         this.urlLoader.addEventListener(Event.OPEN,this.onPartLoadingOpen);
         this.urlLoader.addEventListener(ProgressEvent.PROGRESS,this.onPartLoadingProgress);
         this.urlLoader.addEventListener(Event.COMPLETE,this.onPartLoadingComplete);
         this.urlLoader.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
         this.urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
      }
      
      private function destroyLoader() : void
      {
         if(this.urlLoader != null)
         {
            this.urlLoader.close();
            this.urlLoader.removeEventListener(Event.OPEN,this.onPartLoadingOpen);
            this.urlLoader.removeEventListener(ProgressEvent.PROGRESS,this.onPartLoadingProgress);
            this.urlLoader.removeEventListener(Event.COMPLETE,this.onPartLoadingComplete);
            this.urlLoader.removeEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
            this.urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
            this.urlLoader = null;
         }
      }
   }
}

