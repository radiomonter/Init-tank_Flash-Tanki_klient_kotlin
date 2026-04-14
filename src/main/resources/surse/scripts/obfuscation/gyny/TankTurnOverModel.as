package obfuscation.gyny
{
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.battle.gui.indicators.TurnOverIndicator;
   import alternativa.tanks.models.tank.ITankModel;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import obfuscation.fuco.Doleni;
   import obfuscation.fuco.Redokudi;
   import obfuscation.siw.Bufofav;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class TankTurnOverModel extends Redokudi implements Doleni, BattleEventListener, Bufofav
   {
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private const CHECK_DELAY:int = 100;
      
      private const SHOW_DELAY:int = 4000;
      
      private const RANK_THRESHOLD:int = 5;
      
      private var localUser:IGameObject;
      
      private var timer:Timer;
      
      private var lastTurnedTime:int;
      
      private var wasTurnedOver:Boolean;
      
      private var isInsideBattle:Boolean;
      
      private var indicatorSupport:TurnOverIndicator;
      
      private var clientObject:ClientObject;
      
      public function TankTurnOverModel()
      {
         super();
      }
      
      public function localTankLoaded(clientObject:ClientObject) : void
      {
         this.clientObject = clientObject;
         this.localUser = object;
         this.timer = new Timer(this.CHECK_DELAY);
         this.indicatorSupport = new TurnOverIndicator();
         this.addEventHandlers();
         this.timer.start();
      }
      
      private function checkTurnOverHandler(_arg_1:TimerEvent) : void
      {
         if(this.isTurnedOver())
         {
            if(!this.wasTurnedOver)
            {
               this.lastTurnedTime = getTimer();
               this.wasTurnedOver = true;
            }
         }
         else
         {
            this.wasTurnedOver = false;
         }
         if(this.shouldShowIndicator())
         {
            this.indicatorSupport.show();
         }
         else
         {
            this.indicatorSupport.hide();
         }
      }
      
      private function isTurnedOver() : Boolean
      {
         var _local_1:ITankModel = ITankModel(this.localUser.adapt(ITankModel));
         var _local_2:Tank = _local_1.getTankData(this.clientObject).tank;
         return BattleUtils.hojekaz(_local_2.qiniwu());
      }
      
      private function shouldShowIndicator() : Boolean
      {
         return true;
      }
      
      private function timeSinceTurned() : int
      {
         return 1;
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
      }
      
      private function resetTurnOverState(_arg_1:Boolean) : void
      {
      }
      
      private function addEventHandlers() : void
      {
         this.timer.addEventListener(TimerEvent.TIMER,this.checkTurnOverHandler);
      }
      
      private function removeEventHandlers() : void
      {
         this.timer.removeEventListener(TimerEvent.TIMER,this.checkTurnOverHandler);
      }
      
      public function hydyb() : void
      {
      }
   }
}

