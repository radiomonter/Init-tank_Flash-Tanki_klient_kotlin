package alternativa.tanks.controllers.battleinfo
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.controllers.BattleSelectVectorUtil;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamParams;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamView;
   import alternativa.tanks.view.battleinfo.team.IBattleInfoTeamView;
   import alternativa.types.Long;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import obfuscation.bude.BattleTeam;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.UserPropertiesServiceEvent;
   import services.alertservice.AlertAnswer;
   import utils.preview.IImageResource;
   import utils.preview.ImageResourceLoadingWrapper;
   
   public class BattleInfoTeamController extends EventDispatcher implements IImageResource
   {
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      [Inject]
      public static var battleAlertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private var _view:IBattleInfoTeamView;
      
      private var _usersInfoRed:Vector.<BattleInfoUser>;
      
      private var _usersInfoBlue:Vector.<BattleInfoUser>;
      
      private var _countDownTimer:Timer;
      
      private var _countDown:int = 0;
      
      private var _timeLimitInSec:int = 0;
      
      private var _startTimeInSec:int = 0;
      
      private var _setupTime:int;
      
      private var _rememberBattleTeam:BattleTeam;
      
      private var _userAlreadyPaid:Boolean;
      
      private var _proBattle:Boolean;
      
      private var _autoBalance:Boolean;
      
      private var _proBattleEnterPrice:int;
      
      private var _noSuppliesTimeLeftInSec:int;
      
      private var _available:Boolean;
      
      private var _maxPeopleCount:int;
      
      private var _previewLoadingId:Long;
      
      private var _minRank:int;
      
      private var _maxRank:int;
      
      private var _battleItemId:String;
      
      public function BattleInfoTeamController(_arg_1:IBattleInfoTeamView)
      {
         super();
         this._view = _arg_1;
         this.init();
      }
      
      private static function onExitFromBattle(_arg_1:BattleInfoViewEvent) : void
      {
         lobbyLayoutService.exitFromBattle();
      }
      
      private static function onReturnToBattle(_arg_1:BattleInfoViewEvent) : void
      {
         lobbyLayoutService.showBattleSelect();
      }
      
      private function init() : void
      {
         this._countDownTimer = new Timer(500);
         this._usersInfoBlue = new Vector.<BattleInfoUser>();
         this._usersInfoRed = new Vector.<BattleInfoUser>();
      }
      
      public function showForm(_arg_1:BattleInfoTeamParams) : void
      {
         this._proBattle = _arg_1.proBattle;
         this._maxPeopleCount = _arg_1.maxPeopleCount;
         this._userAlreadyPaid = _arg_1.userPaidNoSuppliesBattle;
         this._proBattleEnterPrice = _arg_1.proBattleEnterPrice;
         this._noSuppliesTimeLeftInSec = _arg_1.noSuppliesTimeLeftInSec;
         this._timeLimitInSec = _arg_1.timeLimitInSec;
         this._autoBalance = _arg_1.autoBalance;
         this._minRank = _arg_1.minRank;
         this._maxRank = _arg_1.maxRank;
         this._battleItemId = _arg_1.battleItemId;
         this.setEvents();
         this.updateNoSupplies();
         var _local_2:ImageResource = _arg_1.previewResource;
         if(_local_2.isLazy && !_local_2.isLoaded)
         {
            this._previewLoadingId = _local_2.id;
            _local_2.loadLazyResource(new ImageResourceLoadingWrapper(this));
         }
         this._view.updateInitParams(_arg_1);
         this.onLobbyLayoutStateChange();
         this.updateSettingsTimeLimit(_arg_1.roundStarted,_arg_1.timeLeftInSec);
         this.updateUsersInfo(_arg_1.usersBlue,_arg_1.usersRed);
         this.updateAvailable(userPropertiesService.rank);
         this.updateAvailableEnterInBattle();
         this._view.show();
      }
      
      public function setPreviewResource(_arg_1:ImageResource) : void
      {
         if(this._previewLoadingId == _arg_1.id)
         {
            this._view.setPreview(_arg_1.data);
         }
      }
      
      private function updateNoSupplies() : void
      {
         if(this._proBattle)
         {
            if(this._userAlreadyPaid)
            {
               this._view.hideNoSuppliesAlert();
               this._view.setCostProBattle(0);
            }
            else if(this._noSuppliesTimeLeftInSec == 0)
            {
               this._view.showNoSuppliesAlert();
               this._view.setCostProBattle(this._proBattleEnterPrice);
            }
            else
            {
               this._view.hideNoSuppliesAlert();
               this._view.setCostProBattle(0);
            }
         }
         else
         {
            this._view.hideNoSuppliesAlert();
            this._view.setCostProBattle(0);
         }
      }
      
      private function setEvents() : void
      {
         this._view.addEventListener(BattleInfoViewEvent.EXIT_FROM_BATTLE,onExitFromBattle);
         this._view.addEventListener(BattleInfoViewEvent.RETURN_TO_BATTLE,onReturnToBattle);
         this._view.addEventListener(BattleInfoViewEvent.ENTER_TEAM,this.onEnterTeam);
         this._view.addEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
         userPropertiesService.addEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.onLobbyLayoutStateChange);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onLobbyLayoutStateChange);
      }
      
      private function onUpdateRank(_arg_1:UserPropertiesServiceEvent) : void
      {
         this.updateAvailable(_arg_1.userProperties.rank);
         this.updateAvailableEnterInBattle();
      }
      
      private function updateSettingsTimeLimit(_arg_1:Boolean, _arg_2:int) : void
      {
         this.stopTimerCountDown();
         if(this._timeLimitInSec != 0)
         {
            if(_arg_1)
            {
               this.restartTimerCountDown(_arg_2);
            }
            this._view.setPercentLeft(this._countDown,this._timeLimitInSec);
            this._countDown = _arg_2 > 0 ? int(_arg_2) : int(this._timeLimitInSec);
            this._view.setTime(TimeStringUtils.getTimeStr(this._countDown));
         }
      }
      
      private function updateUsersInfo(_arg_1:Vector.<BattleInfoUser>, _arg_2:Vector.<BattleInfoUser>) : void
      {
         var _local_3:BattleInfoUser = null;
         var _local_4:BattleInfoUser = null;
         var _local_6:int = 0;
         this._usersInfoBlue.length = 0;
         var _local_5:int = int(_arg_1.length);
         while(_local_6 < _local_5)
         {
            _local_3 = _arg_1[_local_6];
            this._usersInfoBlue.push(_local_3);
            this.updateBlueUser(_local_3);
            _local_6++;
         }
         this._usersInfoRed.length = 0;
         _local_5 = int(_arg_2.length);
         _local_6 = 0;
         while(_local_6 < _local_5)
         {
            _local_4 = _arg_2[_local_6];
            this._usersInfoRed.push(_local_4);
            this.updateRedUser(_local_4);
            _local_6++;
         }
      }
      
      private function updateAvailable(_arg_1:int) : void
      {
         if(_arg_1 >= this._minRank && _arg_1 <= 15000)
         {
            this._available = true;
         }
         else
         {
            this._available = false;
         }
      }
      
      public function updateAvailableEnterInBattle() : void
      {
         if(this._available)
         {
            if(this._usersInfoBlue.length < this._maxPeopleCount && (!this._autoBalance || this._usersInfoBlue.length <= this._usersInfoRed.length))
            {
               this._view.enableEnterInBattleBlue();
            }
            else
            {
               this._view.disableEnterInBattleBlue();
            }
            if(this._usersInfoRed.length < this._maxPeopleCount && (!this._autoBalance || this._usersInfoRed.length <= this._usersInfoBlue.length))
            {
               this._view.enableEnterInBattleRed();
            }
            else
            {
               this._view.disableEnterInBattleRed();
            }
         }
         else
         {
            this._view.disableEnterInBattleRed();
            this._view.disableEnterInBattleBlue();
         }
      }
      
      public function hideForm() : void
      {
         this.removeEvents();
         this.stopTimerCountDown();
         this._view.hide();
      }
      
      public function addFormToStage() : void
      {
         this._view.show();
      }
      
      public function removeFormFromStage() : void
      {
         this._view.hide();
      }
      
      private function removeEvents() : void
      {
         this._view.removeEventListener(BattleInfoViewEvent.EXIT_FROM_BATTLE,onExitFromBattle);
         this._view.removeEventListener(BattleInfoViewEvent.RETURN_TO_BATTLE,onReturnToBattle);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.onLobbyLayoutStateChange);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onLobbyLayoutStateChange);
         this._view.removeEventListener(BattleInfoViewEvent.ENTER_TEAM,this.onEnterTeam);
         this._view.removeEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
         userPropertiesService.removeEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
      }
      
      public function destroy() : void
      {
         this.hideForm();
         this.removeEvents();
         this.stopTimerCountDown();
         this._view.destroy();
         this._view = null;
         this._usersInfoBlue = null;
         this._usersInfoRed = null;
         this._countDownTimer = null;
         this._battleItemId = null;
      }
      
      public function updateName(_arg_1:String) : void
      {
         this._view.updateBattleName(_arg_1);
      }
      
      public function addUserTeam(_arg_1:BattleInfoUser, _arg_2:BattleTeam) : void
      {
         if(_arg_2 == BattleTeam.RED)
         {
            this._usersInfoRed.push(_arg_1);
            this.updateRedUser(_arg_1);
         }
         if(_arg_2 == BattleTeam.BLUE)
         {
            this._usersInfoBlue.push(_arg_1);
            this.updateBlueUser(_arg_1);
         }
         this.updateAvailableEnterInBattle();
      }
      
      public function removeUser(_arg_1:String) : void
      {
         if(BattleSelectVectorUtil.getUsersById(this._usersInfoBlue,_arg_1) != null)
         {
            BattleSelectVectorUtil.deleteElementInUsersVector(this._usersInfoBlue,_arg_1);
         }
         else if(BattleSelectVectorUtil.getUsersById(this._usersInfoRed,_arg_1) != null)
         {
            BattleSelectVectorUtil.deleteElementInUsersVector(this._usersInfoRed,_arg_1);
         }
         this._view.removeUser(_arg_1);
         this.updateAvailableEnterInBattle();
      }
      
      public function updateTeamScore(_arg_1:BattleTeam, _arg_2:int) : void
      {
         this._view.updateScore(_arg_1,_arg_2);
      }
      
      public function updateUserScore(_arg_1:String, _arg_2:int) : void
      {
         var _local_3:BattleInfoUser = null;
         var _local_4:BattleInfoUser = BattleSelectVectorUtil.getUsersById(this._usersInfoBlue,_arg_1);
         if(_local_4 != null)
         {
            _local_4.score = _arg_2;
            this.updateBlueUser(_local_4);
         }
         else
         {
            _local_3 = BattleSelectVectorUtil.getUsersById(this._usersInfoRed,_arg_1);
            if(_local_3 != null)
            {
               _local_3.score = _arg_2;
               this.updateRedUser(_local_3);
            }
         }
      }
      
      public function updateUserSuspiciousState(_arg_1:String, _arg_2:Boolean) : void
      {
         var _local_3:BattleInfoUser = null;
         var _local_4:BattleInfoUser = BattleSelectVectorUtil.getUsersById(this._usersInfoBlue,_arg_1);
         if(_local_4 != null)
         {
            _local_4.suspicious = _arg_2;
            this.updateBlueUser(_local_4);
         }
         else
         {
            _local_3 = BattleSelectVectorUtil.getUsersById(this._usersInfoRed,_arg_1);
            if(_local_3 != null)
            {
               _local_3.suspicious = _arg_2;
               this.updateRedUser(_local_3);
            }
         }
      }
      
      private function updateRedUser(_arg_1:BattleInfoUser) : void
      {
         this._view.updatePlayer(BattleInfoTeamView.RED_TEAM,_arg_1.user,_arg_1.score,_arg_1.suspicious);
      }
      
      private function updateBlueUser(_arg_1:BattleInfoUser) : void
      {
         this._view.updatePlayer(BattleInfoTeamView.BLUE_TEAM,_arg_1.user,_arg_1.score,_arg_1.suspicious);
      }
      
      public function swapTeams() : void
      {
         var _local_3:int = 0;
         var _local_1:Vector.<BattleInfoUser> = new Vector.<BattleInfoUser>();
         var _local_2:int = int(this._usersInfoBlue.length);
         while(_local_3 < _local_2)
         {
            _local_1.push(this._usersInfoBlue[_local_3]);
            _local_3++;
         }
         var _local_4:Vector.<BattleInfoUser> = new Vector.<BattleInfoUser>();
         _local_2 = int(this._usersInfoRed.length);
         _local_3 = 0;
         while(_local_3 < _local_2)
         {
            _local_4.push(this._usersInfoRed[_local_3]);
            _local_3++;
         }
         this._view.clearUsersInfo();
         this.updateUsersInfo(_local_4,_local_1);
         this.updateAvailableEnterInBattle();
      }
      
      public function roundStart() : void
      {
         this.restartTimerCountDown(this._timeLimitInSec);
      }
      
      public function roundFinish() : void
      {
         this.stopTimerCountDown();
         this._countDown = 0;
         this._view.setPercentLeft(this._countDown,this._timeLimitInSec);
         this._view.setTime(TimeStringUtils.getTimeStr(this._countDown));
      }
      
      public function battleStop() : void
      {
         this.stopTimerCountDown();
         this._countDown = this._timeLimitInSec;
         this._view.setPercentLeft(this._countDown,this._timeLimitInSec);
         this._view.setTime(TimeStringUtils.getTimeStr(this._countDown));
      }
      
      private function startCountDown() : void
      {
         this._countDownTimer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._countDownTimer.start();
         this.onTimer(null);
      }
      
      private function stopTimerCountDown() : void
      {
         this._countDownTimer.stop();
         this._countDownTimer.removeEventListener(TimerEvent.TIMER,this.onTimer);
      }
      
      private function restartTimerCountDown(_arg_1:int) : void
      {
         this._startTimeInSec = _arg_1;
         this._countDown = _arg_1;
         this._setupTime = getTimer();
         this.stopTimerCountDown();
         this.startCountDown();
      }
      
      private function onTimer(_arg_1:TimerEvent) : void
      {
         var _local_2:int = 0;
         if(this._countDown < 0)
         {
            this._countDownTimer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._countDownTimer.stop();
         }
         else
         {
            this._view.setPercentLeft(this._countDown,this._timeLimitInSec);
            this._view.setTime(TimeStringUtils.getTimeStr(this._countDown));
            _local_2 = getTimer();
            this._countDown = this._startTimeInSec - (_local_2 - this._setupTime) / 1000;
         }
      }
      
      public function durationBattleNoSuppliesIsOverAboniment() : void
      {
         this._noSuppliesTimeLeftInSec = 0;
         this.updateNoSupplies();
         this.updateAvailableEnterInBattle();
      }
      
      private function onEnterTeam(_arg_1:BattleInfoViewEvent) : void
      {
         if(this._proBattle && this._noSuppliesTimeLeftInSec == 0 && !this._userAlreadyPaid)
         {
            if(moneyService.dic(this._proBattleEnterPrice))
            {
               this.showPayedBattleAlert(_arg_1.team);
            }
         }
         else
         {
            this._view.disableEnterInBattleBlue();
            this._view.disableEnterInBattleRed();
            dispatchEvent(_arg_1.clone());
         }
      }
      
      private function showPayedBattleAlert(_arg_1:BattleTeam) : void
      {
         this._rememberBattleTeam = _arg_1;
         var _local_2:Vector.<String> = Vector.<String>([AlertAnswer.ENTER,AlertAnswer.syj]);
         battleAlertService.showAlert(localeService.getText(TanksLocale.zysizo),_local_2);
         battleAlertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onAlertButtonPressed);
      }
      
      private function onAlertButtonPressed(_arg_1:AlertServiceEvent) : void
      {
         battleAlertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onAlertButtonPressed);
         if(_arg_1.typeButton == localeService.getText(TanksLocale.TEXT_BATTLEINFO_PANEL_PAID_BATTLES_ALERT_ANSWER_ENTER))
         {
            dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.ENTER_TEAM,this._rememberBattleTeam));
         }
      }
      
      private function onEnterSpectator(_arg_1:BattleInfoViewEvent) : void
      {
         if(lobbyLayoutService.inBattle())
         {
            lobbyLayoutService.exitFromBattle();
         }
         else
         {
            dispatchEvent(_arg_1.clone());
         }
      }
      
      private function onLobbyLayoutStateChange(_arg_1:LobbyLayoutServiceEvent = null) : void
      {
         if(lobbyLayoutService.isSwitchInProgress())
         {
            this._view.lock();
         }
         else
         {
            this._view.unlock();
         }
         this._view.updateInBattleState();
      }
      
      public function getBattleItemId() : String
      {
         return this._battleItemId;
      }
   }
}

