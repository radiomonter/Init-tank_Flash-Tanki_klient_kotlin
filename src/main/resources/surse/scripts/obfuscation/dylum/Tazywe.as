package obfuscation.dylum
{
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.service.delaymountcategory.IDelayMountCategoryService;
   import obfuscation.nubezeqyr.Cafa;
   import obfuscation.nubezeqyr.Jowum;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.BattleInfoServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Tazywe extends Jowum implements Cafa, ObjectLoadPostListener, ObjectUnloadListener
   {
      
      [Inject]
      public static var cazygova:IDelayMountCategoryService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var logService:LogService;
      
      public function Tazywe()
      {
         super();
      }
      
      private static function necyjiw(_arg_1:BattleInfoServiceEvent) : void
      {
         cazygova.kutaneq();
      }
      
      private static function onBattleUnload(_arg_1:BattleInfoServiceEvent) : void
      {
         cazygova.kutaneq();
      }
      
      public function objectLoadedPost() : void
      {
         if(lobbyLayoutService.inBattle())
         {
            cazygova.minuk(getInitParam());
            battleInfoService.addEventListener(BattleInfoServiceEvent.BATTLE_RESTART,necyjiw);
            battleInfoService.addEventListener(BattleInfoServiceEvent.BATTLE_UNLOAD,onBattleUnload);
         }
      }
      
      public function objectUnloaded() : void
      {
         battleInfoService.removeEventListener(BattleInfoServiceEvent.BATTLE_RESTART,necyjiw);
         battleInfoService.removeEventListener(BattleInfoServiceEvent.BATTLE_UNLOAD,onBattleUnload);
         if(lobbyLayoutService.inBattle())
         {
            cazygova.ticytezi();
         }
      }
   }
}

