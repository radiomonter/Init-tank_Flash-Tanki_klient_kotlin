package alternativa.tanks.loader
{
   import alternativa.init.TanksServicesActivator;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.loader.dishonestprogressbar.DishonestProgressBar;
   import alternativa.tanks.utils.TransparentJPG;
   import alternativa.tanks.view.TipBlock;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class LoaderWindow extends Sprite implements ILoaderWindowService
   {
      
      private static const showDelay:int = 1000;
      
      private static const hideDelay:int = 10000;
      
      private static const nextTipDelay:int = 9000;
      
      private static const WindowRGB:Class = LoaderWindow_WindowRGB;
      
      private static const WindowRGBChina:Class = LoaderWindow_WindowRGBChina;
      
      private static const WindowAlpha:Class = LoaderWindow_WindowAlpha;
      
      private var layer:DisplayObjectContainer;
      
      private var windowBmp:Bitmap;
      
      private var tipBlock:TipBlock;
      
      private var showTimer:Timer;
      
      private var hideTimer:Timer;
      
      private var nextTipTimer:Timer;
      
      private var resourcesId:Array;
      
      private var dishonestProgressBar:DishonestProgressBar;
      
      private var lock:Boolean = false;
      
      private var tips:Array = [];
      
      public function LoaderWindow()
      {
         super();
         this.layer = (TanksServicesActivator.osgi.getService(IDisplay) as IDisplay).systemUILayer;
         this.resourcesId = new Array();
         var _local_1:BitmapData = this.getLoaderBackgroundBitmap(TanksServicesActivator.osgi.getService(ILocaleService) as ILocaleService);
         this.windowBmp = TransparentJPG.createImageFromRGBAndAlpha(_local_1,new WindowAlpha().bitmapData);
         addChild(this.windowBmp);
         this.tipBlock = new TipBlock();
         addChild(this.tipBlock);
         this.dishonestProgressBar = new DishonestProgressBar(this.progressBarFinished);
         this.dishonestProgressBar.x = 10;
         this.dishonestProgressBar.y = 239;
         addChild(this.dishonestProgressBar);
         this.showTimer = new Timer(showDelay,1);
         this.hideTimer = new Timer(hideDelay,1);
         this.nextTipTimer = new Timer(nextTipDelay,1);
         this.showTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onShowTimerComplemete);
         this.hideTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onHideTimerComplemete);
         this.nextTipTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onNextTipTimerComplete);
      }
      
      private function progressBarFinished() : void
      {
         if(this.layer.contains(this))
         {
            this.layer.removeChild(this);
         }
      }
      
      private function getLoaderBackgroundBitmap(_arg_1:ILocaleService) : BitmapData
      {
         if(_arg_1.language == "cn")
         {
            return new WindowRGBChina().bitmapData;
         }
         return new WindowRGB().bitmapData;
      }
      
      public function setBatchIdForProcess(_arg_1:int, _arg_2:Object) : void
      {
      }
      
      public function showTip(_arg_1:DisplayObject) : void
      {
         this.tips.push(_arg_1);
      }
      
      private function onNextTipTimerComplete(_arg_1:TimerEvent) : void
      {
         var _local_2:ILoaderTipsService = OSGi.getInstance().getService(ILoaderTipsService) as ILoaderTipsService;
         (OSGi.getInstance().getService(IClientLog) as IClientLog).log("loader","==\nLoaderWindow::onNextTipTimerComplete %1\n==",getTimer());
         if(this.tips[0] is DisplayObject)
         {
            this.tipBlock.showTip(this.tips.shift());
         }
         if(_local_2 != null)
         {
            _local_2.getTip(ILocaleService(OSGi.getInstance().getService(ILocaleService)).language);
         }
         this.nextTipTimer.stop();
         this.nextTipTimer.reset();
         this.nextTipTimer.start();
      }
      
      public function processStarted(_arg_1:Object) : void
      {
         this.hideTimer.stop();
         if(this.resourcesId.indexOf(_arg_1) == -1)
         {
            this.resourcesId.push(_arg_1);
         }
         if(!this.lock && !this.showTimer.running && !this.layer.contains(this))
         {
            this.showTimer.reset();
            this.showTimer.start();
         }
      }
      
      public function showLoaderWindow() : void
      {
         (OSGi.getInstance().getService(IClientLog) as IClientLog).log("loader","==\nLoaderWindow::showLoaderWindow %1\n==",getTimer());
         this.onShowTimerComplemete();
      }
      
      public function hideLoaderWindow() : void
      {
         (OSGi.getInstance().getService(IClientLog) as IClientLog).log("loader","==\nLoaderWindow::hideLoaderWindow %1\n==",getTimer());
         this.showTimer.stop();
         this.onHideTimerComplemete();
      }
      
      public function lockLoaderWindow() : void
      {
         if(!this.lock)
         {
            this.lock = true;
            this.showTimer.stop();
            this.hideTimer.stop();
         }
      }
      
      public function unlockLoaderWindow() : void
      {
         if(this.lock)
         {
            this.lock = false;
         }
      }
      
      private function onShowTimerComplemete(_arg_1:TimerEvent = null) : void
      {
         this.showTimer.stop();
         this.show();
      }
      
      private function onHideTimerComplemete(_arg_1:TimerEvent = null) : void
      {
         this.hideTimer.stop();
         this.hide();
      }
      
      private function show() : void
      {
         if(!this.layer.contains(this))
         {
            this.layer.addChild(this);
            stage.addEventListener(Event.RESIZE,this.align);
            this.align();
            this.nextTipTimer.start();
            this.dishonestProgressBar.start();
            this.onNextTipTimerComplete(null);
         }
      }
      
      private function hide() : void
      {
         if(this.layer.contains(this))
         {
            this.nextTipTimer.stop();
            this.dishonestProgressBar.forciblyFinish();
            stage.removeEventListener(Event.RESIZE,this.align);
         }
      }
      
      private function align(_arg_1:Event = null) : void
      {
         this.x = stage.stageWidth - this.windowBmp.width >>> 1;
         this.y = stage.stageHeight - this.windowBmp.height >>> 1;
      }
      
      public function zare() : Boolean
      {
         return this.nextTipTimer.running;
      }
   }
}

