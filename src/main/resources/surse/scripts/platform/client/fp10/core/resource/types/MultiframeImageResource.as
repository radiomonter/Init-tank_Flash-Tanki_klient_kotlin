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
   import platform.client.fp10.core.resource.ResourceStatus;
   import platform.client.fp10.core.resource.SafeURLLoader;
   import platform.client.fp10.core.resource.tara.TARAParser;
   import platform.client.fp10.core.service.localstorage.IResourceLocalStorage;
   import platform.core.general.resource.types.imageframe.ResourceImageFrameParams;
   
   public class MultiframeImageResource extends Resource
   {
      
      [Inject]
      public static var resourceLocalStorage:IResourceLocalStorage;
      
      private static const TARA_FILE:String = "image.tara";
      
      private static const DIFFUSE_FILE:String = "i";
      
      private static const ALPHA_FILE:String = "a";
      
      private static const CHAR_F:int = 70;
      
      private static const CHAR_R:int = 82;
      
      private static const CHAR_M:int = 77;
      
      private static const BINARY_VERSION:int = 1;
      
      private var multiframeResourceInfo:ResourceImageFrameParams;
      
      private var framesConstructor:FramesConstructor;
      
      private var loader:SafeURLLoader;
      
      private var taraData:ByteArray;
      
      private var _data:BitmapData;
      
      public function MultiframeImageResource(_arg_1:ResourceInfo, _arg_2:ResourceImageFrameParams)
      {
         super(_arg_1);
         if(_arg_2 == null)
         {
            throw new Error("Parameter multiframeResourceInfo is null");
         }
         this.multiframeResourceInfo = _arg_2;
      }
      
      public function get frameWidth() : int
      {
         return this.multiframeResourceInfo.frameWidth;
      }
      
      public function get frameHeight() : int
      {
         return this.multiframeResourceInfo.frameHeight;
      }
      
      public function get numFrames() : int
      {
         return this.multiframeResourceInfo.numFrames;
      }
      
      public function get fps() : Number
      {
         return this.multiframeResourceInfo.fps;
      }
      
      public function get data() : BitmapData
      {
         return this._data;
      }
      
      override public function toString() : String
      {
         return "[MultiframeImageResource id=" + id + "]";
      }
      
      override public function get description() : String
      {
         return "Multiframe image";
      }
      
      override public function loadBytes(_arg_1:ByteArray, _arg_2:IResourceLoadingListener) : Boolean
      {
         if(_arg_1.bytesAvailable < 4 || _arg_1.readByte() != CHAR_F || _arg_1.readByte() != CHAR_R || _arg_1.readByte() != CHAR_M || _arg_1.readByte() != BINARY_VERSION)
         {
            return false;
         }
         this.listener = _arg_2;
         var _local_3:int = _arg_1.readInt();
         var _local_4:ByteArray = new ByteArray();
         _arg_1.readBytes(_local_4,0,_local_3);
         this.buildFrames(_local_4);
         return true;
      }
      
      override public function serialize(_arg_1:IResourceSerializationListener) : void
      {
         var _local_2:ByteArray = new ByteArray();
         _local_2.writeByte(CHAR_F);
         _local_2.writeByte(CHAR_R);
         _local_2.writeByte(CHAR_M);
         _local_2.writeByte(BINARY_VERSION);
         _local_2.writeInt(this.taraData.length);
         _local_2.writeBytes(this.taraData);
         this.taraData = null;
         _arg_1.onSerializationComplete(this,_local_2);
      }
      
      override public function load(_arg_1:String, _arg_2:IResourceLoadingListener) : void
      {
         super.load(_arg_1,_arg_2);
         this.doLoad();
      }
      
      override protected function doReload() : void
      {
         this.loader.close();
         this.doLoad();
      }
      
      override protected function completeLoading() : void
      {
         super.completeLoading();
         if(hasAllFlags(ResourceFlags.LOCAL) || !resourceLocalStorage.enabled)
         {
            this.taraData = null;
         }
      }
      
      private function doLoad() : void
      {
         this.loader = new SafeURLLoader();
         this.loader.dataFormat = URLLoaderDataFormat.BINARY;
         this.loader.addEventListener(Event.OPEN,this.onLoadingOpen);
         this.loader.addEventListener(Event.COMPLETE,this.onLoadingComplete);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
         this.loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
         this.loader.addEventListener(ProgressEvent.PROGRESS,this.onLoadingProgress);
         this.loader.load(new URLRequest(baseUrl + TARA_FILE));
         startTimeoutTracking();
         status = ResourceStatus.REQUESTED;
      }
      
      private function onLoadingOpen(_arg_1:Event) : void
      {
         updateLastActivityTime();
         listener.onResourceLoadingStart(this);
      }
      
      private function onLoadingError(_arg_1:ErrorEvent) : void
      {
         this._data = new StubBitmapData(16711935,this.frameWidth,this.frameHeight);
         listener.onResourceLoadingError(this,_arg_1.text);
      }
      
      private function onLoadingProgress(_arg_1:ProgressEvent) : void
      {
         updateLastActivityTime();
      }
      
      private function onLoadingComplete(_arg_1:Event) : void
      {
         stopTimeoutTracking();
         this.taraData = this.loader.data;
         this.loader = null;
         this.buildFrames(this.taraData);
      }
      
      private function buildFrames(_arg_1:ByteArray) : void
      {
         var _local_2:TARAParser = new TARAParser(_arg_1);
         this.framesConstructor = new FramesConstructor();
         this.framesConstructor.addEventListener(Event.COMPLETE,this.onFramesComplete);
         this.framesConstructor.buildFrames(_local_2.getFileData(DIFFUSE_FILE),_local_2.getFileData(ALPHA_FILE));
      }
      
      private function onFramesComplete(_arg_1:Event) : void
      {
         this._data = this.framesConstructor.image;
         this.framesConstructor = null;
         this.completeLoading();
      }
   }
}

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.utils.ByteArray;
import platform.client.fp10.core.resource.ResourceUtils;

class FramesConstructor extends EventDispatcher
{
   
   internal var alphaData:ByteArray;
   
   internal var loader:Loader;
   
   internal var _image:BitmapData;
   
   public function FramesConstructor()
   {
      super();
   }
   
   public function get image() : BitmapData
   {
      return this._image;
   }
   
   public function buildFrames(_arg_1:ByteArray, _arg_2:ByteArray) : void
   {
      this.alphaData = _arg_2;
      this.load(_arg_1,this.onDiffuseImageComplete);
   }
   
   internal function load(_arg_1:ByteArray, _arg_2:Function) : void
   {
      this.loader = new Loader();
      this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,_arg_2);
      this.loader.loadBytes(_arg_1);
   }
   
   internal function onDiffuseImageComplete(_arg_1:Event) : void
   {
      this._image = Bitmap(this.loader.content).bitmapData;
      if(this.alphaData != null)
      {
         this.load(this.alphaData,this.onAlphaImageComplete);
      }
      else
      {
         this.complete();
      }
   }
   
   internal function onAlphaImageComplete(_arg_1:Event) : void
   {
      var _local_2:BitmapData = Bitmap(this.loader.content).bitmapData;
      this._image = ResourceUtils.mergeBitmapAlpha(this._image,_local_2,true);
      this.complete();
   }
   
   internal function complete() : void
   {
      this.loader = null;
      this.alphaData = null;
      dispatchEvent(new Event(Event.COMPLETE));
   }
}
