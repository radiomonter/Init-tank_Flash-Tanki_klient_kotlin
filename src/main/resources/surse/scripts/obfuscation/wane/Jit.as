package obfuscation.wane
{
   import obfuscation.dykuwiwoz.Holeluki;
   import obfuscation.dykuwiwoz.Weg;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.BattleInviteEnableEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   
   public class Jit extends Holeluki implements Weg, ObjectLoadListener, ObjectUnloadListener
   {
      
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      public function Jit()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         battleInviteService.receiveBattleInvite = getInitParam().receiveBattleInvite;
         battleInviteService.addEventListener(BattleInviteEnableEvent.UPDATE,this.pizugydyr);
      }
      
      private function pizugydyr(_arg_1:BattleInviteEnableEvent) : void
      {
         server.enable(_arg_1.enable);
      }
      
      public function objectUnloaded() : void
      {
         battleInviteService.removeEventListener(BattleInviteEnableEvent.UPDATE,this.pizugydyr);
      }
   }
}

