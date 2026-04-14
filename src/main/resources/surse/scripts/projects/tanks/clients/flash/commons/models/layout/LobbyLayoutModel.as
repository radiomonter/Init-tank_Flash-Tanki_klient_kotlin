package projects.tanks.clients.flash.commons.models.layout
{
   import alternativa.osgi.OSGi;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class LobbyLayoutModel implements ILobbyLayout, ObjectLoadListener, ObjectUnloadListener
   {
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      public static var network:Network;
      
      public function LobbyLayoutModel()
      {
         super();
      }
      
      public function switchGarage() : void
      {
         network = OSGi.getInstance().getService(INetworker) as Network;
         network.send("lobby;switch_garage");
      }
      
      public function switchBattleSelect() : void
      {
         network = OSGi.getInstance().getService(INetworker) as Network;
         network.send("lobby;switch_battle_select");
      }
      
      public function switchPayment() : void
      {
         network = OSGi.getInstance().getService(INetworker) as Network;
         network.send("lobby;show_payment");
      }
      
      public function exitFromBattle() : void
      {
         network = OSGi.getInstance().getService(INetworker) as Network;
         network.send("lobby;exitFromBattle;" + LayoutState.BATTLE_SELECT.name);
      }
      
      public function exitFromBattleToState(_arg_1:LayoutState) : void
      {
         network = OSGi.getInstance().getService(INetworker) as Network;
         network.send("lobby;exitFromBattle;" + _arg_1.name);
      }
      
      public function objectLoaded() : void
      {
      }
      
      public function objectUnloaded() : void
      {
      }
   }
}

