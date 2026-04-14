package projects.tanks.clients.flash.commons.models.layout.notify
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.loader.ILoaderWindowService2;
   import alternativa.tanks.service.settings.ISettingsService;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutService;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class LobbyLayoutNotifyModel implements ILobbyLayoutNotify
   {
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var loaderWindowService:ILoaderWindowService;
      
      private var inProgress:Boolean = false;
      
      private var origin:LayoutState;
      
      private var lastState:LayoutState;
      
      private var _transitionFormLobbyIntoBattle:Boolean;
      
      public function LobbyLayoutNotifyModel()
      {
         super();
      }
      
      public function beginLayoutSwitch(_arg_1:LayoutState) : void
      {
         if(_arg_1 != null)
         {
            this.lastState = _arg_1;
         }
         if(this.origin == LayoutState.BATTLE_SELECT && _arg_1 == LayoutState.BATTLE)
         {
            this._transitionFormLobbyIntoBattle = true;
         }
         this.beginSwitch();
      }
      
      public function endLayoutSwitch(_arg_1:LayoutState, _arg_2:LayoutState) : void
      {
         this.origin = _arg_1;
         this.lastState = _arg_2;
         this.endSwitch();
      }
      
      public function layoutSwitchPredicted() : void
      {
         this.beginSwitch();
      }
      
      public function cancelPredictedLayoutSwitch() : void
      {
         this.endSwitch();
      }
      
      public function isSwitchInProgress() : Boolean
      {
         return this.inProgress;
      }
      
      public function getCurrentState() : LayoutState
      {
         return this.lastState;
      }
      
      private function beginSwitch() : void
      {
         var _local_1:LobbyLayoutService = null;
         if(!this.inProgress)
         {
            this.inProgress = true;
            _local_1 = LobbyLayoutService(lobbyLayoutService);
            this.showLoader();
            _local_1.dispatchEvent(new LobbyLayoutServiceEvent(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.lastState));
         }
      }
      
      private function endSwitch() : void
      {
         if(this.inProgress)
         {
            this.inProgress = false;
            lobbyLayoutService.dispatchEvent(new LobbyLayoutServiceEvent(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.lastState));
            this.hideLoader();
         }
      }
      
      private function showLoader() : void
      {
         if(this.lastState == LayoutState.BATTLE && ISettingsService(OSGi.getInstance().getService(ISettingsService)).useNewLoader)
         {
            ILoaderWindowService2(OSGi.getInstance().getService(ILoaderWindowService2)).showLoaderWindow();
         }
         else
         {
            loaderWindowService.unlockLoaderWindow();
            loaderWindowService.showLoaderWindow();
         }
      }
      
      private function hideLoader() : void
      {
         ILoaderWindowService2(OSGi.getInstance().getService(ILoaderWindowService2)).hideLoaderWindow();
         loaderWindowService.lockLoaderWindow();
         loaderWindowService.hideLoaderWindow();
      }
      
      public function inBattle() : Boolean
      {
         return this.origin == LayoutState.BATTLE;
      }
   }
}

