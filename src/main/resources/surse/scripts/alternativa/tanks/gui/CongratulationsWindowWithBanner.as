package alternativa.tanks.gui
{
   import alternativa.osgi.service.locale.ILocaleService;
   import assets.icons.GarageItemBackground;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Point;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemCC;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class CongratulationsWindowWithBanner extends Sprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private const windowMargin:int = 12;
      
      private const margin:int = 9;
      
      private const buttonSize:Point;
      
      private const space:int = 8;
      
      private var window:TankWindow;
      
      private var inner:TankWindowInner;
      
      public var closeButton:DefaultButtonBase;
      
      private var messageLabel:LabelBase;
      
      private var windowSize:Point;
      
      private var windowWidth:int = 450;
      
      private var bannerBmp:Bitmap;
      
      private var itemsContainer:Sprite;
      
      public function CongratulationsWindowWithBanner(_arg_1:String, _arg_2:Vector.<BonusItemCC>)
      {
         var _local_3:int = 0;
         var _local_4:PreviewBonusItem = null;
         var _local_5:LabelBase = null;
         var _local_6:GarageItemBackground = null;
         var _local_8:Sprite = null;
         var _local_9:int = 0;
         this.buttonSize = new Point(104,33);
         super();
         _local_6 = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
         var _local_7:* = (_arg_2.length & 1) == 0;
         if(_arg_2.length == 1)
         {
            _local_3 = 1;
         }
         else if(_arg_2.length < 5)
         {
            _local_3 = 2;
         }
         else
         {
            _local_3 = 3;
         }
         _local_8 = new Sprite();
         this.itemsContainer = new Sprite();
         this.bannerBmp = new Bitmap();
         _local_8.addChild(this.bannerBmp);
         this.windowWidth = _local_6.width + this.windowMargin * 2 + this.margin * 2 + (_local_6.width + this.space) * (_local_3 - 1);
         this.messageLabel = new LabelBase();
         this.messageLabel.wordWrap = true;
         this.messageLabel.multiline = true;
         this.messageLabel.text = _arg_1;
         this.messageLabel.size = 12;
         this.messageLabel.color = 5898034;
         this.messageLabel.x = this.windowMargin * 2;
         this.messageLabel.y = this.windowMargin * 2;
         this.messageLabel.width = this.windowWidth - this.windowMargin * 4;
         this.windowSize = new Point(this.windowWidth,this.messageLabel.height + this.buttonSize.y + this.windowMargin * 3 + this.margin * 3);
         this.window = new TankWindow(this.windowSize.x,this.windowSize.y);
         addChild(this.window);
         this.window.headerLang = localeService.getText(TanksLocale.TEXT_GUI_LANG);
         this.window.header = TankWindowHeader.CONGRATULATIONS;
         this.inner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         addChild(this.inner);
         this.inner.x = this.windowMargin;
         this.inner.y = this.windowMargin;
         this.inner.width = this.windowSize.x - this.windowMargin * 2;
         this.inner.height = this.windowSize.y - this.windowMargin - this.margin * 2 - this.buttonSize.y + 2;
         addChild(this.messageLabel);
         addChild(this.itemsContainer);
         while(_local_9 < _arg_2.length)
         {
            _local_6 = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
            this.itemsContainer.addChild(_local_6);
            _local_4 = new PreviewBonusItem(_arg_2[_local_9].resource,_local_6.width,_local_6.height);
            this.itemsContainer.addChild(_local_4);
            _local_6.x = (!_local_7 && _local_9 > _arg_2.length - _local_3 ? _local_6.width + this.space >> 1 : 0) + int(_local_9 % _local_3) * (_local_6.width + this.space);
            _local_6.y = (_local_6.height + this.space) * int(_local_9 / _local_3);
            _local_4.x = _local_6.x;
            _local_4.y = _local_6.y;
            _local_5 = new LabelBase();
            this.itemsContainer.addChild(_local_5);
            _local_5.size = 16;
            _local_5.color = 5898034;
            _local_5.text = "×" + _arg_2[_local_9].count.toString();
            _local_5.x = _local_6.x + _local_6.width - _local_5.width - 15;
            _local_5.y = _local_6.y + _local_6.height - _local_5.height - 10;
            _local_9++;
         }
         this.windowSize.y += this.itemsContainer.height;
         this.closeButton = new DefaultButtonBase();
         addChild(this.closeButton);
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         this.closeButton.y = this.windowSize.y - this.margin - this.buttonSize.y - 2;
         this.placeItems();
         addChild(_local_8);
         this.window.height = this.windowSize.y;
         this.window.width = this.windowSize.x;
      }
      
      private function placeItems() : void
      {
         this.messageLabel.width = this.windowWidth - this.windowMargin * 4;
         this.itemsContainer.y = this.messageLabel.y + this.messageLabel.height + this.windowMargin;
         this.itemsContainer.x = this.windowSize.x - this.itemsContainer.width >> 1;
         this.inner.width = this.windowSize.x - this.windowMargin * 2;
         this.inner.height = this.windowSize.y - this.windowMargin - this.margin * 2 - this.buttonSize.y + 2;
         this.closeButton.x = this.windowSize.x - this.buttonSize.x >> 1;
      }
      
      public function set bannerBd(_arg_1:BitmapData) : void
      {
         this.bannerBmp.bitmapData = _arg_1;
         this.windowSize.y = this.windowSize.y + this.bannerBmp.height + this.margin - 1;
         this.windowWidth = this.windowSize.x = Math.max(this.windowSize.x,this.bannerBmp.width + this.windowMargin * 2 + this.margin * 2);
         this.window.height = this.windowSize.y;
         this.window.width = this.windowSize.x;
         this.placeItems();
         this.bannerBmp.x = this.windowWidth - this.bannerBmp.width >> 1;
         this.bannerBmp.y = this.inner.y + this.inner.height - this.margin - this.bannerBmp.height - 1;
         this.closeButton.y = this.windowSize.y - this.margin - this.buttonSize.y - 2;
      }
      
      public function get banner() : Bitmap
      {
         return this.bannerBmp;
      }
   }
}

