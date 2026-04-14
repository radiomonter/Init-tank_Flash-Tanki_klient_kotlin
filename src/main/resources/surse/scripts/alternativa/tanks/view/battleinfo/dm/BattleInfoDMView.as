package alternativa.tanks.view.battleinfo.dm
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.utils.removeDisplayObject;
   import alternativa.tanks.view.battleinfo.BattleInfoParamsView;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import alternativa.tanks.view.battleinfo.ILocaleBattleInfo;
   import alternativa.tanks.view.battleinfo.TeamListRenderer;
   import alternativa.tanks.view.battlelist.forms.BattleBigButton;
   import alternativa.tanks.view.battlelist.forms.NoSubScribeAlert;
   import assets.icons.play_icons_ALL;
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import controls.TankWindowInner;
   import fl.controls.List;
   import fl.data.DataProvider;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.ConfigureScroll;
   import forms.TankWindowWithHeader;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import titanomachina.headers.Headers;
   
   public class BattleInfoDMView extends Sprite implements IBattleInfoDmView
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
      
      private var _stage:Stage;
      
      private var _locale:ILocaleBattleInfo;
      
      private var _display:IDisplay;
      
      private var _background:TankWindowWithHeader;
      
      private var _battleInfo:BattleInfoParamsView;
      
      private var _listInner:TankWindowInner;
      
      private var _noSuppliesAlert:NoSubScribeAlert;
      
      private var _fightButton:BattleBigButton;
      
      private var _exitFromBattleButton:BattleBigButton;
      
      private var _returnToBattleButton:BattleBigButton;
      
      private var _listUsers:List;
      
      private var _dataProviderList:DataProvider;
      
      private var _sizeTeam:int;
      
      private var _timeOutResize:uint;
      
      private var _battleItemId:String;
      
      private var _minRank:int;
      
      private var _maxRank:int;
      
      private var _spectatorEnabled:Boolean;
      
      public function BattleInfoDMView(_arg_1:IDisplay, _arg_2:ILocaleBattleInfo)
      {
         super();
         this._display = _arg_1;
         this._stage = _arg_1.stage;
         this._locale = _arg_2;
         this.init();
      }
      
      protected function init() : void
      {
         this._background = new TankWindowWithHeader(Headers.getHeaderById("BATTLE_INFO"));
         addChild(this._background);
         this._battleInfo = new BattleInfoParamsView();
         addChild(this._battleInfo);
         this._listInner = new TankWindowInner(100,100,TankWindowInner.GREEN);
         this._listInner.showBlink = true;
         addChild(this._listInner);
         this._listUsers = new List();
         this._listUsers.rowHeight = 20;
         this._listUsers.setStyle("cellRenderer",TeamListRenderer);
         this._listUsers.focusEnabled = false;
         addChild(this._listUsers);
         ConfigureScroll.configScrollList(this._listUsers,ScrollArrowDownGreen,ScrollArrowUpGreen,ScrollTrackGreen,ScrollThumbSkinGreen);
         this._noSuppliesAlert = new NoSubScribeAlert(this._locale.noSubscribeBattleLabel);
         addChild(this._noSuppliesAlert);
         this._fightButton = new BattleBigButton();
         this._fightButton.label = this._locale.fightButtonLabel;
         this._fightButton.icon = new play_icons_ALL(0,0);
         addChild(this._fightButton);
         this._exitFromBattleButton = new BattleBigButton();
         this._exitFromBattleButton.label = this._locale.exitFromBattleButtonLabel;
         addChild(this._exitFromBattleButton);
         this._returnToBattleButton = new BattleBigButton();
         this._returnToBattleButton.label = this._locale.returnToBattleButtonLabel;
         addChild(this._returnToBattleButton);
         this.onResize();
      }
      
      private function setEvents() : void
      {
         this._stage.addEventListener(Event.RESIZE,this.onResize);
         this._fightButton.addEventListener(MouseEvent.CLICK,this.onFightButtonClick);
         this._exitFromBattleButton.addEventListener(MouseEvent.CLICK,this.onExitFromBattleButtonClick);
         this._returnToBattleButton.addEventListener(MouseEvent.CLICK,this.onReturnToBattleButtonClick);
         this._battleInfo.addEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
      }
      
      private function removeEvents() : void
      {
         this._stage.removeEventListener(Event.RESIZE,this.onResize);
         this._fightButton.removeEventListener(MouseEvent.CLICK,this.onFightButtonClick);
         this._exitFromBattleButton.removeEventListener(MouseEvent.CLICK,this.onExitFromBattleButtonClick);
         this._returnToBattleButton.removeEventListener(MouseEvent.CLICK,this.onReturnToBattleButtonClick);
         this._battleInfo.removeEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
      }
      
      public function updateInitParams(_arg_1:BattleInfoDmParams) : void
      {
         this._battleInfo.setUp(_arg_1.battleName,_arg_1.minRank,_arg_1.maxRank,_arg_1.scoreLimit,_arg_1.timeLimitInSec,false,false,_arg_1.battleUrl,_arg_1.battleMode,_arg_1.noSupplies,_arg_1.withoutBonuses,_arg_1.upgradesDisabled,_arg_1.proBattle,_arg_1.withoutCrystals,_arg_1.reArmor,false,_arg_1.suvo,_arg_1.kagalo);
         this._battleInfo.setClanName(_arg_1.clanName,_arg_1.clanLink);
         this._battleInfo.setPreview(_arg_1.previewResource.data);
         this._dataProviderList = new DataProvider();
         this._listUsers.dataProvider = this._dataProviderList;
         this._sizeTeam = _arg_1.maxPeopleCount;
         this._battleItemId = _arg_1.battleItemId;
         this._minRank = _arg_1.minRank;
         this._maxRank = _arg_1.maxRank;
         this._spectatorEnabled = _arg_1.spectatorEnabled;
         this.fillTeam();
         this.onResize();
      }
      
      public function enableEnterInBattle() : void
      {
         this._fightButton.enabled = true;
      }
      
      public function disableEnterInBattle() : void
      {
         this._fightButton.enabled = false;
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
      
      public function updateBattleName(_arg_1:String) : void
      {
         this._battleInfo.updateBattleName(_arg_1);
      }
      
      public function addUser(_arg_1:BattleInfoUser) : void
      {
         this.updatePlayer(_arg_1.user,_arg_1.kills,_arg_1.suspicious);
      }
      
      public function removeUser(_arg_1:String) : void
      {
         var _local_2:int = this.indexById(_arg_1);
         if(_local_2 >= 0)
         {
            this._dataProviderList.removeItemAt(_local_2);
            this.updatePlayer();
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
      
      public function showNoSuppliesAlert() : void
      {
         this._noSuppliesAlert.visible = true;
      }
      
      public function hideNoSuppliesAlert() : void
      {
         this._noSuppliesAlert.visible = false;
      }
      
      public function setCostProBattle(_arg_1:int) : void
      {
         this._fightButton.cost = _arg_1;
      }
      
      public function updatePlayer(_arg_1:String = null, _arg_2:int = 0, _arg_3:Boolean = false) : void
      {
         var _local_4:Object = {};
         _local_4.id = _arg_1;
         _local_4.style = "green";
         _local_4.noNameText = this._locale.noNameText;
         _local_4.suspicious = _arg_3;
         _local_4.kills = _arg_2;
         var _local_5:int = _arg_1 == null ? int(-1) : int(this.indexById(_arg_1));
         if(_local_5 < 0)
         {
            this._dataProviderList.addItem(_local_4);
         }
         else
         {
            this._dataProviderList.replaceItemAt(_local_4,_local_5);
         }
         this._dataProviderList.sortOn(["kills","id"],[Array.DESCENDING | Array.NUMERIC,Array.DESCENDING | Array.NUMERIC]);
         if(this._dataProviderList.length > this._sizeTeam)
         {
            this._dataProviderList.removeItemAt(this._dataProviderList.length - 1);
         }
         this.resizeWithDelay(500);
      }
      
      private function indexById(_arg_1:String) : int
      {
         var _local_2:Object = null;
         var _local_3:int = 0;
         while(_local_3 < this._dataProviderList.length)
         {
            _local_2 = this._dataProviderList.getItemAt(_local_3);
            if(_local_2.id == _arg_1)
            {
               return _local_3;
            }
            _local_3++;
         }
         return -1;
      }
      
      public function fillTeam() : void
      {
         var _local_1:int = 0;
         this._dataProviderList.removeAll();
         while(_local_1 < this._sizeTeam)
         {
            this.updatePlayer();
            _local_1++;
         }
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
         if(!lobbyLayoutService.inBattle())
         {
            battleInfoService.resetCurrentSelectionBattleId();
         }
         this.removeEvents();
         removeDisplayObject(this);
         achievementService.setBattleStartButtonTargetPoint(new Point());
      }
      
      public function destroy() : void
      {
         this.removeEvents();
         clearTimeout(this._timeOutResize);
         this._background = null;
         this._battleInfo = null;
         this._listInner = null;
         this._noSuppliesAlert = null;
         this._fightButton = null;
         this._exitFromBattleButton = null;
         this._returnToBattleButton = null;
         this._listUsers = null;
         this._dataProviderList = null;
         this._locale = null;
         this._stage = null;
         this._display = null;
         this._battleItemId = null;
      }
      
      public function resize(_arg_1:Number, _arg_2:Number, _arg_3:Boolean = true) : void
      {
         var _local_4:Number = int(Math.max(MIN_FLASH_WIDTH,_arg_1)) / 3;
         var _local_5:Number = Math.max(_arg_2 - HEADER_HEIGHT,MIN_FLASH_HEIGHT);
         this._background.width = _local_4;
         this._background.height = _local_5;
         this.x = _local_4 * 2;
         this.y = HEADER_HEIGHT;
         this._battleInfo.width = _local_4 - 22;
         this._battleInfo.height = int(_local_5 * 0.4);
         this._battleInfo.y = 11;
         this._battleInfo.x = 11;
         this._listInner.width = _local_4 - 22;
         this._listInner.height = _local_5 - this._battleInfo.height - (!this._noSuppliesAlert.visible ? 80 : 164);
         this._listInner.x = 11;
         this._listInner.y = this._battleInfo.height + 14;
         this._listUsers.setSize(this._listInner.width - (this._listUsers.maxVerticalScrollPosition > 0 ? 1 : 4),this._listInner.height - 8);
         this._listUsers.x = this._listInner.x + 4;
         this._listUsers.y = this._listInner.y + 4;
         this._noSuppliesAlert.width = _local_4 - 30;
         this._noSuppliesAlert.x = 15;
         this._noSuppliesAlert.y = _local_5 - 85 - 55;
         this._fightButton.width = 130;
         this._fightButton.x = _local_4 - this._fightButton.width - 11;
         this._fightButton.y = _local_5 - 61;
         this._exitFromBattleButton.width = 130;
         this._exitFromBattleButton.x = _local_4 - this._exitFromBattleButton.width - 11;
         this._exitFromBattleButton.y = _local_5 - 61;
         this._returnToBattleButton.width = 130;
         this._returnToBattleButton.x = _local_4 - this._returnToBattleButton.width - 11;
         this._returnToBattleButton.y = _local_5 - 61;
         this.updateAchievementPosition();
         if(_arg_3)
         {
            this.resizeWithDelay();
         }
         else
         {
            this._dataProviderList.invalidate();
         }
      }
      
      private function updateAchievementPosition() : void
      {
         if(this._fightButton.visible && this._fightButton.enabled)
         {
            achievementService.setBattleStartButtonTargetPoint(new Point(this.x + this._fightButton.x,this.y + this._fightButton.y));
         }
         else
         {
            achievementService.setBattleStartButtonTargetPoint(new Point());
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
      
      private function onResize(_arg_1:Event = null) : void
      {
         this.resize(this._stage.stageWidth,this._stage.stageHeight);
      }
      
      private function onFightButtonClick(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.ENTER_DM));
      }
      
      private function onExitFromBattleButtonClick(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.EXIT_FROM_BATTLE));
      }
      
      private function onReturnToBattleButtonClick(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.RETURN_TO_BATTLE));
      }
      
      private function onEnterSpectator(_arg_1:BattleInfoViewEvent) : void
      {
         dispatchEvent(_arg_1.clone());
      }
      
      public function updateInBattleState() : void
      {
         this._exitFromBattleButton.visible = false;
         this._returnToBattleButton.visible = false;
         this._fightButton.visible = false;
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
            this._fightButton.visible = true;
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

