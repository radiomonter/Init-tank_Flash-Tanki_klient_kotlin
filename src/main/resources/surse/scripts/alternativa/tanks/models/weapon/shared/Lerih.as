package alternativa.tanks.models.weapon.shared
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Ditor;
   import alternativa.tanks.battle.events.Kitut;
   import alternativa.tanks.battle.events.Komahowu;
   import alternativa.tanks.battle.events.Qamy;
   import alternativa.tanks.battle.objects.tank.Dimiqit;
   import alternativa.tanks.models.battle.gui.chat.Movyf;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.keybinding.GameActionEnum;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.targeting.Qizytyv;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import flash.events.Event;
   import flash.events.FullScreenEvent;
   import obfuscation.garud.Sudyhuma;
   
   public class Lerih implements BattleEventListener, Qizytyv
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var vekol:TargetingInputManager;
      
      [Inject]
      public static var pulat:TargetingModeService;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var tytol:KeysBindingService;
      
      private var weapon:Dimiqit;
      
      private var piru:Boolean;
      
      private var hojerit:Boolean;
      
      private var mytekesal:Boolean = false;
      
      private var vag:Vector.<Boolean> = new Vector.<Boolean>(255);
      
      private var pause:Boolean;
      
      private var targetingMode:int;
      
      public function Lerih()
      {
         super();
      }
      
      public function setWeapon(_arg_1:Dimiqit) : void
      {
         this.weapon = _arg_1;
      }
      
      public function selipil() : Boolean
      {
         return this.piru || this.hojerit;
      }
      
      public function sybefe() : Boolean
      {
         return this.piru;
      }
      
      public function hilaq() : void
      {
         this.hojerit = false;
      }
      
      public function init() : void
      {
         display.stage.addEventListener(Event.DEACTIVATE,this.gaduno);
         display.stage.addEventListener(Event.MOUSE_LEAVE,this.fyn);
         display.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.likobadyb);
         battleEventDispatcher.pugu(Ditor,this);
         battleEventDispatcher.pugu(Qamy,this);
         battleEventDispatcher.pugu(Kitut,this);
         battleEventDispatcher.pugu(Komahowu,this);
         battleEventDispatcher.pugu(Movyf,this);
         vekol.addListener(this);
         this.pause = false;
      }
      
      public function destroy() : void
      {
         display.stage.removeEventListener(Event.DEACTIVATE,this.gaduno);
         display.stage.removeEventListener(Event.MOUSE_LEAVE,this.fyn);
         display.stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.likobadyb);
         battleEventDispatcher.kujo(Ditor,this);
         battleEventDispatcher.kujo(Qamy,this);
         battleEventDispatcher.kujo(Kitut,this);
         battleEventDispatcher.kujo(Komahowu,this);
         battleEventDispatcher.kujo(Movyf,this);
         vekol.removeListener(this);
      }
      
      private function likobadyb(_arg_1:FullScreenEvent) : void
      {
         this.dygajocyc();
      }
      
      private function fyn(_arg_1:Event) : void
      {
         this.dygajocyc();
      }
      
      private function suvu(_arg_1:Boolean) : void
      {
         this.piru = true;
         this.hojerit = true;
         pulat.jykec();
         if(this.weapon != null)
         {
            if(_arg_1 && this.targetingMode == Sudyhuma.pobyhevam)
            {
               return;
            }
            this.weapon.suvu();
         }
      }
      
      public function tuvezu(_arg_1:uint) : Boolean
      {
         return _arg_1 < 256 ? Boolean(this.vag[_arg_1]) : Boolean(false);
      }
      
      private function dygajocyc() : void
      {
         var _local_1:Boolean = this.piru;
         this.piru = false;
         if(_local_1 && this.weapon != null)
         {
            this.weapon.dygajocyc();
         }
         pulat.fygywocy();
      }
      
      private function gaduno(_arg_1:Event) : void
      {
         var _local_2:int = 0;
         this.piru = false;
         this.hojerit = false;
         if(this.weapon != null)
         {
            this.weapon.dygajocyc();
         }
         while(_local_2 < this.vag.length)
         {
            this.vag[_local_2] = false;
            _local_2++;
         }
         pulat.fygywocy();
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         var _local_2:Komahowu = null;
         if(_arg_1 is Ditor)
         {
            this.pause = false;
         }
         else if(_arg_1 is Qamy)
         {
            this.pause = true;
         }
         else if(_arg_1 is Kitut)
         {
            this.targetingMode = Kitut(_arg_1).targetingMode;
         }
         else if(_arg_1 is Komahowu)
         {
            _local_2 = Komahowu(_arg_1);
            if(this.piru && this.mytekesal && !_local_2.zomujad)
            {
               this.dygajocyc();
            }
            this.pause = !Komahowu(_arg_1).enabled;
         }
         else if(_arg_1 is Movyf)
         {
            if(this.piru)
            {
               this.dygajocyc();
            }
         }
      }
      
      public function mouseAbsoluteMovement(_arg_1:Number, _arg_2:Number) : void
      {
      }
      
      public function mouseRelativeMovement(_arg_1:Number, _arg_2:Number) : void
      {
      }
      
      public function mouseLeftButton(_arg_1:Boolean, _arg_2:Boolean) : Boolean
      {
         if(!this.pause && settingsService.mouseControl && pulat.visefi() == Sudyhuma.cuwycagin)
         {
            if(!this.piru && _arg_1)
            {
               this.suvu(true);
               this.mytekesal = false;
            }
            else if(this.piru && !this.mytekesal && !_arg_1)
            {
               this.dygajocyc();
            }
         }
         return true;
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
         var _local_3:GameActionEnum = tytol.jikamybu(_arg_1);
         if(_arg_2)
         {
            if(_local_3 == GameActionEnum.SHOT && !this.piru)
            {
               this.suvu(false);
               this.mytekesal = true;
            }
            if(_arg_1 < 256)
            {
               this.vag[_arg_1] = true;
            }
         }
         else
         {
            if(_local_3 == GameActionEnum.SHOT && this.piru && this.mytekesal)
            {
               this.dygajocyc();
            }
            if(_arg_1 < 256)
            {
               this.vag[_arg_1] = false;
            }
         }
         return true;
      }
      
      public function mouseLocked(_arg_1:Boolean) : void
      {
         if(this.piru && this.mytekesal)
         {
            this.dygajocyc();
         }
      }
   }
}

