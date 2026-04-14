package obfuscation.joraky
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Ditor;
   import alternativa.tanks.battle.events.Fukodybiz;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import flash.events.Event;
   import flash.utils.getTimer;
   import obfuscation.tyf.Jimes;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Tiso implements AutoClosable, BattleEventListener, LogicUnit
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var tykih:BattleGUIService;
      
      private var hise:Jimes;
      
      private var nobymy:Boolean;
      
      private var fydyw:int;
      
      public function Tiso()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         battleEventDispatcher.pugu(Ditor,this);
         battleEventDispatcher.pugu(Fukodybiz,this);
         this.hise = new Jimes(localeService.getText(TanksLocale.TEXT_REARM_PAUSE_1),localeService.getText(TanksLocale.TEXT_REARM_PAUSE_2),localeService.getText(TanksLocale.TEXT_REARM_PAUSE_3));
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         if(_arg_1 is Ditor)
         {
            this.jago();
         }
         else if(_arg_1 is Fukodybiz)
         {
            this.fekoro(Fukodybiz(_arg_1));
         }
      }
      
      private function fekoro(_arg_1:Fukodybiz) : void
      {
         if(this.nobymy)
         {
            return;
         }
         this.nobymy = true;
         this.kyciwaqu();
         this.fydyw = getTimer() + _arg_1.ser;
         battleService.getBattleRunner().wop(this);
      }
      
      private function kyciwaqu() : void
      {
         if(this.hise.parent == null)
         {
            tykih.qocuwo().addChild(this.hise);
            display.stage.addEventListener(Event.RESIZE,this.onStageResize);
            this.setPosition();
         }
      }
      
      private function onStageResize(_arg_1:Event) : void
      {
         this.setPosition();
      }
      
      private function setPosition() : void
      {
         this.hise.x = display.stage.stageWidth - this.hise.width >> 1;
         this.hise.y = display.stage.stageHeight - this.hise.height >> 1;
      }
      
      private function jago() : void
      {
         if(!this.nobymy)
         {
            return;
         }
         this.nobymy = false;
         this.supe();
         battleService.getBattleRunner().bapucic(this);
      }
      
      private function supe() : void
      {
         if(this.hise.parent != null)
         {
            this.hise.parent.removeChild(this.hise);
            display.stage.removeEventListener(Event.RESIZE,this.onStageResize);
         }
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         this.hise.seconds = Math.max((this.fydyw - _arg_1) / 1000,0);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.supe();
         battleEventDispatcher.kujo(Fukodybiz,this);
         battleEventDispatcher.kujo(Ditor,this);
      }
   }
}

