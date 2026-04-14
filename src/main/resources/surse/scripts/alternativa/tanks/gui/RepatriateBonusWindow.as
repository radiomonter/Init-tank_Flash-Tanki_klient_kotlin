package alternativa.tanks.gui
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import assets.icons.GarageItemBackground;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Point;
   import forms.TankWindowWithHeader;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemCC;
   import titanomachina.headers.Headers;
   
   public class RepatriateBonusWindow extends Sprite
   {
      
      [Inject]
      public static var resourceService:ResourceRegistry;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var clientLog:IClientLog;
      
      private const windowMargin:int = 12;
      
      private const margin:int = 9;
      
      private const buttonSize:Point;
      
      private const space:int = 8;
      
      private var window:TankWindowWithHeader;
      
      private var inner:TankWindowInner;
      
      public var closeButton:DefaultButtonBase;
      
      private var messageLabel:LabelBase;
      
      private var windowSize:Point;
      
      private var windowWidth:int = 450;
      
      private var itemsContainer:Sprite;
      
      public function RepatriateBonusWindow(_arg_1:BitmapData, _arg_2:String, _arg_3:Vector.<BonusItemCC>)
      {
         var _local_4:int = 0;
         var _local_5:PreviewBonusItem = null;
         var _local_6:int = 0;
         var _local_7:int = 0;
         var _local_8:LabelBase = null;
         var _local_12:int = 0;
         this.buttonSize = new Point(104,33);
         _local_4 = 0;
         super();
         var _local_9:GarageItemBackground = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
         if(_arg_3.length == 1)
         {
            _local_4 = 1;
         }
         else if(_arg_3.length <= 4)
         {
            _local_4 = 2;
         }
         else if(_arg_3.length <= 6)
         {
            _local_4 = 3;
         }
         else
         {
            _local_4 = 4;
         }
         this.itemsContainer = new Sprite();
         this.windowWidth = _local_9.width + this.windowMargin * 2 + this.margin * 2 + (_local_9.width + this.space) * (_local_4 - 1);
         this.messageLabel = new LabelBase();
         this.messageLabel.wordWrap = true;
         this.messageLabel.multiline = true;
         this.messageLabel.text = _arg_2;
         this.messageLabel.size = 12;
         this.messageLabel.color = 5898034;
         this.messageLabel.x = this.windowMargin * 2;
         this.messageLabel.y = 110 + this.windowMargin * 2;
         this.messageLabel.width = this.windowWidth - this.windowMargin * 4;
         this.windowSize = new Point(this.windowWidth,110 + this.messageLabel.height + this.buttonSize.y + this.windowMargin * 3 + this.margin * 3);
         this.window = new TankWindowWithHeader(Headers.getHeaderById("WELCOME_BACK"));
         this.window.width = this.windowSize.x;
         this.window.height = this.windowSize.y;
         addChild(this.window);
         this.inner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         addChild(this.inner);
         this.inner.x = this.windowMargin;
         this.inner.y = this.windowMargin;
         this.inner.width = this.windowSize.x - this.windowMargin * 2;
         this.inner.height = this.windowSize.y - this.windowMargin - this.margin * 2 - this.buttonSize.y + 2;
         clientLog.log("Test","lang = %1",localeService.language);
         var _local_10:Bitmap = new Bitmap(_arg_1);
         addChild(_local_10);
         _local_10.y = 30;
         _local_10.x = (this.inner.width - _local_10.width) / 2;
         addChild(this.messageLabel);
         addChild(this.itemsContainer);
         var _local_11:int = int(int(_arg_3.length / _local_4) + 1);
         while(_local_12 < _arg_3.length)
         {
            _local_9 = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
            this.itemsContainer.addChild(_local_9);
            _local_5 = new PreviewBonusItem(_arg_3[_local_12].resource,_local_9.width,_local_9.height);
            this.itemsContainer.addChild(_local_5);
            if(int(_local_12 / _local_4) + 1 == _local_11)
            {
               _local_6 = _arg_3.length - (_local_11 - 1) * _local_4;
               _local_7 = (_local_4 - _local_6) * (_local_9.width + this.space >> 1);
               _local_9.x = int(_local_12 % _local_4) * (_local_9.width + this.space) + _local_7;
            }
            else
            {
               _local_9.x = int(_local_12 % _local_4) * (_local_9.width + this.space);
            }
            _local_9.y = (_local_9.height + this.space) * int(_local_12 / _local_4);
            _local_5.x = _local_9.x;
            _local_5.y = _local_9.y;
            if(_arg_3[_local_12].count > 0)
            {
               _local_8 = new LabelBase();
               this.itemsContainer.addChild(_local_8);
               _local_8.size = 16;
               _local_8.color = 5898034;
               _local_8.text = "×" + _arg_3[_local_12].count.toString();
               _local_8.x = _local_9.x + _local_9.width - _local_8.width - 15;
               _local_8.y = _local_9.y + _local_9.height - _local_8.height - 10;
            }
            _local_12++;
         }
         this.windowSize.y += this.itemsContainer.height;
         this.closeButton = new DefaultButtonBase();
         addChild(this.closeButton);
         this.closeButton.label = localeService.getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         this.closeButton.y = this.windowSize.y - this.margin - this.buttonSize.y - 2;
         this.placeItems();
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
   }
}

