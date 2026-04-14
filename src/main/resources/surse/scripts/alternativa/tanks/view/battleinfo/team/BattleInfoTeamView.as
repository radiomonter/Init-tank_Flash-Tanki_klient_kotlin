package alternativa.tanks.view.battleinfo.team
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.view.battleinfo.BattleInfoParamsView;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import alternativa.tanks.view.battleinfo.ILocaleBattleInfo;
   import alternativa.tanks.view.battleinfo.TeamListRenderer;
   import alternativa.tanks.view.battlelist.forms.BattleBigButton;
   import alternativa.tanks.view.battlelist.forms.NoSubScribeAlert;
   import assets.icons.play_icons_BLUE;
   import assets.icons.play_icons_RED;
   import assets.scroller.color.ScrollThumbSkinBlue;
   import assets.scroller.color.ScrollThumbSkinRed;
   import assets.scroller.color.ScrollTrackBlue;
   import assets.scroller.color.ScrollTrackRed;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import fl.controls.List;
   import fl.data.DataProvider;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.text.TextFieldAutoSize;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.ConfigureScroll;
   import forms.TankWindowWithHeader;
   import obfuscation.bude.BattleTeam;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import titanomachina.headers.Headers;
   
   public class BattleInfoTeamView extends Sprite implements IBattleInfoTeamView
   {
      
      [Inject]
      public static var achievementService:IAchievementService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private static const MIN_FLASH_WIDTH:int = 970;
      
      private static const MIN_FLASH_HEIGHT:int = 530;
      
      private static const HEADER_HEIGHT:int = 60;
      
      public static const RED_TEAM:Boolean = true;
      
      public static const BLUE_TEAM:Boolean = false;
      
      private var _display:IDisplay;
      
      private var _stage:Stage;
      
      private var _locale:ILocaleBattleInfo;
      
      private var _background:TankWindowWithHeader;
      
      private var _battleInfo:BattleInfoParamsView;
      
      private var _listInnerRed:TankWindowInner;
      
      private var _listInnerBlue:TankWindowInner;
      
      private var _noSuppliesAlert:NoSubScribeAlert;
      
      private var _fightButtonRed:BattleBigButton;
      
      private var _fightButtonBlue:BattleBigButton;
      
      private var _exitFromBattleButton:BattleBigButton;
      
      private var _returnToBattleButton:BattleBigButton;
      
      private var _listUsersBlue:List;
      
      private var _listUsersRed:List;
      
      private var _redScoreLabel:LabelBase;
      
      private var _blueScoreLabel:LabelBase;
      
      private var _score:MovieClip;
      
      private var _sizeTeam:int;
      
      private var countRed:int = 0;
      
      private var countBlue:int = 0;
      
      private var _timeOutResize:uint;
      
      private var _dataProviderBlue:DataProvider;
      
      private var _dataProviderRed:DataProvider;
      
      private var _battleItemId:String;
      
      private var _minRank:int;
      
      private var _maxRank:int;
      
      private var _spectatorEnabled:Boolean;
      
      public function BattleInfoTeamView(_arg_1:IDisplay, _arg_2:ILocaleBattleInfo)
      {
         super();
         this._display = _arg_1;
         this._stage = _arg_1.stage;
         this._locale = _arg_2;
         this.init();
      }
      
      private function init() : void
      {
         this._background = new TankWindowWithHeader(Headers.getHeaderById("BATTLE_INFO"));
         addChild(this._background);
         this._battleInfo = new BattleInfoParamsView();
         addChild(this._battleInfo);
         this._listInnerRed = new TankWindowInner(100,100,TankWindowInner.RED);
         this._listInnerRed.showBlink = true;
         addChild(this._listInnerRed);
         this._listInnerBlue = new TankWindowInner(100,100,TankWindowInner.BLUE);
         this._listInnerBlue.showBlink = true;
         addChild(this._listInnerBlue);
         this._listUsersBlue = new List();
         this._listUsersBlue.rowHeight = 20;
         this._listUsersBlue.setStyle("cellRenderer",TeamListRenderer);
         this._listUsersBlue.focusEnabled = false;
         addChild(this._listUsersBlue);
         this._listUsersRed = new List();
         this._listUsersRed.rowHeight = 20;
         this._listUsersRed.setStyle("cellRenderer",TeamListRenderer);
         this._listUsersRed.focusEnabled = false;
         addChild(this._listUsersRed);
         ConfigureScroll.configScrollList(this._listUsersRed,ScrollArrowDownRed,ScrollArrowUpRed,ScrollTrackRed,ScrollThumbSkinRed);
         ConfigureScroll.configScrollList(this._listUsersBlue,ScrollArrowDownBlue,ScrollArrowUpBlue,ScrollTrackBlue,ScrollThumbSkinBlue);
         this._fightButtonRed = new BattleBigButton();
         this._fightButtonRed.label = this._locale.fightButtonLabel;
         this._fightButtonRed.icon = new play_icons_RED(0,0);
         addChild(this._fightButtonRed);
         this._fightButtonBlue = new BattleBigButton();
         this._fightButtonBlue.label = this._locale.fightButtonLabel;
         this._fightButtonBlue.icon = new play_icons_BLUE(0,0);
         addChild(this._fightButtonBlue);
         this._exitFromBattleButton = new BattleBigButton();
         this._exitFromBattleButton.label = this._locale.exitFromBattleButtonLabel;
         addChild(this._exitFromBattleButton);
         this._returnToBattleButton = new BattleBigButton();
         this._returnToBattleButton.label = this._locale.returnToBattleButtonLabel;
         addChild(this._returnToBattleButton);
         this._noSuppliesAlert = new NoSubScribeAlert(this._locale.noSubscribeBattleLabel);
         addChild(this._noSuppliesAlert);
         this._score = new MovieClip();
         addChild(this._score);
         this._redScoreLabel = new LabelBase();
         this._redScoreLabel.size = 22;
         this._redScoreLabel.color = TankWindowInner.RED;
         this._redScoreLabel.x = -74;
         this._redScoreLabel.width = 70;
         this._redScoreLabel.autoSize = TextFieldAutoSize.RIGHT;
         this._score.addChild(this._redScoreLabel);
         this._blueScoreLabel = new LabelBase();
         this._blueScoreLabel.size = 22;
         this._blueScoreLabel.color = TankWindowInner.BLUE;
         this._blueScoreLabel.x = 5;
         this._blueScoreLabel.width = 70;
         this._blueScoreLabel.autoSize = TextFieldAutoSize.LEFT;
         this._score.addChild(this._blueScoreLabel);
         var _local_1:LabelBase = new LabelBase();
         _local_1.size = 22;
         _local_1.text = ":";
         _local_1.x = -4;
         _local_1.y = -2;
         this._score.addChild(_local_1);
         this._score.filters = [new GlowFilter(13434828,0.5)];
         this.onResize();
      }
      
      private function setEvents() : void
      {
         this._stage.addEventListener(Event.RESIZE,this.onResize);
         this._fightButtonRed.addEventListener(MouseEvent.CLICK,this.onFightButtonRedClick);
         this._fightButtonBlue.addEventListener(MouseEvent.CLICK,this.onFightButtonBlueClick);
         this._battleInfo.addEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
         this._exitFromBattleButton.addEventListener(MouseEvent.CLICK,this.onExitFromBattleButtonClick);
         this._returnToBattleButton.addEventListener(MouseEvent.CLICK,this.onReturnToBattleButtonClick);
      }
      
      private function removeEvents() : void
      {
         this._stage.removeEventListener(Event.RESIZE,this.onResize);
         this._fightButtonRed.removeEventListener(MouseEvent.CLICK,this.onFightButtonRedClick);
         this._fightButtonBlue.removeEventListener(MouseEvent.CLICK,this.onFightButtonBlueClick);
         this._battleInfo.removeEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
         this._exitFromBattleButton.removeEventListener(MouseEvent.CLICK,this.onExitFromBattleButtonClick);
         this._returnToBattleButton.removeEventListener(MouseEvent.CLICK,this.onReturnToBattleButtonClick);
      }
      
      public function updateInitParams(_arg_1:BattleInfoTeamParams) : void
      {
         this._battleInfo.setUp(_arg_1.battleName,_arg_1.minRank,_arg_1.maxRank,_arg_1.scoreLimit,_arg_1.timeLimitInSec,_arg_1.autoBalance,_arg_1.friendlyFire,_arg_1.battleUrl,_arg_1.battleMode,_arg_1.noSupplies,_arg_1.withoutBonuses,_arg_1.upgradesDisabled,_arg_1.proBattle,_arg_1.withoutCrystals,_arg_1.reArmor,false,_arg_1.suvo,_arg_1.kagalo);
         this._battleInfo.setClanName(_arg_1.clanName,_arg_1.clanLink);
         this._battleInfo.setPreview(_arg_1.previewResource.data);
         this._dataProviderRed = new DataProvider();
         this._dataProviderBlue = new DataProvider();
         this._listUsersRed.dataProvider = this._dataProviderRed;
         this._listUsersBlue.dataProvider = this._dataProviderBlue;
         this._sizeTeam = _arg_1.maxPeopleCount;
         this.countBlue = 0;
         this.countRed = 0;
         this._battleItemId = _arg_1.battleItemId;
         this._minRank = _arg_1.minRank;
         this._maxRank = _arg_1.maxRank;
         this._spectatorEnabled = _arg_1.spectatorEnabled;
         this.updateScore(BattleTeam.RED,_arg_1.scoreRed);
         this.updateScore(BattleTeam.BLUE,_arg_1.scoreBlue);
         this.clearUsersInfo();
         this.onResize();
      }
      
      public function clearUsersInfo() : void
      {
         var _local_1:int = 0;
         this._dataProviderRed.removeAll();
         this._dataProviderBlue.removeAll();
         _local_1 = 0;
         while(_local_1 < this._sizeTeam)
         {
            this.updatePlayer(RED_TEAM);
            this.updatePlayer(BLUE_TEAM);
            _local_1++;
         }
         this.countBlue = 0;
         this.countRed = 0;
      }
      
      public function updateBattleName(_arg_1:String) : void
      {
         this._battleInfo.updateBattleName(_arg_1);
      }
      
      public function show() : void
      {
         if(!this.container.contains(this))
         {
            battleInfoService.setCurrentSelectionBattle(this._battleItemId,this._minRank,this._maxRank);
            this.setEvents();
            this.container.addChild(this);
            this.onResize();
         }
      }
      
      public function hide() : void
      {
         if(this.container.contains(this))
         {
            if(!lobbyLayoutService.inBattle())
            {
               battleInfoService.resetCurrentSelectionBattleId();
            }
            this.removeEvents();
            this.container.removeChild(this);
            achievementService.setBattleStartButtonTargetPoint(new Point());
         }
      }
      
      public function destroy() : void
      {
         this.removeEvents();
         clearTimeout(this._timeOutResize);
         this._background = null;
         this._battleInfo = null;
         this._listInnerRed = null;
         this._listInnerBlue = null;
         this._noSuppliesAlert = null;
         this._fightButtonRed = null;
         this._fightButtonBlue = null;
         this._exitFromBattleButton = null;
         this._returnToBattleButton = null;
         this._listUsersBlue = null;
         this._listUsersRed = null;
         this._redScoreLabel = null;
         this._blueScoreLabel = null;
         this._score = null;
         this._locale = null;
         this._stage = null;
         this._display = null;
         this._battleItemId = null;
      }
      
      public function disableEnterInBattleRed() : void
      {
         this._fightButtonRed.enabled = false;
      }
      
      public function enableEnterInBattleRed() : void
      {
         this._fightButtonRed.enabled = true;
      }
      
      public function disableEnterInBattleBlue() : void
      {
         this._fightButtonBlue.enabled = false;
      }
      
      public function enableEnterInBattleBlue() : void
      {
         this._fightButtonBlue.enabled = true;
      }
      
      public function lock() : void
      {
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      public function unlock() : void
      {
         mouseEnabled = true;
         mouseChildren = true;
      }
      
      public function setPreview(_arg_1:BitmapData) : void
      {
         this._battleInfo.setPreview(_arg_1);
      }
      
      private function resize(_arg_1:Number, _arg_2:Number, _arg_3:Boolean = true) : void
      {
         var _local_4:Number = int(Math.max(MIN_FLASH_WIDTH,_arg_1)) / 3;
         var _local_5:Number = Math.max(_arg_2 - HEADER_HEIGHT,MIN_FLASH_HEIGHT);
         this._background.width = _local_4;
         this._background.height = _local_5;
         this.x = _local_4 * 2;
         this.y = HEADER_HEIGHT;
         this._battleInfo.width = _local_4 - 22;
         this._battleInfo.height = int(_local_5 * 0.4);
         this._battleInfo.x = this._battleInfo.y = 11;
         this._listInnerRed.width = int(_local_4 - 25) / 2;
         this._listInnerRed.height = _local_5 - this._battleInfo.height - (!this._noSuppliesAlert.visible ? 80 : 164);
         this._listInnerRed.x = 11;
         this._listInnerRed.y = this._battleInfo.height + 14;
         this._listInnerBlue.width = _local_4 - this._listInnerRed.width - 25;
         this._listInnerBlue.height = _local_5 - this._battleInfo.height - (!this._noSuppliesAlert.visible ? 80 : 164);
         this._listInnerBlue.x = 14 + this._listInnerRed.width;
         this._listInnerBlue.y = this._battleInfo.height + 14;
         this._listUsersRed.x = this._listInnerRed.x + 4;
         this._listUsersRed.y = this._listInnerRed.y + 4;
         this._listUsersRed.setSize(this._listInnerRed.width - (this._listUsersRed.maxVerticalScrollPosition > 0 ? 1 : 4),this._listInnerRed.height - 8);
         this._listUsersBlue.x = this._listInnerBlue.x + 4;
         this._listUsersBlue.y = this._listInnerBlue.y + 4;
         this._listUsersBlue.setSize(this._listInnerBlue.width - (this._listUsersBlue.maxVerticalScrollPosition > 0 ? 1 : 4),this._listInnerBlue.height - 8);
         this._noSuppliesAlert.width = _local_4 - 30;
         this._noSuppliesAlert.x = 15;
         this._noSuppliesAlert.y = _local_5 - 85 - 55;
         this._fightButtonBlue.width = this._fightButtonRed.width = Math.min(130,int((_local_4 - 110) / 2));
         this._fightButtonRed.x = 11;
         this._fightButtonRed.y = _local_5 - 61;
         this._fightButtonBlue.x = _local_4 - this._fightButtonBlue.width - 11;
         this._fightButtonBlue.y = _local_5 - 61;
         this._exitFromBattleButton.width = 130;
         this._exitFromBattleButton.x = _local_4 - this._exitFromBattleButton.width - 11;
         this._exitFromBattleButton.y = _local_5 - 61;
         this._returnToBattleButton.width = 130;
         this._returnToBattleButton.x = _local_4 - this._returnToBattleButton.width - 11;
         this._returnToBattleButton.y = _local_5 - 61;
         this._score.x = this._listInnerBlue.x - 3;
         this._score.y = _local_5 - 51;
         this.updateAchievementPosition();
         if(_arg_3)
         {
            this.resizeWithDelay();
         }
         else
         {
            this._dataProviderBlue.invalidate();
            this._dataProviderRed.invalidate();
         }
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
      
      private function updateAchievementPosition() : void
      {
         var _local_1:Point = null;
         if(this._fightButtonRed.enabled)
         {
            _local_1 = new Point(this.x + this._fightButtonRed.x,this.y + this._fightButtonRed.y);
         }
         else if(Boolean(this._fightButtonBlue))
         {
            _local_1 = new Point(this.x + this._fightButtonBlue.x,this.y + this._fightButtonBlue.y);
         }
         else
         {
            _local_1 = new Point();
         }
         achievementService.setBattleStartButtonTargetPoint(_local_1);
      }
      
      public function showNoSuppliesAlert() : void
      {
         this._noSuppliesAlert.visible = true;
         this.onResize();
      }
      
      public function hideNoSuppliesAlert() : void
      {
         this._noSuppliesAlert.visible = false;
         this.onResize();
      }
      
      public function setCostProBattle(_arg_1:int) : void
      {
         this._fightButtonRed.cost = _arg_1;
         this._fightButtonBlue.cost = _arg_1;
      }
      
      public function updateScore(_arg_1:BattleTeam, _arg_2:int) : void
      {
         if(_arg_1 == BattleTeam.RED)
         {
            this._redScoreLabel.text = String(_arg_2);
         }
         if(_arg_1 == BattleTeam.BLUE)
         {
            this._blueScoreLabel.text = String(_arg_2);
         }
      }
      
      public function removeUser(_arg_1:String) : void
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         _local_2 = this.indexById(RED_TEAM,_arg_1);
         if(_local_2 >= 0)
         {
            this._dataProviderRed.removeItemAt(_local_2);
            this.updatePlayer(RED_TEAM);
         }
         _local_2 = this.indexById(BLUE_TEAM,_arg_1);
         if(_local_2 >= 0)
         {
            this._dataProviderBlue.removeItemAt(_local_2);
            this.updatePlayer(BLUE_TEAM);
         }
         this.countRed = 0;
         this.countBlue = 0;
         _local_3 = 0;
         while(_local_3 < this._dataProviderRed.length)
         {
            this.countRed += this._dataProviderRed.getItemAt(_local_3).id != null ? 1 : 0;
            _local_3++;
         }
         _local_3 = 0;
         while(_local_3 < this._dataProviderBlue.length)
         {
            this.countBlue += this._dataProviderBlue.getItemAt(_local_3).id != null ? 1 : 0;
            _local_3++;
         }
         this.resizeWithDelay(500);
      }
      
      public function updatePlayer(_arg_1:Boolean, _arg_2:Object = null, _arg_3:int = 0, _arg_4:Boolean = false) : void
      {
         var _local_5:int = 0;
         var _local_6:int = 0;
         var _local_7:Object = {};
         var _local_8:DataProvider = _arg_1 == RED_TEAM ? this._dataProviderRed : this._dataProviderBlue;
         _local_7.playerName = name;
         _local_7.style = _arg_1 == RED_TEAM ? "red" : "blue";
         _local_7.noNameText = this._locale.noNameText;
         _local_7.suspicious = _arg_4;
         _local_7.kills = _arg_3;
         _local_7.id = _arg_2;
         _local_5 = _arg_2 == null ? int(-1) : int(this.indexById(_arg_1,_arg_2));
         if(_local_5 < 0)
         {
            _local_8.addItem(_local_7);
         }
         else
         {
            _local_8.replaceItemAt(_local_7,_local_5);
         }
         this.countRed = 0;
         this.countBlue = 0;
         _local_6 = 0;
         while(_local_6 < this._dataProviderRed.length)
         {
            this.countRed += this._dataProviderRed.getItemAt(_local_6).id != null ? 1 : 0;
            _local_6++;
         }
         _local_6 = 0;
         while(_local_6 < this._dataProviderBlue.length)
         {
            this.countBlue += this._dataProviderBlue.getItemAt(_local_6).id != null ? 1 : 0;
            _local_6++;
         }
         this._dataProviderRed.sortOn(["kills","id"],[Array.DESCENDING | Array.NUMERIC,Array.DESCENDING | Array.NUMERIC]);
         this._dataProviderBlue.sortOn(["kills","id"],[Array.DESCENDING | Array.NUMERIC,Array.DESCENDING | Array.NUMERIC]);
         if(_local_8.length > this._sizeTeam && _local_8.getItemAt(_local_8.length - 1).id == null)
         {
            _local_8.removeItemAt(_local_8.length - 1);
         }
         this.resizeWithDelay(500);
      }
      
      public function setPercentLeft(_arg_1:int, _arg_2:int) : void
      {
         this._battleInfo.timeLeftIndicator.setPercentLeft(this._battleInfo.getPercentLeft(_arg_1,_arg_2));
      }
      
      public function setTime(_arg_1:String) : void
      {
         this._battleInfo.setTime(_arg_1);
      }
      
      private function indexById(_arg_1:Boolean, _arg_2:Object) : int
      {
         var _local_3:Object = null;
         var _local_5:int = 0;
         var _local_4:DataProvider = _arg_1 == RED_TEAM ? this._dataProviderRed : this._dataProviderBlue;
         while(_local_5 < _local_4.length)
         {
            _local_3 = _local_4.getItemAt(_local_5);
            if(_local_3.id == _arg_2)
            {
               return _local_5;
            }
            _local_5++;
         }
         return -1;
      }
      
      private function onResize(_arg_1:Event = null) : void
      {
         this.resize(this._stage.stageWidth,this._stage.stageHeight);
      }
      
      private function onFightButtonRedClick(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.ENTER_TEAM,BattleTeam.RED));
      }
      
      private function onFightButtonBlueClick(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.ENTER_TEAM,BattleTeam.BLUE));
      }
      
      private function onEnterSpectator(_arg_1:BattleInfoViewEvent) : void
      {
         dispatchEvent(_arg_1.clone());
      }
      
      private function onExitFromBattleButtonClick(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.EXIT_FROM_BATTLE));
      }
      
      private function onReturnToBattleButtonClick(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.RETURN_TO_BATTLE));
      }
      
      public function updateInBattleState() : void
      {
         this._exitFromBattleButton.visible = false;
         this._returnToBattleButton.visible = false;
         this._fightButtonBlue.visible = false;
         this._fightButtonRed.visible = false;
         if(battleInfoService.hasCurrentBattleId())
         {
            if(battleInfoService.currentBattleId == this._battleItemId)
            {
               this._returnToBattleButton.visible = true;
            }
            else
            {
               this._exitFromBattleButton.visible = true;
            }
         }
         else
         {
            this._fightButtonBlue.visible = true;
            this._fightButtonRed.visible = true;
         }
         if(battleInfoService.isSpectatorMode())
         {
            this._battleInfo.spectatorEnabled = battleInfoService.currentBattleId != this._battleItemId;
         }
         else
         {
            this._battleInfo.spectatorEnabled = this._spectatorEnabled;
         }
         this.updateAchievementPosition();
      }
      
      private function get container() : DisplayObjectContainer
      {
         return this._display.systemLayer;
      }
   }
}

