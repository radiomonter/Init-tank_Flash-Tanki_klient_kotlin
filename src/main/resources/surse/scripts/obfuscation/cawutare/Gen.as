package obfuscation.cawutare
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.battleinput.Tyd;
   import fominskiy.utils.Cipe;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.BlurServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.DialogWindowsDispatcherServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Gen
   {
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var dialogService:IDialogsService;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var bafat:BattleInputService;
      
      [Inject]
      public static var battleService:BattleService;
      
      private var muqohopo:Cipe = new Cipe();
      
      public function Gen()
      {
         super();
         battleService.getBattleRunner().wop(this.muqohopo);
         init();
      }
      
      private static function init() : void
      {
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.OPEN,wefaf);
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,jubihecuv);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,higyrun);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,onEndLayoutSwitch);
         blurService.addEventListener(BlurServiceEvent.CLICK_OVERLAY_BATTLE_CONTENT,suk);
         if(!lobbyLayoutService.isSwitchInProgress())
         {
            jubihecuv();
         }
      }
      
      private static function wefaf(_arg_1:DialogWindowsDispatcherServiceEvent = null) : void
      {
         bafat.lock(Tyd.byzidaj);
      }
      
      private static function jubihecuv(_arg_1:DialogWindowsDispatcherServiceEvent = null) : void
      {
         if(!lobbyLayoutService.isWindowOpenOverBattle())
         {
            bafat.unlock(Tyd.byzidaj);
            battleService.getBattleView().setFocus();
         }
      }
      
      private static function higyrun(_arg_1:LobbyLayoutServiceEvent) : void
      {
         blurService.blurBattleContent();
         wefaf();
      }
      
      private static function onEndLayoutSwitch(_arg_1:LobbyLayoutServiceEvent) : void
      {
         if(!lobbyLayoutService.isWindowOpenOverBattle())
         {
            blurService.unblurBattleContent();
            jubihecuv();
         }
      }
      
      private static function suk(_arg_1:BlurServiceEvent) : void
      {
         lobbyLayoutService.closePopupOverBattle();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         battleService.getBattleRunner().bapucic(this.muqohopo);
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.OPEN,wefaf);
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,jubihecuv);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,higyrun);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,onEndLayoutSwitch);
         blurService.removeEventListener(BlurServiceEvent.CLICK_OVERLAY_BATTLE_CONTENT,suk);
         blurService.unblurBattleContent();
      }
   }
}

