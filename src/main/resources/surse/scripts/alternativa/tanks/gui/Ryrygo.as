package alternativa.tanks.gui
{
   import alternativa.osgi.service.locale.ILocaleService;
   import assets.icons.GarageItemBackground;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormatAlign;
   import forms.TankWindowWithHeader;
   import obfuscation.jufuniqa.Cyfu;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import titanomachina.headers.Headers;
   
   public class Ryrygo extends DialogWindow
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const gaso:Class = Ped;
      
      private static const rudu:BitmapData = new gaso().bitmapData;
      
      private static const WINDOW_WIDTH:int = 680;
      
      private static const WINDOW_HEIGHT:int = 555;
      
      private static const MARGIN:int = 10;
      
      private static const SPACE:int = 20;
      
      private static const niga:int = 90;
      
      private static const wovu:int = 510;
      
      private static const punacu:int = 3;
      
      private var window:TankWindowWithHeader;
      
      private var closeButton:DefaultButtonBase = new DefaultButtonBase();
      
      private var messageLabel:LabelBase = new LabelBase();
      
      private var itemsContainer:Sprite = new Sprite();
      
      private var bejo:Vector.<Cyfu>;
      
      public function Ryrygo(_arg_1:Vector.<Cyfu>)
      {
         super();
         this.bejo = _arg_1;
         this.createWindow();
         this.qawon();
         this.nuhomeb();
         this.addMessage();
         this.cogoqumy();
         this.pysalu();
      }
      
      private function createWindow() : void
      {
         this.window = new TankWindowWithHeader(Headers.getHeaderById("CONGRATULATIONS"));
         this.window.width = WINDOW_WIDTH;
         this.window.height = WINDOW_HEIGHT;
         addChild(this.window);
      }
      
      private function qawon() : void
      {
         var _local_1:TankWindowInner = new TankWindowInner(WINDOW_WIDTH - 2 * MARGIN,WINDOW_HEIGHT - this.closeButton.height - 3 * MARGIN,TankWindowInner.GREEN);
         _local_1.x = MARGIN;
         _local_1.y = MARGIN;
         this.window.addChild(_local_1);
      }
      
      private function nuhomeb() : void
      {
         var _local_1:Bitmap = new Bitmap(rudu);
         this.window.addChild(_local_1);
         _local_1.y = MARGIN + SPACE;
         _local_1.x = (WINDOW_WIDTH - 2 * MARGIN - _local_1.width) / 2;
      }
      
      private function addMessage() : void
      {
         this.messageLabel.wordWrap = true;
         this.messageLabel.multiline = true;
         this.messageLabel.text = localeService.getText(TanksLocale.TEXT_WEEKLY_QUEST_REWARD_WINDOW_DESCRIPTION);
         this.messageLabel.size = 12;
         this.messageLabel.color = 5898034;
         this.messageLabel.align = TextFormatAlign.CENTER;
         this.messageLabel.width = wovu;
         this.messageLabel.x = (WINDOW_WIDTH - wovu) / 2;
         this.messageLabel.y = niga + MARGIN * 2 + SPACE;
         this.window.addChild(this.messageLabel);
      }
      
      private function cogoqumy() : void
      {
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_CLOSE_LABEL);
         this.closeButton.addEventListener(MouseEvent.CLICK,this.onCloseButtonClick);
         this.closeButton.x = (WINDOW_WIDTH - this.closeButton.width) / 2;
         this.closeButton.y = WINDOW_HEIGHT - MARGIN - this.closeButton.height;
         this.window.addChild(this.closeButton);
      }
      
      private function onCloseButtonClick(_arg_1:MouseEvent = null) : void
      {
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.onCloseButtonClick);
         dialogService.removeDialog(this);
      }
      
      private function pysalu() : void
      {
         var _local_1:Boolean = false;
         var _local_2:int = 0;
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_6:int = 0;
         var _local_5:GarageItemBackground = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
         while(_local_6 < this.bejo.length)
         {
            _local_1 = _local_6 > 2 && this.bejo.length < punacu * 2;
            _local_2 = !_local_1 ? int(0) : int(int((_local_5.width + SPACE) / 2));
            _local_3 = _local_6 % punacu * (_local_5.width + SPACE) + _local_2;
            _local_4 = int((_local_5.height + SPACE) * int(_local_6 / punacu));
            this.defiliqi(this.bejo[_local_6].itemImage,this.bejo[_local_6].count,_local_3,_local_4);
            _local_6++;
         }
         this.itemsContainer.y = this.messageLabel.y + this.messageLabel.height + SPACE;
         this.itemsContainer.x = WINDOW_WIDTH - this.itemsContainer.width >> 1;
         this.window.addChild(this.itemsContainer);
      }
      
      private function defiliqi(_arg_1:ImageResource, _arg_2:int, _arg_3:int, _arg_4:int) : void
      {
         var _local_7:PreviewBonusItem = null;
         var _local_5:LabelBase = null;
         var _local_6:GarageItemBackground = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
         this.itemsContainer.addChild(_local_6);
         _local_7 = new PreviewBonusItem(_arg_1,_local_6.width,_local_6.height);
         this.itemsContainer.addChild(_local_7);
         _local_6.x = _local_7.x = _arg_3;
         _local_6.y = _local_7.y = _arg_4;
         if(_arg_2 > 0)
         {
            _local_5 = new LabelBase();
            this.itemsContainer.addChild(_local_5);
            _local_5.size = 16;
            _local_5.color = 5898034;
            _local_5.text = "×" + _arg_2.toString();
            _local_5.x = _local_6.x + _local_6.width - _local_5.width - 1.5 * MARGIN;
            _local_5.y = _local_6.y + _local_6.height - _local_5.height - MARGIN;
         }
      }
      
      public function show() : void
      {
         dialogService.addDialog(this);
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.onCloseButtonClick();
      }
      
      override protected function confirmationKeyPressed() : void
      {
         this.onCloseButtonClick();
      }
   }
}

