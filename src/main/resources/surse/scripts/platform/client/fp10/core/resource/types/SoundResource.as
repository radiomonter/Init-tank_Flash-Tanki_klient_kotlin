package platform.client.fp10.core.resource.types
{
   import alternativa.startup.SoundCacheLoader;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.media.Sound;
   import flash.media.SoundLoaderContext;
   import flash.net.URLRequest;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceFlags;
   import platform.client.fp10.core.resource.ResourceInfo;
   import platform.client.fp10.core.resource.ResourceStatus;
   
   public class SoundResource extends Resource
   {
      
      private var _sound:Sound;
      
      public function SoundResource(_arg_1:ResourceInfo)
      {
         super(_arg_1);
      }
      
      public function get sound() : Sound
      {
         return this._sound;
      }
      
      override public function toString() : String
      {
         return "[SoundResource id=" + id + "]";
      }
      
      override public function load(_arg_1:String, _arg_2:IResourceLoadingListener) : void
      {
         super.load(_arg_1,_arg_2);
         this.doLoad();
      }
      
      override protected function doReload() : void
      {
         if(isLoading)
         {
            clearFlags(ResourceFlags.IS_LOADING);
            this._sound.close();
         }
         this.doLoad();
      }
      
      private function doLoad() : void
      {
         this._sound = new SoundCacheLoader();
         this._sound.addEventListener(Event.OPEN,this.onLoadingOpen);
         this._sound.addEventListener(Event.COMPLETE,this.onLoadComplete);
         this._sound.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadError);
         this._sound.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadError);
         this._sound.addEventListener(ProgressEvent.PROGRESS,this.onLoadProgress);
         this._sound.load(new URLRequest(baseUrl + this.getFileName()),new SoundLoaderContext());
         startTimeoutTracking();
         status = ResourceStatus.REQUESTED;
      }
      
      private function onLoadingOpen(_arg_1:Event) : void
      {
         setFlags(ResourceFlags.IS_LOADING);
         updateLastActivityTime();
         listener.onResourceLoadingStart(this);
      }
      
      private function onLoadComplete(_arg_1:Event) : void
      {
         clearFlags(ResourceFlags.IS_LOADING);
         this._sound.removeEventListener(Event.OPEN,this.onLoadingOpen);
         this._sound.removeEventListener(Event.COMPLETE,this.onLoadComplete);
         this._sound.removeEventListener(IOErrorEvent.IO_ERROR,this.onLoadError);
         this._sound.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadError);
         this._sound.removeEventListener(ProgressEvent.PROGRESS,this.onLoadProgress);
         completeLoading();
      }
      
      private function onLoadProgress(_arg_1:ProgressEvent) : void
      {
         updateLastActivityTime();
      }
      
      private function onLoadError(_arg_1:ErrorEvent) : void
      {
         clearFlags(ResourceFlags.IS_LOADING);
         this._sound = new SoundEmptyWrapper();
         completeLoading();
      }
      
      private function getFileName() : String
      {
         return "sound.swf";
      }
   }
}

