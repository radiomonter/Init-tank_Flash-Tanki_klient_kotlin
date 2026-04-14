package obfuscation.gyvutup
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.info.Cohyko;
   import alternativa.tanks.model.info.Gigymo;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamParams;
   import obfuscation.bopo.Degah;
   import obfuscation.bopo.Joj;
   import obfuscation.bude.BattleTeam;
   import obfuscation.gilapu.Vosu;
   import obfuscation.qikumuza.Dot;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.service.address.AddressService;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   import projects.tanks.client.battleselect.model.info.Qaru;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   
   public class BattleTeamInfoModel extends Joj implements Degah, IObjectLoadListener, ObjectUnloadListener
   {
      
      [Inject]
      public static var battleInfoFormService:IBattleInfoFormService;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      [Inject]
      public static var addressService:AddressService;
      
      [Inject]
      public static var doqa:BattleFormatUtil;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var jywa:ServerFightCommandAlreadySentFlag;
      
      public function BattleTeamInfoModel()
      {
         super();
      }
      
      public function updateTeamScore(_arg_1:BattleTeam, _arg_2:int) : void
      {
         battleInfoFormService.updateTeamScore(_arg_1,_arg_2);
      }
      
      public function swapTeams() : void
      {
         battleInfoFormService.swapTeams();
      }
      
      public function addUser(_arg_1:BattleInfoUser, _arg_2:BattleTeam) : void
      {
         battleInfoFormService.addUserTeam(_arg_1,_arg_2);
      }
      
      public function pevuje() : void
      {
         battleInfoFormService.qorapoha();
      }
      
      public function objectLoaded() : void
      {
      }
      
      public function objectLoadedPost() : void
      {
         var _local_1:Qaru = Gigymo(object.adapt(Gigymo)).getConstructor();
         var _local_2:BattleInfoTeamParams = new BattleInfoTeamParams();
         _local_2.autoBalance = getInitParam().autoBalance;
         _local_2.friendlyFire = getInitParam().friendlyFire;
         _local_2.scoreBlue = getInitParam().scoreBlue;
         _local_2.scoreRed = getInitParam().scoreRed;
         _local_2.usersBlue = getInitParam().usersBlue;
         _local_2.usersRed = getInitParam().usersRed;
         _local_2.battleMode = _local_1.battleMode;
         _local_2.battleName = _local_1.name;
         _local_2.battleItemId = _local_1.itemId;
         _local_2.previewResource = Gigymo(object.adapt(Gigymo)).getPreviewResource();
         var _local_3:String = "battle/" + _local_1.itemId;
         var _local_4:String = Cohyko.wefyzonyk();
         _local_2.battleUrl = (_local_4 + "#/" + _local_3).replace(/((.+)(\?.*)(#.*))/gi,"$2$4");
         _local_2.clanLink = Dot(_local_1.map.adapt(Dot)).getClanLink();
         _local_2.clanName = Dot(_local_1.map.adapt(Dot)).getClanName();
         _local_2.scoreLimit = _local_1.fik.scoreLimit;
         _local_2.timeLimitInSec = _local_1.fik.timeLimitInSec;
         _local_2.timeLeftInSec = _local_1.timeLeftInSec;
         _local_2.maxRank = _local_1.rankRange.max;
         _local_2.maxPeopleCount = _local_1.maxPeopleCount;
         _local_2.minRank = _local_1.rankRange.min;
         _local_2.proBattle = _local_1.proBattle;
         _local_2.noSupplies = _local_1.withoutSupplies;
         _local_2.spectatorEnabled = _local_1.spectator;
         _local_2.withoutBonuses = _local_1.withoutBonuses;
         _local_2.withoutCrystals = _local_1.withoutCrystals;
         _local_2.proBattleEnterPrice = Vosu(object.adapt(Vosu)).getEnterPrice();
         _local_2.noSuppliesTimeLeftInSec = Vosu(object.adapt(Vosu)).getTimeLeftInSec();
         _local_2.roundStarted = _local_1.roundStarted;
         _local_2.userPaidNoSuppliesBattle = _local_1.userPaidNoSuppliesBattle;
         _local_2.upgradesDisabled = _local_1.bitoleho;
         _local_2.reArmor = _local_1.reArmor;
         _local_2.suvo = doqa.suvo(_local_1.equipmentConstraintsMode,_local_1.parkourMode);
         _local_2.kagalo = doqa.vuqud(_local_1.equipmentConstraintsMode,_local_1.parkourMode);
         battleInfoFormService.difebab(_local_2);
         battleInfoFormService.addEventListener(BattleInfoViewEvent.ENTER_TEAM,getFunctionWrapper(this.onEnterTeam));
      }
      
      public function objectUnloaded() : void
      {
         battleInfoFormService.removeEventListener(BattleInfoViewEvent.ENTER_TEAM,getFunctionWrapper(this.onEnterTeam));
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      public function updateUserScore(_arg_1:String, _arg_2:int) : void
      {
         battleInfoFormService.updateUserScore(_arg_1,_arg_2);
      }
      
      private function onEnterTeam(_arg_1:BattleInfoViewEvent) : void
      {
         trackerService.trackEvent("battleList","StartTeamBattle","");
         server.cuduracir(_arg_1.team);
      }
      
      public function leliwili() : void
      {
         this.cebimomos();
      }
      
      private function defitoto() : void
      {
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,getFunctionWrapper(this.socut));
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR),Vector.<String>([localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR_BUTTON_ENTER),localeService.getText(TanksLocale.TEXT_ALERT_ANSWER_CANCEL)]));
      }
      
      private function socut(_arg_1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,getFunctionWrapper(this.socut));
         if(_arg_1.typeButton == localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR_BUTTON_ENTER))
         {
            this.mynyfed(BattleTeam(getData(BattleTeam)));
         }
      }
      
      public function equipmentNotMatchConstraints() : void
      {
         this.cebimomos();
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_ERROR_EQUIPMENT_NOT_MATCH_CONSTRAINTS),Vector.<String>([localeService.getText(TanksLocale.TEXT_CLOSE_LABEL)]));
      }
      
      private function mynyfed(_arg_1:BattleTeam) : void
      {
         if(this.lojuhy())
         {
            this.liguneca();
            server.cuduracir(_arg_1);
         }
      }
      
      private function liguneca() : void
      {
         putData(ServerFightCommandAlreadySentFlag,this.jywa);
      }
      
      private function cebimomos() : void
      {
         clearData(ServerFightCommandAlreadySentFlag);
      }
      
      private function lojuhy() : Boolean
      {
         return getData(ServerFightCommandAlreadySentFlag) == null;
      }
      
      public function lyfy() : void
      {
      }
   }
}

class ServerFightCommandAlreadySentFlag
{
   
   public function ServerFightCommandAlreadySentFlag()
   {
      super();
   }
}
