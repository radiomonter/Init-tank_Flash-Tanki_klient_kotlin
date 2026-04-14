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
   
   public class Resource3DS extends Resource
   {
      
      [Inject]
      public static var resourceLocalStorage:IResourceLocalStorage;
      
      private static const TARA_FILE:String = "3ds.tara";
      
      private static const IMAGES_FILE:String = "images.xml";
      
      private static const MODEL_FILE:String = "object.3ds";
      
      private static const CHAR_3:int = 51;
      
      private static const CHAR_D:int = 68;
      
      private static const CHAR_S:int = 83;
      
      private static const BINARY_VERSION:int = 1;
      
      private var loader:SafeURLLoader;
      
      private var _data:ByteArray;
      
      private var _textureData:Object;
      
      private var textureFileNames:Vector.<String>;
      
      private var batchTextureConstructor:BatchTextureConstructor;
      
      private var taraData:ByteArray;
      
      public function Resource3DS(_arg_1:ResourceInfo)
      {
         super(_arg_1);
      }
      
      public function get data() : ByteArray
      {
         return this._data;
      }
      
      public function getTextureFileNames() : Vector.<String>
      {
         var _local_1:* = null;
         var _local_2:Vector.<String> = new Vector.<String>();
         for(_local_1 in this._textureData)
         {
            _local_2.push(_local_1);
         }
         return _local_2;
      }
      
      public function getTexture(_arg_1:String) : BitmapData
      {
         return this._textureData[_arg_1];
      }
      
      override public function toString() : String
      {
         return "[Resource3DS id=" + id + "]";
      }
      
      override public function get description() : String
      {
         return "3DS";
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
         this.textureFileNames = null;
         this.batchTextureConstructor = null;
         if(hasAllFlags(ResourceFlags.LOCAL) || !resourceLocalStorage.enabled)
         {
            this.taraData = null;
         }
      }
      
      override public function loadBytes(param1:ByteArray, param2:IResourceLoadingListener) : Boolean
      {
         var data:ByteArray = null;
         var dataSize:int = 0;
         var bytes:ByteArray = param1;
         var listener:IResourceLoadingListener = param2;
         if(bytes.bytesAvailable < 4 || bytes.readByte() != CHAR_3 || bytes.readByte() != CHAR_D || bytes.readByte() != CHAR_S || bytes.readByte() != BINARY_VERSION)
         {
            return false;
         }
         if(listener == null)
         {
            throw new ArgumentError("Parameter listener is null");
         }
         this.listener = listener;
         try
         {
            data = new ByteArray();
            dataSize = bytes.readInt();
            bytes.readBytes(data,0,dataSize);
            this.buildResource(data);
         }
         catch(e:Error)
         {
            return false;
         }
         return true;
      }
      
      override public function serialize(_arg_1:IResourceSerializationListener) : void
      {
         var _local_2:ByteArray = new ByteArray();
         _local_2.writeByte(CHAR_3);
         _local_2.writeByte(CHAR_D);
         _local_2.writeByte(CHAR_S);
         _local_2.writeByte(BINARY_VERSION);
         _local_2.writeInt(this.taraData.length);
         _local_2.writeBytes(this.taraData);
         this.taraData = null;
         _arg_1.onSerializationComplete(this,_local_2);
      }
      
      private function doLoad() : void
      {
         this.loader = new SafeURLLoader();
         this.loader.dataFormat = URLLoaderDataFormat.BINARY;
         this.loader.addEventListener(Event.OPEN,this.onTaraLoadingOpen);
         this.loader.addEventListener(ProgressEvent.PROGRESS,this.onProgress);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.onFatalError);
         this.loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onFatalError);
         this.loader.addEventListener(Event.COMPLETE,this.onTaraLoadingComplete);
         this.loader.load(new URLRequest(baseUrl + TARA_FILE));
         startTimeoutTracking();
         status = ResourceStatus.REQUESTED;
      }
      
      private function onTaraLoadingOpen(_arg_1:Event) : void
      {
         updateLastActivityTime();
         listener.onResourceLoadingStart(this);
      }
      
      private function onProgress(_arg_1:ProgressEvent) : void
      {
         updateLastActivityTime();
      }
      
      private function onFatalError(_arg_1:ErrorEvent) : void
      {
         stopTimeoutTracking();
         this.loader = null;
         listener.onResourceLoadingFatalError(this,_arg_1.text);
      }
      
      private function onTaraLoadingComplete(_arg_1:Event) : void
      {
         stopTimeoutTracking();
         this.taraData = this.loader.data;
         this.loader = null;
         this.buildResource(this.taraData);
      }
      
      private function buildResource(_arg_1:ByteArray) : void
      {
         this.parseData(_arg_1);
         this.createBitmaps();
      }
      
      private function parseData(_arg_1:ByteArray) : void
      {
         var _local_2:TARAParser = new TARAParser(_arg_1);
         this._data = _local_2.getFileData(MODEL_FILE);
         this.processImages(_local_2);
      }
      
      private function processImages(_arg_1:TARAParser) : void
      {
         var _local_2:XML = null;
         var _local_3:String = null;
         var _local_4:String = null;
         var _local_5:String = null;
         var _local_6:Object = null;
         var _local_7:XML = XML(_arg_1.getFileData(IMAGES_FILE));
         this._textureData = {};
         if(_local_7.image.length() > 0)
         {
            for each(_local_2 in _local_7.image)
            {
               _local_3 = _local_2.@name;
               _local_4 = _local_2.attribute("new-name");
               _local_5 = _local_2.@alpha;
               _local_6 = {};
               _local_6.diffuseMap = _arg_1.getFileData(_local_4);
               _local_6.opacityMap = _arg_1.getFileData(_local_5);
               this._textureData[_local_3] = _local_6;
            }
         }
      }
      
      private function createBitmaps() : void
      {
         var _local_1:Vector.<TextureByteData> = null;
         var _local_2:String = null;
         var _local_3:Object = null;
         this.textureFileNames = this.getTextureFileNames();
         if(this.textureFileNames.length > 0)
         {
            _local_1 = new Vector.<TextureByteData>();
            for each(_local_2 in this.textureFileNames)
            {
               _local_3 = this._textureData[_local_2];
               _local_1.push(new TextureByteData(_local_3.diffuseMap,_local_3.opacityMap));
            }
            this.batchTextureConstructor = new BatchTextureConstructor();
            this.batchTextureConstructor.addEventListener(Event.COMPLETE,this.onTexturesReady);
            this.batchTextureConstructor.createTextures(_local_1);
         }
         else
         {
            this.completeLoading();
         }
      }
      
      private function onTexturesReady(_arg_1:Event) : void
      {
         var _local_2:int = 0;
         while(_local_2 < this.textureFileNames.length)
         {
            this._textureData[this.textureFileNames[_local_2]] = this.batchTextureConstructor.textures[_local_2];
            _local_2++;
         }
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

class TextureByteData
{
   
   public var diffuseData:ByteArray;
   
   public var opacityData:ByteArray;
   
   public function TextureByteData(_arg_1:ByteArray = null, _arg_2:ByteArray = null)
   {
      super();
      this.diffuseData = _arg_1;
      this.opacityData = _arg_2;
   }
   
   public function toString() : String
   {
      return "[TextureByteData diffuseData=" + this.diffuseData + ", opacityData=" + this.opacityData + "]";
   }
}

class TextureConstructor extends EventDispatcher
{
   
   internal var loader:Loader;
   
   internal var textureData:TextureByteData;
   
   internal var _texture:BitmapData;
   
   public function TextureConstructor()
   {
      super();
   }
   
   public function get texture() : BitmapData
   {
      return this._texture;
   }
   
   public function createTexture(_arg_1:TextureByteData) : void
   {
      if(this.loader != null)
      {
         throw new Error("Construction in progress");
      }
      if(_arg_1 == null)
      {
         throw new ArgumentError("Parameter textureData is null");
      }
      if(_arg_1.diffuseData == null)
      {
         throw new ArgumentError("Diffuse data is null");
      }
      this.textureData = _arg_1;
      _arg_1.diffuseData.position = 0;
      this.loader = new Loader();
      this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onDiffuseTextureLoadingComplete);
      this.loader.loadBytes(_arg_1.diffuseData);
   }
   
   internal function onDiffuseTextureLoadingComplete(_arg_1:Event) : void
   {
      this._texture = Bitmap(this.loader.content).bitmapData;
      this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onDiffuseTextureLoadingComplete);
      this.loader.unload();
      if(this.textureData.opacityData != null)
      {
         this.textureData.opacityData.position = 0;
         this.loader = new Loader();
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onAlphaTextureLoadingComplete);
         this.loader.loadBytes(this.textureData.opacityData);
      }
      else
      {
         this.complete();
      }
   }
   
   internal function onAlphaTextureLoadingComplete(_arg_1:Event) : void
   {
      var _local_2:BitmapData = Bitmap(this.loader.content).bitmapData;
      this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onAlphaTextureLoadingComplete);
      this.loader.unload();
      this._texture = ResourceUtils.mergeBitmapAlpha(this._texture,_local_2,true);
      this.complete();
   }
   
   internal function complete() : void
   {
      this.loader = null;
      this.textureData = null;
      dispatchEvent(new Event(Event.COMPLETE));
   }
}

class BatchTextureConstructor extends EventDispatcher
{
   
   public var textures:Vector.<BitmapData>;
   
   internal var textureDatas:Vector.<TextureByteData>;
   
   internal var textureIndex:int;
   
   internal var textureConstructor:TextureConstructor;
   
   public function BatchTextureConstructor()
   {
      super();
   }
   
   public function createTextures(_arg_1:Vector.<TextureByteData>) : void
   {
      this.textureDatas = _arg_1;
      this.textures = new Vector.<BitmapData>();
      this.textureIndex = -1;
      this.createNextTexture();
   }
   
   internal function createNextTexture() : void
   {
      ++this.textureIndex;
      if(this.textureIndex == this.textureDatas.length)
      {
         dispatchEvent(new Event(Event.COMPLETE));
         return;
      }
      this.textureConstructor = new TextureConstructor();
      this.textureConstructor.addEventListener(Event.COMPLETE,this.onTextureComplete);
      this.textureConstructor.createTexture(this.textureDatas[this.textureIndex]);
   }
   
   internal function onTextureComplete(_arg_1:Event) : void
   {
      this.textures[this.textureIndex] = this.textureConstructor.texture;
      this.createNextTexture();
   }
}
