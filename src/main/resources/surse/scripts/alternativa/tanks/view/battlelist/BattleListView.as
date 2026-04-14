package alternativa.tanks.view.battlelist
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.controllers.battlelist.BattleListItemParams;
   import alternativa.tanks.controllers.battlelist.IBattleListViewControllerCallBack;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.view.battlelist.forms.BattleListRenderer;
   import alternativa.tanks.view.battlelist.friends.FriendsIndicator;
   import alternativa.tanks.view.battlelist.help.LockedMapsHelper;
   import alternativa.tanks.view.timeleftindicator.GreenTimeLeftIndicator;
   import alternativa.tanks.view.timeleftindicator.TimeLeftIndicator;
   import assets.cellrenderer.battlelist.Abris;
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import controls.BigButton1;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import fl.controls.LabelButton;
   import fl.controls.List;
   import fl.controls.ScrollBar;
   import fl.data.DataProvider;
   import fl.events.ListEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import forms.ColorConstants;
   import forms.ConfigureScroll;
   import forms.TankWindowWithHeader;
   import obfuscation.deb.Bezes;
   import obfuscation.fabuqy.Nukoki;
   import obfuscation.fabuqy.Suvozimi;
   import obfuscation.vylurof.Rucewu;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import titanomachina.headers.Headers;
   
   public class BattleListView extends Sprite implements IBattleListView
   {
      
      [Inject]
      public static var helpService:IHelpService;
      
      private static const MIN_FLASH_WIDTH:int = 970;
      
      private static const MIN_FLASH_HEIGHT:int = 530;
      
      private static const HEADER_HEIGHT:int = 60;
      
      private static const ADDITIONAL_SCROLL_AREA_HEIGHT:Number = 7;
      
      private const HELPER_GROUP_KEY:String = "BattleSelectModel";
      
      private const HELPER_NOT_AVAILABLE:int = 1;
      
      private var _lockedMapsHelper:LockedMapsHelper;
      
      private var _stage:Stage;
      
      private var _locale:ILocaleBattleList;
      
      private var _container:DisplayObjectContainer;
      
      private var _callback:IBattleListViewControllerCallBack;
      
      private var _background:TankWindowWithHeader;
      
      private var _inner:TankWindowInner;
      
      private var _showCreateBattleFormButton:DefaultButtonBase;
      
      private var findBattleButton:BigButton1 = new BigButton1();
      
      private var _battleList:List;
      
      private var _battleModeItems:Vector.<BattleModeCheckBox>;
      
      private var _dataProvider:DataProvider;
      
      private var _timeOutResize:uint;
      
      private var iconWidth:int = 100;
      
      private var oldIconWidth:int = 0;
      
      public function BattleListView(_arg_1:Stage, _arg_2:DisplayObjectContainer, _arg_3:ILocaleBattleList, _arg_4:Boolean)
      {
         super();
         this._stage = _arg_1;
         this._container = _arg_2;
         this._locale = _arg_3;
         this.init(_arg_4);
      }
      
      protected function init(_arg_1:Boolean) : void
      {
         this._background = new TankWindowWithHeader(Headers.getHeaderById("BATTLE_LIST"));
         addChild(this._background);
         this._inner = new TankWindowInner(100,100,TankWindowInner.GREEN);
         this._inner.showBlink = true;
         addChild(this._inner);
         this._dataProvider = new DataProvider();
         this._battleList = new List();
         this._battleList.rowHeight = 20;
         this._battleList.setStyle("cellRenderer",BattleListRenderer);
         this._battleList.dataProvider = this._dataProvider;
         this._battleList.focusEnabled = true;
         addChild(this._battleList);
         this._battleList.move(15,70);
         ConfigureScroll.configScrollList(this._battleList,ScrollArrowDownGreen,ScrollArrowUpGreen,ScrollTrackGreen,ScrollThumbSkinGreen);
         this._showCreateBattleFormButton = new DefaultButtonBase();
         this._showCreateBattleFormButton.label = this._locale.showBattleCreateFormLabel;
         this._showCreateBattleFormButton.visible = !_arg_1;
         addChild(this._showCreateBattleFormButton);
         this._battleModeItems = new Vector.<BattleModeCheckBox>();
         this.createBattleModeCheckBox(Suvozimi.DM);
         this.createBattleModeCheckBox(Suvozimi.TDM);
         this.createBattleModeCheckBox(Suvozimi.CTF);
         this.createBattleModeCheckBox(Suvozimi.CP);
         this.findBattleButton.setBigText();
         this.findBattleButton.width = 200;
         this.findBattleButton.label = LocaleBattleList.localeService.getText(TanksLocale.TEXT_FIND_BATTLE_BUTTON_TEXT);
         this.findBattleButton.y = 12;
         this.findBattleButton.setSkin(Bezes.velodej);
         this.findBattleButton.enabled = true;
         addChild(this.findBattleButton);
         this.onResize();
      }
      
      private function createBattleModeCheckBox(_arg_1:Suvozimi) : void
      {
         var _local_2:BattleModeCheckBox = new BattleModeCheckBox(_arg_1);
         addChild(_local_2);
         this._battleModeItems.push(_local_2);
      }
      
      public function setCallBack(_arg_1:IBattleListViewControllerCallBack) : void
      {
         this._callback = _arg_1;
      }
      
      public function show(_arg_1:Boolean, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean) : void
      {
         if(!this._container.contains(this))
         {
            this.onResize();
            this.setEvents();
            this._container.addChild(this);
            this._lockedMapsHelper = new LockedMapsHelper(this._locale.battleSelectLockedMapHelperName,this._locale.battleSelectLockedMapHelperArrowLength);
            helpService.registerHelper(this.HELPER_GROUP_KEY,this.HELPER_NOT_AVAILABLE,this._lockedMapsHelper,false);
            this.getBattleModeCheckBox(Suvozimi.DM).isPressed = _arg_1;
            this.getBattleModeCheckBox(Suvozimi.TDM).isPressed = _arg_2;
            this.getBattleModeCheckBox(Suvozimi.CTF).isPressed = _arg_3;
            this.getBattleModeCheckBox(Suvozimi.CP).isPressed = _arg_4;
         }
      }
      
      public function hide() : void
      {
         if(this._container.contains(this))
         {
            this.removeEvents();
            this._container.removeChild(this);
            helpService.hideHelper(this.HELPER_GROUP_KEY,this.HELPER_NOT_AVAILABLE);
            helpService.unregisterHelper(this.HELPER_GROUP_KEY,this.HELPER_NOT_AVAILABLE);
         }
      }
      
      public function destroy() : void
      {
         var _local_2:int = 0;
         this.removeEvents();
         var _local_1:int = int(this._battleModeItems.length);
         while(_local_2 < _local_1)
         {
            this._battleModeItems[_local_2].destroy();
            _local_2++;
         }
         clearTimeout(this._timeOutResize);
         this._battleModeItems = null;
         this._lockedMapsHelper = null;
         this._callback = null;
         this._locale = null;
         this._stage = null;
         this._container = null;
      }
      
      public function setEvents() : void
      {
         var _local_2:int = 0;
         this._stage.addEventListener(Event.RESIZE,this.onResize);
         this._showCreateBattleFormButton.addEventListener(MouseEvent.CLICK,this.onShowCreateBattleFormButtonClick);
         this._battleList.addEventListener(ListEvent.ITEM_CLICK,this.onBattleListItemClick);
         this._battleList.addEventListener(Event.CHANGE,this.onListChange);
         this._battleList.verticalScrollBar.addEventListener(Event.ENTER_FRAME,this.updateScrollOnEnterFrame);
         this.findBattleButton.addEventListener(MouseEvent.CLICK,this.onBackToMatchmakingClick);
         var _local_1:int = int(this._battleModeItems.length);
         while(_local_2 < _local_1)
         {
            this._battleModeItems[_local_2].addEventListener(Event.CHANGE,this.onBattleModeChange);
            _local_2++;
         }
      }
      
      private function updateScrollOnEnterFrame(_arg_1:Event) : void
      {
         var _local_2:Sprite = null;
         var _local_3:Sprite = null;
         var _local_5:int = 0;
         var _local_4:ScrollBar = this._battleList.verticalScrollBar;
         while(_local_5 < _local_4.numChildren)
         {
            _local_2 = Sprite(_local_4.getChildAt(_local_5));
            if(_local_2.hitArea != null)
            {
               _local_3 = _local_2.hitArea;
               _local_3.graphics.clear();
            }
            else
            {
               _local_3 = new Sprite();
               _local_3.mouseEnabled = false;
               _local_2.hitArea = _local_3;
               this._battleList.addChild(_local_3);
            }
            _local_3.graphics.beginFill(0,0);
            if(_local_2 is LabelButton)
            {
               _local_3.graphics.drawRect(_local_4.x - ADDITIONAL_SCROLL_AREA_HEIGHT,_local_2.y - 14,_local_2.width + ADDITIONAL_SCROLL_AREA_HEIGHT,_local_2.height + 28);
            }
            else
            {
               _local_3.graphics.drawRect(_local_4.x - ADDITIONAL_SCROLL_AREA_HEIGHT,_local_2.y,_local_2.width + ADDITIONAL_SCROLL_AREA_HEIGHT,_local_2.height);
            }
            _local_3.graphics.endFill();
            _local_5++;
         }
      }
      
      private function onBattleModeChange(_arg_1:Event) : void
      {
         var _local_2:BattleModeCheckBox = BattleModeCheckBox(_arg_1.currentTarget);
         this._callback.onBattleModeChange(_local_2.battleMode,_local_2.isPressed);
      }
      
      public function removeEvents() : void
      {
         var _local_2:int = 0;
         this._battleList.verticalScrollBar.removeEventListener(Event.ENTER_FRAME,this.updateScrollOnEnterFrame);
         this._stage.removeEventListener(Event.RESIZE,this.onResize);
         this._showCreateBattleFormButton.removeEventListener(MouseEvent.CLICK,this.onShowCreateBattleFormButtonClick);
         this._battleList.removeEventListener(ListEvent.ITEM_CLICK,this.onBattleListItemClick);
         this._battleList.removeEventListener(Event.CHANGE,this.onListChange);
         this.findBattleButton.removeEventListener(MouseEvent.CLICK,this.onBackToMatchmakingClick);
         var _local_1:int = int(this._battleModeItems.length);
         while(_local_2 < _local_1)
         {
            this._battleModeItems[_local_2].removeEventListener(Event.CHANGE,this.onBattleModeChange);
            _local_2++;
         }
      }
      
      private function onBackToMatchmakingClick(param1:MouseEvent) : void
      {
         this.findBattleButton.enabled = false;
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;start_matchmaking");
      }
      
      public function lockFilter(_arg_1:Suvozimi) : void
      {
         this.getBattleModeCheckBox(_arg_1).lock = true;
      }
      
      public function unLockFilter(_arg_1:Suvozimi) : void
      {
         this.getBattleModeCheckBox(_arg_1).lock = false;
      }
      
      private function getBattleModeCheckBox(_arg_1:Suvozimi) : BattleModeCheckBox
      {
         var _local_2:BattleModeCheckBox = null;
         var _local_4:int = 0;
         var _local_3:int = int(this._battleModeItems.length);
         while(_local_4 < _local_3)
         {
            if(this._battleModeItems[_local_4].battleMode == _arg_1)
            {
               _local_2 = this._battleModeItems[_local_4];
               break;
            }
            _local_4++;
         }
         return _local_2;
      }
      
      public function resize(_arg_1:Boolean = true) : void
      {
         var _local_6:int = 0;
         clearTimeout(this._timeOutResize);
         var _local_2:int = int(Math.max(MIN_FLASH_WIDTH,this._stage.stageWidth) / 3);
         var _local_3:int = Math.max(this._stage.stageHeight - HEADER_HEIGHT,MIN_FLASH_HEIGHT);
         this._background.width = _local_2;
         this._background.height = _local_3;
         this.x = _local_2;
         this.y = HEADER_HEIGHT;
         this._inner.width = _local_2 - 22;
         this._inner.height = _local_3 - 115;
         this._inner.y = 67;
         this._inner.x = 11;
         this.findBattleButton.x = (_local_2 - this.findBattleButton.width) / 2;
         var _local_4:int = this._inner.width - (this._battleList.maxVerticalScrollPosition > 0 ? 0 : 4);
         this._battleList.setSize(_local_4,this._inner.height - 8);
         var _local_5:int = int(this._battleModeItems.length);
         while(_local_6 < _local_5)
         {
            if(_local_6 == 0)
            {
               this._battleModeItems[_local_6].x = 11;
            }
            else
            {
               this._battleModeItems[_local_6].x = this._battleModeItems[_local_6 - 1].x + this._battleModeItems[_local_6 - 1].width + 5;
            }
            this._battleModeItems[_local_6].y = _local_3 - 42;
            _local_6++;
         }
         this._showCreateBattleFormButton.x = _local_2 - this._showCreateBattleFormButton.width - 11;
         this._showCreateBattleFormButton.y = _local_3 - 42;
         this.resizeListItem(_local_4);
         if(_arg_1)
         {
            this.resizeWithDelay();
         }
      }
      
      private function resizeWithDelay(_arg_1:int = 400) : void
      {
         clearTimeout(this._timeOutResize);
         this._timeOutResize = setTimeout(this.onResizeWithDelay,_arg_1);
      }
      
      private function onResizeWithDelay() : void
      {
         this.resize(false);
      }
      
      private function resizeListItem(_arg_1:int) : void
      {
         var _local_2:Object = null;
         var _local_3:BattleListItemParams = null;
         var _local_4:int = 0;
         this.iconWidth = _arg_1 - (this._battleList.maxVerticalScrollPosition > 0 ? 32 : 20);
         if(this.iconWidth == this.oldIconWidth)
         {
            return;
         }
         this.oldIconWidth = this.iconWidth;
         while(_local_4 < this._dataProvider.length)
         {
            _local_2 = this._dataProvider.getItemAt(_local_4);
            _local_3 = _local_2.dat;
            _local_2.iconNormal = this.myIcon(false,_local_3);
            _local_2.iconSelected = this.myIcon(true,_local_3);
            this._dataProvider.replaceItemAt(_local_2,_local_4);
            this._dataProvider.invalidateItemAt(_local_4);
            _local_4++;
         }
      }
      
      private function myIcon(_arg_1:Boolean, _arg_2:BattleListItemParams) : Sprite
      {
         var _local_3:LabelBase = null;
         var _local_4:Abris = null;
         var _local_5:uint = 0;
         var _local_6:Boolean = false;
         var _local_7:FriendsIndicator = null;
         var _local_8:Boolean = false;
         var _local_9:Boolean = false;
         var _local_10:FriendsIndicator = null;
         var _local_11:FriendsIndicator = null;
         var _local_15:Bitmap = null;
         var _local_12:Sprite = new Sprite();
         var _local_13:Shape = new Shape();
         var _local_14:Boolean = _arg_2.accessible;
         var _local_16:int = this.iconWidth;
         var _local_17:int = int(_local_16 * 0.55);
         if(_arg_2.proBattle)
         {
            if(_arg_2.capin)
            {
               _local_15 = new Bitmap(Rucewu.namo(_local_14,_arg_1));
               _local_15.y = 3;
               _local_15.x = -2;
               _local_12.addChild(_local_15);
            }
            else
            {
               _local_15 = new Bitmap(Rucewu.ronihil(_local_14,_arg_1));
               _local_15.y = 3;
               _local_15.x = -2;
               _local_12.addChild(_local_15);
            }
         }
         _local_3 = new LabelBase();
         _local_3.size = 12;
         if(_arg_2.suspicious)
         {
            _local_5 = ColorConstants.SUSPICIOUS;
         }
         else
         {
            _local_5 = this.getLabelColorByAccessible(_arg_2);
         }
         _local_3.color = _local_5;
         _local_3.text = _arg_2.gamename;
         _local_3.autoSize = TextFieldAutoSize.NONE;
         _local_3.width = _local_17 - 6;
         _local_3.height = 18;
         _local_3.x = 8;
         _local_3.y = -1;
         _local_12.addChild(_local_3);
         var _local_18:uint = this.getLabelColorByAccessible(_arg_2);
         var timeLeftIndicator:TimeLeftIndicator = new GreenTimeLeftIndicator();
         timeLeftIndicator.x = _local_16 - _local_3.textWidth + 2;
         timeLeftIndicator.y = -1;
         timeLeftIndicator.setPercentLeft(_arg_2.timeLeft);
         if(_arg_2.dmatch)
         {
            _local_6 = _arg_2.all == _arg_2.maxPeople;
            _local_4 = new Abris();
            _local_4.gotoAndStop(!_local_6 ? 2 : 1);
            _local_4.x = _local_17;
            _local_4.y = 1;
            _local_12.addChild(_local_4);
            _local_3 = new LabelBase();
            _local_3.autoSize = TextFieldAutoSize.NONE;
            _local_3.size = 12;
            _local_3.color = !_local_6 ? uint(16777215) : uint(8816262);
            _local_3.align = TextFormatAlign.CENTER;
            _local_3.text = String(_arg_2.all);
            _local_3.x = int(_local_17 - 0.5);
            _local_3.y = -1;
            _local_3.width = 52;
            _local_3.height = 16;
            _local_12.addChild(_local_3);
            if(_arg_2.friends > 0)
            {
               _local_7 = new FriendsIndicator(_arg_1,_local_14,_arg_2.friends,_local_18);
               _local_7.x = _local_17 + _local_4.width + 10;
               _local_12.addChild(_local_7);
            }
         }
         else
         {
            _local_8 = _arg_2.reds == _arg_2.maxPeople;
            _local_9 = _arg_2.blues == _arg_2.maxPeople;
            _local_4 = new Abris();
            _local_4.gotoAndStop(!_local_8 ? 5 : 3);
            _local_4.x = _local_17;
            _local_4.y = 1;
            _local_12.addChild(_local_4);
            _local_4 = new Abris();
            _local_4.gotoAndStop(!_local_9 ? 6 : 4);
            _local_4.x = _local_17 + 27;
            _local_4.y = 1;
            _local_12.addChild(_local_4);
            _local_3 = new LabelBase();
            _local_3.autoSize = TextFieldAutoSize.NONE;
            _local_3.size = 12;
            _local_3.align = TextFormatAlign.CENTER;
            _local_3.color = !_local_8 ? uint(16777215) : uint(8816262);
            _local_3.text = String(_arg_2.reds);
            _local_3.x = int(_local_17 - 0.5);
            _local_3.y = -1;
            _local_3.width = 27;
            _local_3.height = 16;
            _local_12.addChild(_local_3);
            _local_3 = new LabelBase();
            _local_3.autoSize = TextFieldAutoSize.NONE;
            _local_3.align = TextFormatAlign.CENTER;
            _local_3.color = !_local_9 ? uint(16777215) : uint(8816262);
            _local_3.text = String(_arg_2.blues);
            _local_3.x = int(_local_17 + 26.5);
            _local_3.y = -1;
            _local_3.width = 25;
            _local_3.height = 16;
            _local_12.addChild(_local_3);
            if(_arg_2.friendsBlues > 0)
            {
               _local_10 = new FriendsIndicator(_arg_1,_local_14,_arg_2.friendsBlues,_local_18);
               _local_10.x = _local_17 + 27 + _local_4.width + 10;
               _local_12.addChild(_local_10);
            }
            if(_arg_2.friendsReds > 0)
            {
               _local_11 = new FriendsIndicator(_arg_1,_local_14,_arg_2.friendsReds,_local_18);
               _local_11.x = _local_17 - _local_11.width - 9;
               _local_12.addChild(_local_11);
            }
         }
         return _local_12;
      }
      
      private function getLabelColorByAccessible(data:BattleListItemParams) : uint
      {
         return data.accessible ? ColorConstants.GREEN_LABEL : ColorConstants.ACCESS_LABEL;
      }
      
      public function sortBattleList() : void
      {
         this._dataProvider.sortOn(["suspicious","accessible","friends","id"],[Array.NUMERIC | Array.DESCENDING,Array.DESCENDING,Array.NUMERIC | Array.DESCENDING,Array.NUMERIC | Array.DESCENDING]);
      }
      
      public function resetSelectedItem() : void
      {
         this._battleList.selectedItem = null;
      }
      
      public function createItem(_arg_1:BattleListItemParams, _arg_2:Boolean) : void
      {
         var _local_3:int = this.getItemIndex(_arg_1.id);
         var _local_4:Object = new Object();
         _local_4.id = _arg_1.id;
         _local_4.accessible = _arg_1.accessible;
         _local_4.iconNormal = this.myIcon(false,_arg_1);
         _local_4.iconSelected = this.myIcon(true,_arg_1);
         _local_4.suspicious = _arg_1.suspicious;
         _local_4.dat = _arg_1;
         if(_arg_1.dmatch)
         {
            _local_4.friends = _arg_1.friends;
         }
         else
         {
            _local_4.friends = _arg_1.friendsBlues + _arg_1.friendsReds;
         }
         if(_local_3 < 0)
         {
            this._dataProvider.addItem(_local_4);
         }
         if(_arg_2)
         {
            this.sortBattleList();
            this.resize();
            helpService.hideHelper(this.HELPER_GROUP_KEY,this.HELPER_NOT_AVAILABLE);
         }
      }
      
      public function removeItem(_arg_1:String) : void
      {
         var _local_2:int = this.getItemIndex(_arg_1);
         if(_local_2 >= 0)
         {
            this._dataProvider.removeItemAt(_local_2);
            this.resizeWithDelay();
         }
      }
      
      public function setSelect(_arg_1:String) : void
      {
         var _local_2:int = this.getItemIndex(_arg_1);
         if(_local_2 >= 0)
         {
            this._battleList.selectedIndex = _local_2;
            this._battleList.scrollToSelected();
         }
         else
         {
            this._battleList.selectedItem = null;
         }
         this._battleList.drawNow();
      }
      
      public function updateName(_arg_1:String, _arg_2:String) : void
      {
         var _local_3:Object = null;
         var _local_4:BattleListItemParams = null;
         var _local_5:Object = null;
         var _local_6:int = this.getItemIndex(_arg_1);
         if(_local_6 >= 0)
         {
            _local_3 = this._dataProvider.getItemAt(_local_6);
            _local_4 = _local_3.dat;
            _local_5 = this.getItem(_local_4.id,_arg_2,_local_4.battleItemGO,_local_4.dmatch,_local_4.reds,_local_4.blues,_local_4.friendsReds,_local_4.friendsBlues,_local_4.all,_local_4.friends,_local_4.maxPeople,_local_4.nmap,_local_4.accessible,_local_4.proBattle,_local_4.noSupplies,_local_4.suspicious,_local_4.rankRange,_local_4.capin,_local_4.kagalo);
            this._dataProvider.replaceItemAt(_local_5,_local_6);
            this._dataProvider.invalidateItemAt(_local_6);
         }
      }
      
      public function updateSuspicious(_arg_1:String, _arg_2:Boolean) : void
      {
         var _local_3:Object = null;
         var _local_4:BattleListItemParams = null;
         var _local_5:Object = null;
         var _local_6:int = this.getItemIndex(_arg_1);
         if(_local_6 >= 0)
         {
            _local_3 = this._dataProvider.getItemAt(_local_6);
            _local_4 = _local_3.dat;
            _local_5 = this.getItem(_local_4.id,_local_4.gamename,_local_4.battleItemGO,_local_4.dmatch,_local_4.reds,_local_4.blues,_local_4.friendsReds,_local_4.friendsBlues,_local_4.all,_local_4.friends,_local_4.maxPeople,_local_4.nmap,_local_4.accessible,_local_4.proBattle,_local_4.noSupplies,_arg_2,_local_4.rankRange,_local_4.capin,_local_4.kagalo);
            this._dataProvider.replaceItemAt(_local_5,_local_6);
            this._dataProvider.invalidateItemAt(_local_6);
            this.sortBattleList();
         }
      }
      
      public function updateUsersCountTeam(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:uint) : void
      {
         var _local_6:Object = null;
         var _local_7:BattleListItemParams = null;
         var _local_8:Object = null;
         var _local_9:int = this.getItemIndex(_arg_1);
         if(_local_9 >= 0)
         {
            _local_6 = this._dataProvider.getItemAt(_local_9);
            _local_7 = _local_6.dat;
            _local_8 = this.getItem(_local_7.id,_local_7.gamename,_local_7.battleItemGO,_local_7.dmatch,_arg_2,_arg_3,_arg_4,_arg_5,_local_7.all,_local_7.friends,_local_7.maxPeople,_local_7.nmap,_local_7.accessible,_local_7.proBattle,_local_7.noSupplies,_local_7.suspicious,_local_7.rankRange,_local_7.capin,_local_7.kagalo);
            this._dataProvider.replaceItemAt(_local_8,_local_9);
            this._dataProvider.invalidateItemAt(_local_9);
         }
      }
      
      public function updateUsersCountDm(_arg_1:String, _arg_2:int, _arg_3:int) : void
      {
         var _local_4:Object = null;
         var _local_5:BattleListItemParams = null;
         var _local_6:Object = null;
         var _local_7:int = this.getItemIndex(_arg_1);
         if(_local_7 >= 0)
         {
            _local_4 = this._dataProvider.getItemAt(_local_7);
            _local_5 = _local_4.dat;
            _local_6 = this.getItem(_local_5.id,_local_5.gamename,_local_5.battleItemGO,_local_5.dmatch,_local_5.reds,_local_5.blues,_local_5.friendsReds,_local_5.friendsBlues,_arg_2,_arg_3,_local_5.maxPeople,_local_5.nmap,_local_5.accessible,_local_5.proBattle,_local_5.noSupplies,_local_5.suspicious,_local_5.rankRange,_local_5.capin,_local_5.kagalo);
            this._dataProvider.replaceItemAt(_local_6,_local_7);
            this._dataProvider.invalidateItemAt(_local_7);
         }
      }
      
      public function swapTeams(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int) : void
      {
         var _local_6:Object = null;
         var _local_7:BattleListItemParams = null;
         var _local_8:Object = null;
         var _local_9:int = this.getItemIndex(_arg_1);
         if(_local_9 >= 0)
         {
            _local_6 = this._dataProvider.getItemAt(_local_9);
            _local_7 = _local_6.dat;
            _local_8 = this.getItem(_local_7.id,_local_7.gamename,_local_7.battleItemGO,_local_7.dmatch,_arg_2,_arg_3,_arg_4,_arg_5,_local_7.all,_local_7.friends,_local_7.maxPeople,_local_7.nmap,_local_7.accessible,_local_7.proBattle,_local_7.noSupplies,_local_7.suspicious,_local_7.rankRange,_local_7.capin,_local_7.kagalo);
            this._dataProvider.replaceItemAt(_local_8,_local_9);
            this._dataProvider.invalidateItemAt(_local_9);
         }
      }
      
      public function updateAvailableItems(_arg_1:int) : void
      {
         var _local_2:Object = null;
         var _local_3:BattleListItemParams = null;
         var _local_4:Nukoki = null;
         var _local_5:Boolean = false;
         var _local_6:Object = null;
         var _local_8:int = 0;
         var _local_7:int = int(this._dataProvider.length);
         while(_local_8 < _local_7)
         {
            _local_2 = this._dataProvider.getItemAt(_local_8);
            _local_3 = _local_2.dat;
            _local_4 = Nukoki(_local_3.rankRange);
            _local_5 = _arg_1 >= _local_4.min && _arg_1 <= _local_4.max;
            _local_6 = this.getItem(_local_3.id,_local_3.gamename,_local_3.battleItemGO,_local_3.dmatch,_local_3.reds,_local_3.blues,_local_3.friendsReds,_local_3.friendsBlues,_local_3.all,_local_3.friends,_local_3.maxPeople,_local_3.nmap,_local_5,_local_3.proBattle,_local_3.noSupplies,_local_3.suspicious,_local_3.rankRange,_local_3.capin,_local_3.kagalo);
            this._dataProvider.replaceItemAt(_local_6,_local_8);
            this._dataProvider.invalidateItemAt(_local_8);
            _local_8++;
         }
         this.sortBattleList();
      }
      
      private function getItem(_arg_1:String, _arg_2:String, _arg_3:IGameObject, _arg_4:Boolean, _arg_5:int, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:int, _arg_10:int, _arg_11:int, _arg_12:String, _arg_13:Boolean, _arg_14:Boolean, _arg_15:Boolean, _arg_16:Boolean, _arg_17:Nukoki, _arg_18:Boolean, _arg_19:String) : Object
      {
         var _local_20:BattleListItemParams = new BattleListItemParams();
         _local_20.gamename = _arg_2;
         _local_20.battleItemGO = _arg_3;
         _local_20.id = _arg_1;
         _local_20.dmatch = _arg_4;
         _local_20.reds = _arg_5;
         _local_20.blues = _arg_6;
         _local_20.friendsReds = _arg_7;
         _local_20.friendsBlues = _arg_8;
         _local_20.all = _arg_9;
         _local_20.friends = _arg_10;
         _local_20.maxPeople = _arg_11;
         _local_20.nmap = _arg_12;
         _local_20.accessible = _arg_13;
         _local_20.rankRange = _arg_17;
         _local_20.noSupplies = _arg_15;
         _local_20.proBattle = _arg_14;
         _local_20.suspicious = _arg_16;
         _local_20.capin = _arg_18;
         _local_20.kagalo = _arg_19;
         var _local_21:Object = new Object();
         _local_21.id = _arg_1;
         _local_21.accessible = _arg_13;
         _local_21.iconNormal = this.myIcon(false,_local_20);
         _local_21.iconSelected = this.myIcon(true,_local_20);
         _local_21.suspicious = _arg_16;
         _local_21.dat = _local_20;
         if(_arg_4)
         {
            _local_21.friends = _local_20.friends;
         }
         else
         {
            _local_21.friends = _local_20.friendsBlues + _local_20.friendsReds;
         }
         return _local_21;
      }
      
      private function cefemilek(_arg_1:String, _arg_2:Boolean, _arg_3:String) : String
      {
         if(_arg_2)
         {
            _arg_1 = _arg_1 + " " + _arg_3;
         }
         return _arg_1;
      }
      
      public function getItemIndex(_arg_1:String) : int
      {
         var _local_2:Object = null;
         var _local_4:int = 0;
         var _local_3:int = int(this._dataProvider.length);
         while(_local_4 < _local_3)
         {
            _local_2 = this._dataProvider.getItemAt(_local_4);
            if(_local_2.id == _arg_1)
            {
               return _local_4;
            }
            _local_4++;
         }
         return -1;
      }
      
      private function onResize(_arg_1:Event = null) : void
      {
         this.resize();
      }
      
      private function onShowCreateBattleFormButtonClick(_arg_1:MouseEvent) : void
      {
         this._callback.onShowCreateBattleFormButtonClick();
      }
      
      private function onBattleListItemClick(_arg_1:ListEvent) : void
      {
         this._callback.onBattleListItemClick(String(_arg_1.item.dat.id));
         var _local_2:Boolean = Boolean(_arg_1.item.dat.accessible);
         if(!_local_2)
         {
            this._lockedMapsHelper.targetPoint = new Point(this._stage.mouseX,this._stage.mouseY);
            helpService.showHelper(this.HELPER_GROUP_KEY,this.HELPER_NOT_AVAILABLE);
         }
      }
      
      private function onListChange(_arg_1:Event) : void
      {
         if(this._battleList.selectedItem != null)
         {
            this._callback.onBattleListItemChange(String(this._battleList.selectedItem.dat.id));
         }
      }
   }
}

