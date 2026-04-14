package alternativa.tanks.services.targeting
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Ditor;
   import alternativa.tanks.battle.events.Komahowu;
   import alternativa.tanks.battle.events.Qamy;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import flash.display.Stage;
   import flash.display.StageDisplayState;
   import flash.events.Event;
   import flash.events.FullScreenEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Lipasod implements TargetingInputManager, BattleEventListener
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var zudysy:ILobbyLayoutService;
      
      [Inject]
      public static var bafat:BattleInputService;
      
      [Inject]
      public static var dowiruduj:FullscreenService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const vyvylu:String = "movementX";
      
      private static const nyle:String = "movementY";
      
      private static const keciqyh:String = "rightMouseDown";
      
      private static const vagidaso:String = "rightMouseUp";
      
      private static const roq:String = "fullScreenInteractiveAccepted";
      
      private static const MOUSE_LOCK:String = "mouseLock";
      
      private var listeners:Vector.<Qizytyv> = new Vector.<Qizytyv>();
      
      private var hededov:int = 0;
      
      private var active:Boolean = true;
      
      private var zane:Boolean = false;
      
      private var hujarahe:Boolean = false;
      
      private var hevyfef:Boolean = false;
      
      private var lowuvabap:int = 0;
      
      private var mid:Boolean = false;
      
      private var meferoji:Boolean = false;
      
      private var povacyjo:Boolean = false;
      
      private var pause:Boolean = false;
      
      private var activate:Boolean = false;
      
      private var kucomojah:Boolean = false;
      
      private var zomujad:Boolean = false;
      
      public function Lipasod()
      {
         super();
      }
      
      public function init() : void
      {
         if(!this.kucomojah)
         {
            display.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            display.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            display.stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            display.stage.addEventListener(keciqyh,this.halila);
            display.stage.addEventListener(vagidaso,this.mawuf);
            display.stage.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
            display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            display.stage.addEventListener(Event.ACTIVATE,this.peg);
            display.stage.addEventListener(Event.DEACTIVATE,this.paru);
            display.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.likobadyb);
            display.stage.addEventListener(roq,this.nadu);
            battleEventDispatcher.pugu(Qamy,this);
            battleEventDispatcher.pugu(Ditor,this);
            this.listeners.length = 0;
            this.hededov = 0;
            this.active = true;
            this.activate = false;
            this.pause = false;
            this.mid = false;
            this.lowuvabap = 0;
            this.hujarahe = false;
            this.zane = false;
            this.zomujad = false;
            this.kucomojah = true;
         }
      }
      
      public function close() : void
      {
         if(this.kucomojah)
         {
            display.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            display.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            display.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            display.stage.removeEventListener(keciqyh,this.halila);
            display.stage.removeEventListener(vagidaso,this.mawuf);
            display.stage.removeEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
            display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            display.stage.removeEventListener(Event.ACTIVATE,this.peg);
            display.stage.removeEventListener(Event.DEACTIVATE,this.paru);
            display.stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.likobadyb);
            display.stage.removeEventListener(roq,this.nadu);
            battleEventDispatcher.kujo(Qamy,this);
            battleEventDispatcher.kujo(Ditor,this);
            this.listeners.length = 0;
            this.kucomojah = false;
         }
      }
      
      private function nadu(_arg_1:FullScreenEvent) : void
      {
         if(_arg_1.fullScreen)
         {
            this.tiq();
         }
         this.mid = false;
      }
      
      private function likobadyb(_arg_1:FullScreenEvent) : void
      {
         if(_arg_1.fullScreen)
         {
            this.tiq();
         }
         this.mid = _arg_1.fullScreen && !dowiruduj.isStandAlone();
      }
      
      private function halila(_arg_1:MouseEvent) : void
      {
         var _local_2:int = 0;
         if(this.vam(_arg_1))
         {
            _local_2 = 0;
            while(_local_2 < this.listeners.length)
            {
               if(!Qizytyv(this.listeners[_local_2]).mouseRightButton(true,true))
               {
                  return;
               }
               _local_2++;
            }
         }
      }
      
      private function mawuf(_arg_1:MouseEvent) : void
      {
         var _local_2:int = 0;
         if(this.vam(_arg_1) && this.lowuvabap == 0)
         {
            _local_2 = 0;
            while(_local_2 < this.listeners.length)
            {
               if(!Qizytyv(this.listeners[_local_2]).mouseRightButton(false,true))
               {
                  return;
               }
               _local_2++;
            }
         }
      }
      
      private function onMouseWheel(_arg_1:MouseEvent) : void
      {
         var _local_2:int = 0;
         if(this.vam(_arg_1) && this.lowuvabap == 0)
         {
            _local_2 = 0;
            if(dowiruduj.isMouseLocked())
            {
               while(_local_2 < this.listeners.length)
               {
                  Qizytyv(this.listeners[_local_2]).mouseWheel(_arg_1.delta);
                  _local_2++;
               }
            }
         }
      }
      
      private function onMouseMove(_arg_1:MouseEvent) : void
      {
         var _local_2:int = 0;
         if(this.vam(_arg_1) && this.lowuvabap == 0)
         {
            if(this.zane)
            {
               this.zane = false;
               return;
            }
            if(dowiruduj.isMouseLocked())
            {
               _local_2 = 0;
               while(_local_2 < this.listeners.length)
               {
                  Qizytyv(this.listeners[_local_2]).mouseRelativeMovement(_arg_1[vyvylu],_arg_1[nyle]);
                  _local_2++;
               }
            }
            else
            {
               _local_2 = 0;
               while(_local_2 < this.listeners.length)
               {
                  Qizytyv(this.listeners[_local_2]).mouseAbsoluteMovement(_arg_1.stageX,_arg_1.stageY);
                  _local_2++;
               }
            }
         }
      }
      
      private function onMouseDown(_arg_1:MouseEvent) : void
      {
         this.povacyjo = true;
         if(this.vam(_arg_1) && this.lowuvabap == 0)
         {
            this.meferoji = true;
            this.qodisymedu(true,true);
         }
      }
      
      private function onMouseUp(_arg_1:MouseEvent) : void
      {
         this.povacyjo = false;
         if(this.vam(_arg_1) && this.lowuvabap == 0)
         {
            this.meferoji = false;
            this.qodisymedu(false,true);
         }
      }
      
      private function qodisymedu(_arg_1:Boolean, _arg_2:Boolean) : void
      {
         var _local_3:int = 0;
         while(_local_3 < this.listeners.length)
         {
            if(!Qizytyv(this.listeners[_local_3]).mouseLeftButton(_arg_1,_arg_2))
            {
               return;
            }
            _local_3++;
         }
      }
      
      private function onKeyDown(_arg_1:KeyboardEvent) : void
      {
         var _local_2:int = 0;
         if(this.bebobytyd(_arg_1) && this.lowuvabap == 0)
         {
            _local_2 = 0;
            while(_local_2 < this.listeners.length)
            {
               if(!Qizytyv(this.listeners[_local_2]).keyboardButton(_arg_1.keyCode,true))
               {
                  return;
               }
               _local_2++;
            }
         }
      }
      
      private function onKeyUp(_arg_1:KeyboardEvent) : void
      {
         var _local_2:int = 0;
         if(this.bebobytyd(_arg_1) && this.lowuvabap == 0)
         {
            _local_2 = 0;
            while(_local_2 < this.listeners.length)
            {
               if(!Qizytyv(this.listeners[_local_2]).keyboardButton(_arg_1.keyCode,false))
               {
                  return;
               }
               _local_2++;
            }
         }
      }
      
      private function peg(_arg_1:Event) : void
      {
         if(!this.active)
         {
            this.activate = true;
            this.tiq();
         }
      }
      
      private function paru(_arg_1:Event) : void
      {
         this.active = false;
      }
      
      public function tick() : void
      {
         if(this.kucomojah && this.active)
         {
            if(this.hevyfef && !this.dyzywub())
            {
               if(this.hujarahe)
               {
                  this.requestMouseLock();
               }
            }
            else if(!this.hevyfef && this.dyzywub())
            {
               if(this.isInFullscreen())
               {
                  display.stage[MOUSE_LOCK] = false;
               }
            }
            this.hevyfef = this.dyzywub();
            if(this.lowuvabap > 0)
            {
               --this.lowuvabap;
            }
         }
         if(this.activate)
         {
            this.active = true;
            this.activate = false;
            if(this.isInFullscreen() && this.hujarahe)
            {
               this.requestMouseLock();
            }
         }
      }
      
      public function addListener(_arg_1:Qizytyv) : void
      {
         if(this.listeners.indexOf(_arg_1) < 0)
         {
            this.listeners.push(_arg_1);
         }
      }
      
      public function removeListener(_arg_1:Qizytyv) : void
      {
         this.listeners.splice(this.listeners.indexOf(_arg_1),1);
      }
      
      public function lyregejiv() : void
      {
         this.fyzecuca(false);
      }
      
      public function nizojemak() : void
      {
         this.fyzecuca(true);
      }
      
      private function fyzecuca(_arg_1:Boolean) : void
      {
         if(this.kucomojah)
         {
            this.zomujad = _arg_1;
            ++this.hededov;
            if(this.hededov == 1)
            {
               battleEventDispatcher.dispatchEvent(new Komahowu(false,_arg_1));
            }
         }
      }
      
      private function isInFullscreen() : Boolean
      {
         return display.stage.displayState != StageDisplayState.NORMAL;
      }
      
      public function volof() : void
      {
         if(this.kucomojah)
         {
            --this.hededov;
            if(this.hededov <= 0)
            {
               this.hededov = 0;
               battleEventDispatcher.dispatchEvent(new Komahowu(true,this.zomujad));
               this.zomujad = false;
               if(this.povacyjo != this.meferoji)
               {
                  if(!this.dyzywub())
                  {
                     this.qodisymedu(this.povacyjo,false);
                  }
                  this.meferoji = this.povacyjo;
               }
            }
         }
      }
      
      public function requestMouseLock() : void
      {
         if(this.kucomojah)
         {
            if(!this.dyzywub())
            {
               dowiruduj.requestMouseLock();
            }
            else
            {
               this.hujarahe = true;
            }
            if(dowiruduj.isMouseLocked())
            {
               this.fenyjen(true);
               this.zane = true;
               this.hujarahe = true;
            }
         }
      }
      
      private function dyzywub() : Boolean
      {
         return this.hededov > 0 || this.puwoj();
      }
      
      private function puwoj() : Boolean
      {
         return !zudysy.inBattle() || zudysy.isSwitchInProgress() || zudysy.isWindowOpenOverBattle() || this.mid;
      }
      
      private function vam(_arg_1:MouseEvent) : Boolean
      {
         return !bafat.miwyraze() && this.hebysizoq(_arg_1);
      }
      
      private function bebobytyd(_arg_1:KeyboardEvent) : Boolean
      {
         return !bafat.miwyraze() && !this.pause && (!this.puwoj() || this.zomujad);
      }
      
      private function hebysizoq(_arg_1:MouseEvent) : Boolean
      {
         var _local_2:* = !(_arg_1.target is Stage);
         return this.active && !this.pause && !_local_2 && !this.dyzywub();
      }
      
      public function res() : void
      {
         if(this.isInFullscreen())
         {
            display.stage[MOUSE_LOCK] = false;
            this.fenyjen(false);
            this.hujarahe = false;
         }
      }
      
      private function fenyjen(_arg_1:Boolean) : void
      {
         var _local_2:int = 0;
         while(_local_2 < this.listeners.length)
         {
            Qizytyv(this.listeners[_local_2]).mouseLocked(_arg_1);
            _local_2++;
         }
      }
      
      public function tiq(_arg_1:int = 1) : void
      {
         this.lowuvabap = _arg_1;
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         if(_arg_1 is Qamy)
         {
            this.pause = true;
         }
         else if(_arg_1 is Ditor)
         {
            this.pause = false;
         }
      }
   }
}

