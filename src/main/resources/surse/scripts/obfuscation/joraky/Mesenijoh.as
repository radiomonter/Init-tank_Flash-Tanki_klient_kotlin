package obfuscation.joraky
{
   import alternativa.tanks.help.IHelpService;
   import obfuscation.nabi.ControlsHelper;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Mesenijoh implements AutoClosable
   {
      
      [Inject]
      public static var helpService:IHelpService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private var controlsHelper:ControlsHelper;
      
      public function Mesenijoh()
      {
         super();
         this.init();
      }
      
      private static function higyrun(_arg_1:LobbyLayoutServiceEvent) : void
      {
         if(_arg_1.state == LayoutState.BATTLE)
         {
            debizev();
         }
      }
      
      private static function debizev() : void
      {
         helpService.unregisterHelper(ControlsHelper.puse,ControlsHelper.vacipa);
      }
      
      private function init() : void
      {
         this.controlsHelper = new ControlsHelper();
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,higyrun);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
      }
      
      private function onEndLayoutSwitch(_arg_1:LobbyLayoutServiceEvent) : void
      {
         if(_arg_1.state == LayoutState.BATTLE)
         {
            this.ziwogy();
         }
      }
      
      private function ziwogy() : void
      {
         helpService.registerHelper(ControlsHelper.puse,ControlsHelper.vacipa,this.controlsHelper,true);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,higyrun);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
         debizev();
         this.controlsHelper = null;
      }
   }
}

