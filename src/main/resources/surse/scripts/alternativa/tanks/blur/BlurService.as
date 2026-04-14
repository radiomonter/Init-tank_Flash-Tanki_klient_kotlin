package alternativa.tanks.blur
{
   import alternativa.init.TanksServicesActivator;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.help.IHelpService;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class BlurService implements IBlurService
   {
      
      private var blured:Boolean;
      
      private var mainContainerService:IDisplay;
      
      private var overlay:Sprite;
      
      public function BlurService()
      {
         super();
         this.mainContainerService = IDisplay(TanksServicesActivator.osgi.getService(IDisplay));
         this.overlay = new Sprite();
         this.overlay.mouseEnabled = true;
         this.blured = false;
      }
      
      public function blur() : void
      {
         var _local_1:IHelpService = null;
         if(!this.blured)
         {
            this.blured = true;
            this.mainContainerService.dialogsLayer.addChildAt(this.overlay,0);
            this.mainContainerService.stage.addEventListener(Event.RESIZE,this.onStageResize);
            this.redrawOverlay();
            _local_1 = TanksServicesActivator.osgi.getService(IHelpService) as IHelpService;
            _local_1.pushState();
            _local_1.hideAllHelpers();
            _local_1.lock();
         }
      }
      
      public function unblur() : void
      {
         var _local_1:IHelpService = null;
         if(this.blured)
         {
            this.blured = false;
            this.mainContainerService.dialogsLayer.removeChild(this.overlay);
            this.mainContainerService.stage.removeEventListener(Event.RESIZE,this.onStageResize);
            _local_1 = TanksServicesActivator.osgi.getService(IHelpService) as IHelpService;
            _local_1.popState();
            _local_1.unlock();
         }
      }
      
      private function onStageResize(_arg_1:Event) : void
      {
         this.redrawOverlay();
      }
      
      private function redrawOverlay() : void
      {
         var _local_1:int = this.mainContainerService.stage.stageWidth;
         var _local_2:int = this.mainContainerService.stage.stageHeight;
         this.overlay.graphics.clear();
         this.overlay.graphics.beginFill(0,0.5);
         this.overlay.graphics.drawRect(0,0,_local_1,_local_2);
      }
   }
}

