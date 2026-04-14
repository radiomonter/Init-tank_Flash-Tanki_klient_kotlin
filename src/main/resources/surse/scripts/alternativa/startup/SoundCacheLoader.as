package alternativa.startup
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.media.Sound;
   import flash.media.SoundLoaderContext;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   
   public class SoundCacheLoader extends Sound
   {
      
      private var encodedUrl:String;
      
      private var cacheDirectory:Object;
      
      private var context:SoundLoaderContext;
      
      private var FileClass:Class;
      
      private var FileStreamClass:Class;
      
      private var FileModeClass:Class;
      
      public function SoundCacheLoader()
      {
         super();
         if(StartupSettings.isDesktop)
         {
            this.FileClass = getDefinitionByName("flash.filesystem.File") as Class;
            this.FileStreamClass = getDefinitionByName("flash.filesystem.FileStream") as Class;
            this.FileModeClass = getDefinitionByName("flash.filesystem.FileMode") as Class;
            this.cacheDirectory = this.FileClass.applicationStorageDirectory.resolvePath("cache");
            if(!this.cacheDirectory.exists)
            {
               this.cacheDirectory.createDirectory();
            }
            else if(!this.cacheDirectory.isDirectory)
            {
               throw new Error("Cannot create directory." + this.cacheDirectory.nativePath + " is already exists.");
            }
         }
      }
      
      override public function load(_arg_1:URLRequest, _arg_2:SoundLoaderContext = null) : void
      {
         var _local_4:URLLoader = null;
         if(!StartupSettings.isDesktop || _arg_1 == null)
         {
            super.load(_arg_1,_arg_2);
            return;
         }
         this.context = _arg_2;
         this.encodedUrl = URLEncoder.encode(_arg_1.url);
         var _local_3:Object = this.cacheDirectory.resolvePath(this.encodedUrl);
         if(Boolean(_local_3.exists))
         {
            super.load(new URLRequest(_local_3.url),_arg_2);
            return;
         }
         _local_4 = new URLLoader();
         _local_4.dataFormat = URLLoaderDataFormat.BINARY;
         _local_4.addEventListener(Event.COMPLETE,this.onBytesLoaded,false,0,true);
         _local_4.addEventListener(IOErrorEvent.IO_ERROR,this.onIOError,false,0,true);
         _local_4.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError,false,0,true);
         _local_4.load(_arg_1);
      }
      
      private function onIOError(_arg_1:Event) : void
      {
         dispatchEvent(new IOErrorEvent("SoundCacheLoader: IOError!"));
      }
      
      private function onSecurityError(_arg_1:Event) : void
      {
         dispatchEvent(new SecurityErrorEvent("SoundCacheLoader: Security error!"));
      }
      
      private function onBytesLoaded(param1:Event) : void
      {
         var e:Event = param1;
         var bytes:ByteArray = URLLoader(e.target).data as ByteArray;
         var file:Object = new this.FileClass(this.cacheDirectory.resolvePath(this.encodedUrl).nativePath);
         var fileStream:Object = new this.FileStreamClass();
         try
         {
            fileStream.open(file,this.FileModeClass.WRITE);
            fileStream.writeBytes(bytes);
            fileStream.close();
         }
         catch(e:Error)
         {
            dispatchEvent(new IOErrorEvent("SoundCacheLoader error! " + e.message + "url: " + encodedUrl));
         }
         super.load(new URLRequest(file.url),this.context);
      }
   }
}

