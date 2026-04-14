package obfuscation.garud
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Komahowu;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.service.settings.keybinding.GameActionEnum;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.utils.MathUtils;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   
   public class Rocuva extends Giwomo implements BattleEventListener
   {
      
      [Inject]
      public static var commandService:CommandService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var qefag:KeysBindingService;
      
      private static const loke:int = 1 << qab;
      
      private var listener:Quhob;
      
      private var hisazypy:int;
      
      private var sabubuwi:Boolean = true;
      
      public function Rocuva(param1:Tank, param2:Quhob)
      {
         super(param1);
         this.listener = param2;
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKey);
         display.stage.addEventListener(Event.DEACTIVATE,this.gaduno);
         battleEventDispatcher.pugu(Komahowu,this);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:Komahowu = null;
         if(param1 is Komahowu)
         {
            _loc2_ = Komahowu(param1);
            if(!this.sabubuwi && _loc2_.enabled && !_loc2_.zomujad)
            {
               rolo(0);
            }
            this.sabubuwi = _loc2_.enabled;
         }
      }
      
      private function onKey(param1:KeyboardEvent) : void
      {
         OSGi.clientLog.log("keys","on key %1 %2",param1.keyCode,param1.charCode);
         var _loc2_:* = 0;
         var _loc3_:GameActionEnum = qefag.jikamybu(param1.keyCode);
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:int = kyzoje;
         var _loc5_:* = param1.type == KeyboardEvent.KEY_DOWN;
         switch(_loc3_)
         {
            case GameActionEnum.CHASSIS_FORWARD_MOVEMENT:
               _loc4_ = MathUtils.changeBitValue(kyzoje,cohenylic,_loc5_);
               break;
            case GameActionEnum.CHASSIS_BACKWARD_MOVEMENT:
               _loc4_ = MathUtils.changeBitValue(kyzoje,hecega,_loc5_);
               break;
            case GameActionEnum.CHASSIS_LEFT_MOVEMENT:
               _loc4_ = MathUtils.changeBitValue(kyzoje,lisihusah,_loc5_);
               break;
            case GameActionEnum.CHASSIS_RIGHT_MOVEMENT:
               _loc4_ = MathUtils.changeBitValue(kyzoje,tyn,_loc5_);
         }
         if(_loc4_ != kyzoje)
         {
            _loc2_ = _loc4_ | this.hisazypy;
            rolo(_loc2_);
         }
      }
      
      private function gaduno(param1:Event) : void
      {
         rolo(0);
      }
      
      override protected function verimiji(param1:int) : void
      {
         this.listener.noh(param1);
      }
      
      public function mitug(param1:Boolean) : void
      {
         if(param1)
         {
            this.hisazypy = loke;
         }
         else
         {
            this.hisazypy = 0;
            kyzoje &= ~loke;
         }
      }
      
      [Obfuscation(rename="false")]
      override public function close() : void
      {
         super.close();
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKey);
         display.stage.removeEventListener(Event.DEACTIVATE,this.gaduno);
         battleEventDispatcher.kujo(Komahowu,this);
      }
   }
}

