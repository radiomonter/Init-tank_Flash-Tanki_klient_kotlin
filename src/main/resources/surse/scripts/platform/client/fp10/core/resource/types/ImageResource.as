package platform.client.fp10.core.resource.types
{
   import flash.display.BitmapData;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.IResourceSerializationListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceFlags;
   import platform.client.fp10.core.resource.ResourceInfo;
   import platform.client.fp10.core.resource.SafeURLLoader;
   import platform.client.fp10.core.service.localstorage.IResourceLocalStorage;
   import platform.core.general.resource.types.image.ResourceImageParams;
   
   public class ImageResource extends Resource
   {
      
      [Inject]
      public static var resourceLocalStorage:IResourceLocalStorage;
      
      private static const DIFFUSE_MAP_FILE:String = "image.jpg";
      
      private static const ALPHA_MAP_FILE:String = "alpha.jpg";
      
      private static const STATE_LOADING_DIFFUSE:int = 0;
      
      private static const STATE_LOADING_ALPHA:int = 1;
      
      private static const CHAR_I:int = 73;
      
      private static const CHAR_M:int = 77;
      
      private static const CHAR_G:int = 71;
      
      private static const BINARY_VERSION:int = 1;
      
      private var imageResourceInfo:ResourceImageParams;
      
      private var state:int;
      
      private var lastFileSize:int;
      
      private var loader:SafeURLLoader;
      
      private var byteData:ImageByteData;
      
      private var imageBuilder:ImageBuilder;
      
      private var _data:BitmapData;
      
      public function ImageResource(_arg_1:ResourceInfo, _arg_2:ResourceImageParams)
      {
         super(_arg_1);
         if(_arg_2 == null)
         {
            throw new ArgumentError("Parameter imageResourceInfo is null");
         }
         this.imageResourceInfo = _arg_2;
      }
      
      public function get data() : BitmapData
      {
         return this._data;
      }
      
      override public function get description() : String
      {
         return "Image";
      }
      
      override public function loadBytes(_arg_1:ByteArray, _arg_2:IResourceLoadingListener) : Boolean
      {
         if(_arg_1.bytesAvailable < 4 || _arg_1.readByte() != CHAR_I || _arg_1.readByte() != CHAR_M || _arg_1.readByte() != CHAR_G || _arg_1.readByte() != BINARY_VERSION)
         {
            return false;
         }
         this.listener = _arg_2;
         var _local_3:ImageByteData = new ImageByteData();
         var _local_4:int = _arg_1.readInt();
         _local_3.diffuseData = new ByteArray();
         _arg_1.readBytes(_local_3.diffuseData,0,_local_4);
         var _local_5:int = _arg_1.readInt();
         if(_local_5 > 0)
         {
            _local_3.opacityData = new ByteArray();
            _arg_1.readBytes(_local_3.opacityData,0,_local_5);
         }
         this.imageBuilder = new ImageBuilder();
         this.imageBuilder.build(_local_3,this.onImageComplete);
         return true;
      }
      
      override public function serialize(_arg_1:IResourceSerializationListener) : void
      {
         var _local_2:ByteArray = new ByteArray();
         _local_2.writeByte(CHAR_I);
         _local_2.writeByte(CHAR_M);
         _local_2.writeByte(CHAR_G);
         _local_2.writeByte(BINARY_VERSION);
         _local_2.writeInt(this.byteData.diffuseData.length);
         _local_2.writeBytes(this.byteData.diffuseData);
         if(this.byteData.opacityData != null)
         {
            _local_2.writeInt(this.byteData.opacityData.length);
            _local_2.writeBytes(this.byteData.opacityData);
         }
         else
         {
            _local_2.writeInt(0);
         }
         this.byteData = null;
         _arg_1.onSerializationComplete(this,_local_2);
      }
      
      override public function load(_arg_1:String, _arg_2:IResourceLoadingListener) : void
      {
         super.load(_arg_1,_arg_2);
         this.loadDiffuseData();
      }
      
      override protected function doReload() : void
      {
         this.loader.close();
         switch(this.state)
         {
            case STATE_LOADING_DIFFUSE:
               this.loadDiffuseData();
               return;
            case STATE_LOADING_ALPHA:
               this.loadOpacityData();
         }
      }
      
      override protected function createDummyData() : Boolean
      {
         this._data = new StubBitmapData(16711680);
         return true;
      }
      
      private function onLoadingComplete(_arg_1:Event) : void
      {
         stopTimeoutTracking();
         switch(this.state)
         {
            case STATE_LOADING_DIFFUSE:
               this.processDiffuseData(this.loader.data);
               return;
            case STATE_LOADING_ALPHA:
               this.processAlphaData(this.loader.data);
         }
      }
      
      private function loadDiffuseData() : void
      {
         this.state = STATE_LOADING_DIFFUSE;
         this.loader = this.createLoader(true);
         this.loader.load(new URLRequest(baseUrl + DIFFUSE_MAP_FILE));
         startTimeoutTracking();
         status = "Diffuse map requested";
      }
      
      private function loadOpacityData() : void
      {
         this.state = STATE_LOADING_ALPHA;
         this.loader = this.createLoader(false);
         this.loader.load(new URLRequest(baseUrl + ALPHA_MAP_FILE));
         status = "Opacity map requested";
         startTimeoutTracking();
      }
      
      private function processDiffuseData(_arg_1:ByteArray) : void
      {
         this.byteData = new ImageByteData();
         this.byteData.diffuseData = _arg_1;
         if(this.imageResourceInfo.alpha)
         {
            this.loadOpacityData();
         }
         else
         {
            this.completeRemoteLoading();
         }
      }
      
      private function processAlphaData(_arg_1:ByteArray) : void
      {
         this.byteData.opacityData = _arg_1;
         this.completeRemoteLoading();
      }
      
      private function completeRemoteLoading() : void
      {
         this.loader = null;
         this.imageBuilder = new ImageBuilder();
         this.imageBuilder.build(this.byteData,this.onImageComplete);
      }
      
      private function onImageComplete(_arg_1:ImageBuilder) : void
      {
         this._data = _arg_1.image;
         if(hasAllFlags(ResourceFlags.LOCAL) || !resourceLocalStorage.enabled)
         {
            this.byteData = null;
         }
         this.completeLoading();
      }
      
      override protected function completeLoading() : void
      {
         super.completeLoading();
         this.imageBuilder = null;
         baseUrl = null;
      }
      
      private function onLoadingOpen(_arg_1:Event) : void
      {
         updateLastActivityTime();
         listener.onResourceLoadingStart(this);
      }
      
      private function onLoadingError(_arg_1:ErrorEvent) : void
      {
         stopTimeoutTracking();
         if(this.state == STATE_LOADING_DIFFUSE)
         {
            this._data = new StubBitmapData(16711680);
         }
         setFlags(ResourceFlags.LOADED);
         baseUrl = null;
         this.byteData = null;
         listener.onResourceLoadingError(this,_arg_1.toString());
      }
      
      private function onLoadingProgress(_arg_1:ProgressEvent) : void
      {
         updateLastActivityTime();
      }
      
      private function createLoader(_arg_1:Boolean) : SafeURLLoader
      {
         var _local_2:SafeURLLoader = new SafeURLLoader();
         _local_2.dataFormat = URLLoaderDataFormat.BINARY;
         if(_arg_1)
         {
            _local_2.addEventListener(Event.OPEN,this.onLoadingOpen);
         }
         _local_2.addEventListener(ProgressEvent.PROGRESS,this.onLoadingProgress);
         _local_2.addEventListener(Event.COMPLETE,this.onLoadingComplete);
         _local_2.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
         _local_2.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
         return _local_2;
      }
   }
}

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.utils.ByteArray;
import platform.client.fp10.core.resource.ResourceUtils;

class ImageByteData
{
   
   public var diffuseData:ByteArray;
   
   public var opacityData:ByteArray;
   
   public function ImageByteData()
   {
      super();
   }
}

class ImageBuilder
{
   
   public var image:BitmapData;
   
   internal var byteData:ImageByteData;
   
   internal var callback:Function;
   
   internal var loader:Loader;
   
   public function ImageBuilder()
   {
      super();
   }
   
   public function build(_arg_1:ImageByteData, _arg_2:Function) : void
   {
      this.byteData = _arg_1;
      this.callback = _arg_2;
      this.load(_arg_1.diffuseData,this.onDiffuseComplete);
   }
   
   internal function onDiffuseComplete(_arg_1:Event) : void
   {
      this.image = Bitmap(this.loader.content).bitmapData;
      if(this.byteData.opacityData != null)
      {
         this.load(this.byteData.opacityData,this.onOpacityComplete);
      }
      else
      {
         this.complete();
      }
   }
   
   internal function onOpacityComplete(_arg_1:Event) : void
   {
      var _local_2:BitmapData = Bitmap(this.loader.content).bitmapData;
      this.image = ResourceUtils.mergeBitmapAlpha(this.image,_local_2,true);
      this.complete();
   }
   
   internal function load(_arg_1:ByteArray, _arg_2:Function) : void
   {
      this.loader = new Loader();
      this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,_arg_2);
      this.loader.loadBytes(_arg_1);
   }
   
   internal function complete() : void
   {
      this.loader = null;
      this.callback.call(null,this);
   }
}
