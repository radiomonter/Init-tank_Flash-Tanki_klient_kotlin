package alternativa.tanks.view.battlecreate
{
   import alternativa.tanks.controllers.battlecreate.CreateBattleMapParams;
   import alternativa.tanks.controllers.battlecreate.ICreateBattleFormControllerCallBack;
   import alternativa.tanks.controllers.battlecreate.ICreateBattleFormViewCallBack;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.battlecreate.slider.SelectRankSlider;
   import alternativa.tanks.view.battlecreate.slider.SelectRankSliderEvent;
   import alternativa.tanks.view.battleinfo.BattleInfoParamsView;
   import assets.icons.BattleInfoIcons;
   import assets.icons.InputCheckIcon;
   import controls.NumStepper;
   import controls.base.RedButtonBase;
   import controls.base.TankInputBase;
   import controls.checkbox.CheckBoxEvent;
   import controls.checkbox.TankCheckBox;
   import controls.dropdownlist.ComboBoxRenderer;
   import controls.dropdownlist.DropDownList;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.TankWindowWithHeader;
   import forms.events.LoginFormEvent;
   import obfuscation.dup.Nalahuno;
   import obfuscation.fabuqy.Suvozimi;
   import titanomachina.headers.Headers;
   
   public class CreateBattleFormView extends Sprite implements ICreateBattleFormView, ICreateBattleFormViewCallBack
   {
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      private static const GA_CATEGORY:String = "lobby";
      
      private static const GA_ACTION:String = "createBattle";
      
      private static const MIN_FLASH_WIDTH:int = 970;
      
      private static const MIN_FLASH_HEIGHT:int = 530;
      
      private static const HEADER_HEIGHT:int = 60;
      
      private static const MAX_CHARS_BATTLE_NAME:int = 25;
      
      private static const FIRST_COLUMN_X:int = 11;
      
      private static const RIGHT_MARGIN:Number = 11;
      
      private const fyloni:Number = 11;
      
      private var _stage:Stage;
      
      private var _locale:ILocaleCreateBattleForm;
      
      private var _container:DisplayObjectContainer;
      
      private var _isShowThemeComboBox:Boolean;
      
      private var _callback:ICreateBattleFormControllerCallBack;
      
      private var _timeOutResize:uint;
      
      private var _background:TankWindowWithHeader;
      
      private var _battleNameTextInput:TankInputBase;
      
      private var _battleNameCheckIcon:InputCheckIcon;
      
      private var _chooseMapComboBox:DropDownList;
      
      private var _chooseThemeMapComboBox:DropDownList;
      
      private var kiraw:DropDownList;
      
      private var _battleInfo:BattleInfoParamsView;
      
      private var _chooseRankSlider:SelectRankSlider;
      
      private var _chooseTypeBattle:ChooseTypeBattleView;
      
      private var _maxNumberPlayersStepper:NumStepper;
      
      private var _timeLimitStepper:NumStepper;
      
      private var _scoreLimitStepper:NumStepper;
      
      private var _autoBalanceCheckBox:TankCheckBox;
      
      private var _friendlyFireCheckBox:TankCheckBox;
      
      private var _suppliesCheckBox:TankCheckBox;
      
      private var _bonusesCheckBox:TankCheckBox;
      
      private var _crystalsCheckBox:TankCheckBox;
      
      private var _proBattleCheckBox:TankCheckBox;
      
      private var _upgradesCheckBox:TankCheckBox;
      
      private var _privateBattleCheckBox:TankCheckBox;
      
      private var _reArmorCheckBox:TankCheckBox;
      
      private var _startButton:RedButtonBase;
      
      private var _trackedEvents:Dictionary = new Dictionary();
      
      public function CreateBattleFormView(_arg_1:Stage, _arg_2:DisplayObjectContainer, _arg_3:ILocaleCreateBattleForm)
      {
         super();
         this._stage = _arg_1;
         this._container = _arg_2;
         this._locale = _arg_3;
         this.init();
      }
      
      protected function init() : void
      {
         this._background = new TankWindowWithHeader(Headers.getHeaderById("CREATE_BATTLE"));
         addChild(this._background);
         this._battleNameTextInput = new TankInputBase();
         this._battleNameTextInput.maxChars = MAX_CHARS_BATTLE_NAME;
         addChild(this._battleNameTextInput);
         this._battleNameCheckIcon = new InputCheckIcon();
         addChild(this._battleNameCheckIcon);
         this.resetProgressBattleNameCheckIcon();
         this._battleInfo = new BattleInfoParamsView();
         addChild(this._battleInfo);
         this._chooseRankSlider = new SelectRankSlider();
         addChild(this._chooseRankSlider);
         var _local_1:Vector.<String> = new Vector.<String>();
         _local_1.push(this._locale.deathMatchButtonLabel);
         _local_1.push(this._locale.teamDeathMatchButtonLabel);
         _local_1.push(this._locale.captureTheFlagButtonLabel);
         _local_1.push(this._locale.dominationButtonLabel);
         _local_1.push("Джаггернаут");
         var _local_2:Vector.<String> = new Vector.<String>();
         _local_2.push(this._locale.deathMatchButtonShortLabel);
         _local_2.push(this._locale.teamDeathMatchButtonShortLabel);
         _local_2.push(this._locale.captureTheFlagButtonShortLabel);
         _local_2.push(this._locale.dominationButtonShortLabel);
         _local_2.push("JGR");
         this._chooseTypeBattle = new ChooseTypeBattleView(_local_1,_local_2,this);
         addChild(this._chooseTypeBattle);
         this._maxNumberPlayersStepper = new NumStepper();
         this._maxNumberPlayersStepper.label = this._locale.stepperMaxPlayersLabel;
         this._maxNumberPlayersStepper.icon = BattleInfoIcons.PLAYERS;
         addChild(this._maxNumberPlayersStepper);
         this._timeLimitStepper = new NumStepper();
         this._timeLimitStepper.label = this._locale.stepperTimeLimitLabel;
         this._timeLimitStepper.icon = BattleInfoIcons.TIME_LIMIT;
         addChild(this._timeLimitStepper);
         this._scoreLimitStepper = new NumStepper();
         this._scoreLimitStepper.label = this._locale.stepperFlagsLimitLabel;
         this._scoreLimitStepper.icon = BattleInfoIcons.CTF;
         addChild(this._scoreLimitStepper);
         this._proBattleCheckBox = new TankCheckBox(Nalahuno.bafeny);
         this._proBattleCheckBox.label = this._locale.checkBoxSportModeLabel;
         this._proBattleCheckBox.checked = false;
         addChild(this._proBattleCheckBox);
         this._autoBalanceCheckBox = new TankCheckBox(Nalahuno.nerup);
         this._autoBalanceCheckBox.checked = true;
         this._autoBalanceCheckBox.label = this._locale.checkBoxAutoBalanceLabel;
         addChild(this._autoBalanceCheckBox);
         this._friendlyFireCheckBox = new TankCheckBox(Nalahuno.lywivic);
         this._friendlyFireCheckBox.label = this._locale.checkBoxFriendlyFireLabel;
         addChild(this._friendlyFireCheckBox);
         this._suppliesCheckBox = new TankCheckBox(Nalahuno.geta);
         this._suppliesCheckBox.checked = true;
         this._suppliesCheckBox.label = this._locale.checkBoxNoSuppliesLabel;
         addChild(this._suppliesCheckBox);
         this._bonusesCheckBox = new TankCheckBox(Nalahuno.pefehuzic);
         this._bonusesCheckBox.checked = true;
         this._bonusesCheckBox.label = this._locale.checkBoxBonusesLabel;
         addChild(this._bonusesCheckBox);
         this._crystalsCheckBox = new TankCheckBox(Nalahuno.myr);
         this._crystalsCheckBox.checked = true;
         this._crystalsCheckBox.label = this._locale.checkBoxCrystalsLabel;
         addChild(this._crystalsCheckBox);
         this._upgradesCheckBox = new TankCheckBox(Nalahuno.dijy);
         this._upgradesCheckBox.checked = true;
         this._upgradesCheckBox.label = this._locale.checkBoxUpgradesLabel;
         this._upgradesCheckBox.alpha = 0.5;
         this._upgradesCheckBox.enabled = false;
         this._privateBattleCheckBox = new TankCheckBox(Nalahuno.zukugo);
         this._privateBattleCheckBox.label = this._locale.checkBoxPrivateBattleLabel;
         addChild(this._privateBattleCheckBox);
         this._reArmorCheckBox = new TankCheckBox(Nalahuno.jazifa);
         this._reArmorCheckBox.checked = true;
         this._reArmorCheckBox.label = this._locale.checkBoxReArmorLabel;
         addChild(this._reArmorCheckBox);
         this.kiraw = new DropDownList();
         this.kiraw.setRenderer(ComboBoxRenderer);
         addChild(this.kiraw);
         this._startButton = new RedButtonBase();
         this._startButton.label = this._locale.startButtonLabel;
         addChild(this._startButton);
         this._chooseMapComboBox = new DropDownList();
         this._chooseMapComboBox.label = this._locale.mapNameLabel;
         addChild(this._chooseMapComboBox);
         this._chooseThemeMapComboBox = new DropDownList();
         this._chooseThemeMapComboBox.label = this._locale.themeMapNameLabel;
         addChild(this._chooseThemeMapComboBox);
      }
      
      public function setEvents() : void
      {
         this._stage.addEventListener(Event.RESIZE,this.onResize);
         this._battleNameTextInput.addEventListener(LoginFormEvent.TEXT_CHANGED,this.onBattleNameChange);
         this._battleNameTextInput.textField.addEventListener(FocusEvent.FOCUS_IN,this.onBattleNameInFocus);
         this._battleNameTextInput.textField.addEventListener(FocusEvent.FOCUS_OUT,this.onBattleNameOutFocus);
         this._chooseMapComboBox.addEventListener(Event.CHANGE,this.onMapChange);
         this._chooseMapComboBox.addEventListener(Event.OPEN,this.onMapComboBoxOpen);
         this._chooseThemeMapComboBox.addEventListener(Event.OPEN,this.onThemeComboBoxOpen);
         this._chooseThemeMapComboBox.addEventListener(Event.CHANGE,this.onThemeChange);
         this._maxNumberPlayersStepper.addEventListener(Event.CHANGE,this.onPlayersNumberChange);
         this._maxNumberPlayersStepper.addEventListener(MouseEvent.CLICK,this.onPlayersNumberChangeTrack);
         this._timeLimitStepper.addEventListener(Event.CHANGE,this.onTimeLimitChange);
         this._timeLimitStepper.addEventListener(MouseEvent.CLICK,this.onTimeLimitChangeTrack);
         this._scoreLimitStepper.addEventListener(Event.CHANGE,this.onScoreLimitChange);
         this._scoreLimitStepper.addEventListener(MouseEvent.CLICK,this.onScoreLimitChangeTrack);
         this._chooseRankSlider.addEventListener(SelectRankSliderEvent.RANK_LIMIT_CHANGED,this.onRankLimitChanged);
         this._startButton.addEventListener(MouseEvent.CLICK,this.onStartButtonClick);
         this._suppliesCheckBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.onNoSuppliesChange);
         this._proBattleCheckBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.onProBattleChanged);
         this._privateBattleCheckBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.onPrivateBattleChange);
         this._friendlyFireCheckBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.onFriendlyFireChange);
         this._bonusesCheckBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.onBonusesChange);
         this._crystalsCheckBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.onCrystalsChange);
         this._autoBalanceCheckBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.onAutoBalanceChange);
         this._reArmorCheckBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.onReArmorChange);
         this.kiraw.addEventListener(Event.CHANGE,this.befume);
      }
      
      public function removeEvents() : void
      {
         this._stage.removeEventListener(Event.RESIZE,this.onResize);
         this._battleNameTextInput.removeEventListener(LoginFormEvent.TEXT_CHANGED,this.onBattleNameChange);
         this._battleNameTextInput.textField.removeEventListener(FocusEvent.FOCUS_IN,this.onBattleNameInFocus);
         this._battleNameTextInput.textField.removeEventListener(FocusEvent.FOCUS_OUT,this.onBattleNameOutFocus);
         this._chooseMapComboBox.removeEventListener(Event.CHANGE,this.onMapChange);
         this._chooseMapComboBox.removeEventListener(Event.OPEN,this.onMapComboBoxOpen);
         this._chooseThemeMapComboBox.removeEventListener(Event.OPEN,this.onThemeComboBoxOpen);
         this._chooseThemeMapComboBox.removeEventListener(Event.CHANGE,this.onThemeChange);
         this._maxNumberPlayersStepper.removeEventListener(Event.CHANGE,this.onPlayersNumberChange);
         this._maxNumberPlayersStepper.removeEventListener(MouseEvent.CLICK,this.onPlayersNumberChangeTrack);
         this._timeLimitStepper.removeEventListener(Event.CHANGE,this.onTimeLimitChange);
         this._timeLimitStepper.removeEventListener(MouseEvent.CLICK,this.onTimeLimitChangeTrack);
         this._scoreLimitStepper.removeEventListener(Event.CHANGE,this.onScoreLimitChange);
         this._scoreLimitStepper.removeEventListener(MouseEvent.CLICK,this.onScoreLimitChangeTrack);
         this._chooseRankSlider.removeEventListener(SelectRankSliderEvent.RANK_LIMIT_CHANGED,this.onRankLimitChanged);
         this._startButton.removeEventListener(MouseEvent.CLICK,this.onStartButtonClick);
         this._suppliesCheckBox.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.onNoSuppliesChange);
         this._proBattleCheckBox.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.onProBattleChanged);
         this._privateBattleCheckBox.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.onPrivateBattleChange);
         this._friendlyFireCheckBox.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.onFriendlyFireChange);
         this._bonusesCheckBox.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.onBonusesChange);
         this._autoBalanceCheckBox.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.onAutoBalanceChange);
         this._reArmorCheckBox.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.onReArmorChange);
         this.kiraw.removeEventListener(Event.CHANGE,this.befume);
      }
      
      public function onClickTypeBattleButton(_arg_1:Suvozimi) : void
      {
         this._callback.onSelected(_arg_1);
         this.trackOnce("battleTypeChange_" + _arg_1.name);
      }
      
      public function setTypeBattle(_arg_1:Suvozimi) : void
      {
         this._chooseTypeBattle.setTypeBattle(_arg_1);
         this.onProBattleChanged();
      }
      
      public function setProgressBattleNameCheckIcon() : void
      {
         this._battleNameCheckIcon.gotoAndStop(1);
         this._battleNameCheckIcon.visible = true;
      }
      
      public function resetProgressBattleNameCheckIcon() : void
      {
         this._battleNameCheckIcon.gotoAndStop(0);
         this._battleNameCheckIcon.visible = false;
      }
      
      public function showInvalidRectangleBattleName() : void
      {
         this._battleNameTextInput.validValue = false;
      }
      
      public function hideInvalidRectangleBattleName() : void
      {
         this._battleNameTextInput.validValue = true;
      }
      
      public function setBattleName(_arg_1:String) : void
      {
         this._battleNameTextInput.value = _arg_1;
      }
      
      public function getBattleName() : String
      {
         return this._battleNameTextInput.value;
      }
      
      public function getBattleNameLength() : int
      {
         return this._battleNameTextInput.textField.length;
      }
      
      public function blockedStartButton() : void
      {
         this._startButton.enable = false;
      }
      
      public function unBlockedStartButton() : void
      {
         this._startButton.enable = true;
      }
      
      public function resetCheckBox() : void
      {
         this._privateBattleCheckBox.checked = false;
         this.onProBattleChanged();
      }
      
      public function get isPrivateBattle() : Boolean
      {
         return this._privateBattleCheckBox.checked;
      }
      
      public function get isAutoBalance() : Boolean
      {
         return this._autoBalanceCheckBox.checked;
      }
      
      public function get isFriendlyFire() : Boolean
      {
         return this._friendlyFireCheckBox.checked;
      }
      
      public function get isNoSuppliesBattle() : Boolean
      {
         return !this._suppliesCheckBox.checked;
      }
      
      public function get isWithoutBonuses() : Boolean
      {
         return !this._bonusesCheckBox.checked;
      }
      
      public function get isWithoutCrystals() : Boolean
      {
         return !this._crystalsCheckBox.checked;
      }
      
      public function get isProBattle() : Boolean
      {
         return this._proBattleCheckBox.checked;
      }
      
      public function get isReArmor() : Boolean
      {
         return this._reArmorCheckBox.checked;
      }
      
      public function get isWithoutUpgrades() : Boolean
      {
         return !this._upgradesCheckBox.checked;
      }
      
      public function setRankIntervalRestriction(_arg_1:int, _arg_2:int, _arg_3:int) : void
      {
         this._chooseRankSlider.minValue = _arg_1;
         this._chooseRankSlider.maxValue = _arg_2;
         this._chooseRankSlider.tickInterval = _arg_3;
      }
      
      public function setMaxRankRange(_arg_1:int) : void
      {
         this._chooseRankSlider.maxRangRange = _arg_1;
      }
      
      public function setMaxRang(_arg_1:int) : void
      {
         this._chooseRankSlider.maxRang = _arg_1;
         this._chooseRankSlider.width = this._battleInfo.width;
      }
      
      public function setMinRang(_arg_1:int) : void
      {
         this._chooseRankSlider.minRang = _arg_1;
         this._chooseRankSlider.width = this._battleInfo.width;
      }
      
      public function setCurrentRank(_arg_1:int) : void
      {
         this._chooseRankSlider.currentRang = _arg_1;
      }
      
      public function getCurrentRang() : int
      {
         return this._chooseRankSlider.currentRang;
      }
      
      public function getMaxRank() : int
      {
         return this._chooseRankSlider.maxRang;
      }
      
      public function getMinRank() : int
      {
         return this._chooseRankSlider.minRang;
      }
      
      public function getMinRangValue() : int
      {
         return this._chooseRankSlider.minValue;
      }
      
      public function getMaxRangValue() : int
      {
         return this._chooseRankSlider.maxValue;
      }
      
      public function getMaxRangRange() : int
      {
         return this._chooseRankSlider.maxRangRange;
      }
      
      public function setCallBack(_arg_1:ICreateBattleFormControllerCallBack) : void
      {
         this._callback = _arg_1;
      }
      
      public function show() : void
      {
         this.setEvents();
         this.onResize(null);
         this.onProBattleChanged();
         if(!this._container.contains(this))
         {
            this._container.addChild(this);
         }
      }
      
      public function hide() : void
      {
         this.removeEvents();
         if(this._container.contains(this))
         {
            this._container.removeChild(this);
         }
      }
      
      public function destroy() : void
      {
         this.removeEvents();
         clearTimeout(this._timeOutResize);
         this._chooseTypeBattle.destroy();
         this._chooseTypeBattle = null;
         this._background = null;
         this._battleNameTextInput = null;
         this._battleNameCheckIcon = null;
         this._battleInfo = null;
         this._chooseRankSlider = null;
         this._maxNumberPlayersStepper = null;
         this._timeLimitStepper = null;
         this._scoreLimitStepper = null;
         this._autoBalanceCheckBox = null;
         this._friendlyFireCheckBox = null;
         this._suppliesCheckBox = null;
         this._proBattleCheckBox = null;
         this._bonusesCheckBox = null;
         this._crystalsCheckBox = null;
         this._upgradesCheckBox = null;
         this._privateBattleCheckBox = null;
         this._reArmorCheckBox = null;
         this._startButton = null;
         this._chooseMapComboBox = null;
         this._chooseThemeMapComboBox = null;
         this._callback = null;
         this._locale = null;
         this._stage = null;
         this._container = null;
         this._trackedEvents = null;
         this.kiraw = null;
      }
      
      public function setAvailableTypesBattle(_arg_1:Vector.<Suvozimi>) : void
      {
         this._chooseTypeBattle.setAvailableTypesBattle(_arg_1);
      }
      
      public function resize(_arg_1:Number, _arg_2:Number, _arg_3:Boolean = true) : void
      {
         var _local_4:* = 520;
         if(this._stage.stageHeight < 720)
         {
            _local_4 = 450;
         }
         var _local_5:Number = int(Math.max(MIN_FLASH_WIDTH,_arg_1)) / 3;
         var _local_6:Number = Math.max(_arg_2 - HEADER_HEIGHT,MIN_FLASH_HEIGHT);
         this._background.width = _local_5;
         this._background.height = _local_6;
         this.x = _local_5 * 2;
         this.y = HEADER_HEIGHT;
         this._battleNameTextInput.x = FIRST_COLUMN_X;
         this._battleNameTextInput.y = this._startButton.y;
         this._battleNameTextInput.width = this._startButton.x - FIRST_COLUMN_X - RIGHT_MARGIN;
         this._battleNameCheckIcon.x = this._startButton.x - 35;
         this._battleNameCheckIcon.y = this._startButton.y + 5;
         this._chooseMapComboBox.x = 11 + this._chooseMapComboBox.getLabelWidth() + 5;
         this._chooseMapComboBox.y = 11;
         this._chooseMapComboBox.height = 274;
         this.resizeMapAndThemeComboBoxes();
         this._battleInfo.width = _local_5 - 22;
         this._battleInfo.height = int(_local_6 - 520);
         this._battleInfo.x = 11;
         this._battleInfo.y = 51;
         this._chooseRankSlider.x = 11;
         this._chooseRankSlider.y = this._battleInfo.y + this._battleInfo.height + 5;
         this._chooseRankSlider.width = this._battleInfo.width;
         this._chooseTypeBattle.resize(this._battleInfo.width,this._chooseTypeBattle.getComponentHeight());
         this._chooseTypeBattle.x = 11;
         this._chooseTypeBattle.y = this._chooseRankSlider.y + this._chooseRankSlider.height + 5;
         var _local_7:int = int(int((_local_5 - this._maxNumberPlayersStepper.width - this._timeLimitStepper.width - this._scoreLimitStepper.width) / 4));
         this._maxNumberPlayersStepper.x = _local_7;
         this._timeLimitStepper.x = this._maxNumberPlayersStepper.width + _local_7 * 2;
         this._scoreLimitStepper.x = this._maxNumberPlayersStepper.width + this._timeLimitStepper.width + _local_7 * 3;
         this._maxNumberPlayersStepper.y = this._timeLimitStepper.y = this._scoreLimitStepper.y = this._chooseTypeBattle.y + 71;
         var _local_8:int = int(_local_5 / 2 + 5);
         this._proBattleCheckBox.x = 11;
         this._proBattleCheckBox.y = this._maxNumberPlayersStepper.y + this._maxNumberPlayersStepper.height - 11;
         this._reArmorCheckBox.x = 11;
         this._reArmorCheckBox.y = this._proBattleCheckBox.y + this._proBattleCheckBox.height + 8;
         this._bonusesCheckBox.x = 11;
         this._bonusesCheckBox.y = this._reArmorCheckBox.y + this._reArmorCheckBox.height + 8;
         this._crystalsCheckBox.x = 11;
         this._crystalsCheckBox.y = this._bonusesCheckBox.y + this._bonusesCheckBox.height + 8;
         this._suppliesCheckBox.x = 11;
         this._suppliesCheckBox.y = this._crystalsCheckBox.y + this._crystalsCheckBox.height + 8;
         this.kiraw.x = _local_8;
         this.kiraw.y = this._proBattleCheckBox.y;
         this.kiraw.width = _local_5 - this.kiraw.x - this.fyloni;
         this.wury();
         this._privateBattleCheckBox.x = _local_8;
         this._privateBattleCheckBox.y = this._proBattleCheckBox.y + this._proBattleCheckBox.height + 8;
         this._autoBalanceCheckBox.x = _local_8;
         this._autoBalanceCheckBox.y = this._privateBattleCheckBox.y + this._privateBattleCheckBox.height + 8;
         this._friendlyFireCheckBox.x = _local_8;
         this._friendlyFireCheckBox.y = this._autoBalanceCheckBox.y + this._autoBalanceCheckBox.height + 8;
         this._upgradesCheckBox.x = _local_8;
         this._startButton.x = _local_5 - this._startButton.width - 11;
         this._startButton.y = _local_6 - 42;
         if(_arg_3)
         {
            this.resizeWithDelay();
         }
      }
      
      private function wury() : void
      {
         this.kiraw.height = 34 + 5 * this.kiraw.rowHeight;
      }
      
      private function resizeWithDelay(_arg_1:int = 200) : void
      {
         clearTimeout(this._timeOutResize);
         this._timeOutResize = setTimeout(this.onResizeWithDelay,_arg_1);
      }
      
      private function onResizeWithDelay() : void
      {
         this.resize(this._stage.stageWidth,this._stage.stageHeight,false);
      }
      
      public function setMapsInfo(_arg_1:Array) : void
      {
         var _local_2:CreateBattleMapParams = null;
         var _local_4:int = 0;
         this._chooseMapComboBox.clear();
         var _local_3:int = int(_arg_1.length);
         while(_local_4 < _local_3)
         {
            _local_2 = _arg_1[_local_4] as CreateBattleMapParams;
            this._chooseMapComboBox.addItem({
               "index":_local_2.index,
               "gameName":_local_2.gameName,
               "id":_local_2.id,
               "minRank":_local_2.minRank,
               "maxRank":_local_2.maxRank,
               "rang":_local_2.currentRank,
               "maxPeople":_local_2.maxPeople,
               "battleModes":_local_2.battleModes,
               "clanName":_local_2.clanName,
               "clanLink":_local_2.clanLink,
               "matchmakingMark":_local_2.matchmakingMark
            });
            _local_4++;
         }
      }
      
      public function setThemeInfo(_arg_1:Array) : void
      {
         var _local_3:int = 0;
         this._chooseThemeMapComboBox.clear();
         var _local_2:int = int(_arg_1.length);
         while(_local_3 < _local_2)
         {
            this._chooseThemeMapComboBox.addItem({
               "gameName":this._locale.getThemeName(_arg_1[_local_3].theme),
               "themeName":_arg_1[_local_3].gameName,
               "id":_arg_1[_local_3].id,
               "rang":_arg_1[_local_3].rang,
               "theme":_arg_1[_local_3].theme
            });
            _local_3++;
         }
         this._chooseThemeMapComboBox.height = 34 + _local_2 * 20;
      }
      
      public function selectMap(_arg_1:String, _arg_2:String) : void
      {
         this._chooseMapComboBox.selectItemByField(_arg_1,_arg_2);
      }
      
      public function setSelectMapThemeItemByField(_arg_1:String, _arg_2:String) : void
      {
         this._chooseThemeMapComboBox.selectItemByField(_arg_1,_arg_2);
      }
      
      public function getSelectMapItem() : Object
      {
         return this._chooseMapComboBox.selectedItem;
      }
      
      public function getSelectedThemeItem() : Object
      {
         return this._chooseThemeMapComboBox.selectedItem;
      }
      
      public function showThemeForMap() : void
      {
         this._isShowThemeComboBox = true;
         this._chooseThemeMapComboBox.visible = this._isShowThemeComboBox;
         this.resizeMapAndThemeComboBoxes();
      }
      
      public function hideThemeForMap() : void
      {
         this._isShowThemeComboBox = false;
         this._chooseThemeMapComboBox.visible = this._isShowThemeComboBox;
         this.resizeMapAndThemeComboBoxes();
      }
      
      public function setPreview(_arg_1:BitmapData) : void
      {
         this._battleInfo.setPreview(_arg_1);
      }
      
      public function setSettingsPlayersLimit(_arg_1:int, _arg_2:int, _arg_3:int) : void
      {
         this._maxNumberPlayersStepper.minValue = _arg_1;
         this._maxNumberPlayersStepper.maxValue = _arg_2;
         this._maxNumberPlayersStepper.value = _arg_3;
      }
      
      public function setSettingsTimeLimit(_arg_1:int, _arg_2:int, _arg_3:int) : void
      {
         this._timeLimitStepper.minValue = _arg_1;
         this._timeLimitStepper.maxValue = _arg_2;
         this._timeLimitStepper.value = _arg_3;
      }
      
      public function setSettingsScoreLimit(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int) : void
      {
         this._scoreLimitStepper.minValue = _arg_1;
         this._scoreLimitStepper.maxValue = _arg_2;
         this._scoreLimitStepper.value = _arg_3;
         this._scoreLimitStepper.step = _arg_4;
      }
      
      public function setNameMaxPlayersStepper() : void
      {
         this._maxNumberPlayersStepper.label = this._locale.stepperMaxPlayersLabel;
      }
      
      public function setNameMaxPlayersTeamStepper() : void
      {
         this._maxNumberPlayersStepper.label = this._locale.stepperMaxTeamPlayersLabel;
      }
      
      public function setNameAndIconKillsLimitStepper() : void
      {
         this._scoreLimitStepper.label = this._locale.stepperKillsLimitLabel;
         this._scoreLimitStepper.icon = BattleInfoIcons.KILL_LIMIT;
      }
      
      public function setNameAndIconFlagsStepper() : void
      {
         this._scoreLimitStepper.label = this._locale.stepperFlagsLimitLabel;
         this._scoreLimitStepper.icon = BattleInfoIcons.CTF;
      }
      
      public function setNameAndIconDominationStepper() : void
      {
         this._scoreLimitStepper.label = this._locale.stepperDominationLimitLabel;
         this._scoreLimitStepper.icon = BattleInfoIcons.CTF;
      }
      
      public function getTimeLimit() : int
      {
         return this._timeLimitStepper.value;
      }
      
      public function getScoreLimit() : int
      {
         return this._scoreLimitStepper.value;
      }
      
      public function getNumberPlayers() : int
      {
         return this._maxNumberPlayersStepper.value;
      }
      
      private function resizeMapAndThemeComboBoxes() : void
      {
         var _local_1:Number = int(Math.max(MIN_FLASH_WIDTH,this._stage.stageWidth)) / 3;
         if(this._isShowThemeComboBox)
         {
            this._chooseMapComboBox.width = int(_local_1 / 2 - this._chooseMapComboBox.x - 11);
            this._chooseThemeMapComboBox.width = int(_local_1 / 2 - this._chooseMapComboBox.x - 10);
            this._chooseThemeMapComboBox.x = int(_local_1 / 2 + this._chooseMapComboBox.x);
         }
         else
         {
            this._chooseMapComboBox.width = _local_1 - this._chooseMapComboBox.x - 11;
         }
         this._chooseThemeMapComboBox.y = 11;
      }
      
      private function onPrivateBattleChange(_arg_1:CheckBoxEvent) : void
      {
         this.trackOnce("privateBattleChange");
      }
      
      private function onRankLimitChanged(_arg_1:SelectRankSliderEvent) : void
      {
         this.trackOnce("rankLimitChange");
      }
      
      private function onStartButtonClick(_arg_1:MouseEvent) : void
      {
         this._callback.onCreateBattle();
         this.trackOnce("startBattle");
      }
      
      private function onResize(_arg_1:Event) : void
      {
         this.resize(this._stage.stageWidth,this._stage.stageHeight);
      }
      
      private function onBattleNameChange(_arg_1:LoginFormEvent) : void
      {
         this._callback.onBattleNameChange();
         this.trackOnce("battleNameChange");
      }
      
      private function onBattleNameInFocus(_arg_1:FocusEvent) : void
      {
         this._callback.onBattleNameInFocus();
      }
      
      private function onBattleNameOutFocus(_arg_1:FocusEvent) : void
      {
         this._callback.onBattleNameOutFocus();
      }
      
      private function onMapChange(_arg_1:Event) : void
      {
         this._callback.onMapChange();
         this.trackOnce("mapChange");
      }
      
      private function onMapComboBoxOpen(_arg_1:Event) : void
      {
         this.trackOnce("mapComboBoxOpen");
      }
      
      private function onThemeComboBoxOpen(_arg_1:Event) : void
      {
         this.trackOnce("themeComboBoxOpen");
      }
      
      private function onThemeChange(_arg_1:Event) : void
      {
         this._callback.onThemeChange();
         this.trackOnce("themeChange");
      }
      
      private function onPlayersNumberChange(_arg_1:Event) : void
      {
         this._callback.onPlayersNumberChange();
      }
      
      private function onTimeLimitChange(_arg_1:Event) : void
      {
         this._callback.onTimeLimitChange();
      }
      
      private function onScoreLimitChange(_arg_1:Event) : void
      {
         this._callback.onScoreLimitChange();
      }
      
      private function onNoSuppliesChange(_arg_1:CheckBoxEvent) : void
      {
         this.trackOnce("supplyChange");
      }
      
      private function onProBattleChanged(_arg_1:CheckBoxEvent = null) : void
      {
         if(this._proBattleCheckBox.checked)
         {
            this._upgradesCheckBox.visible = true;
            this._bonusesCheckBox.visible = true;
            this._crystalsCheckBox.visible = true;
            this._suppliesCheckBox.visible = true;
            this._reArmorCheckBox.visible = true;
            this._privateBattleCheckBox.visible = true;
            this.kiraw.visible = true;
            if(this._chooseTypeBattle.getSelectedBattleMode() != Suvozimi.DM || this._chooseTypeBattle.getSelectedBattleMode() != Suvozimi.JGR)
            {
               this._friendlyFireCheckBox.visible = true;
               this._autoBalanceCheckBox.visible = true;
            }
            else
            {
               this._friendlyFireCheckBox.visible = false;
               this._autoBalanceCheckBox.visible = false;
            }
         }
         else
         {
            this._upgradesCheckBox.visible = false;
            this._bonusesCheckBox.visible = false;
            this._crystalsCheckBox.visible = false;
            this._suppliesCheckBox.visible = false;
            this._friendlyFireCheckBox.visible = false;
            this._autoBalanceCheckBox.visible = false;
            this._privateBattleCheckBox.visible = false;
            this.kiraw.visible = false;
            this._reArmorCheckBox.visible = false;
         }
         this.trackOnce("proBattleChanged");
      }
      
      private function onFriendlyFireChange(_arg_1:CheckBoxEvent) : void
      {
         this.trackOnce("friendlyFireChange");
      }
      
      private function onBonusesChange(_arg_1:CheckBoxEvent) : void
      {
         this.trackOnce("bonusesChange");
      }
      
      private function onCrystalsChange(_arg_1:CheckBoxEvent) : void
      {
         this.trackOnce("crystalBonusChange");
      }
      
      private function onAutoBalanceChange(_arg_1:CheckBoxEvent) : void
      {
         this.trackOnce("autoBalanceChange");
      }
      
      private function onScoreLimitChangeTrack(_arg_1:MouseEvent) : void
      {
         this.trackOnce("scoreLimitChange");
      }
      
      private function onPlayersNumberChangeTrack(_arg_1:MouseEvent) : void
      {
         this.trackOnce("playersNumberChange");
      }
      
      private function onTimeLimitChangeTrack(_arg_1:MouseEvent) : void
      {
         this.trackOnce("timeLimitChange");
      }
      
      private function onReArmorChange(_arg_1:CheckBoxEvent) : void
      {
         this._callback.niryt();
         this.trackOnce("ReArmorChange");
      }
      
      private function befume(_arg_1:Event) : void
      {
         this._callback.befume();
      }
      
      private function trackOnce(_arg_1:String) : void
      {
         if(this._trackedEvents[_arg_1] == null)
         {
            this._trackedEvents[_arg_1] = true;
            trackerService.trackEvent(GA_CATEGORY,GA_ACTION,_arg_1);
         }
      }
      
      public function luz(_arg_1:Vector.<Object>) : void
      {
         var _local_2:int = 0;
         while(_local_2 < _arg_1.length)
         {
            this.kiraw.addItem(_arg_1[_local_2]);
            _local_2++;
         }
      }
      
      public function haqibobej() : Object
      {
         return this.kiraw.selectedItem;
      }
      
      public function dotog() : void
      {
         this._reArmorCheckBox.checked = false;
      }
      
      public function laduw() : void
      {
         this._upgradesCheckBox.checked = false;
      }
      
      public function gogoqeg(_arg_1:int) : void
      {
         this.kiraw.selectItemByField("index",_arg_1);
      }
   }
}

