package obfuscation.qanyfi
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.info.Cohyko;
   import alternativa.tanks.model.info.Gigymo;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import alternativa.tanks.view.battleinfo.dm.BattleInfoDmParams;
   import obfuscation.gilapu.Vosu;
   import obfuscation.qaluvyjy.Pewutagaz;
   import obfuscation.qaluvyjy.Wipyb;
   import obfuscation.qikumuza.Dot;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   import projects.tanks.client.battleselect.model.info.Qaru;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   
   public class BattleDmInfoModel extends Wipyb implements Pewutagaz, IObjectLoadListener, ObjectUnloadListener
   {
      
      [Inject]
      public static var battleInfoFormService:IBattleInfoFormService;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      [Inject]
      public static var resourceRegistry:ResourceRegistry;
      
      [Inject]
      public static var doqa:BattleFormatUtil;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var jywa:ServerFightCommandAlreadySentFlag;
      
      private var wag:Boolean = false;
      
      public function BattleDmInfoModel()
      {
         super();
         this.jywa = new ServerFightCommandAlreadySentFlag();
      }
      
      public function addUser(_arg_1:BattleInfoUser) : void
      {
         battleInfoFormService.felah(_arg_1);
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
         var _local_2:BattleInfoDmParams = new BattleInfoDmParams();
         _local_2.users = getInitParam().users;
         _local_2.battleMode = _local_1.battleMode;
         _local_2.battleName = _local_1.name;
         _local_2.previewResource = Gigymo(object.adapt(Gigymo)).getPreviewResource();
         _local_2.battleItemId = _local_1.itemId;
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
         battleInfoFormService.somodaky(_local_2);
         battleInfoFormService.addEventListener(BattleInfoViewEvent.ENTER_DM,getFunctionWrapper(this.onEnterDm));
      }
      
      public function objectUnloaded() : void
      {
         battleInfoFormService.removeEventListener(BattleInfoViewEvent.ENTER_DM,getFunctionWrapper(this.onEnterDm));
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      public function updateUserKills(_arg_1:String, _arg_2:int) : void
      {
         battleInfoFormService.updateUserScore(_arg_1,_arg_2);
      }
      
      private function onEnterDm(_arg_1:BattleInfoViewEvent) : void
      {
         trackerService.trackEvent("battleList","StartDMBattle","");
         server.cuduracir();
      }
      
      public function leliwili() : void
      {
         this.cebimomos();
      }
      
      private function defitoto() : void
      {
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,getFunctionWrapper(this.socut));
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR),Vector.<String>([localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR_BUTTON_ENTER),localeService.getText(TanksLocale.TEXT_ALERT_ANSWER_CANCEL)]));
         this.wag = true;
      }
      
      private function socut(_arg_1:AlertServiceEvent) : void
      {
         this.wag = false;
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,getFunctionWrapper(this.socut));
         if(_arg_1.typeButton == localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR_BUTTON_ENTER))
         {
            this.mynyfed();
         }
      }
      
      public function equipmentNotMatchConstraints() : void
      {
         this.cebimomos();
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_ERROR_EQUIPMENT_NOT_MATCH_CONSTRAINTS),Vector.<String>([localeService.getText(TanksLocale.TEXT_CLOSE_LABEL)]));
      }
      
      private function mynyfed() : void
      {
         if(this.lojuhy())
         {
            this.liguneca();
            server.cuduracir();
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
   }
}

class ServerFightCommandAlreadySentFlag
{
   
   public function ServerFightCommandAlreadySentFlag()
   {
      super();
   }
}
