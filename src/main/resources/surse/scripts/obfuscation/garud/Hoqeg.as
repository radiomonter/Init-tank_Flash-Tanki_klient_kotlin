package obfuscation.garud
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Kitut;
   import alternativa.tanks.battle.scene3d.Renderer;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import flash.events.Event;
   import obfuscation.poluto.Covize;
   import obfuscation.poluto.Rutyqy;
   
   public class Hoqeg implements BattleEventListener, Renderer
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var norata:BattleInputService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var madilywid:TargetingModeService;
      
      private var docudava:Boolean = false;
      
      private var myj:Boolean = false;
      
      private var kacuno:Rutyqy;
      
      private var mouseState:Covize;
      
      private var currentState:Curah = null;
      
      private var javulomuw:Curah = null;
      
      private var myhop:Rib;
      
      private var fyc:Boolean;
      
      public function Hoqeg(_arg_1:Rib)
      {
         super();
         this.myhop = _arg_1;
         display.stage.addEventListener(Event.DEACTIVATE,this.gaduno);
         battleEventDispatcher.pugu(Kitut,this);
         this.kacuno = new Rutyqy(_arg_1);
         this.mouseState = this.deziwa(_arg_1);
         this.changeState(this.pug(madilywid.visefi()));
         battleService.getBattleScene3D().toqok(this);
      }
      
      protected function deziwa(_arg_1:Rib) : Covize
      {
         return new Covize(_arg_1);
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         this.tick(_arg_2 * 0.001);
      }
      
      public function tick(_arg_1:Number) : void
      {
         if(this.javulomuw != null)
         {
            if(this.currentState != null)
            {
               this.currentState.exit();
            }
            this.myhop.hyjyra();
            this.currentState = this.javulomuw;
            this.currentState.enter();
            this.javulomuw = null;
         }
         if(this.currentState != null)
         {
            if(this.fyc)
            {
               this.currentState.exit();
               this.currentState.enter();
               this.fyc = false;
            }
            this.currentState.tick(_arg_1);
         }
      }
      
      private function gaduno(_arg_1:Event) : void
      {
         this.docudava = false;
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         display.stage.removeEventListener(Event.DEACTIVATE,this.gaduno);
         battleEventDispatcher.kujo(Kitut,this);
         battleService.getBattleScene3D().qahakuve(this);
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         var _local_2:int = 0;
         var _local_3:Kitut = _arg_1 as Kitut;
         if(_local_3 != null)
         {
            _local_2 = _local_3.targetingMode;
            this.changeState(this.pug(_local_2));
         }
      }
      
      protected function changeState(_arg_1:Curah) : void
      {
         this.javulomuw = _arg_1;
      }
      
      protected function pug(_arg_1:int) : Curah
      {
         switch(_arg_1)
         {
            case Sudyhuma.pobyhevam:
               return this.kacuno;
            case Sudyhuma.cuwycagin:
               return this.mouseState;
            default:
               return null;
         }
      }
      
      public function sowiq() : Rib
      {
         return this.myhop;
      }
      
      public function murafi() : void
      {
         this.myhop.jyfudelenu();
         this.myhop.rolo(0);
      }
      
      public function reset() : void
      {
         this.murafi();
         this.fyc = true;
      }
   }
}

