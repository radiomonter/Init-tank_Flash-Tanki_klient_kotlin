package projects.tanks.clients.flash.resources.resource.loaders
{
   import alternativa.engine3d.loaders.events.LoaderEvent;
   import alternativa.engine3d.loaders.events.LoaderProgressEvent;
   import alternativa.proplib.utils.TextureByteDataMap;
   import alternativa.utils.textureutils.TextureByteData;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.utils.ByteArray;
   import projects.tanks.clients.flash.resources.resource.loaders.events.BatchTextureLoaderErrorEvent;
   
   public class BatchTextureLoader extends EventDispatcher
   {
      
      private static var redSquareClass:Class = BatchTextureLoader_redSquareClass;
      
      private static var redSquareData:ByteArray = new redSquareClass();
      
      private static const IDLE:int = 0;
      
      private static const LOADING:int = 1;
      
      private var state:int = 0;
      
      private var textureLoader:TextureLoader;
      
      private var baseURL:String;
      
      private var batch:Object;
      
      private var textureNames:Vector.<String>;
      
      private var textureIndex:int;
      
      private var numTextures:int;
      
      private var _textures:TextureByteDataMap;
      
      private var loadingOpened:Boolean;
      
      public function BatchTextureLoader(_arg_1:Object)
      {
         var _local_2:* = null;
         super();
         if(_arg_1 == null)
         {
            throw ArgumentError("Parameter batch cannot be null");
         }
         this.batch = _arg_1;
         this.textureNames = new Vector.<String>();
         for(_local_2 in _arg_1)
         {
            this.textureNames.push(_local_2);
         }
         this.numTextures = this.textureNames.length;
      }
      
      public function get textures() : TextureByteDataMap
      {
         return this._textures;
      }
      
      public function close() : void
      {
         if(this.state == LOADING)
         {
            this.textureLoader.close();
            this.cleanup();
            this._textures = null;
            this.state = IDLE;
         }
      }
      
      public function unload() : void
      {
         this._textures = null;
      }
      
      public function load(_arg_1:String) : void
      {
         if(_arg_1 == null)
         {
            throw ArgumentError("Parameter baseURL cannot be null");
         }
         this.baseURL = _arg_1;
         if(this.textureLoader == null)
         {
            this.textureLoader = new TextureLoader();
            this.textureLoader.addEventListener(Event.OPEN,this.onTextureLoadingOpen);
            this.textureLoader.addEventListener(LoaderProgressEvent.LOADER_PROGRESS,this.onProgress);
            this.textureLoader.addEventListener(Event.COMPLETE,this.onTextureLoadingComplete);
            this.textureLoader.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
            this.textureLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
         }
         else
         {
            this.close();
         }
         this._textures = new TextureByteDataMap();
         this.loadingOpened = false;
         this.state = LOADING;
         this.textureIndex = 0;
         this.loadCurrentTexture();
      }
      
      public function reload() : void
      {
         if(this.state == IDLE)
         {
            throw new Error("Wrong method invocation");
         }
         this.textureLoader.reload();
      }
      
      private function loadCurrentTexture() : void
      {
         var _local_1:TextureInfo = this.batch[this.textureNames[this.textureIndex]];
         var _local_2:String = Boolean(_local_1.opacityMapFileName) ? this.baseURL + _local_1.opacityMapFileName : null;
         this.textureLoader.load(this.baseURL + _local_1.diffuseMapFileName,_local_2);
      }
      
      private function onTextureLoadingOpen(_arg_1:Event) : void
      {
         if(!this.loadingOpened)
         {
            this.loadingOpened = true;
            if(hasEventListener(Event.OPEN))
            {
               dispatchEvent(new Event(Event.OPEN));
            }
         }
         if(hasEventListener(LoaderEvent.PART_OPEN))
         {
            dispatchEvent(new LoaderEvent(LoaderEvent.PART_OPEN,this.numTextures,this.textureIndex));
         }
      }
      
      private function onProgress(_arg_1:LoaderProgressEvent) : void
      {
         var _local_2:Number = NaN;
         if(hasEventListener(LoaderProgressEvent.LOADER_PROGRESS))
         {
            _local_2 = (this.textureIndex + _arg_1.totalProgress) / this.numTextures;
            dispatchEvent(new LoaderProgressEvent(LoaderProgressEvent.LOADER_PROGRESS,this.numTextures,this.textureIndex,_local_2,_arg_1.bytesLoaded,_arg_1.bytesTotal));
         }
      }
      
      private function onTextureLoadingComplete(_arg_1:Event) : void
      {
         this._textures.putValue(this.textureNames[this.textureIndex],new TextureByteData(this.textureLoader.diffuseData,this.textureLoader.opacityData));
         this.tryNextTexure();
      }
      
      private function onLoadingError(_arg_1:ErrorEvent) : void
      {
         var _local_2:String = this.textureNames[this.textureIndex];
         this._textures.putValue(_local_2,new TextureByteData(this.textureLoader.diffuseData || redSquareData));
         dispatchEvent(new BatchTextureLoaderErrorEvent(BatchTextureLoaderErrorEvent.LOADER_ERROR,_local_2,_arg_1.text));
         this.tryNextTexure();
      }
      
      private function tryNextTexure() : void
      {
         if(this.state == IDLE)
         {
            return;
         }
         if(hasEventListener(LoaderEvent.PART_COMPLETE))
         {
            dispatchEvent(new LoaderEvent(LoaderEvent.PART_COMPLETE,this.numTextures,this.textureIndex));
         }
         if(++this.textureIndex == this.numTextures)
         {
            this.cleanup();
            this.state = IDLE;
            if(hasEventListener(Event.COMPLETE))
            {
               dispatchEvent(new Event(Event.COMPLETE));
            }
         }
         else
         {
            this.loadCurrentTexture();
         }
      }
      
      private function cleanup() : void
      {
         this.textureNames = null;
      }
   }
}

