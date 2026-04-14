package alternativa.tanks.services.targeting
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Kitut;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import flash.display.StageDisplayState;
   import flash.events.FullScreenEvent;
   import obfuscation.garud.Sudyhuma;
   import obfuscation.garud.Tesik;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenStateService;
   
   public class Cifoduk implements TargetingModeService, Qizytyv
   {
      
      [Inject]
      public static var vekol:TargetingInputManager;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var comihar:FullscreenStateService;
      
      [Inject]
      public static var dowiruduj:FullscreenService;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var tytol:KeysBindingService;
      
      private static const roq:String = "fullScreenInteractiveAccepted";
      
      private static const MOUSE_LOCK:String = "mouseLock";
      
      private var lyrod:int;
      
      private var gakynoj:int;
      
      private var gac:Tesik;
      
      private var sefinib:int;
      
      public function Cifoduk()
      {
         super();
      }
      
      public function init() : void
      {
         this.lyrod = Sudyhuma.lof;
         this.gakynoj = Sudyhuma.pobyhevam;
         vekol.addListener(this);
         display.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.likobadyb);
         display.stage.addEventListener(roq,this.likobadyb);
         this.sefinib = 0;
         if(comihar.isFullscreen())
         {
            vekol.requestMouseLock();
         }
      }
      
      public function close() : void
      {
         display.stage.removeEventListener(roq,this.likobadyb);
         display.stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.likobadyb);
         vekol.removeListener(this);
      }
      
      private function likobadyb(_arg_1:FullScreenEvent) : void
      {
         if(_arg_1.fullScreen && (_arg_1.type == roq || dowiruduj.isStandAlone()) && settingsService.mouseControl)
         {
            vekol.requestMouseLock();
            vekol.tiq();
         }
         else if(!_arg_1.fullScreen && this.lyrod == Sudyhuma.cuwycagin)
         {
            this.kyfiq(Sudyhuma.pobyhevam);
         }
      }
      
      public function tick() : void
      {
         if(this.lyrod == Sudyhuma.cuwycagin && !settingsService.mouseControl)
         {
            this.kyfiq(Sudyhuma.pobyhevam);
         }
         if(this.gakynoj != this.lyrod)
         {
            if(this.lyrod == Sudyhuma.cuwycagin)
            {
               vekol.res();
            }
            this.lyrod = this.gakynoj;
            battleEventDispatcher.dispatchEvent(new Kitut(this.lyrod));
         }
      }
      
      public function visefi() : int
      {
         return this.lyrod;
      }
      
      public function mouseAbsoluteMovement(_arg_1:Number, _arg_2:Number) : void
      {
      }
      
      public function mouseRelativeMovement(_arg_1:Number, _arg_2:Number) : void
      {
      }
      
      public function mouseLeftButton(_arg_1:Boolean, _arg_2:Boolean) : Boolean
      {
         if(!dowiruduj.isMouseLockDisabled() && settingsService.mouseControl && this.sefinib == 0 && _arg_1)
         {
            if(this.isInFullscreen() && !dowiruduj.isMouseLocked())
            {
               vekol.requestMouseLock();
               return false;
            }
            if(_arg_2 && !this.isInFullscreen())
            {
               dowiruduj.switchFullscreen();
               return false;
            }
         }
         return true;
      }
      
      private function isInFullscreen() : Boolean
      {
         return display.stage.displayState != StageDisplayState.NORMAL;
      }
      
      public function mouseWheel(_arg_1:int) : void
      {
      }
      
      public function mouseRightButton(_arg_1:Boolean, _arg_2:Boolean) : Boolean
      {
         return true;
      }
      
      public function keyboardButton(_arg_1:uint, _arg_2:Boolean) : Boolean
      {
         var _local_3:Boolean = false;
         if(_arg_2 && this.lyrod != Sudyhuma.pobyhevam && this.gac != null)
         {
            _local_3 = tytol.jikamybu(_arg_1) == this.gac.pezojywuc;
            _local_3 ||= tytol.jikamybu(_arg_1) == this.gac.demezuvog;
            _local_3 ||= tytol.jikamybu(_arg_1) == this.gac.mih;
            if(_local_3)
            {
               this.kyfiq(Sudyhuma.pobyhevam);
               return false;
            }
         }
         return true;
      }
      
      private function nitivona(_arg_1:uint, _arg_2:Vector.<uint>) : Boolean
      {
         return _arg_2 != null ? Boolean(_arg_2.indexOf(_arg_1) >= 0) : Boolean(false);
      }
      
      public function mouseLocked(_arg_1:Boolean) : void
      {
         this.kyfiq(Sudyhuma.cuwycagin);
         vekol.tiq();
      }
      
      private function kyfiq(_arg_1:int) : void
      {
         if(_arg_1 != this.lyrod && this.sefinib == 0)
         {
            this.gakynoj = _arg_1;
         }
      }
      
      public function fugatatyr(_arg_1:Tesik) : void
      {
         this.gac = _arg_1;
      }
      
      public function nihesavut() : Tesik
      {
         return this.gac;
      }
      
      public function jykec() : void
      {
         ++this.sefinib;
      }
      
      public function fygywocy() : void
      {
         --this.sefinib;
         if(this.sefinib < 0)
         {
            this.sefinib = 0;
         }
      }
   }
}

