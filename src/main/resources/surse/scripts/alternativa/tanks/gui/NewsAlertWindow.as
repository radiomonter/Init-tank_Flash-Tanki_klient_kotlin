package alternativa.tanks.gui
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.news.NewsItem;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import forms.ColorConstants;
   import forms.TankWindowWithHeader;
   import projects.tanks.client.chat.models.news.showing.NewsItemData;
   import projects.tanks.clients.flash.commons.services.datetime.DateFormatter;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import titanomachina.headers.Headers;
   import utils.ScrollStyleUtils;
   
   public class NewsAlertWindow extends DialogWindow
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const SCROLL_SPEED_MULTIPLIER:int = 3;
      
      private static const WIDTH:int = 500;
      
      private var scrollPane:ScrollPane;
      
      private var scrollContainer:Sprite;
      
      private var window:TankWindowWithHeader;
      
      public var closeButton:DefaultButtonBase;
      
      private var innerWidth:int;
      
      public function NewsAlertWindow(_arg_1:Vector.<NewsItemData>)
      {
         var _local_3:TankWindowInner = null;
         this.scrollPane = new ScrollPane();
         this.scrollContainer = new Sprite();
         super();
         this.innerWidth = WIDTH - 2 * 10;
         this.addNewsItems(_arg_1);
         var _local_2:int = this.scrollContainer.height < 300 ? int(this.scrollContainer.height + 100) : 400;
         this.window = new TankWindowWithHeader(Headers.getHeaderById("NEWS"));
         this.window.width = WIDTH;
         this.window.height = _local_2;
         addChild(this.window);
         _local_3 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         _local_3.x = 10;
         _local_3.y = 10;
         _local_3.height = this.window.height - 50 - 2 * 10;
         _local_3.width = this.window.width - 2 * 10;
         addChild(_local_3);
         ScrollStyleUtils.setGreenStyle(this.scrollPane);
         this.scrollPane.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.scrollPane.verticalScrollPolicy = ScrollPolicy.AUTO;
         this.scrollPane.source = this.scrollContainer;
         this.scrollPane.x = 10;
         this.scrollPane.y = 10;
         this.scrollPane.focusEnabled = false;
         this.scrollPane.setSize(_local_3.width - 10,_local_3.height - 2 * 10);
         this.scrollPane.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel,true);
         this.scrollPane.update();
         _local_3.addChild(this.scrollPane);
         this.scrollPane.update();
         this.closeButton = new DefaultButtonBase();
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_CLOSE_LABEL);
         this.closeButton.x = (this.window.width - this.closeButton.width) / 2;
         this.closeButton.y = this.window.height - this.closeButton.height - 20;
         this.closeButton.addEventListener(MouseEvent.CLICK,this.onClickCancel);
         addChild(this.closeButton);
      }
      
      private function onClickCancel(_arg_1:MouseEvent = null) : void
      {
         this.destroy();
         dialogService.removeDialog(this);
      }
      
      private function onMouseWheel(_arg_1:MouseEvent) : void
      {
         _arg_1.delta *= SCROLL_SPEED_MULTIPLIER;
      }
      
      private function createNewsItem(_arg_1:NewsItemData) : NewsItem
      {
         var _local_2:NewsItem = new NewsItem(_arg_1,null,0);
         _local_2.x = -4;
         return _local_2;
      }
      
      private function addNewsItems(_arg_1:Vector.<NewsItemData>) : void
      {
         var _local_4:NewsItemData = null;
         var _local_5:Sprite = null;
         var _local_6:NewsItem = null;
         var _local_7:String = null;
         var _local_8:LabelBase = null;
         var _local_2:int = 0;
         var _local_3:String = "";
         for each(_local_4 in _arg_1)
         {
            _local_6 = this.createNewsItem(_local_4);
            _local_7 = _local_4.dateInSeconds;
            if(_local_3 != _local_7)
            {
               _local_3 = _local_7;
               _local_8 = new LabelBase();
               _local_8.htmlText = _local_3;
               _local_8.textColor = ColorConstants.NEWS_DATE;
               this.scrollContainer.addChild(_local_8);
               _local_8.x = this.innerWidth - _local_8.textWidth - 20 >> 1;
               _local_8.y = _local_2;
               _local_2 += 10;
            }
            _local_6.y = _local_2;
            _local_6.resize(this.innerWidth - 20);
            this.scrollContainer.addChild(_local_6);
            _local_2 = _local_6.y + _local_6.height + 10;
         }
         _local_5 = new Sprite();
         _local_5.graphics.beginFill(0,0);
         _local_5.graphics.drawRect(0,0,10,20);
         _local_5.graphics.endFill();
         _local_5.y = _local_2;
         this.scrollContainer.addChild(_local_5);
      }
      
      private function getDateString(_arg_1:int) : String
      {
         var _local_2:Date = new Date();
         _local_2.setTime(_arg_1 * 1000);
         return DateFormatter.formatDateToLocalized(_local_2);
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.onClickCancel();
      }
      
      override protected function confirmationKeyPressed() : void
      {
         this.onClickCancel();
      }
      
      override public function get height() : Number
      {
         return this.window.height;
      }
      
      override public function get width() : Number
      {
         return this.window.width;
      }
      
      private function destroy() : void
      {
         var _local_2:NewsItem = null;
         var _local_1:int = 0;
         this.scrollPane.removeEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.onClickCancel);
         while(_local_1 < this.scrollContainer.numChildren)
         {
            _local_2 = this.scrollContainer.getChildAt(_local_1) as NewsItem;
            if(_local_2 != null)
            {
               _local_2.destroy();
            }
            _local_1++;
         }
      }
   }
}

