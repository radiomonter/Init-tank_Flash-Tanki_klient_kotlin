package alternativa.tanks.battle
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.View;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.bg.IBackgroundService;
   import alternativa.tanks.display.AxisIndicator;
   import alternativa.tanks.models.battle.battlefield.ViewportBorder;
   import alternativa.tanks.service.settings.keybinding.GameActionEnum;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.utils.MathUtils;
   import alternativa.utils.removeDisplayObject;
   import alternativa.utils.removeDisplayObjectChildren;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.geom.Rectangle;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class BattleView
   {
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var bafat:BattleInputService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var tytol:KeysBindingService;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var mymodo:IBackgroundService;
      
      public static const juz:int = 10;
      
      private static const ryw:String = "screenSize";
      
      private var container:Sprite;
      
      private var view:View;
      
      private var overlay:Sprite;
      
      private var zysumykyh:Shape;
      
      private var jokatise:Boolean;
      
      private var wehu:AxisIndicator;
      
      private var screenSize:int = 10;
      
      public function BattleView()
      {
         super();
         this.boqu();
         this.view = new View(1,1,GPUCapabilities.constrained);
         this.view.mouseEnabled = false;
         this.view.hideLogo();
         this.container.addChild(this.view);
         battleService.getBattleScene3D().colulif(this.view);
         this.overlay = new Sprite();
         this.container.addChild(this.overlay);
         this.zysumykyh = new Shape();
         this.container.addChild(this.zysumykyh);
         this.setSize(storageService.getStorage().data[ryw]);
      }
      
      private function boqu() : void
      {
         this.container = new Sprite();
         this.container.addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.container.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onAddedToStage(_arg_1:Event) : void
      {
         this.container.stage.addEventListener(Event.RESIZE,this.onResize);
         this.container.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         this.setFocus();
         this.resize();
      }
      
      private function onRemovedFromStage(_arg_1:Event) : void
      {
         this.container.stage.removeEventListener(Event.RESIZE,this.onResize);
         this.container.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function onResize(_arg_1:Event) : void
      {
         this.resize();
      }
      
      private function onKeyDown(_arg_1:KeyboardEvent) : void
      {
         if(bafat.miwyraze())
         {
            return;
         }
         var _local_2:GameActionEnum = tytol.jikamybu(_arg_1.keyCode);
         switch(_local_2)
         {
            case GameActionEnum.BATTLE_VIEW_INCREASE:
               this.kewimu();
               return;
            case GameActionEnum.BATTLE_VIEW_DECREASE:
               this.poko();
         }
      }
      
      private function kewimu() : void
      {
         this.zobiqewiz();
         storageService.getStorage().data[ryw] = this.sagiwe();
      }
      
      private function poko() : void
      {
         this.nafe();
         storageService.getStorage().data[ryw] = this.sagiwe();
      }
      
      public function destroy() : void
      {
         this.fivata();
         this.view.clear();
         this.view = null;
         removeDisplayObjectChildren(this.overlay);
         this.overlay = null;
         removeDisplayObjectChildren(this.container);
         this.container.removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.container.removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this.container = null;
      }
      
      public function zotebiqe(_arg_1:Boolean) : void
      {
         if(this.jokatise != _arg_1)
         {
            this.jokatise = _arg_1;
            if(_arg_1)
            {
               this.wehu = new AxisIndicator(100);
               this.container.addChild(this.wehu);
               this.vedugose();
            }
            else
            {
               this.container.removeChild(this.wehu);
               this.wehu = null;
            }
         }
      }
      
      public function myfani(_arg_1:Boolean) : void
      {
         var _local_2:Camera3D = battleService.getBattleScene3D().cewubu();
         if(_arg_1 != this.container.contains(_local_2.diagram))
         {
            if(_arg_1)
            {
               this.container.addChild(_local_2.diagram);
            }
            else
            {
               this.container.removeChild(_local_2.diagram);
            }
         }
      }
      
      private function resize() : void
      {
         if(this.container.stage == null)
         {
            return;
         }
         this.cof();
         this.pyty();
         this.sohekokod();
         this.drawBackground();
         this.vedugose();
         battleService.getBattleScene3D().cewubu().buwasuduv();
      }
      
      private function cof() : void
      {
         var _local_1:Number = this.screenSize / juz;
         this.view.width = int(this.container.stage.stageWidth * _local_1);
         this.view.height = int(this.container.stage.stageHeight * _local_1);
      }
      
      private function pyty() : void
      {
         this.container.x = this.container.stage.stageWidth - this.view.width >> 1;
         this.container.y = this.container.stage.stageHeight - this.view.height >> 1;
      }
      
      private function sohekokod() : void
      {
         this.zysumykyh.graphics.clear();
         if(this.screenSize < juz)
         {
            ViewportBorder.draw(this.zysumykyh.graphics,this.view.width,this.view.height);
         }
      }
      
      private function drawBackground() : void
      {
         var _local_1:int = 0.5 * (this.container.stage.stageWidth - this.view.width);
         var _local_2:int = 0.5 * (this.container.stage.stageHeight - this.view.height);
         mymodo.drawBg(new Rectangle(_local_1,_local_2,this.view.width,this.view.height));
      }
      
      private function vedugose() : void
      {
         if(this.jokatise)
         {
            this.wehu.y = this.view.height - this.wehu.size - 50;
         }
      }
      
      public function zobiqewiz() : void
      {
         if(this.screenSize < juz)
         {
            ++this.screenSize;
            this.resize();
         }
      }
      
      public function nafe() : void
      {
         if(this.screenSize > 1)
         {
            --this.screenSize;
            this.resize();
         }
      }
      
      private function setSize(_arg_1:int) : void
      {
         if(_arg_1 == 0)
         {
            this.screenSize = juz;
         }
         else
         {
            this.screenSize = MathUtils.clamp(_arg_1,1,juz);
         }
         this.resize();
      }
      
      public function sagiwe() : int
      {
         return this.screenSize;
      }
      
      public function update() : void
      {
         if(this.jokatise)
         {
            this.wehu.update(battleService.getBattleScene3D().cewubu());
         }
      }
      
      public function jod(_arg_1:DisplayObject) : void
      {
         this.overlay.addChild(_arg_1);
      }
      
      public function gitis() : int
      {
         if(this.container.stage == null)
         {
            return 1;
         }
         return this.container.stage.stageWidth * this.screenSize / juz;
      }
      
      public function boh() : int
      {
         if(this.container.stage == null)
         {
            return 1;
         }
         return this.container.stage.stageHeight * this.screenSize / juz;
      }
      
      public function hagetity() : Number
      {
         return this.boh() * this.boh() + this.gitis() * this.gitis();
      }
      
      public function kihe() : DisplayObjectContainer
      {
         return this.container.parent;
      }
      
      public function lizo() : int
      {
         return this.container.x;
      }
      
      public function sohysatu() : int
      {
         return this.container.y;
      }
      
      public function lacyfu(_arg_1:DisplayObjectContainer) : void
      {
         _arg_1.addChild(this.container);
      }
      
      public function fivata() : void
      {
         removeDisplayObject(this.container);
      }
      
      public function setFocus() : void
      {
         display.stage.focus = this.container;
      }
   }
}

