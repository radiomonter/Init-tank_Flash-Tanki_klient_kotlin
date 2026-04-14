package alternativa.tanks.service.battleinfo
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.controllers.battleinfo.BattleInfoDMController;
   import alternativa.tanks.controllers.battleinfo.BattleInfoTeamController;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import alternativa.tanks.view.battleinfo.LocaleBattleInfo;
   import alternativa.tanks.view.battleinfo.dm.BattleInfoDMView;
   import alternativa.tanks.view.battleinfo.dm.BattleInfoDmParams;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamParams;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamView;
   import flash.events.EventDispatcher;
   import obfuscation.bude.BattleTeam;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class Qesybeloq extends EventDispatcher implements IBattleInfoFormService
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      private static const GA_CATEGORY:String = "lobby";
      
      private var nyke:BattleInfoDMController;
      
      private var tepehas:BattleInfoTeamController;
      
      private var gawidotas:Boolean;
      
      private var gukik:Boolean;
      
      public function Qesybeloq()
      {
         super();
      }
      
      public function vamo() : void
      {
         if(this.gawidotas)
         {
            this.nyke.addFormToStage();
         }
         if(this.gukik)
         {
            this.tepehas.addFormToStage();
         }
      }
      
      public function removeFormFromStage() : void
      {
         if(this.gawidotas)
         {
            this.nyke.removeFormFromStage();
         }
         if(this.gukik)
         {
            this.tepehas.removeFormFromStage();
         }
      }
      
      public function somodaky(_arg_1:BattleInfoDmParams) : void
      {
         if(this.nyke == null)
         {
            this.nyke = new BattleInfoDMController(new BattleInfoDMView(display,new LocaleBattleInfo()));
            this.nyke.addEventListener(BattleInfoViewEvent.ENTER_DM,this.hubu);
            this.nyke.addEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
         }
         this.qosam();
         this.gawidotas = true;
         this.nyke.showForm(_arg_1);
      }
      
      private function hubu(_arg_1:BattleInfoViewEvent) : void
      {
         dispatchEvent(_arg_1.clone());
         trackerService.trackEvent(GA_CATEGORY,"enterBattle","DM");
      }
      
      public function difebab(_arg_1:BattleInfoTeamParams) : void
      {
         if(this.tepehas == null)
         {
            this.tepehas = new BattleInfoTeamController(new BattleInfoTeamView(display,new LocaleBattleInfo()));
            this.tepehas.addEventListener(BattleInfoViewEvent.ENTER_TEAM,this.onEnterTeam);
            this.tepehas.addEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
         }
         this.qosam();
         this.gukik = true;
         this.tepehas.showForm(_arg_1);
      }
      
      public function qorapoha() : void
      {
         if(this.tepehas != null)
         {
            this.tepehas.updateAvailableEnterInBattle();
         }
         if(this.nyke != null)
         {
            this.nyke.updateAvailableEnterInBattle();
         }
      }
      
      private function onEnterTeam(_arg_1:BattleInfoViewEvent) : void
      {
         dispatchEvent(_arg_1.clone());
         trackerService.trackEvent(GA_CATEGORY,"enterBattle","Team");
      }
      
      private function onEnterSpectator(_arg_1:BattleInfoViewEvent) : void
      {
         dispatchEvent(_arg_1.clone());
         trackerService.trackEvent(GA_CATEGORY,"enterBattle","Spectator");
      }
      
      public function qosam() : void
      {
         this.katolerus();
         this.sisysy();
      }
      
      private function katolerus() : void
      {
         if(this.gawidotas)
         {
            this.gawidotas = false;
            this.nyke.hideForm();
         }
      }
      
      private function sisysy() : void
      {
         if(this.gukik)
         {
            this.gukik = false;
            this.tepehas.hideForm();
         }
      }
      
      public function destroy() : void
      {
         if(this.nyke != null)
         {
            this.nyke.removeEventListener(BattleInfoViewEvent.ENTER_DM,this.hubu);
            this.nyke.removeEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
            this.nyke.destroy();
            this.nyke = null;
            this.gawidotas = false;
         }
         if(this.tepehas != null)
         {
            this.tepehas.removeEventListener(BattleInfoViewEvent.ENTER_TEAM,this.onEnterTeam);
            this.tepehas.removeEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
            this.tepehas.destroy();
            this.tepehas = null;
            this.gukik = false;
         }
      }
      
      public function updateName(_arg_1:String) : void
      {
         if(this.gawidotas)
         {
            this.nyke.updateName(_arg_1);
         }
         if(this.gukik)
         {
            this.tepehas.updateName(_arg_1);
         }
      }
      
      public function updateTeamScore(_arg_1:BattleTeam, _arg_2:int) : void
      {
         if(this.gukik)
         {
            this.tepehas.updateTeamScore(_arg_1,_arg_2);
         }
      }
      
      public function addUserTeam(_arg_1:BattleInfoUser, _arg_2:BattleTeam) : void
      {
         if(this.gukik)
         {
            this.tepehas.addUserTeam(_arg_1,_arg_2);
         }
      }
      
      public function felah(_arg_1:BattleInfoUser) : void
      {
         if(this.gawidotas)
         {
            this.nyke.addUser(_arg_1);
         }
      }
      
      public function removeUser(_arg_1:String) : void
      {
         if(this.gawidotas)
         {
            this.nyke.removeUser(_arg_1);
         }
         if(this.gukik)
         {
            this.tepehas.removeUser(_arg_1);
         }
      }
      
      public function updateUserScore(_arg_1:String, _arg_2:int) : void
      {
         if(this.gawidotas)
         {
            this.nyke.updateUserScore(_arg_1,_arg_2);
         }
         if(this.gukik)
         {
            this.tepehas.updateUserScore(_arg_1,_arg_2);
         }
      }
      
      public function updateUserSuspiciousState(_arg_1:String, _arg_2:Boolean) : void
      {
         if(this.gawidotas)
         {
            this.nyke.updateUserSuspiciousState(_arg_1,_arg_2);
         }
         if(this.gukik)
         {
            this.tepehas.updateUserSuspiciousState(_arg_1,_arg_2);
         }
      }
      
      public function swapTeams() : void
      {
         if(this.gukik)
         {
            this.tepehas.swapTeams();
         }
      }
      
      public function roundStart() : void
      {
         if(this.gawidotas)
         {
            this.nyke.roundStart();
         }
         if(this.gukik)
         {
            this.tepehas.roundStart();
         }
      }
      
      public function roundFinish() : void
      {
         if(this.gawidotas)
         {
            this.nyke.roundFinish();
         }
         if(this.gukik)
         {
            this.tepehas.roundFinish();
         }
      }
      
      public function battleStop() : void
      {
         if(this.gawidotas)
         {
            this.nyke.battleStop();
         }
         if(this.gukik)
         {
            this.tepehas.battleStop();
         }
      }
      
      public function wavol() : void
      {
         if(this.gawidotas)
         {
            this.nyke.durationBattleNoSuppliesIsOverAboniment();
         }
         if(this.gukik)
         {
            this.tepehas.durationBattleNoSuppliesIsOverAboniment();
         }
      }
      
      public function getBattleItemId() : String
      {
         if(this.gawidotas)
         {
            return this.nyke.getBattleItemId();
         }
         if(this.gukik)
         {
            return this.tepehas.getBattleItemId();
         }
         return null;
      }
   }
}

