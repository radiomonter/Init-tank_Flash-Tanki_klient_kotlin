package alternativa.tanks.gui
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.buttons.GarageButton;
   import alternativa.tanks.gui.buttons.TimerButton;
   import alternativa.tanks.gui.buttons.TimerButtonEvent;
   import alternativa.tanks.gui.device.ItemInfoDevicesPanel;
   import alternativa.tanks.gui.effects.BlinkEffect;
   import alternativa.tanks.gui.effects.GlowEffect;
   import alternativa.tanks.gui.upgrade.ItemPropertyUpgradeEvent;
   import alternativa.tanks.gui.upgrade.SelectUpgradeWindow;
   import alternativa.tanks.gui.upgrade.UpgradeButton;
   import alternativa.tanks.gui.upgrade.UpgradeColors;
   import alternativa.tanks.model.item.droppablegold.DroppableGoldItemModel;
   import alternativa.tanks.model.item.kit.GarageKit;
   import alternativa.tanks.model.item.present.PresentItem;
   import alternativa.tanks.model.item.properties.ItemPropertyValue;
   import alternativa.tanks.model.item.skins.AvailableSkins;
   import alternativa.tanks.model.item.temporary.ITemporaryItem;
   import alternativa.tanks.model.item.upgradable.UpgradableItem;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import alternativa.tanks.model.lootboxes.LootBoxModel;
   import alternativa.tanks.service.delaymountcategory.IDelayMountCategoryService;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.item3d.ITank3DViewer;
   import alternativa.tanks.service.itempropertyparams.Bekipudi;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.types.Long;
   import alternativa.utils.removeDisplayObject;
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import base.DiscreteSprite;
   import controls.Money;
   import controls.NumStepper;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import controls.buttons.h50px.GreyBigButton;
   import controls.timer.CountDownTimer;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import forms.TankWindowWithHeader;
   import obfuscation.kysunek.Lof;
   import obfuscation.silulu.Zuludod;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.removeChildrenFrom;
   import titanomachina.headers.Headers;
   import utils.resource.IResourceLoadingComplete;
   import utils.resource.ResourceLoadingWrapper;
   
   public class ItemInfoPanel extends Sprite implements IResourceLoadingComplete
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var clientLog:IClientLog;
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      [Inject]
      public static var panelView:IPanelView;
      
      [Inject]
      public static var propertyService:ItemPropertyParamsService;
      
      [Inject]
      public static var dialogService:IDialogsService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var parami:ITank3DViewer;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var cazygova:IDelayMountCategoryService;
      
      public static const INVENTORY_MAX_VALUE:int = 9999;
      
      private static const TOP_PREVIEW_WITH_NAME_PENETRATION_SIZE:int = 15;
      
      private static const BOTTOM_MARGIN:int = 64;
      
      private static const BUTTON_SIZE:Point = new Point(120,50);
      
      private static const ICON_SPACING_H:int = 10;
      
      private static const HORIZONTAL_MARGIN:int = 12;
      
      private static const VERTICAL_MARGIN:int = 9;
      
      private static const MODULE_SPACING:int = 3;
      
      private static const PREVIEW_OFFSET_X:int = 0;
      
      private static const goqyza:int = 10;
      
      public const margin:int = 11;
      
      public var size:Point;
      
      public var inventoryNumStepper:NumStepper;
      
      public var buyButton:GarageButton;
      
      public var equipButton:TimerButton;
      
      public var upgradeButton:UpgradeButton;
      
      public var robog:GreyBigButton;
      
      private var mupuzeb:GreyBigButton;
      
      private var itemNameLabel:LabelBase;
      
      private var itemDescriptionLabel:LabelBase;
      
      private var window:TankWindowWithHeader;
      
      private var inner:TankWindowInner;
      
      private var gygedosyw:Bitmap;
      
      private var tusyjo:DiscreteSprite;
      
      private var dypuhup:Bitmap;
      
      private var zuni:Bitmap;
      
      private var leftPreview:Bitmap;
      
      private var _leftPreviewEnabled:Boolean = true;
      
      private var topPreview:Bitmap;
      
      private var propertiesParams:Vector.<Bekipudi>;
      
      private var scrollPane:ScrollPane;
      
      private var scrollContainer:Sprite;
      
      private var propertiesPanel:Sprite;
      
      private var propertiesPanelLeft:Bitmap;
      
      private var propertiesPanelCenter:Bitmap;
      
      private var propertiesPanelRight:Bitmap;
      
      private var area:Shape;
      
      private var areaRect:Rectangle;
      
      private var areaRect2:Rectangle;
      
      private var timeIndicator:LabelBase;
      
      private var modTable:ModTable;
      
      private var vuzoho:Lof;
      
      private var rum:Sprite;
      
      private var tigu:Bitmap;
      
      private var gozejyc:Bitmap;
      
      private var nybo:Bitmap;
      
      private var jogubeg:Bitmap;
      
      private var zovoki:Bitmap;
      
      private var pupek:Bitmap;
      
      private var gycazet:Bitmap;
      
      private var gaco:Bitmap;
      
      private var juwadavu:Bitmap;
      
      private var gopicydit:Bitmap;
      
      private var tytenub:Bitmap;
      
      private var vaj:Bitmap;
      
      private var doj:Bitmap;
      
      private var nefogukuc:Shape;
      
      private var bawowimaqi:Shape;
      
      private var zereqyj:Boolean;
      
      private var kigijab:LabelBase;
      
      private var item:IGameObject;
      
      private var itemCategory:ItemCategoryEnum;
      
      private var itemPrice:int;
      
      private var isCountable:Boolean = false;
      
      private var previewResource:ImageResource;
      
      private var maxRankIndex:int;
      
      private var minRankIndex:int;
      
      private var symewotoc:Long;
      
      private var _topPreviewLoadingId:Long;
      
      private var tysi:Long;
      
      private var jonurywi:Long;
      
      private var selectWindow:SelectUpgradeWindow;
      
      private var blinkEffect:BlinkEffect;
      
      private var actionButtonsContainer:DiscreteSprite;
      
      private var oldActionButtonsContainer:DiscreteSprite;
      
      private var enabledUpgrades:Boolean;
      
      private var begizotap:Hovoja;
      
      private var devicesAvailable:Boolean = false;
      
      private var devicesPanel:ItemInfoDevicesPanel;
      
      public function ItemInfoPanel(_arg_1:Boolean, _arg_2:int)
      {
         var _local_3:TextFormat = null;
         this.propertiesParams = new Vector.<Bekipudi>();
         this.blinkEffect = new BlinkEffect();
         this.actionButtonsContainer = new DiscreteSprite();
         this.oldActionButtonsContainer = new DiscreteSprite();
         super();
         this.enabledUpgrades = _arg_1;
         this.size = new Point(400,300);
         this.window = new TankWindowWithHeader(Headers.getHeaderById("INFORMATION"));
         this.window.width = this.size.x;
         this.window.height = this.size.y;
         addChild(this.window);
         this.inner = new TankWindowInner(164,106,TankWindowInner.GREEN);
         this.inner.showBlink = true;
         addChild(this.inner);
         this.inner.x = this.margin;
         this.inner.y = this.margin;
         this.area = new Shape();
         this.areaRect = new Rectangle();
         this.areaRect2 = new Rectangle(HORIZONTAL_MARGIN,VERTICAL_MARGIN,0,0);
         this.areaRect.width = _arg_2 - this.margin * 2 - 2;
         this.areaRect2.width = this.areaRect.width - HORIZONTAL_MARGIN * 2;
         this.scrollContainer = new Sprite();
         this.scrollContainer.x = this.margin + 1;
         this.scrollContainer.y = this.margin + 1;
         this.scrollContainer.addChild(this.area);
         this.scrollPane = new ScrollPane();
         addChild(this.scrollPane);
         this.confScroll();
         this.scrollPane.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.scrollPane.verticalScrollPolicy = ScrollPolicy.AUTO;
         this.scrollPane.source = this.scrollContainer;
         this.scrollPane.focusEnabled = false;
         this.scrollPane.x = this.margin + 1;
         this.scrollPane.y = this.margin + 1 + MODULE_SPACING;
         var _local_4:String = userPropertiesService.userName;
         this.itemNameLabel = new LabelBase();
         this.itemNameLabel.type = TextFieldType.DYNAMIC;
         this.itemNameLabel.text = "Hello, " + _local_4 + "!";
         this.itemNameLabel.size = 18;
         this.itemNameLabel.color = 381208;
         this.scrollContainer.addChild(this.itemNameLabel);
         this.itemNameLabel.x = HORIZONTAL_MARGIN - 3;
         this.itemNameLabel.y = VERTICAL_MARGIN - 7;
         this.devicesPanel = new ItemInfoDevicesPanel();
         this.devicesPanel.x = HORIZONTAL_MARGIN;
         this.scrollContainer.addChild(this.devicesPanel);
         this.itemDescriptionLabel = new LabelBase();
         var _local_5:String = localeService.language;
         if(_local_5 == "cn")
         {
            _local_3 = this.itemDescriptionLabel.getTextFormat();
            _local_3.leading = 3;
            this.itemDescriptionLabel.defaultTextFormat = _local_3;
         }
         this.itemDescriptionLabel.multiline = true;
         this.itemDescriptionLabel.wordWrap = true;
         this.itemDescriptionLabel.color = 381208;
         this.itemDescriptionLabel.text = "Description";
         this.itemDescriptionLabel.mouseWheelEnabled = false;
         this.scrollContainer.addChild(this.itemDescriptionLabel);
         this.itemDescriptionLabel.x = HORIZONTAL_MARGIN - 3;
         this.tusyjo = new DiscreteSprite();
         this.scrollContainer.addChild(this.tusyjo);
         this.begizotap = new Hovoja(this.areaRect2.width);
         this.begizotap.x = 9;
         this.gygedosyw = new Bitmap();
         this.dypuhup = new Bitmap();
         this.zuni = new Bitmap();
         this.leftPreview = new Bitmap();
         this.topPreview = new Bitmap();
         this.buyButton = new GarageButton();
         this.upgradeButton = new UpgradeButton();
         this.upgradeButton.addEventListener(MouseEvent.CLICK,this.onButtonUpgradeClick);
         this.equipButton = new TimerButton();
         this.equipButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_INFO_PANEL_BUTTON_EQUIP_TEXT);
         this.mupuzeb = new GreyBigButton();
         this.mupuzeb.label = localeService.getText(TanksLocale.TEXT_FITTING_BUTTON_TEXT);
         this.mupuzeb.visible = false;
         this.mupuzeb.addEventListener(MouseEvent.CLICK,this.finy);
         this.robog = new GreyBigButton();
         this.robog.label = localeService.getText(TanksLocale.TEXT_DELETE_PRESENT_BUTTON);
         this.robog.visible = false;
         this.buyButton.visible = false;
         this.upgradeButton.visible = false;
         this.equipButton.visible = false;
         addChild(this.oldActionButtonsContainer);
         this.oldActionButtonsContainer.addChild(this.buyButton);
         this.oldActionButtonsContainer.addChild(this.upgradeButton);
         this.oldActionButtonsContainer.addChild(this.equipButton);
         this.oldActionButtonsContainer.addChild(this.mupuzeb);
         this.oldActionButtonsContainer.addChild(this.robog);
         addChild(this.actionButtonsContainer);
         this.inventoryNumStepper = new NumStepper();
         this.oldActionButtonsContainer.addChild(this.inventoryNumStepper);
         this.inventoryNumStepper.value = 1;
         this.inventoryNumStepper.minValue = 1;
         this.inventoryNumStepper.maxValue = INVENTORY_MAX_VALUE;
         this.inventoryNumStepper.visible = false;
         this.inventoryNumStepper.mouseEnabled = false;
         this.inventoryNumStepper.addEventListener(Event.CHANGE,this.inventoryNumChanged);
         this.propertiesPanel = new Sprite();
         this.propertiesPanelLeft = new Bitmap(ItemInfoPanelBitmaps.propertiesLeft);
         this.propertiesPanel.addChild(this.propertiesPanelLeft);
         this.propertiesPanelCenter = new Bitmap(ItemInfoPanelBitmaps.propertiesCenter);
         this.propertiesPanel.addChild(this.propertiesPanelCenter);
         this.propertiesPanelRight = new Bitmap(ItemInfoPanelBitmaps.propertiesRight);
         this.propertiesPanel.addChild(this.propertiesPanelRight);
         this.propertiesPanelCenter.x = this.propertiesPanelLeft.width;
         this.propertiesPanel.x = HORIZONTAL_MARGIN;
         this.propertiesPanel.y = Math.round(VERTICAL_MARGIN * 2 + this.itemNameLabel.textHeight - 7);
         this.lihujyjy();
         this.timeIndicator = new LabelBase();
         this.timeIndicator.size = 18;
         this.timeIndicator.color = 381208;
         this.modTable = new ModTable(this.areaRect2.width);
         this.modTable.x = HORIZONTAL_MARGIN;
         this.kigijab = new LabelBase();
         this.kigijab.color = 16777215;
         this.kigijab.align = TextFormatAlign.CENTER;
         this.kigijab.size = 23;
         this.kigijab.bold = true;
         if(_local_5 == "cn")
         {
            this.kigijab.size = 20;
         }
      }
      
      private static function getRequiredRank(_arg_1:int, _arg_2:int, _arg_3:int) : int
      {
         var _local_4:int = _arg_2;
         if(_arg_1 < _arg_2)
         {
            _local_4 = -_arg_2;
         }
         else if(_arg_1 > _arg_3)
         {
            _local_4 = -_arg_3;
         }
         return _local_4;
      }
      
      private function lihujyjy() : void
      {
         this.rum = new Sprite();
         this.tigu = new Bitmap(ItemInfoPanelBitmaps.nigopolib);
         this.rum.addChild(this.tigu);
         this.gozejyc = new Bitmap(ItemInfoPanelBitmaps.regapi);
         this.rum.addChild(this.gozejyc);
         this.nybo = new Bitmap(ItemInfoPanelBitmaps.gezinije);
         this.rum.addChild(this.nybo);
         this.gozejyc.x = this.tigu.width;
         this.jogubeg = new Bitmap(ItemInfoPanelBitmaps.kajuvyna);
         this.rum.addChild(this.jogubeg);
         this.zovoki = new Bitmap(ItemInfoPanelBitmaps.mivumoheq);
         this.rum.addChild(this.zovoki);
         this.vaj = new Bitmap(ItemInfoPanelBitmaps.raceni);
         this.rum.addChild(this.vaj);
         this.doj = new Bitmap(ItemInfoPanelBitmaps.gelymyj);
         this.rum.addChild(this.doj);
         this.gopicydit = new Bitmap(ItemInfoPanelBitmaps.regapi);
         this.rum.addChild(this.gopicydit);
         this.pupek = new Bitmap(ItemInfoPanelBitmaps.tejis);
         this.rum.addChild(this.pupek);
         this.gycazet = new Bitmap(ItemInfoPanelBitmaps.vozubypak);
         this.rum.addChild(this.gycazet);
         this.tytenub = new Bitmap(ItemInfoPanelBitmaps.kywujiwe);
         this.rum.addChild(this.tytenub);
         this.gaco = new Bitmap(ItemInfoPanelBitmaps.kajuvyna);
         this.rum.addChild(this.gaco);
         this.juwadavu = new Bitmap(ItemInfoPanelBitmaps.mivumoheq);
         this.rum.addChild(this.juwadavu);
         this.nefogukuc = new Shape();
         this.rum.addChild(this.nefogukuc);
         this.bawowimaqi = new Shape();
         this.rum.addChild(this.bawowimaqi);
         this.rum.x = HORIZONTAL_MARGIN;
         this.vuzoho = new Lof(this.areaRect2.width);
         this.vuzoho.x = HORIZONTAL_MARGIN;
      }
      
      public function destroy() : void
      {
         this.window = null;
         this.inner = null;
         this.leftPreview = null;
         this.topPreview = null;
         this.dypuhup = null;
         this.tusyjo = null;
         this.gygedosyw = null;
         this.zuni = null;
         this.item = null;
         this.itemNameLabel = null;
         this.itemDescriptionLabel = null;
         this.scrollPane = null;
         this.scrollContainer = null;
         this.propertiesPanel = null;
         this.propertiesPanelLeft = null;
         this.propertiesPanelCenter = null;
         this.propertiesPanelRight = null;
         this.rum = null;
         this.tigu = null;
         this.gozejyc = null;
         this.nybo = null;
         this.jogubeg = null;
         this.area = null;
         this.areaRect = null;
         this.areaRect2 = null;
         this.oldActionButtonsContainer = null;
         this.buyButton = null;
         this.mupuzeb.removeEventListener(MouseEvent.CLICK,this.finy);
         this.mupuzeb = null;
         if(this.equipButton != null)
         {
            this.equipButton.removeEventListener(TimerButtonEvent.wopim,this.mydoha);
            this.equipButton.hideTime();
            this.equipButton = null;
         }
         if(this.upgradeButton != null)
         {
            this.upgradeButton.removeEventListener(MouseEvent.CLICK,this.onButtonUpgradeClick);
         }
         if(this.devicesPanel != null)
         {
            this.devicesPanel.destroy();
            this.devicesPanel = null;
         }
         this.upgradeButton = null;
         this.symewotoc = null;
         this.blinkEffect.stop();
         if(Boolean(this.selectWindow))
         {
            dialogService.removeDialog(this.selectWindow);
            this.selectWindow = null;
         }
         this.begizotap.destroy();
         this.begizotap = null;
         this.actionButtonsContainer = null;
      }
      
      private function finy(_arg_1:MouseEvent) : void
      {
         Zuludod(this.item.adapt(Zuludod)).fit();
         this.mupuzeb.enabled = false;
      }
      
      private function confScroll() : void
      {
         this.scrollPane.setStyle("downArrowUpSkin",ScrollArrowDownGreen);
         this.scrollPane.setStyle("downArrowDownSkin",ScrollArrowDownGreen);
         this.scrollPane.setStyle("downArrowOverSkin",ScrollArrowDownGreen);
         this.scrollPane.setStyle("downArrowDisabledSkin",ScrollArrowDownGreen);
         this.scrollPane.setStyle("upArrowUpSkin",ScrollArrowUpGreen);
         this.scrollPane.setStyle("upArrowDownSkin",ScrollArrowUpGreen);
         this.scrollPane.setStyle("upArrowOverSkin",ScrollArrowUpGreen);
         this.scrollPane.setStyle("upArrowDisabledSkin",ScrollArrowUpGreen);
         this.scrollPane.setStyle("trackUpSkin",ScrollTrackGreen);
         this.scrollPane.setStyle("trackDownSkin",ScrollTrackGreen);
         this.scrollPane.setStyle("trackOverSkin",ScrollTrackGreen);
         this.scrollPane.setStyle("trackDisabledSkin",ScrollTrackGreen);
         this.scrollPane.setStyle("thumbUpSkin",ScrollThumbSkinGreen);
         this.scrollPane.setStyle("thumbDownSkin",ScrollThumbSkinGreen);
         this.scrollPane.setStyle("thumbOverSkin",ScrollThumbSkinGreen);
         this.scrollPane.setStyle("thumbDisabledSkin",ScrollThumbSkinGreen);
      }
      
      private function hideIcons() : void
      {
         var _local_1:Bekipudi = null;
         for each(_local_1 in this.propertiesParams)
         {
            if(this.propertiesPanel.contains(_local_1.icon))
            {
               this.propertiesPanel.removeChild(_local_1.icon);
            }
         }
      }
      
      private function showIcons() : void
      {
         var _local_1:Bekipudi = null;
         for each(_local_1 in this.propertiesParams)
         {
            if(!this.propertiesPanel.contains(_local_1.icon))
            {
               this.propertiesPanel.addChild(_local_1.icon);
            }
         }
      }
      
      public function onLoadingComplete(_arg_1:Resource) : void
      {
         if(this.symewotoc == _arg_1.id)
         {
            if(!this.zereqyj && !itemService.gotol(this.item))
            {
               this.gygedosyw.bitmapData = ImageResource(_arg_1).data;
               this.resize(this.size.x,this.size.y);
            }
         }
         if(this._topPreviewLoadingId == _arg_1.id)
         {
            this.topPreview.bitmapData = ImageResource(_arg_1).data;
            this.showBitmap(this.topPreview);
            this.resize(this.size.x,this.size.y);
         }
         if(this.tysi == _arg_1.id)
         {
            if(this.zereqyj)
            {
               this.dypuhup.bitmapData = ImageResource(_arg_1).data;
               this.showBitmap(this.dypuhup);
               this.resize(this.size.x,this.size.y);
            }
         }
         if(this.jonurywi == _arg_1.id)
         {
            if(itemService.gotol(this.item))
            {
               this.zuni.bitmapData = ImageResource(_arg_1).data;
               this.showBitmap(this.zuni);
               this.resize(this.size.x,this.size.y);
            }
         }
      }
      
      public function showItemInfo(_arg_1:IGameObject, _arg_2:Boolean) : void
      {
         var _local_3:ImageResource = null;
         var _local_4:Boolean = false;
         var _local_5:int = 0;
         var _local_6:ItemPropertyValue = null;
         var _local_7:Bekipudi = null;
         var _local_8:int = 0;
         var _local_9:Vector.<IGameObject> = null;
         var _local_10:Vector.<String> = null;
         var _local_11:int = 0;
         var _local_12:IGameObject = null;
         var _local_13:ModInfoRow = null;
         var _local_14:int = 0;
         var _local_15:Vector.<UpgradableItemPropertyValue> = null;
         var _local_16:int = 0;
         var _local_17:int = 0;
         var _local_18:int = 0;
         var _local_20:int = 0;
         var _local_21:IGameObject = null;
         var _local_22:int = 0;
         var _local_23:PresentItem = null;
         var _local_24:ImageResource = null;
         var _local_25:ImageResource = null;
         var _local_19:Number = NaN;
         this.dypuhup.bitmapData = null;
         this.zuni.bitmapData = null;
         this.gygedosyw.bitmapData = null;
         if(!_arg_2 && !itemService.gotol(_arg_1))
         {
            this.updateUpgradeButton(_arg_1);
         }
         this.devicesAvailable = !_arg_2 && AvailableSkins(_arg_1.adapt(AvailableSkins)).getSkins().length > 0;
         removeChildrenFrom(this.actionButtonsContainer);
         this.jol(_arg_2,this.item,_arg_1);
         if(this.item != _arg_1)
         {
            parami.quz();
            this.item = _arg_1;
         }
         if(this.devicesAvailable)
         {
            this.devicesPanel.init(_arg_1);
         }
         this.devicesPanel.visible = this.devicesAvailable;
         if(_arg_2 || !itemService.cacum(_arg_1))
         {
            this.buyButton.setText(localeService.getText(TanksLocale.TEXT_GARAGE_INFO_PANEL_BUTTON_BUY_TEXT));
         }
         else
         {
            this.buyButton.setText(localeService.getText(TanksLocale.TEXT_GARAGE_INFO_PANEL_BUTTON_BUY_TEXT) + " M" + (itemService.getModificationIndex(_arg_1) + 1));
         }
         this.itemNameLabel.text = itemService.getName(_arg_1);
         this.itemDescriptionLabel.visible = !itemService.gotol(_arg_1);
         this.itemDescriptionLabel.htmlText = itemService.getDescription(_arg_1);
         this.previewResource = itemService.getPreviewResource(_arg_1);
         if(itemService.zereqyj(_arg_1))
         {
            _local_3 = GarageKit(_arg_1.adapt(GarageKit)).getImage();
            this.tysi = _local_3.id;
            if(_local_3.isLazy && !_local_3.isLoaded)
            {
               _local_3.loadLazyResource(new ResourceLoadingWrapper(this));
            }
            this.dypuhup.bitmapData = _local_3.data;
            if(this.dypuhup.bitmapData != null)
            {
               this.showBitmap(this.dypuhup);
            }
            else
            {
               removeDisplayObject(this.dypuhup);
            }
         }
         else if(itemService.gotol(_arg_1))
         {
            this.leftPreviewEnabled = false;
            _local_24 = PresentItem(_arg_1.adapt(PresentItem)).getImage();
            this.jonurywi = _local_24.id;
            if(_local_24.isLazy && !_local_24.isLoaded)
            {
               _local_24.loadLazyResource(new ResourceLoadingWrapper(this));
            }
            this.zuni.bitmapData = _local_24.data;
            if(this.zuni.bitmapData != null)
            {
               this.showBitmap(this.zuni);
            }
            else
            {
               removeDisplayObject(this.zuni);
            }
         }
         else
         {
            _local_25 = itemService.getPreviewResource(_arg_1);
            this.symewotoc = _local_25.id;
            if(_local_25.isLazy && !_local_25.isLoaded)
            {
               _local_25.loadLazyResource(new ResourceLoadingWrapper(this));
            }
            this.gygedosyw.bitmapData = _local_25.data;
         }
         this.maxRankIndex = itemService.hun(_arg_1);
         this.minRankIndex = itemService.ruma(_arg_1);
         this.hideIcons();
         this.itemCategory = itemService.getCategory(_arg_1);
         this.itemPrice = itemService.getPrice(_arg_1);
         this.isCountable = itemService.isCountable(_arg_1);
         var _local_26:Boolean = this.itemCategory != ItemCategoryEnum.ARMOR && this.itemCategory != ItemCategoryEnum.WEAPON;
         var _local_27:Vector.<ItemPropertyValue> = itemService.getProperties(_arg_1);
         if(_local_27 != null && _local_27.length > 0)
         {
            this.propertiesParams.length = _local_27.length;
            _local_4 = true;
            _local_5 = 0;
            while(_local_5 < _local_27.length)
            {
               _local_6 = _local_27[_local_5];
               _local_7 = propertyService.getParams(_local_6.getProperty());
               this.propertiesParams[_local_5] = _local_7;
               if(_local_6.isUpgradable() && _local_6.getUpgradableValue().getMaxLevel() > 0)
               {
                  _local_4 = true;
               }
               if(_local_26)
               {
                  _local_8 = UpgradeColors.getColorForValue(_local_6);
                  _local_7.icon.setValue(_local_6.getValue(),_local_8);
               }
               else
               {
                  _local_7.icon.removeValue();
               }
               _local_5++;
            }
            this.upgradeButton.visible = this.enabledUpgrades && !_arg_2 && _local_4;
            this.showIcons();
            if(!this.scrollContainer.contains(this.propertiesPanel))
            {
               this.scrollContainer.addChild(this.propertiesPanel);
            }
         }
         else
         {
            this.upgradeButton.visible = false;
            this.propertiesParams.length = 0;
            if(this.scrollContainer.contains(this.propertiesPanel))
            {
               this.scrollContainer.removeChild(this.propertiesPanel);
            }
         }
         if(itemService.gotol(_arg_1))
         {
            _local_23 = PresentItem(_arg_1.adapt(PresentItem));
            this.begizotap.update(_local_23.getPresenterId(),_local_23.getDate(),_local_23.getText());
            this.tusyjo.addChild(this.begizotap);
         }
         else
         {
            this.begizotap.lem();
         }
         if(itemService.zereqyj(_arg_1))
         {
            this.zereqyj = true;
            this.lukuz(_arg_1);
         }
         else
         {
            this.zereqyj = false;
            this.jopepobov();
            if(this.scrollContainer.contains(this.kigijab))
            {
               this.scrollContainer.removeChild(this.kigijab);
            }
         }
         if(this.itemCategory == ItemCategoryEnum.ARMOR || this.itemCategory == ItemCategoryEnum.WEAPON)
         {
            this.propertiesPanelLeft.bitmapData = ItemInfoPanelBitmaps.upgradeTableLeft;
            this.propertiesPanelCenter.bitmapData = ItemInfoPanelBitmaps.upgradeTableCenter;
            this.propertiesPanelRight.bitmapData = ItemInfoPanelBitmaps.upgradeTableRight;
            this.showModTable();
            this.modTable.select(itemService.getModificationIndex(_arg_1));
            _local_9 = itemService.muceraqe(_arg_1);
            _local_10 = new Vector.<String>(this.propertiesParams.length);
            if(_local_9.length == 1)
            {
               _local_11 = 0;
               while(_local_11 < this.modTable.rows.length)
               {
                  _local_13 = ModInfoRow(this.modTable.rows[_local_11]);
                  if(_local_11 > 0)
                  {
                     _local_13.visible = false;
                  }
                  _local_11++;
               }
            }
            else
            {
               _local_11 = 0;
               while(_local_11 < this.modTable.rows.length)
               {
                  _local_13 = ModInfoRow(this.modTable.rows[_local_11]);
                  _local_13.visible = true;
                  _local_11++;
               }
            }
            _local_11 = 0;
            while(_local_11 < _local_9.length)
            {
               _local_12 = _local_9[_local_11];
               _local_13 = ModInfoRow(this.modTable.rows[_local_11]);
               _local_13.upgradeIndicator.visible = _local_9.length != 1;
               _local_13.costLabel.text = Money.numToString(itemService.getPriceWithoutDiscount(_local_12),false);
               if(_local_14 < _local_13.costLabel.width)
               {
                  _local_14 = _local_13.costLabel.width;
               }
               this.modTable.maxCostWidth = _local_14;
               _local_13.rankIcon.setRank(itemService.ruma(_local_12));
               _local_15 = itemService.getUpgradableProperties(_local_12);
               _local_5 = 0;
               while(_local_5 < _local_15.length)
               {
                  _local_6 = UpgradableItemPropertyValue(_local_15[_local_5]);
                  _local_7 = propertyService.getParams(_local_6.getProperty());
                  if(_local_7 != null)
                  {
                     _local_10[_local_5] = _local_6.getValue();
                  }
                  _local_5++;
               }
               _local_13.setLabelsNum(_local_15.length);
               _local_13.setLabelsText(_local_15);
               _local_11++;
            }
            this.modTable.correctNonintegralValues();
         }
         else
         {
            this.propertiesPanelLeft.bitmapData = ItemInfoPanelBitmaps.propertiesLeft;
            this.propertiesPanelCenter.bitmapData = ItemInfoPanelBitmaps.propertiesCenter;
            this.propertiesPanelRight.bitmapData = ItemInfoPanelBitmaps.propertiesRight;
            this.hideModTable();
         }
         if(itemService.gotol(_arg_1))
         {
            this.robog.visible = true;
            this.robog.enabled = true;
            this.buyButton.visible = false;
            this.equipButton.visible = false;
         }
         else
         {
            this.robog.visible = false;
            if(_arg_2)
            {
               this.buyButton.visible = true;
               this.equipButton.visible = false;
            }
            else if(this.itemCategory == ItemCategoryEnum.INVENTORY)
            {
               this.buyButton.visible = true;
               this.equipButton.visible = false;
            }
            else
            {
               this.buyButton.visible = false;
               if(this.itemCategory == ItemCategoryEnum.PLUGIN || this.itemCategory == ItemCategoryEnum.EMBLEM)
               {
                  this.equipButton.visible = false;
               }
               else
               {
                  this.equipButton.visible = true;
                  if(this.itemCategory == ItemCategoryEnum.ARMOR || this.itemCategory == ItemCategoryEnum.WEAPON)
                  {
                     this.buyButton.visible = itemService.getModificationIndex(_arg_1) < 3 && _local_9.length > 1;
                  }
               }
            }
         }
         if(this.buyButton.visible)
         {
            _local_16 = getRequiredRank(userPropertiesService.rank,itemService.ruma(_arg_1),itemService.hun(_arg_1));
            _local_17 = 1;
            if(this.isCountable)
            {
               this.inventoryNumStepper.visible = true;
               _local_20 = int(Math.min(INVENTORY_MAX_VALUE,Math.floor(moneyService.crystal / this.itemPrice)));
               if(_local_16 > 0)
               {
                  if(_local_20 > 0)
                  {
                     this.inventoryNumStepper.enabled = true;
                     this.inventoryNumStepper.alpha = 1;
                  }
                  else
                  {
                     this.inventoryNumStepper.enabled = false;
                     this.inventoryNumStepper.alpha = 0.7;
                  }
               }
               else
               {
                  this.inventoryNumStepper.enabled = false;
                  this.inventoryNumStepper.alpha = 0.7;
                  this.inventoryNumStepper.value = 1;
               }
               _local_18 = itemService.getPrice(_arg_1);
               _local_19 = itemService.getDiscount(_arg_1);
               _local_17 = this.inventoryNumStepper.value;
            }
            else if(!_arg_2 && itemService.cacum(_arg_1))
            {
               this.inventoryNumStepper.visible = false;
               this.inventoryNumStepper.enabled = false;
               _local_21 = itemService.nyr(_arg_1);
               _local_18 = itemService.getPrice(_local_21);
               _local_19 = itemService.getDiscount(_local_21);
               _local_22 = itemService.ruma(_local_21);
               _local_16 = userPropertiesService.rank >= _local_22 ? int(_local_22) : int(-_local_22);
            }
            else
            {
               _local_18 = itemService.getPrice(_arg_1);
               _local_19 = itemService.getDiscount(_arg_1);
               this.inventoryNumStepper.visible = false;
               this.inventoryNumStepper.enabled = false;
            }
            this.buyButton.setInfo(_local_18,_local_17,_local_16,itemService.miqysi(_arg_1));
         }
         else
         {
            this.inventoryNumStepper.visible = false;
         }
         this.updateBlinkEffect();
         this.setButtonsPosition();
         this.updateEquipButton();
         if(this.itemCategory == ItemCategoryEnum.PLUGIN && !_arg_2)
         {
            if(!this.scrollContainer.contains(this.timeIndicator))
            {
               this.scrollContainer.addChild(this.timeIndicator);
            }
            this.setTimeRemaining(ITemporaryItem(_arg_1.adapt(ITemporaryItem)).getStopDate());
         }
         else if(this.scrollContainer.contains(this.timeIndicator))
         {
            this.scrollContainer.removeChild(this.timeIndicator);
         }
         if(!(this.oldActionButtonsContainer.visible = this.itemCategory != ItemCategoryEnum.LOOT_BOX))
         {
            LootBoxModel(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModel(new LootBoxModel().id)).updateActionElements(this.actionButtonsContainer,this);
            LootBoxModel(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModel(new LootBoxModel().id)).updateCount(itemService.getCount(_arg_1));
         }
         else if(!(this.oldActionButtonsContainer.visible = _arg_1.name != "gold_m0"))
         {
            DroppableGoldItemModel(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModel(new DroppableGoldItemModel().id))._object = _arg_1;
            DroppableGoldItemModel(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModel(new DroppableGoldItemModel().id)).updateActionElements(this.actionButtonsContainer,this);
         }
      }
      
      private function lukuz(_arg_1:IGameObject) : void
      {
         if(!this.scrollContainer.contains(this.rum))
         {
            this.scrollContainer.addChild(this.rum);
         }
         if(!this.scrollContainer.contains(this.vuzoho))
         {
            this.scrollContainer.addChild(this.vuzoho);
         }
         this.vuzoho.show(_arg_1);
      }
      
      private function jopepobov() : void
      {
         if(this.scrollContainer.contains(this.rum))
         {
            this.scrollContainer.removeChild(this.rum);
         }
         if(this.scrollContainer.contains(this.vuzoho))
         {
            this.scrollContainer.removeChild(this.vuzoho);
         }
      }
      
      public function updateEquipButton() : void
      {
         this.miba();
         if(Boolean(lobbyLayoutService.inBattle()) && !battleInfoService.reArmorEnabled)
         {
            this.equipButton.enabled = false;
            return;
         }
         if(this.gahijyb())
         {
            this.felofedi();
         }
         else
         {
            this.equipButton.enabled = false;
            this.equipButton.hideTime();
         }
      }
      
      private function gahijyb() : Boolean
      {
         return itemService.joso(this.item) && itemService.jihosis(this.item) && !itemService.zelima(this.item);
      }
      
      private function felofedi() : void
      {
         var _local_1:CountDownTimer = cazygova.vyjyjyr(this.item);
         if(Boolean(lobbyLayoutService.inBattle()) && _local_1.getRemainingSeconds() > 0 && !itemService.zelima(this.item))
         {
            this.equipButton.startTimer(_local_1);
            this.equipButton.addEventListener(TimerButtonEvent.wopim,this.mydoha);
         }
         else
         {
            this.equipButton.hideTime();
            this.equipButton.enabled = true;
         }
      }
      
      private function miba() : void
      {
         if(this.gahijyb())
         {
            this.equipButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_INFO_PANEL_BUTTON_EQUIP_TEXT);
         }
         else
         {
            this.equipButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_EQUIPPED_TEXT);
         }
      }
      
      private function mydoha(_arg_1:TimerButtonEvent) : void
      {
         this.equipButton.enabled = true;
         this.equipButton.removeEventListener(TimerButtonEvent.wopim,this.mydoha);
      }
      
      private function jol(_arg_1:Boolean, _arg_2:IGameObject, _arg_3:IGameObject) : void
      {
         if(_arg_1 && itemService.getCategory(_arg_3) == ItemCategoryEnum.COLOR && !battleInfoService.isInBattle())
         {
            this.mupuzeb.visible = true;
            if(_arg_2 != _arg_3)
            {
               this.mupuzeb.enabled = true;
            }
         }
         else
         {
            this.mupuzeb.visible = false;
         }
      }
      
      private function onButtonUpgradeClick(_arg_1:MouseEvent) : void
      {
         var _local_2:UpgradableItemPropertyValue = null;
         var _local_3:UpgradableItem = UpgradableItem(this.item.adapt(UpgradableItem));
         var _local_4:Vector.<UpgradableItemPropertyValue> = itemService.getUpgradableProperties(this.item);
         if(_local_3.isUpgrading())
         {
            _local_2 = _local_3.getUpgradingValue();
            if(moneyService.dic(_local_2.getSpeedUpCost()))
            {
               dispatchEvent(new ItemPropertyUpgradeEvent(ItemPropertyUpgradeEvent.SPEED_UP,_local_2));
            }
         }
         else
         {
            this.showSelectUpgradeWindow(_local_4);
         }
      }
      
      private function showSelectUpgradeWindow(_arg_1:Vector.<UpgradableItemPropertyValue>) : void
      {
         if(itemService.cacum(this.item))
         {
            this.selectWindow = new SelectUpgradeWindow(_arg_1,itemService.getModificationIndex(this.item),itemService.hasNextModification(this.item));
         }
         else
         {
            this.selectWindow = new SelectUpgradeWindow(_arg_1);
         }
         this.selectWindow.addEventListener(ItemPropertyUpgradeEvent.SELECT_WINDOW_CLOSED,this.onSelectWindowClosed);
         this.selectWindow.addEventListener(ItemPropertyUpgradeEvent.SPEED_UP,this.onSpeedUp);
         this.selectWindow.addEventListener(ItemPropertyUpgradeEvent.UPGRADE_STARTED,this.onUpgradeStarted);
         this.selectWindow.addEventListener(ItemPropertyUpgradeEvent.FLUSH_UPGRADES,this.onFlushUpgrades);
         dialogService.addDialog(this.selectWindow);
      }
      
      private function onSelectWindowClosed(_arg_1:Event) : void
      {
         this.selectWindow.removeEventListener(ItemPropertyUpgradeEvent.SELECT_WINDOW_CLOSED,this.onSelectWindowClosed);
         this.selectWindow.removeEventListener(ItemPropertyUpgradeEvent.SPEED_UP,this.onSpeedUp);
         this.selectWindow.removeEventListener(ItemPropertyUpgradeEvent.UPGRADE_STARTED,this.onUpgradeStarted);
         this.selectWindow.removeEventListener(ItemPropertyUpgradeEvent.FLUSH_UPGRADES,this.onFlushUpgrades);
         dialogService.removeDialog(this.selectWindow);
         this.selectWindow = null;
      }
      
      private function updateUpgradeButton(_arg_1:IGameObject) : void
      {
         var _local_2:UpgradableItem = null;
         var _local_3:UpgradableItemPropertyValue = null;
         if(_arg_1.hasModel(UpgradableItem))
         {
            _local_2 = UpgradableItem(_arg_1.adapt(UpgradableItem));
            if(_local_2.isUpgrading())
            {
               _local_3 = _local_2.getUpgradingValue();
               this.upgradeButton.setUpgradingButton(_local_2.getCountDownTimer(),_local_3);
            }
            else if(itemService.isFullUpgraded(_arg_1))
            {
               this.upgradeButton.setUpgradedButton();
            }
            else
            {
               this.upgradeButton.setUpgradeButton();
            }
         }
      }
      
      private function onFlushUpgrades(_arg_1:ItemPropertyUpgradeEvent) : void
      {
         dispatchEvent(new ItemPropertyUpgradeEvent(_arg_1.type));
      }
      
      private function onSpeedUp(_arg_1:ItemPropertyUpgradeEvent) : void
      {
         dispatchEvent(new ItemPropertyUpgradeEvent(_arg_1.type,_arg_1.getPropertyValue()));
      }
      
      private function onUpgradeStarted(_arg_1:ItemPropertyUpgradeEvent) : void
      {
         this.upgradeButton.setUpgradingButton(_arg_1.getTimer(),_arg_1.getPropertyValue());
         dispatchEvent(new ItemPropertyUpgradeEvent(_arg_1.type,_arg_1.getPropertyValue(),_arg_1.getTimer()));
         this.startBlinkEffect(_arg_1.getPropertyValue().getProperty());
      }
      
      private function setButtonsPosition() : void
      {
         var _local_1:int = this.size.y - this.margin - BUTTON_SIZE.y + 1;
         if(this.buyButton.visible)
         {
            this.buyButton.y = _local_1;
            if(this.isCountable)
            {
               this.inventoryNumStepper.x = -7;
               this.inventoryNumStepper.y = this.buyButton.y + Math.round((BUTTON_SIZE.y - this.inventoryNumStepper.height) * 0.5);
               this.buyButton.x = this.inventoryNumStepper.x + this.inventoryNumStepper.width + 10;
            }
            else
            {
               this.buyButton.x = this.margin;
            }
         }
         if(this.equipButton.visible)
         {
            this.equipButton.y = _local_1;
            this.equipButton.x = this.size.x - this.margin - BUTTON_SIZE.x;
         }
         if(this.mupuzeb.visible)
         {
            this.mupuzeb.y = _local_1;
            this.mupuzeb.x = this.size.x - this.margin - BUTTON_SIZE.x;
         }
         this.upgradeButton.y = _local_1;
         this.upgradeButton.x = this.margin + BUTTON_SIZE.x + 15;
         this.robog.x = this.margin;
         this.robog.y = _local_1;
      }
      
      public function resize(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_5:int = 0;
         var _local_6:int = 0;
         var _local_7:int = 0;
         var _local_8:int = 0;
         var _local_9:ItemPropertyIcon = null;
         var _local_10:ModInfoRow = null;
         var _local_11:Vector.<Number> = null;
         var _local_12:BitmapData = null;
         this.scrollPane.update();
         this.size.x = _arg_1;
         this.size.y = _arg_2;
         this.window.width = _arg_1;
         this.window.height = _arg_2;
         this.inner.width = _arg_1 - this.margin * 2;
         this.inner.height = _arg_2 - this.margin - BOTTOM_MARGIN;
         this.areaRect.width = _arg_1 - this.margin * 2 - 2;
         this.areaRect2.width = this.areaRect.width - HORIZONTAL_MARGIN * 2;
         this.itemDescriptionLabel.x = HORIZONTAL_MARGIN - 3;
         this.itemDescriptionLabel.width = this.areaRect2.width;
         var _local_13:int = int(this.propertiesParams.length);
         if(_local_13 > 0)
         {
            _local_3 = this.propertiesPanel.y + this.propertiesPanel.height + VERTICAL_MARGIN;
            this.propertiesPanelRight.x = this.areaRect2.width - this.propertiesPanelRight.width;
            this.propertiesPanelCenter.width = this.propertiesPanelRight.x - this.propertiesPanelCenter.x;
            _local_4 = 6;
            _local_5 = ItemInfoPanelBitmaps.armor.width * _local_13 + ICON_SPACING_H * (_local_13 - 1);
            _local_6 = _local_5;
            if(this.scrollContainer.contains(this.modTable))
            {
               _local_6 += this.modTable.constWidth;
            }
            _local_7 = Math.round((this.propertiesPanel.width - _local_6) * 0.5);
            if(this.itemCategory == ItemCategoryEnum.COLOR || this.itemCategory == ItemCategoryEnum.INVENTORY || this.itemCategory == ItemCategoryEnum.LOOT_BOX || this.itemCategory == ItemCategoryEnum.RESISTANCE_MODULE)
            {
               _local_8 = 0;
               while(_local_8 < _local_13)
               {
                  _local_9 = this.propertiesParams[_local_8].icon;
                  _local_9.x = _local_7 + _local_8 * (ItemInfoPanelBitmaps.armor.width + ICON_SPACING_H);
                  _local_9.y = _local_4;
                  _local_8++;
               }
            }
            else
            {
               for each(_local_10 in this.modTable.rows)
               {
                  _local_10.updatePositions();
               }
               _local_11 = _local_10.getPositions();
               _local_8 = 0;
               while(_local_8 < _local_11.length)
               {
                  _local_9 = this.propertiesParams[_local_8].icon;
                  _local_9.x = _local_11[_local_8] - _local_9.width / 2;
                  _local_9.y = _local_4;
                  _local_8++;
               }
               this.modTable.y = this.propertiesPanel.y + _local_9.height + 2;
            }
            this.itemDescriptionLabel.y = this.propertiesPanel.y + this.propertiesPanel.height + VERTICAL_MARGIN - 4;
         }
         else
         {
            this.itemDescriptionLabel.y = this.areaRect2.y + 24 - 7;
         }
         if(this.devicesAvailable)
         {
            this.devicesPanel.y = this.itemDescriptionLabel.y;
            this.itemDescriptionLabel.y += this.devicesPanel.height + 5;
         }
         if(this.dypuhup.bitmapData != null)
         {
            this.dypuhup.y = this.itemNameLabel.y + this.itemNameLabel.height + VERTICAL_MARGIN - TOP_PREVIEW_WITH_NAME_PENETRATION_SIZE;
            this.dypuhup.x = this.scrollContainer.width - this.dypuhup.width >> 1;
            this.itemDescriptionLabel.y += this.dypuhup.bitmapData.height + VERTICAL_MARGIN - TOP_PREVIEW_WITH_NAME_PENETRATION_SIZE;
         }
         if(this.zuni.bitmapData != null)
         {
            this.zuni.y = this.itemNameLabel.y + this.itemNameLabel.height + VERTICAL_MARGIN - TOP_PREVIEW_WITH_NAME_PENETRATION_SIZE;
            this.zuni.x = this.scrollContainer.width - this.zuni.width >> 1;
            this.itemDescriptionLabel.y += this.zuni.bitmapData.height + VERTICAL_MARGIN - TOP_PREVIEW_WITH_NAME_PENETRATION_SIZE;
         }
         _local_3 += VERTICAL_MARGIN + this.itemDescriptionLabel.textHeight - 4;
         var _local_14:int = _local_3;
         var _local_15:* = this.gygedosyw.bitmapData != null;
         if(Boolean(_local_15))
         {
            this.gygedosyw.x = PREVIEW_OFFSET_X;
            if(_local_13 > 0)
            {
               this.gygedosyw.y = this.propertiesPanel.y + this.propertiesPanel.height + VERTICAL_MARGIN;
            }
            else
            {
               this.gygedosyw.y = this.areaRect2.y + 24;
            }
            this.itemDescriptionLabel.x = this.gygedosyw.x + this.gygedosyw.width + PREVIEW_OFFSET_X - 3;
            this.itemDescriptionLabel.width = this.areaRect2.width - this.itemDescriptionLabel.x - 3;
            _local_3 = Math.max(this.itemDescriptionLabel.y + 3 + this.itemDescriptionLabel.textHeight + VERTICAL_MARGIN,this.gygedosyw.y + this.gygedosyw.height + VERTICAL_MARGIN);
         }
         else
         {
            _local_3 = this.itemDescriptionLabel.y + 3 + this.itemDescriptionLabel.textHeight + VERTICAL_MARGIN;
         }
         var _local_16:int = Math.max(_local_3,_arg_2 - this.margin - BOTTOM_MARGIN - 2 - MODULE_SPACING * 2);
         this.areaRect.height = _local_16;
         this.areaRect2.height = this.area.height - VERTICAL_MARGIN * 2;
         if(_local_16 > _arg_2 - this.margin - BOTTOM_MARGIN - 2 - MODULE_SPACING * 2)
         {
            _local_15 = false;
            this.itemDescriptionLabel.x = HORIZONTAL_MARGIN - 3;
            this.itemDescriptionLabel.width = this.areaRect2.width;
            _local_3 = _local_14;
            _local_16 = Math.max(_local_3,_arg_2 - this.margin - BOTTOM_MARGIN - 2 - MODULE_SPACING * 2);
            this.areaRect.height = _local_16;
            this.areaRect2.height = this.area.height - VERTICAL_MARGIN * 2;
         }
         if(this.zereqyj)
         {
            this.mafunyl(this.dypuhup);
            this.rum.y = this.dypuhup.bitmapData != null && this.scrollContainer.contains(this.dypuhup) ? Number(int(this.dypuhup.height + this.itemNameLabel.height + goqyza * 2)) : Number(int(this.itemNameLabel.height) + goqyza);
            this.vuzoho.y = this.rum.y;
            this.itemDescriptionLabel.y = this.rum.y + this.vuzoho.qihuzitys() + 10;
            this.nybo.x = this.areaRect2.width - this.nybo.width;
            this.gozejyc.width = this.nybo.x - this.gozejyc.x;
            this.jogubeg.y = this.tigu.height;
            this.jogubeg.height = this.vuzoho.muporosy();
            this.zovoki.y = this.nybo.height;
            this.zovoki.height = this.jogubeg.height;
            this.zovoki.x = this.areaRect2.width - this.zovoki.width;
            this.vaj.y = this.jogubeg.height + this.tigu.height;
            this.doj.y = this.vaj.y;
            this.doj.x = this.zovoki.x;
            this.gopicydit.x = this.vaj.width;
            this.gopicydit.y = this.doj.y;
            this.gopicydit.width = this.doj.x - this.gopicydit.x;
            this.gaco.y = this.gopicydit.y + this.gopicydit.height;
            this.gaco.height = this.vuzoho.kyduc();
            this.juwadavu.y = this.gaco.y;
            this.juwadavu.height = this.gaco.height;
            this.juwadavu.x = this.zovoki.x;
            this.pupek.y = this.gaco.y + this.gaco.height;
            this.gycazet.y = this.pupek.y;
            this.gycazet.x = this.doj.x;
            this.tytenub.y = this.pupek.y + this.pupek.height - this.tytenub.height;
            this.tytenub.x = this.pupek.width;
            this.tytenub.width = this.gozejyc.width;
            _local_12 = ItemInfoPanelBitmaps.habere;
            this.nefogukuc.graphics.clear();
            this.nefogukuc.graphics.beginBitmapFill(_local_12);
            this.nefogukuc.graphics.drawRect(this.tigu.width,this.tigu.height,this.gozejyc.width,this.jogubeg.height);
            this.bawowimaqi.graphics.clear();
            this.bawowimaqi.graphics.beginBitmapFill(_local_12);
            this.bawowimaqi.graphics.drawRect(this.vaj.width,this.vaj.y + this.vaj.height,this.tytenub.width,this.gaco.height);
         }
         if(Boolean(this.item) && itemService.gotol(this.item))
         {
            this.begizotap.y = this.zuni.bitmapData != null && this.scrollContainer.contains(this.zuni) ? Number(this.zuni.height + this.itemNameLabel.height + 20) : Number(this.itemNameLabel.height + 10);
            this.begizotap.jovu(this.areaRect2.width);
         }
         this.area.graphics.clear();
         this.area.graphics.beginFill(16711680,0);
         this.area.graphics.drawRect(this.areaRect.x,this.areaRect.y,this.areaRect.width,this.areaRect.height);
         if(Boolean(_local_15))
         {
            if(this.item != null && this.gygedosyw != null && this.gygedosyw.parent == null)
            {
               this.showBitmap(this.gygedosyw);
            }
         }
         else
         {
            removeDisplayObject(this.gygedosyw);
         }
         this.actionButtonsContainer.y = this.size.y - this.margin - BUTTON_SIZE.y + 1;
         this.setButtonsPosition();
         this.scrollPane.setSize(_arg_1 - this.margin * 2 - 2 + 6,_arg_2 - this.margin - BOTTOM_MARGIN - 2 - MODULE_SPACING * 2);
         this.scrollPane.update();
         if(this.scrollContainer.contains(this.timeIndicator))
         {
            this.timeIndicator.x = this.areaRect2.x + this.areaRect2.width - this.timeIndicator.width + 3;
            this.timeIndicator.y = this.areaRect2.y - 7;
         }
      }
      
      public function hideModTable() : void
      {
         if(this.scrollContainer.contains(this.modTable))
         {
            this.scrollContainer.removeChild(this.modTable);
         }
      }
      
      public function showModTable() : void
      {
         if(!this.scrollContainer.contains(this.modTable))
         {
            this.scrollContainer.addChild(this.modTable);
         }
      }
      
      private function mafunyl(_arg_1:Bitmap) : void
      {
         if(this.dypuhup.height > 0)
         {
            _arg_1.y += goqyza;
            this.kigijab.text = "-" + String(itemService.getDiscount(this.item)) + "%";
            this.kigijab.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
            this.kigijab.x = 302;
            this.kigijab.y = int(this.itemNameLabel.height + goqyza) + 168;
            if(localeService.language == "cn")
            {
               this.kigijab.x = 300;
            }
            if(!this.scrollContainer.contains(this.kigijab))
            {
               this.scrollContainer.addChild(this.kigijab);
            }
            else
            {
               this.scrollContainer.removeChild(this.kigijab);
               this.scrollContainer.addChild(this.kigijab);
            }
         }
      }
      
      private function pini(_arg_1:Bitmap) : void
      {
         this.hideBitmap(_arg_1);
         if(this.scrollContainer.contains(this.kigijab))
         {
            this.scrollContainer.removeChild(this.kigijab);
         }
      }
      
      private function showBitmap(_arg_1:Bitmap) : void
      {
         if(_arg_1.bitmapData != null && !this.tusyjo.contains(_arg_1))
         {
            this.tusyjo.addChild(_arg_1);
         }
      }
      
      private function hideBitmap(_arg_1:Bitmap) : void
      {
         if(this.scrollContainer.contains(_arg_1))
         {
            this.scrollContainer.removeChild(_arg_1);
         }
      }
      
      public function get leftPreviewEnabled() : Boolean
      {
         return this._leftPreviewEnabled;
      }
      
      public function set leftPreviewEnabled(_arg_1:Boolean) : void
      {
         this._leftPreviewEnabled = _arg_1;
      }
      
      private function setTimeRemaining(_arg_1:Date) : void
      {
         var _local_2:String = null;
         var _local_3:String = null;
         var _local_4:String = null;
         var _local_5:String = null;
         if(isNaN(_arg_1.date))
         {
            this.timeIndicator.text = " ";
         }
         else
         {
            _local_2 = (_arg_1.hours < 10 ? "0" + String(_arg_1.hours) : String(_arg_1.hours)) + ":" + (_arg_1.minutes < 10 ? "0" + String(_arg_1.minutes) : String(_arg_1.minutes));
            _local_3 = _arg_1.month + 1 < 10 ? "0" + String(_arg_1.month + 1) : String(_arg_1.month + 1);
            _local_4 = _arg_1.date < 10 ? "0" + String(_arg_1.date) : String(_arg_1.date);
            if(localeService.getText(TanksLocale.TEXT_GUI_LANG) == "ru")
            {
               _local_5 = _local_4 + "-" + _local_3 + "-" + String(_arg_1.fullYear);
            }
            else
            {
               _local_5 = _local_3 + "-" + _local_4 + "-" + String(_arg_1.fullYear);
            }
            this.timeIndicator.text = _local_2 + "  " + _local_5;
         }
         this.resize(this.size.x,this.size.y);
      }
      
      private function inventoryNumChanged(_arg_1:Event = null) : void
      {
         var _local_2:int = 0;
         var _local_3:int = getRequiredRank(userPropertiesService.rank,this.minRankIndex,this.maxRankIndex);
         var _local_4:int = !this.isCountable ? int(1) : int(this.inventoryNumStepper.value);
         if(moneyService.crystal >= this.itemPrice * _local_4)
         {
            _local_2 = this.itemPrice * _local_4;
         }
         else
         {
            _local_2 = -this.itemPrice * _local_4;
         }
         this.buyButton.setInfo(itemService.getPrice(this.item),_local_4,_local_3,itemService.miqysi(this.item));
         this.setButtonsPosition();
      }
      
      public function propertyUpgraded(_arg_1:UpgradableItemPropertyValue) : void
      {
         if(this.selectWindow != null)
         {
            this.selectWindow.propertyUpgraded(_arg_1);
         }
         this.showItemInfo(this.item,false);
         this.resize(this.size.x,this.size.y);
         GlowEffect.glow(this.getLabelByProperty(_arg_1.getProperty()),UpgradeColors.getColorForValue(_arg_1));
         this.blinkEffect.stop();
      }
      
      private function updateBlinkEffect() : void
      {
         if(itemService.isUpgrading(this.item))
         {
            this.startBlinkEffect(itemService.getUpgradingProperty(this.item));
         }
         else
         {
            this.blinkEffect.stop();
         }
      }
      
      private function startBlinkEffect(_arg_1:ItemGarageProperty) : void
      {
         this.blinkEffect.start(this.getLabelByProperty(_arg_1));
      }
      
      private function getLabelByProperty(_arg_1:ItemGarageProperty) : DisplayObject
      {
         var _local_2:int = 0;
         var _local_3:ModInfoRow = null;
         var _local_4:Vector.<ItemPropertyValue> = null;
         var _local_5:int = 0;
         if(itemService.cacum(this.item))
         {
            _local_2 = itemService.getModificationIndex(this.item);
            _local_3 = this.modTable.rows[_local_2];
            _local_4 = itemService.getProperties(this.item);
            _local_5 = 0;
            return _local_3.labels[_local_5];
         }
         return propertyService.getParams(_arg_1).icon.getLabel();
      }
   }
}

