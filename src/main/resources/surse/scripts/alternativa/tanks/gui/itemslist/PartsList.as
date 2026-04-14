package alternativa.tanks.gui.itemslist
{
   import assets.Diamond;
   import assets.icons.GarageItemBackground;
   import assets.icons.IconGarageMod;
   import assets.icons.InputCheckIcon;
   import base.DiscreteSprite;
   import controls.Money;
   import controls.base.LabelBase;
   import controls.labels.CountDownTimerLabel;
   import controls.saleicons.SaleIcons;
   import controls.timer.CountDownTimer;
   import controls.timer.CountDownTimerOnCompleteBefore;
   import fl.controls.LabelButton;
   import fl.controls.ScrollBar;
   import fl.controls.ScrollBarDirection;
   import fl.controls.TileList;
   import fl.data.DataProvider;
   import fl.events.ListEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.utils.getTimer;
   import forms.events.PartsListEvent;
   import forms.premium.PremiumItemLock;
   import forms.ranks.BigRankIcon;
   import forms.ranks.RankIcon;
   import forms.registration.CallsignIconStates;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemGarageProperty;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.disposeBitmapsData;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.removeDisplayObject;
   import utils.ScrollStyleUtils;
   
   public class PartsList extends Sprite implements IResourceLoadingListener, CountDownTimerOnCompleteBefore
   {
      
      private static const labelRed:Bitmap = SaleIcons.createSaleRedLabelInstance();
      
      private static const MIN_POSIBLE_SPEED:Number = 70;
      
      private static const MAX_DELTA_FOR_SELECT:Number = 7;
      
      private static const ADDITIONAL_SCROLL_AREA_HEIGHT:Number = 3;
      
      private static const PREMIUM_ITEM_LOCK_X:int = 118;
      
      private static const PREMIUM_ITEM_LOCK_Y:int = 58;
      
      private var list:TileList;
      
      private var dp:DataProvider;
      
      private var typeSort:Array = [ItemCategoryEnum.WEAPON,ItemCategoryEnum.ARMOR,ItemCategoryEnum.COLOR,ItemCategoryEnum.PLUGIN,ItemCategoryEnum.INVENTORY,ItemCategoryEnum.KIT];
      
      private var _selectedItem:IGameObject = null;
      
      private var previousPositionX:Number;
      
      private var currrentPositionX:Number;
      
      private var sumDragWay:Number;
      
      private var lastItemIndex:int;
      
      private var previousTime:int;
      
      private var currentTime:int;
      
      private var scrollSpeed:Number = 0;
      
      private var bitmapsData:Array;
      
      private var _width:int;
      
      private var _height:int;
      
      public function PartsList()
      {
         super();
         this.bitmapsData = [];
         this.dp = new DataProvider();
         this.list = new TileList();
         this.list.dataProvider = this.dp;
         this.list.rowCount = 1;
         this.list.rowHeight = 130;
         this.list.columnWidth = 203;
         this.list.setStyle("cellRenderer",PartsListRenderer);
         this.list.direction = ScrollBarDirection.HORIZONTAL;
         this.list.focusEnabled = false;
         this.list.horizontalScrollBar.focusEnabled = false;
         addChild(this.list);
         addEventListener(Event.ADDED_TO_STAGE,this.addListners);
         addEventListener(Event.REMOVED_FROM_STAGE,this.removeListners);
         ScrollStyleUtils.setGreenStyle(this.list);
      }
      
      public function get selectedItem() : IGameObject
      {
         return this._selectedItem;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = Math.ceil(_arg_1);
         this.list.width = this._width;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set height(_arg_1:Number) : void
      {
         this._height = Math.ceil(_arg_1);
         this.list.height = this._height;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      public function get columnWidth() : int
      {
         return Math.ceil(this.list.columnWidth);
      }
      
      private function updateScrollOnEnterFrame(_arg_1:Event) : void
      {
         var _local_2:Sprite = null;
         var _local_3:Sprite = null;
         var _local_5:int = 0;
         _local_2 = null;
         _local_3 = null;
         var _local_4:ScrollBar = this.list.horizontalScrollBar;
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
               this.list.addChild(_local_3);
            }
            _local_3.graphics.beginFill(0,0);
            if(_local_2 is LabelButton)
            {
               _local_3.graphics.drawRect(_local_2.y - 14,_local_4.y - ADDITIONAL_SCROLL_AREA_HEIGHT,_local_2.height + 28,_local_2.width + ADDITIONAL_SCROLL_AREA_HEIGHT);
            }
            else
            {
               _local_3.graphics.drawRect(_local_2.y,_local_4.y - ADDITIONAL_SCROLL_AREA_HEIGHT,_local_2.height,_local_2.width + ADDITIONAL_SCROLL_AREA_HEIGHT);
            }
            _local_3.graphics.endFill();
            _local_5++;
         }
      }
      
      private function onMouseDown(_arg_1:MouseEvent) : void
      {
         this.scrollSpeed = 0;
         var _local_2:Rectangle = this.list.horizontalScrollBar.getBounds(stage);
         _local_2.top -= ADDITIONAL_SCROLL_AREA_HEIGHT;
         if(!_local_2.contains(_arg_1.stageX,_arg_1.stageY))
         {
            this.sumDragWay = 0;
            this.previousPositionX = this.currrentPositionX = _arg_1.stageX;
            this.currentTime = this.previousTime = getTimer();
            this.lastItemIndex = this.list.selectedIndex;
            stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseMove(_arg_1:MouseEvent) : void
      {
         this.previousPositionX = this.currrentPositionX;
         this.currrentPositionX = _arg_1.stageX;
         this.previousTime = this.currentTime;
         this.currentTime = getTimer();
         var _local_2:Number = this.currrentPositionX - this.previousPositionX;
         this.sumDragWay += Math.abs(_local_2);
         if(this.sumDragWay > MAX_DELTA_FOR_SELECT)
         {
            this.list.horizontalScrollPosition -= _local_2;
         }
         _arg_1.updateAfterEvent();
      }
      
      private function onMouseUp(_arg_1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         var _local_2:Number = (getTimer() - this.previousTime) / 1000;
         if(_local_2 == 0)
         {
            _local_2 = 0.1;
         }
         var _local_3:Number = _arg_1.stageX - this.previousPositionX;
         this.scrollSpeed = _local_3 / _local_2;
         this.previousTime = this.currentTime;
         this.currentTime = getTimer();
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(_arg_1:Event) : void
      {
         this.previousTime = this.currentTime;
         this.currentTime = getTimer();
         var _local_2:Number = (this.currentTime - this.previousTime) / 1000;
         this.list.horizontalScrollPosition -= this.scrollSpeed * _local_2;
         var _local_3:Number = this.list.horizontalScrollPosition;
         var _local_4:Number = this.list.maxHorizontalScrollPosition;
         if(Math.abs(this.scrollSpeed) > MIN_POSIBLE_SPEED && 0 < _local_3 && _local_3 < _local_4)
         {
            this.scrollSpeed *= Math.exp(-1.5 * _local_2);
         }
         else
         {
            this.scrollSpeed = 0;
            removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
      
      private function selectItem(_arg_1:ListEvent) : void
      {
         var _local_2:Object = null;
         if(this.sumDragWay < MAX_DELTA_FOR_SELECT)
         {
            _local_2 = _arg_1.item;
            this.scrollSpeed = 0;
            if(this._selectedItem != _local_2.dat.id)
            {
               this._selectedItem = _local_2.dat.id;
               this.list.selectedItem = _local_2;
               this.list.scrollToSelected();
               dispatchEvent(new PartsListEvent(PartsListEvent.SELECT_PARTS_LIST_ITEM));
            }
            dispatchEvent(new PartsListEvent(PartsListEvent.ITEM_CLICK));
         }
         else
         {
            this.list.addEventListener(Event.CHANGE,this.onChangeItem);
         }
      }
      
      private function onChangeItem(_arg_1:Event) : void
      {
         this.list.selectedIndex = this.lastItemIndex;
         this.list.removeEventListener(Event.CHANGE,this.onChangeItem);
      }
      
      public function addItem(_arg_1:IGameObject, _arg_2:String, _arg_3:ItemCategoryEnum, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:Boolean, _arg_8:Boolean, _arg_9:int, _arg_10:ImageResource, _arg_11:int = 0, _arg_12:CountDownTimer = null, _arg_13:int = -1, _arg_14:CountDownTimer = null, _arg_15:Vector.<ItemGarageProperty> = null, _arg_16:Boolean = false) : void
      {
         var _local_17:DisplayObject = null;
         var _local_18:DisplayObject = null;
         var _local_19:Object = {};
         _local_19.id = _arg_1;
         _local_19.name = _arg_2;
         _local_19.type = _arg_3;
         _local_19.typeSort = this.typeSort[_arg_3];
         _local_19.mod = _arg_13;
         _local_19.crystalPrice = _arg_5;
         _local_19.rank = _arg_6 == 0 && !_arg_7 ? -1 : _arg_6;
         _local_19.showLockPremium = _arg_7;
         _local_19.installed = false;
         _local_19.garageElement = _arg_8;
         _local_19.count = _arg_9;
         _local_19.preview = _arg_10;
         _local_19.sort = _arg_4;
         _local_19.discount = _arg_11;
         _local_19.timer = _arg_12;
         _local_19.timerDiscount = _arg_14;
         _local_19.isUpgradingInAvailableItemsAlert = _arg_16;
         if(_arg_12 != null && _arg_16)
         {
            _local_19.timer.addListener(CountDownTimerOnCompleteBefore,this);
         }
         _local_17 = this.myIcon(_local_19,false);
         _local_18 = this.myIcon(_local_19,true);
         this.dp.addItem({
            "iconNormal":_local_17,
            "iconSelected":_local_18,
            "dat":_local_19,
            "rank":_local_19.rank,
            "type":_arg_3,
            "typesort":_local_19.typeSort,
            "sort":_arg_4
         });
         this.dp.sortOn(["rank","sort"],[Array.NUMERIC,Array.NUMERIC]);
      }
      
      private function update(_arg_1:IGameObject, _arg_2:String, _arg_3:* = null, _arg_4:Boolean = true) : void
      {
         var _local_5:int = this.indexById(_arg_1);
         this.updateByIndex(_local_5,_arg_2,_arg_3,_arg_4);
      }
      
      private function updateByIndex(_arg_1:int, _arg_2:String, _arg_3:*, _arg_4:Boolean) : void
      {
         var _local_5:DisplayObject = null;
         var _local_6:DisplayObject = null;
         var _local_7:Object = this.dp.getItemAt(_arg_1);
         var _local_8:Object = _local_7.dat;
         _local_8[_arg_2] = _arg_3;
         if(_arg_4)
         {
            _local_5 = this.myIcon(_local_8,false);
            _local_6 = this.myIcon(_local_8,true);
            _local_7.dat = _local_8;
            _local_7.iconNormal = _local_5;
            _local_7.iconSelected = _local_6;
            this.dp.replaceItemAt(_local_7,_arg_1);
            this.dp.sortOn(["rank","sort"],[Array.NUMERIC,Array.NUMERIC]);
            this.dp.invalidateItemAt(_arg_1);
         }
      }
      
      public function mount(_arg_1:IGameObject) : void
      {
         this.update(_arg_1,"installed",true);
      }
      
      public function unmount(_arg_1:IGameObject) : void
      {
         this.update(_arg_1,"installed",false);
      }
      
      public function updateCount(_arg_1:IGameObject, _arg_2:int) : void
      {
         this.update(_arg_1,"count",_arg_2);
      }
      
      public function updateDiscountWithTimer(_arg_1:IGameObject, _arg_2:int, _arg_3:CountDownTimer) : void
      {
         this.update(_arg_1,"discount",_arg_2,false);
         this.update(_arg_1,"timerDiscount",_arg_3);
      }
      
      public function updateDiscountAndCost(_arg_1:IGameObject, _arg_2:int, _arg_3:CountDownTimer, _arg_4:int) : void
      {
         this.update(_arg_1,"discount",_arg_2,false);
         this.update(_arg_1,"timerDiscount",_arg_3,false);
         this.updateCost(_arg_1,_arg_4);
      }
      
      public function updatePreview(_arg_1:ImageResource) : void
      {
         var _local_2:Object = null;
         var _local_3:int = 0;
         while(_local_3 < this.dp.length)
         {
            _local_2 = this.dp.getItemAt(_local_3);
            if((_local_2.dat.preview as ImageResource).id == _arg_1.id)
            {
               this.update(_local_2.dat.id,"preview",_arg_1 as ImageResource);
            }
            _local_3++;
         }
      }
      
      public function deleteItem(_arg_1:IGameObject) : void
      {
         var _local_2:int = this.indexById(_arg_1);
         var _local_3:Object = this.dp.getItemAt(_local_2);
         if(this.list.selectedIndex == _local_2)
         {
            this._selectedItem = null;
            this.list.selectedItem = null;
         }
         this.dp.removeItem(_local_3);
      }
      
      public function select(_arg_1:IGameObject) : void
      {
         var _local_2:int = 0;
         this.scrollSpeed = 0;
         if(this._selectedItem != _arg_1)
         {
            _local_2 = this.indexById(_arg_1);
            this.list.selectedIndex = _local_2;
            this._selectedItem = _arg_1;
            dispatchEvent(new PartsListEvent(PartsListEvent.SELECT_PARTS_LIST_ITEM));
         }
      }
      
      public function selectByIndex(_arg_1:uint) : void
      {
         var _local_2:Object = null;
         this.scrollSpeed = 0;
         if(this.list.selectedIndex != _arg_1)
         {
            _local_2 = (this.dp.getItemAt(_arg_1) as Object).dat;
            this.list.selectedIndex = _arg_1;
            this._selectedItem = _local_2.id;
            dispatchEvent(new PartsListEvent(PartsListEvent.SELECT_PARTS_LIST_ITEM));
         }
      }
      
      public function scrollTo(_arg_1:IGameObject) : void
      {
         this.scrollSpeed = 0;
         var _local_2:int = this.indexById(_arg_1);
         this.list.scrollToIndex(_local_2);
      }
      
      public function unselect() : void
      {
         this._selectedItem = null;
         this.list.selectedItem = null;
      }
      
      private function myIcon(_arg_1:Object, _arg_2:Boolean) : DisplayObject
      {
         var _local_3:BitmapData = null;
         var _local_4:GarageItemBackground = null;
         var _local_5:String = null;
         var _local_6:Bitmap = null;
         var _local_7:IconGarageMod = null;
         var _local_8:CountDownTimer = null;
         var _local_9:CountDownTimerLabel = null;
         var _local_10:Sprite = new DiscreteSprite();
         var _local_11:Sprite = new DiscreteSprite();
         var _local_12:LabelBase = new LabelBase();
         var _local_13:LabelBase = new LabelBase();
         var _local_14:LabelBase = new LabelBase();
         var _local_15:Diamond = new Diamond();
         var _local_16:InputCheckIcon = new InputCheckIcon();
         if((_arg_1.preview as ImageResource).data == null)
         {
            _local_11.addChild(_local_16);
            _local_16.gotoAndStop(CallsignIconStates.CALLSIGN_ICON_STATE_PROGRESS);
            _local_16.x = 200 - _local_16.width >> 1;
            _local_16.y = 130 - _local_16.height >> 1;
            (_arg_1.preview as ImageResource).addLazyListener(this);
         }
         else
         {
            _local_6 = new Bitmap((_arg_1.preview as ImageResource).data);
            _local_6.x = 19;
            _local_6.y = 18;
            _local_11.addChild(_local_6);
         }
         if(_arg_1.rank > 0 || Boolean(_arg_1.showLockPremium))
         {
            if(_arg_1.type != ItemCategoryEnum.PLUGIN)
            {
               this.addLockItem(_arg_1,_local_11);
            }
            _local_5 = "OFF";
            _arg_1.installed = false;
            _local_14.color = _local_13.color = _local_12.color = 12632256;
         }
         else
         {
            _local_14.color = _local_13.color = _local_12.color = 5898034;
            if(Boolean(_arg_1.garageElement) && _arg_1.mod != -1)
            {
               _local_7 = new IconGarageMod(_arg_1.mod);
               _local_11.addChild(_local_7);
               _local_7.x = 159;
               _local_7.y = 7;
            }
            switch(_arg_1.type)
            {
               case ItemCategoryEnum.WEAPON:
                  if(Boolean(_arg_1.garageElement) && Boolean(_arg_1.installed))
                  {
                     _local_12.color = 8693863;
                  }
                  _local_5 = "GUN";
                  break;
               case ItemCategoryEnum.ARMOR:
                  if(Boolean(_arg_1.garageElement) && Boolean(_arg_1.installed))
                  {
                     _local_12.color = 9411748;
                  }
                  _local_5 = "SHIELD";
                  break;
               case ItemCategoryEnum.COLOR:
                  _local_5 = "COLOR";
                  if(Boolean(_arg_1.installed))
                  {
                     _local_12.color = 11049390;
                  }
                  break;
               case ItemCategoryEnum.INVENTORY:
                  _local_5 = "ENGINE";
                  _arg_1.installed = false;
                  _local_11.addChild(_local_14);
                  _local_14.x = 15;
                  _local_14.y = 100;
                  _local_14.autoSize = TextFieldAutoSize.NONE;
                  _local_14.size = 16;
                  _local_14.align = TextFormatAlign.LEFT;
                  _local_14.width = 100;
                  _local_14.height = 25;
                  _local_14.text = _arg_1.count == 0 ? " " : "×" + String(_arg_1.count);
                  break;
               default:
                  _local_5 = "PLUGIN";
            }
         }
         _local_5 += (Boolean(_arg_1.installed) ? "_INSTALLED" : "_NORMAL") + (!_arg_2 ? "" : "_SELECTED");
         _local_4 = new GarageItemBackground(GarageItemBackground.idByName(_local_5));
         _local_12.text = _arg_1.name;
         if(!_arg_1.garageElement || _arg_1.type == ItemCategoryEnum.INVENTORY)
         {
            if(_arg_1.crystalPrice > 0)
            {
               _local_13.text = Money.numToString(_arg_1.crystalPrice,false);
               _local_13.x = 181 - _local_13.textWidth;
               _local_13.y = 2;
               _local_11.addChild(_local_15);
               _local_11.addChild(_local_13);
               _local_15.x = 186;
               _local_15.y = 6;
            }
         }
         _local_12.y = 2;
         _local_12.x = 3;
         _local_11.addChildAt(_local_4,0);
         _local_11.addChild(_local_12);
         var _local_17:LabelBase = new LabelBase();
         if(_arg_1.discount > 0 && (Boolean(_arg_1.rank <= 0) || Boolean(_arg_1.garageElement)))
         {
            labelRed.y = _local_4.height - labelRed.height - 8;
            labelRed.x = _local_4.width - labelRed.width - 2;
            _local_11.addChild(labelRed);
            _local_17.color = 16777215;
            _local_17.align = TextFormatAlign.CENTER;
            _local_17.text = "-" + String(_arg_1.discount) + "%";
            _local_17.size = 13;
            _local_17.x = int(labelRed.x + labelRed.width / 2 - _local_17.textWidth / 2);
            _local_17.y = labelRed.y + 6;
            _local_11.addChild(_local_17);
            if(_arg_1.timerDiscount != null)
            {
               _local_8 = _arg_1.timerDiscount;
               if(_local_8.getEndTime() > getTimer())
               {
                  _local_9 = new CountDownTimerLabel();
                  _local_9.color = 15258050;
                  _local_9.start(_arg_1.timerDiscount);
                  _local_9.y = labelRed.y + 18;
                  _local_9.autoSize = TextFieldAutoSize.NONE;
                  _local_9.align = TextFormatAlign.CENTER;
                  _local_9.width = labelRed.width - 8;
                  _local_9.x = int(labelRed.x + labelRed.width / 2 - _local_9.width / 2);
                  _local_10.addChild(_local_9);
               }
               else
               {
                  _arg_1.timerDiscount = null;
                  _local_17.y += 5;
               }
            }
            else
            {
               _local_17.y += 5;
            }
         }
         _local_3 = new BitmapData(_local_11.width,_local_11.height,true,0);
         this.bitmapsData.push(_local_3);
         _local_3.draw(_local_11);
         _local_10.addChildAt(new Bitmap(_local_3),0);
         if(_arg_1.timer != null)
         {
            if(Boolean(_arg_1.isUpgradingInAvailableItemsAlert))
            {
               _local_9 = new CountDownTimerLabel();
               _local_9.start(_arg_1.timer);
               _local_9.y = _local_4.height - _local_9.textHeight - 7;
               _local_9.width = _local_4.width - 7;
               _local_9.autoSize = TextFieldAutoSize.NONE;
               _local_9.align = TextFormatAlign.RIGHT;
               _local_9.x = 0;
               _local_10.addChild(_local_9);
            }
         }
         return _local_10;
      }
      
      private function addLockItem(_arg_1:Object, _arg_2:Sprite) : void
      {
         if(_arg_1.rank > 0)
         {
            _arg_2.addChild(this.createRankIcon(_arg_1));
         }
         else
         {
            _arg_2.addChild(this.createPremiumIcon());
         }
      }
      
      private function createRankIcon(_arg_1:Object) : RankIcon
      {
         var _local_2:RankIcon = new BigRankIcon();
         if(Boolean(_arg_1.showLockPremium))
         {
            _local_2.setPremium(_arg_1.rank);
            _local_2.x = PREMIUM_ITEM_LOCK_X;
            _local_2.y = PREMIUM_ITEM_LOCK_Y;
         }
         else
         {
            _local_2.setDefaultAccount(_arg_1.rank);
            _local_2.x = 135;
            _local_2.y = 65;
         }
         return _local_2;
      }
      
      private function createPremiumIcon() : Bitmap
      {
         var _local_1:Bitmap = PremiumItemLock.createInstance();
         _local_1.x = PREMIUM_ITEM_LOCK_X;
         _local_1.y = PREMIUM_ITEM_LOCK_Y;
         return _local_1;
      }
      
      public function indexById(_arg_1:IGameObject) : int
      {
         var _local_2:Object = null;
         var _local_3:int = 0;
         while(_local_3 < this.dp.length)
         {
            _local_2 = this.dp.getItemAt(_local_3);
            if(_local_2.dat.id == _arg_1)
            {
               return _local_3;
            }
            _local_3++;
         }
         return -1;
      }
      
      public function updateCost(_arg_1:IGameObject, _arg_2:int) : void
      {
         this.update(_arg_1,"crystalPrice",_arg_2);
      }
      
      public function updateShowLockPremium(_arg_1:IGameObject, _arg_2:Boolean) : void
      {
         this.update(_arg_1,"showLockPremium",_arg_2);
      }
      
      public function removeDiscountItem(_arg_1:IGameObject) : void
      {
         this.update(_arg_1,"saleImage",null);
      }
      
      public function getItemAt(_arg_1:int) : IGameObject
      {
         return this.dp.getItemAt(_arg_1).dat.id;
      }
      
      public function itemsCount() : int
      {
         return this.dp.length;
      }
      
      private function scrollList(_arg_1:MouseEvent) : void
      {
         this.scrollSpeed = 0;
         this.list.horizontalScrollPosition -= _arg_1.delta * (!Boolean(Capabilities.os.search("Linux") != -1) ? 10 : 50);
      }
      
      public function onResourceLoadingComplete(_arg_1:Resource) : void
      {
         this.updatePreview(_arg_1 as ImageResource);
      }
      
      private function addListners(_arg_1:Event) : void
      {
         this.list.horizontalScrollBar.addEventListener(Event.ENTER_FRAME,this.updateScrollOnEnterFrame);
         this.list.addEventListener(ListEvent.ITEM_CLICK,this.selectItem);
         addEventListener(MouseEvent.MOUSE_WHEEL,this.scrollList);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
      }
      
      private function removeListners(_arg_1:Event) : void
      {
         this.list.horizontalScrollBar.removeEventListener(Event.ENTER_FRAME,this.updateScrollOnEnterFrame);
         this.list.removeEventListener(ListEvent.ITEM_CLICK,this.selectItem);
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         removeEventListener(MouseEvent.MOUSE_WHEEL,this.scrollList);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      public function onResourceLoadingError(_arg_1:Resource, _arg_2:String) : void
      {
      }
      
      public function onResourceLoadingFatalError(_arg_1:Resource, _arg_2:String) : void
      {
      }
      
      public function onResourceLoadingProgress(_arg_1:Resource, _arg_2:int) : void
      {
      }
      
      public function onResourceLoadingStart(_arg_1:Resource) : void
      {
      }
      
      public function onCompleteBefore(_arg_1:CountDownTimer, _arg_2:Boolean) : void
      {
         var _local_3:Object = null;
         var _local_4:int = 0;
         while(_local_4 < this.dp.length)
         {
            _local_3 = this.dp.getItemAt(_local_4).dat;
            if(_local_3.timer == _arg_1)
            {
               this.updateByIndex(_local_4,"timer",null,false);
            }
            _local_4++;
         }
      }
      
      public function destroy() : void
      {
         disposeBitmapsData(this.bitmapsData);
         this.bitmapsData = null;
         removeDisplayObject(this.list);
         this.removePreviewLazyListeners();
         this.removeAllElements();
         this.list.removeAll();
         this.list = null;
         this.dp = null;
      }
      
      private function removeAllElements() : void
      {
         var _local_1:Object = null;
         var _local_2:CountDownTimer = null;
         var _local_3:int = 0;
         while(_local_3 < this.dp.length)
         {
            _local_1 = this.dp.getItemAt(_local_3).dat;
            if(_local_1.timer != null)
            {
               _local_2 = _local_1.timer;
               _local_2.removeListener(CountDownTimerOnCompleteBefore,this);
            }
            _local_3++;
         }
         this.dp.removeAll();
      }
      
      private function removePreviewLazyListeners() : void
      {
         var _local_1:Object = null;
         var _local_2:ImageResource = null;
         var _local_3:int = 0;
         while(_local_3 < this.dp.length)
         {
            _local_1 = this.dp.getItemAt(_local_3);
            _local_2 = _local_1.dat.preview as ImageResource;
            _local_2.removeLazyListener(this);
            _local_3++;
         }
      }
   }
}

