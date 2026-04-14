package projects.tanks.clients.fp10.libraries.tanksservices.service.blur
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.utils.removeDisplayObject;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class BlurService extends EventDispatcher implements IBlurService
   {
      
      [Inject]
      public static var helperService:IHelpService;
      
      private static const OVERLAY_COLOR:uint = 0;
      
      private static const OVERLAY_ALPHA:Number = 0.5;
      
      private var isBlurGameContent:Boolean;
      
      private var isBlurBattleContent:Boolean;
      
      private var isBlurDialogContent:Boolean;
      
      private var isBlurAllContent:Boolean;
      
      private var overlay:Sprite;
      
      private var mainContainerService:IDisplay;
      
      private var componentOverlays:Dictionary;
      
      private var blurredComponentsCount:uint = 0;
      
      public function BlurService()
      {
         super();
         this.mainContainerService = IDisplay(OSGi.getInstance().getService(IDisplay));
         this.overlay = new Sprite();
         this.overlay.mouseEnabled = true;
         this.componentOverlays = new Dictionary();
      }
      
      private static function lockHelpService() : void
      {
         helperService.pushState();
         helperService.hideAllHelpers();
         helperService.lock();
      }
      
      private static function unLockHelpService() : void
      {
         helperService.popState();
         helperService.unlock();
      }
      
      public function blurComponent(_arg_1:DisplayObject) : void
      {
         if(_arg_1 in this.componentOverlays)
         {
            return;
         }
         var _local_2:Sprite = this.createComponentOverlay(_arg_1);
         this.componentOverlays[_arg_1] = _local_2;
         ++this.blurredComponentsCount;
         if(this.blurredComponentsCount == 1)
         {
            this.mainContainerService.stage.addEventListener(Event.RESIZE,this.onStageResize);
         }
         this.mainContainerService.dialogsLayer.addChildAt(_local_2,0);
      }
      
      private function createComponentOverlay(_arg_1:DisplayObject) : Sprite
      {
         var _local_2:Sprite = new Sprite();
         _arg_1.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this.redrawComponentOverlay(_local_2,_arg_1);
         return _local_2;
      }
      
      public function blurBattleContent() : void
      {
         if(!this.isBlurBattleContent)
         {
            this.isBlurBattleContent = true;
            this.addOverlay();
         }
         this.mainContainerService.systemLayer.addChildAt(this.overlay,0);
      }
      
      public function blurGameContent() : void
      {
         if(!this.isBlurGameContent)
         {
            this.isBlurGameContent = true;
            this.addOverlay();
         }
         this.mainContainerService.dialogsLayer.addChildAt(this.overlay,0);
      }
      
      public function blurDialogContent() : void
      {
         if(!this.isBlurDialogContent)
         {
            this.isBlurDialogContent = true;
            this.addOverlay();
         }
         this.mainContainerService.noticesLayer.addChildAt(this.overlay,0);
      }
      
      public function blurAllContent() : void
      {
         if(!this.isBlurAllContent)
         {
            this.isBlurAllContent = true;
            this.addOverlay();
         }
         this.mainContainerService.stage.addChild(this.overlay);
      }
      
      public function unblurBattleContent() : void
      {
         if(this.isBlurBattleContent)
         {
            this.isBlurBattleContent = false;
            if(this.isBlurAllContent)
            {
               return;
            }
            if(this.isBlurDialogContent)
            {
               this.blurDialogContent();
               return;
            }
            if(this.isBlurGameContent)
            {
               this.blurGameContent();
               return;
            }
            this.removeOverlay();
         }
      }
      
      public function unblurGameContent() : void
      {
         if(this.isBlurGameContent)
         {
            this.isBlurGameContent = false;
            if(this.isBlurAllContent)
            {
               return;
            }
            if(this.isBlurDialogContent)
            {
               this.blurDialogContent();
               return;
            }
            if(this.isBlurBattleContent)
            {
               this.blurBattleContent();
               return;
            }
            this.removeOverlay();
         }
      }
      
      public function unblurDialogContent() : void
      {
         if(this.isBlurDialogContent)
         {
            this.isBlurDialogContent = false;
            if(this.isBlurAllContent)
            {
               return;
            }
            if(this.isBlurGameContent)
            {
               this.blurGameContent();
               return;
            }
            if(this.isBlurBattleContent)
            {
               this.blurBattleContent();
               return;
            }
            this.removeOverlay();
         }
      }
      
      public function unblurAllContent() : void
      {
         if(this.isBlurAllContent)
         {
            this.isBlurAllContent = false;
            if(this.isBlurDialogContent)
            {
               this.blurDialogContent();
               return;
            }
            if(this.isBlurGameContent)
            {
               this.blurGameContent();
               return;
            }
            if(this.isBlurBattleContent)
            {
               this.blurBattleContent();
               return;
            }
            this.removeOverlay();
         }
      }
      
      public function unblurAllComponents() : void
      {
         var _local_1:* = null;
         for(_local_1 in this.componentOverlays)
         {
            this.unblurComponent(DisplayObject(_local_1));
         }
      }
      
      public function unblurComponent(_arg_1:DisplayObject) : void
      {
         if(_arg_1 in this.componentOverlays)
         {
            _arg_1.removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
            removeDisplayObject(this.componentOverlays[_arg_1]);
            delete this.componentOverlays[_arg_1];
            --this.blurredComponentsCount;
            if(this.blurredComponentsCount == 0)
            {
               this.mainContainerService.stage.removeEventListener(Event.RESIZE,this.onStageResize);
            }
         }
      }
      
      private function addOverlay() : void
      {
         if(this.overlay.parent == null)
         {
            this.mainContainerService.stage.addEventListener(Event.RESIZE,this.redrawOverlay);
            this.overlay.addEventListener(MouseEvent.CLICK,this.onClickOverlay);
            this.redrawOverlay();
            lockHelpService();
         }
      }
      
      private function redrawOverlay(_arg_1:Event = null) : void
      {
         var _local_2:int = this.mainContainerService.stage.stageWidth;
         var _local_3:int = this.mainContainerService.stage.stageHeight;
         this.overlay.graphics.clear();
         this.overlay.graphics.beginFill(OVERLAY_COLOR,OVERLAY_ALPHA);
         this.overlay.graphics.drawRect(0,0,_local_2,_local_3);
      }
      
      private function onClickOverlay(_arg_1:MouseEvent) : void
      {
         if(this.isClickOverlayBattleContent())
         {
            dispatchEvent(new BlurServiceEvent(BlurServiceEvent.CLICK_OVERLAY_BATTLE_CONTENT));
         }
      }
      
      private function isClickOverlayBattleContent() : Boolean
      {
         return this.isBlurBattleContent && !this.isBlurGameContent && !this.isBlurDialogContent && !this.isBlurAllContent;
      }
      
      private function removeOverlay() : void
      {
         if(this.overlay.parent != null)
         {
            this.overlay.removeEventListener(MouseEvent.CLICK,this.onClickOverlay);
            removeDisplayObject(this.overlay);
            this.mainContainerService.stage.removeEventListener(Event.RESIZE,this.redrawOverlay);
            unLockHelpService();
         }
      }
      
      private function onStageResize(_arg_1:Event) : void
      {
         var _local_2:* = null;
         for(_local_2 in this.componentOverlays)
         {
            this.redrawComponentOverlay(this.componentOverlays[_local_2],DisplayObject(_local_2));
         }
      }
      
      private function redrawComponentOverlay(_arg_1:Sprite, _arg_2:DisplayObject) : void
      {
         var _local_3:Point = _arg_2.localToGlobal(new Point(0,0));
         _arg_1.graphics.clear();
         _arg_1.graphics.beginFill(0,0);
         _arg_1.graphics.drawRect(_local_3.x,_local_3.y,_arg_2.width,_arg_2.height);
         _arg_1.graphics.endFill();
      }
      
      private function onRemovedFromStage(_arg_1:Event) : void
      {
         var _local_2:DisplayObject = DisplayObject(_arg_1.target);
         this.unblurComponent(_local_2);
      }
   }
}

