package alternativa.tanks.services.battlereadiness
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.flash.commons.models.layout.notify.ILobbyLayoutNotify;
   import projects.tanks.clients.flash.commons.models.layout.notify.LobbyLayoutNotifyModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Lenadet implements BattleReadinessService
   {
      
      [Inject]
      public static var talofege:BattleService;
      
      [Inject]
      public static var loaderWindowService:ILoaderWindowService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private var cuvoqy:Boolean;
      
      private var jicyhi:Boolean;
      
      public function Lenadet()
      {
         super();
      }
      
      public function reset() : void
      {
         lobbyLayoutService.setBattleReady(false);
         this.cuvoqy = false;
         this.jicyhi = false;
      }
      
      public function sylutysiv() : void
      {
         if(!this.cuvoqy)
         {
            this.cuvoqy = true;
            this.gyniqoq();
         }
      }
      
      public function jiju() : void
      {
         if(!this.jicyhi)
         {
            this.jicyhi = true;
            this.gyniqoq();
         }
      }
      
      public function isBattleReady() : Boolean
      {
         return this.cuvoqy && this.jicyhi;
      }
      
      public function zigak() : Boolean
      {
         return this.cuvoqy;
      }
      
      private function gyniqoq() : void
      {
         if(this.isBattleReady())
         {
            lobbyLayoutService.setBattleReady(true);
            LobbyLayoutNotifyModel(OSGi.getInstance().getService(ILobbyLayoutNotify)).endLayoutSwitch(LayoutState.BATTLE,LayoutState.BATTLE);
            loaderWindowService.hideLoaderWindow();
            talofege.dop();
         }
      }
   }
}

