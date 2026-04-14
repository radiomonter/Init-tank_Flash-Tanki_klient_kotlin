package obfuscation.rihyj
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Ditor;
   import alternativa.tanks.battle.events.Qamy;
   import flash.utils.getTimer;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Haqaje implements AutoClosable, BattleEventListener, LogicUnit
   {
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private static const hyl:int = 60;
      
      private var wabyrujy:int;
      
      private var _alert:Wotufuduv;
      
      private var wukos:Boolean;
      
      public function Haqaje()
      {
         super();
         this.init();
      }
      
      private static function nevikoru() : Boolean
      {
         return !lobbyLayoutService.isSwitchInProgress() && lobbyLayoutService.isWindowOpenOverBattle();
      }
      
      private static function har() : void
      {
         var _local_1:LayoutState = lobbyLayoutService.getCurrentState();
         if(_local_1 != LayoutState.BATTLE)
         {
            lobbyLayoutService.nyq();
         }
      }
      
      private function init() : void
      {
         battleEventDispatcher.pugu(Qamy,this);
         battleEventDispatcher.pugu(Ditor,this);
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         if(_arg_1 is Qamy)
         {
            this.hicabumek(Qamy(_arg_1));
         }
         else if(_arg_1 is Ditor)
         {
            this.jago();
         }
      }
      
      private function hicabumek(_arg_1:Qamy) : void
      {
         if(this.wukos)
         {
            return;
         }
         this.wukos = true;
         this.wabyrujy = getTimer() + _arg_1.ser;
         battleService.getBattleRunner().wop(this);
      }
      
      private function jago() : void
      {
         if(!this.wukos)
         {
            return;
         }
         this.wukos = false;
         battleService.getBattleRunner().bapucic(this);
         this.destroyAlert();
      }
      
      private function destroyAlert() : void
      {
         if(this.mepir())
         {
            this._alert.removeEventListener(NotificationEndsPausedAlertEvent.RETURN_TO_BATTLE,this.onReturnToBattle);
            this._alert.removeEventListener(NotificationEndsPausedAlertEvent.CLOSE_ALERT,this.meges);
            this._alert.destroy();
            this._alert = null;
         }
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:int = int((this.wabyrujy - _arg_1) / 1000);
         if(_local_3 <= hyl)
         {
            if(this.mepir())
            {
               this._alert.seconds = Math.max(_local_3,0);
            }
            else if(nevikoru())
            {
               this.fyv(_local_3);
            }
         }
      }
      
      private function mepir() : Boolean
      {
         return this._alert != null;
      }
      
      private function fyv(_arg_1:int) : void
      {
         this._alert = new Wotufuduv();
         this._alert.addEventListener(NotificationEndsPausedAlertEvent.RETURN_TO_BATTLE,this.onReturnToBattle);
         this._alert.addEventListener(NotificationEndsPausedAlertEvent.CLOSE_ALERT,this.meges);
         this._alert.seconds = _arg_1;
         this._alert.show();
      }
      
      private function meges(_arg_1:NotificationEndsPausedAlertEvent = null) : void
      {
         this.jago();
      }
      
      private function onReturnToBattle(_arg_1:NotificationEndsPausedAlertEvent) : void
      {
         dialogWindowsDispatcherService.forciblyClose();
         har();
         this.jago();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.destroyAlert();
         battleEventDispatcher.kujo(Qamy,this);
         battleEventDispatcher.kujo(Ditor,this);
      }
   }
}

