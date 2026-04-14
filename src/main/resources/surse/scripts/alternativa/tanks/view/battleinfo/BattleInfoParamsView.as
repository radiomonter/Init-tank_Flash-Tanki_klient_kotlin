package alternativa.tanks.view.battleinfo
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.view.timeleftindicator.BigWhiteTimeLeftIndicator;
   import alternativa.tanks.view.timeleftindicator.TimeLeftIndicator;
   import alternativa.types.Long;
   import assets.icons.InputCheckIcon;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.System;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import forms.ranks.SmallRankIcon;
   import forms.registration.CallsignIconStates;
   import obfuscation.dup.Gucobuted;
   import obfuscation.fabuqy.Suvozimi;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class BattleInfoParamsView extends Sprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static var waitIcon:InputCheckIcon = new InputCheckIcon();
      
      private var _width:int;
      
      private var _height:int;
      
      private var urlString:TankInputBase;
      
      private var urlCopyButton:DefaultButtonBase;
      
      private var copyLinkText:String;
      
      private var _spectatorEnabled:Boolean;
      
      public var killlimit:int = 0;
      
      private var _clanName:String;
      
      private var _clanLink:String;
      
      private var mykife:Number;
      
      private var ICON_VERTICAL_MARGIN:int = 6;
      
      private var _previewLoadingId:Long;
      
      private var matchmakingStampIcon:Bitmap;
      
      private var infoParams:BattleInfoBaseParams;
      
      private var iconBar:Sprite;
      
      private var autoBalanceIcon:Bitmap;
      
      private var friendlyFireIcon:Bitmap;
      
      public var timeLeftIndicator:TimeLeftIndicator;
      
      private var battleModeIcon:Bitmap;
      
      private var iconCTF:Bitmap;
      
      private var iconCP:Bitmap;
      
      private var suppliesIcon:Bitmap;
      
      private var bonusesIcon:Bitmap;
      
      private var crystalBonusesIcon:Bitmap;
      
      private var upgradesIcon:Bitmap;
      
      private var proBattleIcon:Bitmap;
      
      private var reArmorIcon:Bitmap;
      
      private var heris:Bitmap;
      
      private var killLimitLabel:LabelBase;
      
      private var timeLimitLabel:LabelBase;
      
      private var rangBar:Sprite;
      
      private var bg:TankWindowInner;
      
      private var nameTF:LabelBase;
      
      private var preview:Sprite;
      
      private var clan:Sprite;
      
      private var clanName:LabelBase;
      
      private var rect:Rectangle;
      
      private var spectatorButton:DefaultButtonBase;
      
      private var stamp:Sprite;
      
      public function BattleInfoParamsView()
      {
         var _local_1:Array = null;
         this.iconBar = new Sprite();
         this.autoBalanceIcon = new Bitmap(Gucobuted.nerup);
         this.friendlyFireIcon = new Bitmap(Gucobuted.lywivic);
         this.timeLeftIndicator = new BigWhiteTimeLeftIndicator();
         this.battleModeIcon = new Bitmap(Gucobuted.gahezoma);
         this.iconCTF = new Bitmap(Gucobuted.kita);
         this.iconCP = new Bitmap(Gucobuted.qyfagilez);
         this.suppliesIcon = new Bitmap(Gucobuted.geta);
         this.bonusesIcon = new Bitmap(Gucobuted.pefehuzic);
         this.crystalBonusesIcon = new Bitmap(Gucobuted.fup);
         this.upgradesIcon = new Bitmap(Gucobuted.dijy);
         this.proBattleIcon = new Bitmap(Gucobuted.gejoqynaw);
         this.reArmorIcon = new Bitmap(Gucobuted.jazifa);
         this.heris = new Bitmap(Gucobuted.qyqyw);
         this.killLimitLabel = new LabelBase();
         this.timeLimitLabel = new LabelBase();
         this.rangBar = new Sprite();
         this.bg = new TankWindowInner(100,100,TankWindowInner.TRANSPARENT);
         this.nameTF = new LabelBase();
         this.preview = new Sprite();
         this.clan = new Sprite();
         this.clanName = new LabelBase();
         this.rect = new Rectangle(0,0,400,300);
         this.spectatorButton = new DefaultButtonBase();
         this.matchmakingStampIcon = new Bitmap(Gucobuted.matchmakingStampBitmapData);
         this.stamp = new Sprite();
         super();
         _local_1 = [new GlowFilter(0,1,6,6)];
         addChild(this.preview);
         addChild(this.bg);
         addChild(this.nameTF);
         addChild(this.rangBar);
         addChild(this.iconBar);
         addChild(this.spectatorButton);
         addChild(this.clan);
         addChild(this.stamp);
         this.clanName.multiline = true;
         this.clanName.autoSize = TextFieldAutoSize.LEFT;
         this.clanName.mouseEnabled = false;
         this.spectatorButton.label = "Spectator";
         this.spectatorEnabled = false;
         this.nameTF.size = 18;
         this.nameTF.height = 25;
         this.nameTF.thickness = 0;
         this.nameTF.autoSize = TextFieldAutoSize.NONE;
         this.nameTF.filters = _local_1;
         this.iconBar.filters = _local_1;
         this.clan.filters = _local_1;
         this.preview.scrollRect = this.rect;
         this.copyLinkText = localeService.getText(TanksLocale.TEXT_BATTLEINFO_PANEL_COPY_LINK_TEXT);
         this.spectatorButton.visible = false;
         this.stamp.addChild(this.matchmakingStampIcon);
      }
      
      private function onResize() : *
      {
         this.stamp.x = 10;
         this.stamp.y = this.bg.height - this.stamp.height;
         this.matchmakingStampIcon.visible = this.bg.height > 100;
      }
      
      public function setPreview(_arg_1:BitmapData) : void
      {
         if(this.preview.numChildren > 0)
         {
            this.preview.removeChildAt(0);
         }
         if(_arg_1 == null)
         {
            this.preview.addChild(waitIcon);
            waitIcon.gotoAndStop(CallsignIconStates.CALLSIGN_ICON_STATE_PROGRESS);
            waitIcon.x = int(375 - waitIcon.width / 2);
            waitIcon.y = int(250 - waitIcon.height / 2);
            this.preview.scrollRect = this.rect;
         }
         else
         {
            this.preview.addChild(new Bitmap(_arg_1));
            this.preview.scrollRect = this.rect;
         }
         this.width = this._width;
         this.height = this._height;
         this.stamp.visible = false;
      }
      
      private function onClanClick(_arg_1:MouseEvent) : void
      {
         navigateToURL(new URLRequest(this._clanLink));
      }
      
      public function setClanName(_arg_1:String, _arg_2:String) : void
      {
         var _local_3:Graphics = null;
         this._clanLink = _arg_2;
         var _local_4:Boolean = this._clanLink != null && this._clanLink != "" && this._clanLink != "null";
         this._clanName = !_local_4 ? _arg_1 : "\"<u>" + _arg_1 + "</u>\"";
         if(this.clan.hasEventListener(MouseEvent.MOUSE_UP))
         {
            this.clan.removeEventListener(MouseEvent.MOUSE_UP,this.onClanClick);
            this.clan.buttonMode = false;
         }
         if(_arg_1 != null && this.clanName.text != _arg_1)
         {
            this.clanName.htmlText = localeService.getText(TanksLocale.TEXT_BATTLE_SELECT_MAP_OWNER_TEXT) + "\n" + this._clanName;
            this.clanName.y = 103;
            this.clan.visible = true;
            this.clan.addChild(this.clanName);
            if(_local_4)
            {
               this.clan.addEventListener(MouseEvent.MOUSE_UP,this.onClanClick);
               this.clan.buttonMode = true;
            }
            _local_3 = this.clan.graphics;
            _local_3.clear();
            _local_3.beginFill(0,0);
            _local_3.drawRect(0,0,this.clan.width,this.clan.height);
            this.width = this._width;
            this.height = this._height;
         }
         else
         {
            this.clanName.text = "";
         }
      }
      
      public function setUp(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:Boolean, _arg_7:Boolean, _arg_8:String, _arg_9:Suvozimi, _arg_10:Boolean, _arg_11:Boolean, _arg_12:Boolean, _arg_13:Boolean, _arg_14:Boolean, _arg_15:Boolean, _arg_16:Boolean, _arg_17:Boolean, _arg_18:String) : void
      {
         var _local_22:int = 0;
         var _local_19:SmallRankIcon = null;
         var _local_20:int = 0;
         var _local_21:int = 0;
         _local_22 = 0;
         while(this.rangBar.numChildren > 0)
         {
            this.rangBar.removeChildAt(0);
         }
         if(_arg_2 != 0 && _arg_3 != 0)
         {
            _local_20 = _arg_3;
            while(_local_20 >= _arg_2)
            {
               _local_19 = new SmallRankIcon(_local_20);
               _local_19.x = _local_21 * 15;
               _local_19.y = _local_22 * 16;
               this.rangBar.addChild(_local_19);
               if(--_local_21 < -15)
               {
                  _local_22--;
                  _local_21 = 0;
               }
               _local_20--;
            }
         }
         this.mykife = _local_22 * 14;
         if(_arg_8.length > 0 && this.urlString == null)
         {
            this.urlString = new TankInputBase();
            this.urlCopyButton = new DefaultButtonBase();
            addChild(this.urlString);
            addChild(this.urlCopyButton);
         }
         if(_arg_8.length > 0)
         {
            this.urlString.value = _arg_8;
            this.urlString.textField.type = TextFieldType.DYNAMIC;
            this.urlCopyButton.width = this.copyLinkText.length * 7;
            this.urlCopyButton.label = this.copyLinkText;
            this.urlCopyButton.addEventListener(MouseEvent.CLICK,this.copyURL);
         }
         this.nameTF.text = _arg_1;
         if(_arg_17)
         {
            this.nameTF.text = this.nameTF.text + " " + _arg_18;
         }
         this.heris.x = this.proBattleIcon.x;
         this.heris.y = this.proBattleIcon.y + 1;
         this.heris.visible = _arg_14 && _arg_17;
         while(this.iconBar.numChildren > 0)
         {
            this.iconBar.removeChildAt(0);
         }
         if(_arg_5 != 0)
         {
            this.iconBar.addChild(this.timeLeftIndicator);
            this.iconBar.addChild(this.timeLimitLabel);
            this.timeLimitLabel.x = 18;
            this.timeLimitLabel.autoSize = TextFieldAutoSize.NONE;
            this.timeLimitLabel.size = 14;
            this.timeLimitLabel.width = 50;
            this.timeLimitLabel.height = 20;
         }
         if(_arg_4 > 0)
         {
            if(_arg_9 == Suvozimi.DM || _arg_9 == Suvozimi.TDM || _arg_9 == Suvozimi.JGR)
            {
               this.battleModeIcon = new Bitmap(Gucobuted.gahezoma);
            }
            if(_arg_9 == Suvozimi.CTF)
            {
               this.battleModeIcon = new Bitmap(Gucobuted.kita);
            }
            if(_arg_9 == Suvozimi.CP)
            {
               this.battleModeIcon = new Bitmap(Gucobuted.qyfagilez);
            }
            this.battleModeIcon.x = this.iconBar.numChildren > 0 ? Number(this.iconBar.width + this.ICON_VERTICAL_MARGIN) : Number(0);
            this.iconBar.addChild(this.battleModeIcon);
            this.iconBar.addChild(this.killLimitLabel);
            this.killLimitLabel.size = 14;
            this.killLimitLabel.text = String(_arg_4);
            this.killLimitLabel.x = this.battleModeIcon.x + 16;
         }
         this.killlimit = _arg_4;
         this.addIcon(this.proBattleIcon,_arg_13);
         this.addIcon(this.bonusesIcon,!_arg_11);
         this.addIcon(this.crystalBonusesIcon,!_arg_14);
         this.addIcon(this.suppliesIcon,!_arg_10);
         this.addIcon(this.reArmorIcon,_arg_15);
         if(_arg_9 != Suvozimi.DM || _arg_9 != Suvozimi.JGR)
         {
            this.addIcon(this.autoBalanceIcon,_arg_6);
            this.addIcon(this.friendlyFireIcon,_arg_7);
         }
         this.width = this._width;
         this.height = this._height;
      }
      
      private function addIcon(_arg_1:Bitmap, _arg_2:Boolean) : void
      {
         if(this.iconBar.numChildren > 0)
         {
            _arg_1.x = this.iconBar.width + this.ICON_VERTICAL_MARGIN;
         }
         else
         {
            _arg_1.x = 0;
         }
         _arg_1.alpha = !_arg_2 ? Number(0.5) : Number(1);
         this.iconBar.addChild(_arg_1);
      }
      
      private function copyURL(_arg_1:MouseEvent) : void
      {
         System.setClipboard(this.urlString.value);
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = int(_arg_1);
         this.bg.width = this._width;
         this.preview.x = 1;
         this.clan.x = 10;
         this.rect.x = int(375 - this._width / 2);
         this.rect.width = this._width - 2;
         this.preview.scrollRect = this.rect;
         this.rangBar.x = this._width - 23;
         this.nameTF.x = 10;
         this.nameTF.width = this._width - 20;
         this.iconBar.x = 12;
         this.spectatorButton.x = this._width - this.spectatorButton.width - 9;
         if(this.urlString != null)
         {
            this.urlString.width = this._width - this.urlCopyButton.width - 3;
            this.urlCopyButton.x = this._width - this.urlCopyButton.width;
         }
         this.onResize();
      }
      
      override public function set height(_arg_1:Number) : void
      {
         this._height = int(_arg_1);
         this.bg.height = this.urlString != null ? Number(this._height - this.urlString.height - 3) : Number(this._height);
         this.preview.y = 1;
         this.clan.y = this.bg.height - this.clan.height - 10;
         this.rect.y = int(250 - this._height / 2);
         this.rect.height = this.bg.height - 2;
         this.preview.scrollRect = this.rect;
         this.rangBar.y = this.bg.height - 23;
         this.nameTF.y = 10;
         this.iconBar.y = 40;
         this.spectatorButton.y = this.rangBar.y + this.mykife - this.spectatorButton.height - 9;
         if(this.urlString != null)
         {
            this.urlString.y = this._height - this.urlCopyButton.height;
            this.urlCopyButton.y = this._height - this.urlCopyButton.height;
         }
         this.onResize();
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      public function set spectatorEnabled(_arg_1:Boolean) : void
      {
         if(this._spectatorEnabled && !_arg_1)
         {
            this.spectatorButton.removeEventListener(MouseEvent.CLICK,this.spectatorButton_clickHandler);
         }
         if(!this._spectatorEnabled && _arg_1)
         {
            this.spectatorButton.addEventListener(MouseEvent.CLICK,this.spectatorButton_clickHandler);
         }
         this._spectatorEnabled = _arg_1;
         this.spectatorButton.visible = this._spectatorEnabled;
      }
      
      private function spectatorButton_clickHandler(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.ENTER_SPECTATOR));
      }
      
      public function updateBattleName(_arg_1:String) : void
      {
         this.nameTF.text = _arg_1;
      }
      
      public function getPercentLeft(_arg_1:int, _arg_2:int) : Number
      {
         if(_arg_1 == 0)
         {
            return 1;
         }
         return _arg_1 / _arg_2;
      }
      
      public function setTime(_arg_1:String) : void
      {
         this.timeLimitLabel.text = _arg_1;
      }
      
      public function setMatchmakingMark(param1:Boolean) : void
      {
         this.stamp.visible = param1;
      }
   }
}

