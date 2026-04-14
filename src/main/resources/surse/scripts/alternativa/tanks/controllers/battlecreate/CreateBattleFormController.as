package alternativa.tanks.controllers.battlecreate
{
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.view.battlecreate.ICreateBattleFormView;
   import alternativa.types.Long;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.net.SharedObject;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import obfuscation.fabuqy.Nukoki;
   import obfuscation.fabuqy.Qumafi;
   import obfuscation.fabuqy.Suvozimi;
   import obfuscation.gybivyveq.Tiz;
   import obfuscation.hifoped.Nywehohal;
   import obfuscation.qedajyt.Juva;
   import obfuscation.qikumuza.Dot;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   import utils.preview.IImageResource;
   import utils.preview.ImageResourceLoadingWrapper;
   
   public class CreateBattleFormController extends EventDispatcher implements ICreateBattleFormControllerCallBack, IImageResource
   {
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var achievementService:IAchievementService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var doqa:BattleFormatUtil;
      
      private static const CHANNEL:String = "battlecreate";
      
      private static const MAX_RANK:int = 15000;
      
      private static const MIN_RANK:int = 1;
      
      private static const MIN_RANK_INTERVAL_LENGTH:int = 1;
      
      private static const MIN_PLAYER_FOR_DEATH_MATCH:int = 2;
      
      private static const MIN_PLAYER_FOR_TEAM_BATTLE:int = 1;
      
      private static const STEP_FOR_STEPPER_DM:int = 1;
      
      private static const STEP_FOR_STEPPER_TDM:int = 1;
      
      private static const STEP_FOR_STEPPER_CTF:int = 1;
      
      private static const STEP_FOR_STEPPER_CP:int = 50;
      
      private var _battlesLimits:Vector.<Juva>;
      
      private var _killsLimit:int = 0;
      
      private var _flagsLimit:int = 0;
      
      private var _dominationScore:int = 0;
      
      private var _timeLimitInSec:int = 900;
      
      private var _maxPeopleCount:int;
      
      private var _battleMode:Suvozimi = Suvozimi.DM;
      
      private var _view:ICreateBattleFormView;
      
      private var _mapThemes:Dictionary = new Dictionary();
      
      private var _currentRank:int = -1;
      
      private var _mapsParams:Array;
      
      private var _checkedBattleNameTimer:Timer;
      
      private var _battleNameBeforeCheck:String;
      
      private var _mapParamsForCurrentRank:Array;
      
      private var _isAutoName:Boolean;
      
      private var _isCheckedServerBattleName:Boolean;
      
      private var _themeName:String;
      
      private var _loadingPreviewId:Long;
      
      private var _isShowForm:Boolean;
      
      private var sah:int;
      
      public function CreateBattleFormController(_arg_1:Vector.<Juva>, _arg_2:int, _arg_3:Vector.<IGameObject>, _arg_4:ICreateBattleFormView)
      {
         super();
         this._view = _arg_4;
         this.init(_arg_1,_arg_2,_arg_3);
      }
      
      private function init(_arg_1:Vector.<Juva>, _arg_2:int, _arg_3:Vector.<IGameObject>) : void
      {
         this._view.setCallBack(this);
         this._checkedBattleNameTimer = new Timer(1200);
         this._checkedBattleNameTimer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._battlesLimits = _arg_1;
         this._view.setMaxRankRange(_arg_2 - 1);
         this._view.setRankIntervalRestriction(MIN_RANK,MAX_RANK,MIN_RANK_INTERVAL_LENGTH);
         this._view.resetCheckBox();
         this._view.luz(this.jeqymopeq());
         this.parseMapsParams(_arg_3);
      }
      
      private function parseMapsParams(_arg_1:Vector.<IGameObject>) : void
      {
         var _local_2:IGameObject = null;
         var _local_3:Nywehohal = null;
         var _local_4:CreateBattleMapParams = null;
         var _local_5:Dot = null;
         var _local_7:int = 0;
         this._mapsParams = new Array();
         var _local_6:int = int(_arg_1.length);
         while(_local_7 < _local_6)
         {
            _local_2 = _arg_1[_local_7];
            _local_3 = Nywehohal(_local_2.adapt(Nywehohal));
            _local_4 = new CreateBattleMapParams();
            _local_4.index = _local_7;
            _local_4.id = _local_3.misapyju();
            _local_4.previewResource = _local_3.getPreviewResource();
            _local_4.gameName = _local_3.getName();
            _local_4.maxPeople = _local_3.tafumu();
            _local_4.maxRank = _local_3.getMaxRank();
            _local_4.minRank = _local_3.getMinRank();
            _local_4.themeName = _local_3.getThemeName();
            _local_4.theme = _local_3.rujer();
            _local_4.battleModes = _local_3.der();
            _local_4.enabled = _local_3.isEnabled();
            _local_5 = Dot(_local_2.adapt(Dot));
            _local_4.clanName = _local_5.getClanName();
            _local_4.clanLink = _local_5.getClanLink();
            _local_4.matchmakingMark = _local_3.hasMatchmakingMark();
            this._mapsParams.push(_local_4);
            _local_7++;
         }
      }
      
      public function setPreviewResource(_arg_1:ImageResource) : void
      {
         if(this._loadingPreviewId == _arg_1.id)
         {
            this._view.setPreview(_arg_1.data);
         }
      }
      
      public function onPlayersNumberChange() : void
      {
         this._maxPeopleCount = this._view.getNumberPlayers();
      }
      
      public function onTimeLimitChange() : void
      {
         this._timeLimitInSec = this._view.getTimeLimit() * 60;
         if(this._isCheckedServerBattleName)
         {
            this.checkedCorrectBattleParams();
         }
      }
      
      public function onScoreLimitChange() : void
      {
         switch(this._battleMode)
         {
            case Suvozimi.DM:
            case Suvozimi.TDM:
            case Suvozimi.JGR:
               this._killsLimit = this._view.getScoreLimit();
               break;
            case Suvozimi.CTF:
               this._flagsLimit = this._view.getScoreLimit();
               break;
            case Suvozimi.CP:
               this._dominationScore = this._view.getScoreLimit();
         }
         if(this._isCheckedServerBattleName)
         {
            this.checkedCorrectBattleParams();
         }
      }
      
      public function onBattleNameChange() : void
      {
         this._view.blockedStartButton();
         this._checkedBattleNameTimer.stop();
         if(this._view.getBattleNameLength() != 0)
         {
            this._view.hideInvalidRectangleBattleName();
            this._isCheckedServerBattleName = false;
            this._checkedBattleNameTimer.start();
         }
         else
         {
            this._view.showInvalidRectangleBattleName();
         }
      }
      
      public function onBattleNameInFocus() : void
      {
         if(this._view.getBattleName() == this.getAutoName())
         {
            this._isAutoName = false;
            this._view.setBattleName("");
            this._view.showInvalidRectangleBattleName();
            this._view.blockedStartButton();
         }
      }
      
      public function onBattleNameOutFocus() : void
      {
         if(this._view.getBattleNameLength() == 0)
         {
            this.setAutoNameBattle();
            if(this.isBattleParamsCorrect())
            {
               this._view.unBlockedStartButton();
            }
         }
      }
      
      public function onSelected(_arg_1:Suvozimi) : void
      {
         this._battleMode = _arg_1;
         var _local_2:int = this._battlesLimits[this._battleMode.value].timeLimitInSec;
         if(this._timeLimitInSec > _local_2)
         {
            this._timeLimitInSec = _local_2;
         }
         switch(this._battleMode)
         {
            case Suvozimi.DM:
               this.setTypeBattleDM();
               return;
            case Suvozimi.TDM:
               this.setTypeBattleTDM();
               return;
            case Suvozimi.CTF:
               this.setTypeBattleCtf();
               return;
            case Suvozimi.CP:
               this.setTypeBattleDomination();
               return;
            case Suvozimi.JGR:
               this.setTypeBattleJgr();
         }
      }
      
      private function setTypeBattleDM() : void
      {
         this._view.setTypeBattle(this._battleMode);
         var _local_1:int = int(this.getSelectedMapParams().maxPeople);
         this._maxPeopleCount = _local_1;
         this._view.setSettingsPlayersLimit(MIN_PLAYER_FOR_DEATH_MATCH,_local_1,this._maxPeopleCount);
         this._view.setSettingsTimeLimit(0,this._battlesLimits[this._battleMode.value].timeLimitInSec / 60,this._timeLimitInSec / 60);
         this._view.setSettingsScoreLimit(0,this._battlesLimits[this._battleMode.value].scoreLimit,this._killsLimit,STEP_FOR_STEPPER_DM);
         this._view.setNameAndIconKillsLimitStepper();
         this._view.setNameMaxPlayersStepper();
         if(this._isAutoName)
         {
            this.setAutoNameBattle();
         }
      }
      
      private function setTypeBattleTDM() : void
      {
         this._view.setTypeBattle(this._battleMode);
         var _local_1:int = int(int(this.getSelectedMapParams().maxPeople) / 2);
         this._maxPeopleCount = _local_1;
         this._view.setSettingsPlayersLimit(MIN_PLAYER_FOR_TEAM_BATTLE,_local_1,this._maxPeopleCount);
         this._view.setSettingsTimeLimit(0,this._battlesLimits[this._battleMode.value].timeLimitInSec / 60,this._timeLimitInSec / 60);
         this._view.setSettingsScoreLimit(0,this._battlesLimits[this._battleMode.value].scoreLimit,this._killsLimit,STEP_FOR_STEPPER_TDM);
         this._view.setNameAndIconKillsLimitStepper();
         this._view.setNameMaxPlayersTeamStepper();
         if(this._isAutoName)
         {
            this.setAutoNameBattle();
         }
      }
      
      private function setTypeBattleCtf() : void
      {
         this._view.setTypeBattle(this._battleMode);
         var _local_1:int = int(int(this.getSelectedMapParams().maxPeople) / 2);
         this._maxPeopleCount = _local_1;
         this._view.setSettingsPlayersLimit(MIN_PLAYER_FOR_TEAM_BATTLE,_local_1,this._maxPeopleCount);
         this._view.setSettingsTimeLimit(0,this._battlesLimits[this._battleMode.value].timeLimitInSec / 60,this._timeLimitInSec / 60);
         this._view.setSettingsScoreLimit(0,this._battlesLimits[this._battleMode.value].scoreLimit,this._flagsLimit,STEP_FOR_STEPPER_CTF);
         this._view.setNameAndIconFlagsStepper();
         this._view.setNameMaxPlayersTeamStepper();
         if(this._isAutoName)
         {
            this.setAutoNameBattle();
         }
      }
      
      private function setTypeBattleDomination() : void
      {
         this._view.setTypeBattle(this._battleMode);
         var _local_1:int = int(int(this.getSelectedMapParams().maxPeople) / 2);
         this._maxPeopleCount = _local_1;
         this._view.setSettingsPlayersLimit(MIN_PLAYER_FOR_TEAM_BATTLE,_local_1,this._maxPeopleCount);
         this._view.setSettingsTimeLimit(0,this._battlesLimits[this._battleMode.value].timeLimitInSec / 60,this._timeLimitInSec / 60);
         this._view.setSettingsScoreLimit(0,this._battlesLimits[this._battleMode.value].scoreLimit,this._dominationScore,STEP_FOR_STEPPER_CP);
         this._view.setNameAndIconDominationStepper();
         this._view.setNameMaxPlayersTeamStepper();
         if(this._isAutoName)
         {
            this.setAutoNameBattle();
         }
      }
      
      private function setTypeBattleJgr() : void
      {
         this._view.setTypeBattle(this._battleMode);
         var _local_1:int = int(int(this.getSelectedMapParams().maxPeople) / 2);
         this._maxPeopleCount = _local_1;
         this._view.setSettingsPlayersLimit(MIN_PLAYER_FOR_TEAM_BATTLE,_local_1,this._maxPeopleCount);
         this._view.setSettingsTimeLimit(0,this._battlesLimits[this._battleMode.value].timeLimitInSec / 60,this._timeLimitInSec / 60);
         this._view.setSettingsScoreLimit(0,this._battlesLimits[this._battleMode.value].scoreLimit,this._flagsLimit,STEP_FOR_STEPPER_DM);
         this._view.setNameAndIconKillsLimitStepper();
         this._view.setNameMaxPlayersTeamStepper();
         if(this._isAutoName)
         {
            this.setAutoNameBattle();
         }
      }
      
      public function onMapChange() : void
      {
         this.updateThemes();
         this.updateParams();
      }
      
      public function onThemeChange() : void
      {
         this._themeName = this._view.getSelectedThemeItem().themeName;
         this.updateParams();
      }
      
      private function updateParams() : void
      {
         this.updateRangeRank();
         this.setAvailableBattleTypes();
         this.selectBattleType(this._battleMode);
         this.saveMapParamInStorage();
         this.updatePreview();
      }
      
      private function updatePreview() : void
      {
         var _local_1:ImageResource = this.getSelectedMapParams().previewResource;
         if(_local_1.isLazy && !_local_1.isLoaded)
         {
            this._loadingPreviewId = _local_1.id;
            _local_1.loadLazyResource(new ImageResourceLoadingWrapper(this));
         }
         this._view.setPreview(_local_1.data);
      }
      
      public function destroy() : void
      {
         this._checkedBattleNameTimer.stop();
         this._checkedBattleNameTimer.removeEventListener(TimerEvent.TIMER,this.onTimer);
         this._checkedBattleNameTimer = null;
         this._view.destroy();
         this._view = null;
      }
      
      public function showForm(_arg_1:int) : void
      {
         this._isShowForm = true;
         if(this._currentRank != _arg_1)
         {
            this._currentRank = _arg_1;
            if(this._currentRank < MIN_RANK)
            {
               this._currentRank = MIN_RANK;
            }
            this._view.setCurrentRank(this._currentRank);
            this.updateAvailableMaps();
            this.selectDefaultMap();
         }
         achievementService.showStartButtonHelper();
         this.setAutoNameBattle();
         this._view.show();
      }
      
      public function setRank(_arg_1:int) : void
      {
         if(this._isShowForm)
         {
            this.showForm(_arg_1);
         }
      }
      
      public function hideForm() : void
      {
         this._isShowForm = false;
         this._checkedBattleNameTimer.stop();
         this._view.hide();
         achievementService.hideStartButtonHelper();
      }
      
      public function checkedBattleNameResult(_arg_1:String) : void
      {
         this._isCheckedServerBattleName = true;
         this._checkedBattleNameTimer.stop();
         if(this._view.getBattleName() == this._battleNameBeforeCheck && this._battleNameBeforeCheck != _arg_1)
         {
            this._isAutoName = false;
            this._view.setBattleName(_arg_1);
         }
         this._view.resetProgressBattleNameCheckIcon();
         if(this._view.getBattleNameLength() != 0)
         {
            this._view.hideInvalidRectangleBattleName();
         }
         this.checkedCorrectBattleParams();
      }
      
      private function setAutoNameBattle() : void
      {
         this._isAutoName = true;
         this._isCheckedServerBattleName = true;
         this._view.setBattleName(this.getAutoName());
         this._view.hideInvalidRectangleBattleName();
      }
      
      private function checkedCorrectBattleParams() : void
      {
         if(this.isBattleParamsCorrect())
         {
            this._view.unBlockedStartButton();
         }
         else
         {
            this._view.blockedStartButton();
         }
      }
      
      private function isBattleParamsCorrect() : Boolean
      {
         var _local_1:Boolean = false;
         if(this._view.getBattleNameLength() != 0 && (this._view.getTimeLimit() != 0 || this._view.getScoreLimit() != 0))
         {
            _local_1 = true;
         }
         return _local_1;
      }
      
      private function setAvailableBattleTypes() : void
      {
         this._view.setAvailableTypesBattle(this.getSelectedMapParams().battleModes);
      }
      
      private function updateRangeRank() : void
      {
         var _local_1:CreateBattleMapParams = this.getSelectedMapParams();
         var _local_2:int = _local_1.minRank < MIN_RANK ? int(MIN_RANK) : int(_local_1.minRank);
         var _local_3:int = _local_1.maxRank > MAX_RANK ? int(MAX_RANK) : int(_local_1.maxRank);
         var _local_4:int = this._view.getMaxRangRange();
         if(_local_2 < this._currentRank - _local_4)
         {
            _local_2 = this._currentRank - _local_4;
         }
         if(_local_3 > this._currentRank + _local_4)
         {
            _local_3 = this._currentRank + _local_4;
         }
         this._view.setRankIntervalRestriction(_local_2,_local_3,MIN_RANK_INTERVAL_LENGTH);
         var _local_5:int = this._view.getMinRank();
         var _local_6:int = this._view.getMaxRank();
         if(this._currentRank + _local_4 <= this._view.getMaxRangValue())
         {
            this._view.setMaxRang(this._currentRank + _local_4);
         }
         else
         {
            this._view.setMaxRang(this._view.getMaxRangValue());
         }
         _local_6 = this._view.getMaxRank();
         if(_local_6 - this._currentRank < _local_4)
         {
            if(_local_6 - _local_4 >= this._view.getMinRangValue())
            {
               this._view.setMinRang(_local_6 - _local_4);
            }
            else
            {
               this._view.setMinRang(this._view.getMinRangValue());
            }
         }
         else
         {
            this._view.setMinRang(this._currentRank);
         }
      }
      
      private function updateThemes() : void
      {
         var _local_1:Array = null;
         var _local_3:CreateBattleMapParams = null;
         var _local_4:CreateBattleMapParams = null;
         var _local_5:Object = null;
         var _local_2:* = null;
         var _local_6:String = this._view.getSelectMapItem().id;
         var _local_7:Dictionary = this._mapThemes[_local_6];
         if(_local_7 != null)
         {
            _local_1 = new Array();
            for(_local_2 in _local_7)
            {
               _local_4 = this._mapThemes[_local_6][_local_2];
               if(this._currentRank >= _local_4.minRank && this._currentRank <= _local_4.maxRank)
               {
                  _local_1.push({
                     "gameName":_local_2,
                     "id":_local_4.id,
                     "rang":0,
                     "theme":_local_4.theme
                  });
               }
            }
            _local_1.sortOn(["gameName"]);
            this._view.setThemeInfo(_local_1);
            _local_3 = this._mapThemes[this._view.getSelectMapItem().id][this._themeName];
            if(this._themeName != null && this.isMapAndThemeAvailable(_local_3))
            {
               this._view.setSelectMapThemeItemByField("themeName",this._themeName);
            }
            else
            {
               _local_5 = this._view.getSelectedThemeItem();
               this._themeName = _local_5 != null ? _local_5.themeName : null;
            }
            if(_local_1.length > 1)
            {
               this._view.showThemeForMap();
            }
            else
            {
               this._view.hideThemeForMap();
            }
         }
      }
      
      private function isMapAndThemeAvailable(_arg_1:CreateBattleMapParams) : Boolean
      {
         return _arg_1 != null && _arg_1.enabled && this._currentRank >= _arg_1.minRank && this._currentRank <= _arg_1.maxRank;
      }
      
      private function getSelectedMapParams() : CreateBattleMapParams
      {
         return CreateBattleMapParams(this._mapThemes[this._view.getSelectMapItem().id][this._themeName]);
      }
      
      private function updateAvailableMaps() : void
      {
         var _local_1:CreateBattleMapParams = null;
         this._mapThemes = new Dictionary();
         this._mapParamsForCurrentRank = new Array();
         for each(_local_1 in this._mapsParams)
         {
            if(_local_1.enabled && this._currentRank <= _local_1.maxRank)
            {
               if(this._mapThemes[_local_1.id] == undefined)
               {
                  this._mapThemes[_local_1.id] = new Dictionary();
                  _local_1.currentRank = this._currentRank >= _local_1.minRank ? int(0) : int(_local_1.minRank);
                  this._mapParamsForCurrentRank.push(_local_1);
               }
               this._mapThemes[_local_1.id][_local_1.themeName] = _local_1;
            }
         }
         if(this._mapParamsForCurrentRank.length != 0)
         {
            this._mapParamsForCurrentRank.sortOn(["currentRank","gameName"],[Array.NUMERIC,null]);
            this._view.setMapsInfo(this._mapParamsForCurrentRank);
            return;
         }
         throw new ArgumentError("For your rank is not available maps");
      }
      
      private function selectDefaultMap() : void
      {
         var _local_1:String = null;
         var _local_2:SaveMapParams = this.getSaveMapParams();
         var _local_3:CreateBattleMapParams = this.getMapParams(_local_2.mapId,_local_2.themeName);
         if(this.isMapAndThemeAvailable(_local_3))
         {
            _local_1 = _local_3.gameName;
            this._themeName = _local_3.themeName;
         }
         else
         {
            _local_1 = this._mapParamsForCurrentRank[0].gameName;
            this._themeName = this._mapParamsForCurrentRank[0].themeName;
         }
         this._view.selectMap("gameName",_local_1);
         this.onMapChange();
      }
      
      private function getMapParams(_arg_1:Long, _arg_2:String) : CreateBattleMapParams
      {
         var _local_4:int = 0;
         var _local_3:int = int(this._mapsParams.length);
         while(_local_4 < _local_3)
         {
            if(_arg_1 != null && this._mapsParams[_local_4].previewResource.id.low == _arg_1.low && this._mapsParams[_local_4].themeName == _arg_2)
            {
               return this._mapsParams[_local_4];
            }
            _local_4++;
         }
         return null;
      }
      
      private function getSaveMapParams() : SaveMapParams
      {
         var _local_4:int = 0;
         var _local_1:SaveMapParams = new SaveMapParams();
         var _local_2:SharedObject = storageService.getStorage();
         var _local_3:Vector.<Object> = _local_2.data.SelectedMap != null && _local_2.data.SelectedMap is Vector.<Object> ? _local_2.data.SelectedMap as Vector.<Object> : new Vector.<Object>();
         while(_local_4 < _local_3.length)
         {
            if(_local_3[_local_4].userName == userPropertiesService.userName)
            {
               _local_1.mapId = Long.getLong(int(_local_3[_local_4].mapIdHigh),int(_local_3[_local_4].mapIdLow));
               _local_1.themeName = _local_3[_local_4].mapTheme;
               break;
            }
            _local_4++;
         }
         return _local_1;
      }
      
      private function saveMapParamInStorage() : void
      {
         var _local_1:Object = null;
         var _local_5:int = 0;
         var _local_2:SharedObject = storageService.getStorage();
         var _local_3:Vector.<Object> = _local_2.data.SelectedMap != null && _local_2.data.SelectedMap is Vector.<Object> ? _local_2.data.SelectedMap as Vector.<Object> : new Vector.<Object>();
         var _local_4:int = -1;
         while(_local_5 < _local_3.length)
         {
            if(_local_3[_local_5].userName == userPropertiesService.userName)
            {
               _local_4 = _local_5;
               break;
            }
            _local_5++;
         }
         var _local_6:CreateBattleMapParams = this.getSelectedMapParams();
         if(_local_4 != -1)
         {
            _local_3[_local_4].mapIdLow = _local_6.previewResource.id.low;
            _local_3[_local_4].mapIdHigh = _local_6.previewResource.id.high;
            _local_3[_local_4].mapTheme = _local_6.themeName;
         }
         else
         {
            _local_1 = new Object();
            _local_1.userName = userPropertiesService.userName;
            _local_1.mapIdLow = _local_6.previewResource.id.low;
            _local_1.mapIdHigh = _local_6.previewResource.id.high;
            _local_1.mapTheme = _local_6.themeName;
            _local_3.push(_local_1);
         }
         _local_2.data.SelectedMap = _local_3;
      }
      
      private function selectBattleType(_arg_1:Suvozimi) : void
      {
         if(this.isTypeBattleContainedSelectedMap(_arg_1))
         {
            this.onSelected(_arg_1);
         }
         else
         {
            this.onSelected(this.getSelectedMapParams().battleModes[0]);
         }
      }
      
      private function isTypeBattleContainedSelectedMap(_arg_1:Suvozimi) : Boolean
      {
         var _local_2:Boolean = false;
         var _local_4:int = 0;
         var _local_3:Vector.<Suvozimi> = this.getSelectedMapParams().battleModes;
         while(_local_4 < _local_3.length)
         {
            if(_local_3[_local_4] == _arg_1)
            {
               _local_2 = true;
               break;
            }
            _local_4++;
         }
         return _local_2;
      }
      
      public function onCreateBattle() : void
      {
         var _local_1:Qumafi = null;
         if(this.isBattleParamsCorrect())
         {
            _local_1 = new Qumafi();
            _local_1.battleMode = this._battleMode;
            _local_1.fik = new Juva(this._view.getScoreLimit(),this._timeLimitInSec);
            _local_1.mapId = this._view.getSelectedThemeItem().id;
            _local_1.theme = this._view.getSelectedThemeItem().theme;
            _local_1.maxPeopleCount = this._maxPeopleCount;
            _local_1.name = this._view.getBattleName();
            _local_1.privateBattle = this._view.isPrivateBattle;
            _local_1.rankRange = new Nukoki(this._view.getMaxRank(),this._view.getMinRank());
            _local_1.proBattle = this._view.isProBattle;
            if(this._view.isProBattle)
            {
               _local_1.withoutSupplies = this._view.isNoSuppliesBattle;
               _local_1.bitoleho = this._view.isWithoutUpgrades;
               _local_1.withoutBonuses = this._view.isWithoutBonuses;
               _local_1.withoutCrystals = this._view.isWithoutCrystals;
               _local_1.autoBalance = this._view.isAutoBalance;
               _local_1.friendlyFire = this._view.isFriendlyFire;
               _local_1.reArmorEnabled = this._view.isReArmor;
            }
            else
            {
               _local_1.autoBalance = true;
            }
            _local_1.equipmentConstraintsMode = this.tajolawo();
            _local_1.parkourMode = this._view.isProBattle && this.bymo();
            dispatchEvent(new CreateBattleEvent(CreateBattleEvent.CREATE_BATTLE,_local_1));
            this.hideForm();
            achievementService.hideAllBubbles(true);
         }
      }
      
      private function bymo() : Boolean
      {
         return this._view.haqibobej().parkour;
      }
      
      private function tajolawo() : Tiz
      {
         if(this._view.isProBattle)
         {
            return this._view.haqibobej().equipmentConstraintsMode;
         }
         return Tiz.NONE;
      }
      
      private function jeqymopeq() : Vector.<Object>
      {
         this.sah = 0;
         var _local_1:Vector.<Object> = new Vector.<Object>();
         _local_1.push({
            "index":0,
            "gameName":doqa.vosuwol(Tiz.NONE),
            "equipmentConstraintsMode":Tiz.NONE,
            "parkour":false,
            "rang":0
         });
         _local_1.push({
            "index":1,
            "gameName":doqa.vosuwol(Tiz.HORNET_RAILGUN),
            "equipmentConstraintsMode":Tiz.HORNET_RAILGUN,
            "parkour":false,
            "rang":0
         });
         _local_1.push({
            "index":2,
            "gameName":doqa.vosuwol(Tiz.WASP_RAILGUN),
            "equipmentConstraintsMode":Tiz.WASP_RAILGUN,
            "parkour":false,
            "rang":0
         });
         _local_1.push({
            "index":3,
            "gameName":doqa.vosuwol(Tiz.HORNET_WASP_RAILGUN),
            "equipmentConstraintsMode":Tiz.HORNET_WASP_RAILGUN,
            "parkour":false,
            "rang":0
         });
         _local_1.push({
            "index":4,
            "gameName":doqa.sedose(),
            "equipmentConstraintsMode":Tiz.NONE,
            "parkour":true,
            "rang":0
         });
         return _local_1;
      }
      
      public function befume() : void
      {
         var _local_1:Tiz = null;
         if(!this.bymo())
         {
            _local_1 = this.tajolawo();
            if(_local_1 != Tiz.NONE)
            {
               this._view.dotog();
            }
         }
      }
      
      public function niryt() : void
      {
         if(this._view.isReArmor)
         {
            this.doh();
         }
      }
      
      private function doh() : void
      {
         if(!this.bymo())
         {
            this.qywajata();
         }
      }
      
      private function qywajata() : void
      {
         this._view.gogoqeg(this.sah);
      }
      
      private function getAutoName() : String
      {
         return this.getSelectedMapParams().gameName + " " + this._battleMode.name;
      }
      
      private function onTimer(_arg_1:TimerEvent) : void
      {
         this._view.setProgressBattleNameCheckIcon();
         this._view.blockedStartButton();
         this._battleNameBeforeCheck = this._view.getBattleName();
         this._checkedBattleNameTimer.stop();
         dispatchEvent(new CheckBattleNameEvent(CheckBattleNameEvent.CHECK_NAME,this._battleNameBeforeCheck));
      }
   }
}

