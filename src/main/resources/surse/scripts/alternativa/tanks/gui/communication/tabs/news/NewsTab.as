package alternativa.tanks.gui.communication.tabs.news
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.communication.tabs.*;
   import alternativa.tanks.gui.news.NewsItem;
   import alternativa.tanks.services.NewsService;
   import alternativa.tanks.services.NewsServiceEvent;
   import alternativa.types.Long;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import forms.ColorConstants;
   import projects.tanks.client.chat.models.news.showing.NewsItemData;
   import utils.ScrollStyleUtils;
   
   public class NewsTab extends AbstractCommunicationPanelTab
   {
      
      [Inject]
      public static var newsService:NewsService = NewsService(OSGi.getInstance().getService(NewsService));
      
      private static const AROUND_GAP:int = 25;
      
      private static const SCROLL_GAP:int = 5;
      
      private static const SCROLL_PANE_BOTTOM_PADDING:int = 15;
      
      private static const SCROLL_SHIFT_GAP:int = 5;
      
      private static const SCROLL_SPEED_MULTIPLIER:int = 3;
      
      private static const LEFT_MARGIN:int = 10;
      
      private static const VERTICAL_GAP:int = 12;
      
      private static const NEWS_VERTICAL_GAP:int = 24;
      
      private var scrollPane:ScrollPane = new ScrollPane();
      
      private var scrollContainer:Sprite = new Sprite();
      
      private var scrollPaneBottomPadding:Sprite = new Sprite();
      
      private var inner:TankWindowInner = new TankWindowInner(0,0,TankWindowInner.GREEN);
      
      private var scrollEnabled:Boolean;
      
      private var _width:int;
      
      private var _height:int;
      
      private var newsId2NewsItem:Dictionary = new Dictionary();
      
      public function NewsTab()
      {
         super();
         this.inner.showBlink = true;
         addChild(this.inner);
         this.scrollContainer.addChild(this.scrollPaneBottomPadding);
         ScrollStyleUtils.setGreenStyle(this.scrollPane);
         this.scrollPane.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.scrollPane.verticalScrollPolicy = ScrollPolicy.AUTO;
         this.scrollPane.source = this.scrollContainer;
         this.scrollPane.update();
         this.scrollPane.focusEnabled = false;
         this.scrollPane.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel,true);
         this.inner.addChild(this.scrollPane);
         newsService.setNewsAddingCallback(this.addNewsItems);
         newsService.addEventListener(NewsServiceEvent.NEWS_ITEM_IS_SENT,this.onNewsItemAdded);
         newsService.addEventListener(NewsServiceEvent.NEWS_ITEM_IS_REMOVED,this.onNewsItemRemoved);
         addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(_arg_1:MouseEvent) : void
      {
         var _local_3:DisplayObject = null;
         var _local_4:NewsItem = null;
         var _local_5:int = 0;
         var _local_2:int = 0;
         while(_local_2 < this.scrollContainer.numChildren)
         {
            _local_3 = this.scrollContainer.getChildAt(_local_2);
            if(_local_3 is NewsItem)
            {
               _local_4 = NewsItem(_local_3);
               _local_5 = _local_3.y - (this.scrollEnabled ? this.scrollPane.verticalScrollPosition : 0);
               if(!_local_4.isRead() && _local_3.x <= mouseX && _local_3.x + _local_3.width >= mouseX && _local_5 <= mouseY && _local_5 + _local_3.height >= mouseY)
               {
                  _local_4.read();
                  return;
               }
            }
            _local_2++;
         }
      }
      
      private function onMouseWheel(_arg_1:MouseEvent) : void
      {
         _arg_1.delta *= SCROLL_SPEED_MULTIPLIER;
      }
      
      private function onNewsItemRemoved(_arg_1:NewsServiceEvent) : void
      {
         var _local_2:Long = _arg_1.getNewsId();
         var _local_3:NewsItem = this.newsId2NewsItem[_local_2];
         if(_local_3 != null)
         {
            this.removeNewsItem(_local_3);
         }
      }
      
      public function removeNewsItem(_arg_1:NewsItem) : void
      {
         _arg_1.destroy();
         var _local_2:int = this.scrollContainer.getChildIndex(_arg_1);
         this.scrollContainer.removeChildAt(_local_2);
         this.removeUnusedDateLabel(_local_2);
         this.resize(this._width,this._height);
      }
      
      private function removeUnusedDateLabel(_arg_1:int) : void
      {
         if(!(this.scrollContainer.getChildAt(_arg_1 - 1) is LabelBase))
         {
            return;
         }
         if(_arg_1 == this.scrollContainer.numChildren || this.scrollContainer.getChildAt(_arg_1) is LabelBase)
         {
            this.scrollContainer.removeChildAt(_arg_1 - 1);
         }
      }
      
      private function onNewsItemAdded(_arg_1:NewsServiceEvent) : void
      {
         var _local_6:LabelBase = null;
         var _local_2:NewsItemData = _arg_1.getNewsItem();
         var _local_3:Long = _local_2.id;
         if(this.newsId2NewsItem[_local_3] != null)
         {
            return;
         }
         var _local_4:NewsItem = this.createNewsItem(_local_2);
         if(_local_4 == null)
         {
            return;
         }
         this.newsId2NewsItem[_local_3] = _local_4;
         var _local_5:String = _local_2.dateInSeconds;
         if(this.scrollContainer.numChildren > 1)
         {
            _local_6 = this.scrollContainer.getChildAt(1) as LabelBase;
            if(_local_5 == _local_6.text)
            {
               this.scrollContainer.addChildAt(_local_4,2);
            }
            else
            {
               this.addNewsItemAndNewDateBlock(_local_4,_local_5);
            }
         }
         else
         {
            this.addNewsItemAndNewDateBlock(_local_4,_local_5);
         }
         this.resize(this._width,this._height);
         dispatchEvent(new NewsTabNewsItemAddedEvent());
      }
      
      private function createNewsItem(_arg_1:NewsItemData) : NewsItem
      {
         var _local_2:int = 0;
         if(_arg_1.endDate > 0)
         {
            _local_2 = _arg_1.endDate * 1000 - new Date().time;
            if(_local_2 < 5000)
            {
               return null;
            }
         }
         var _local_3:NewsItem = new NewsItem(_arg_1,this,_local_2);
         _local_3.x = LEFT_MARGIN;
         return _local_3;
      }
      
      private function addNewsItemAndNewDateBlock(_arg_1:NewsItem, _arg_2:String) : void
      {
         this.scrollContainer.addChildAt(_arg_1,1);
         var _local_3:LabelBase = new LabelBase();
         _local_3.htmlText = _arg_2;
         _local_3.textColor = ColorConstants.NEWS_DATE;
         this.scrollContainer.addChildAt(_local_3,1);
      }
      
      override public function resize(_arg_1:int, _arg_2:int) : void
      {
         this._width = _arg_1;
         this._height = _arg_2;
         this.scrollPane.y = SCROLL_GAP;
         this.scrollPane.setSize(_arg_1 + SCROLL_SHIFT_GAP,_arg_2 - SCROLL_GAP * 2);
         this.inner.width = _arg_1;
         this.inner.height = _arg_2;
         var _local_3:int = this.resizeAll(_arg_1 - 20);
         this.scrollEnabled = false;
         if(this.scrollPane.height < _local_3 + SCROLL_SHIFT_GAP * 2)
         {
            _local_3 = this.resizeAll(_arg_1 - 25);
            this.scrollEnabled = true;
         }
         this.fixScrollPaneBottomPadding(_local_3);
         this.scrollPane.update();
      }
      
      private function fixScrollPaneBottomPadding(_arg_1:int) : void
      {
         this.scrollPaneBottomPadding.graphics.lineStyle(1,ColorConstants.WHITE,0);
         this.scrollPaneBottomPadding.graphics.beginFill(ColorConstants.WHITE,0);
         this.scrollPaneBottomPadding.graphics.drawRect(0,0,1,SCROLL_PANE_BOTTOM_PADDING);
         this.scrollPaneBottomPadding.graphics.endFill();
         this.scrollPaneBottomPadding.x = AROUND_GAP;
         this.scrollPaneBottomPadding.y = _arg_1;
      }
      
      private function resizeAll(_arg_1:int) : int
      {
         var _local_4:DisplayObject = null;
         var _local_5:NewsItem = null;
         var _local_6:LabelBase = null;
         var _local_3:int = 0;
         var _local_2:int = VERTICAL_GAP >> 1;
         while(_local_3 < this.scrollContainer.numChildren)
         {
            _local_4 = this.scrollContainer.getChildAt(_local_3);
            if(_local_4 is NewsItem)
            {
               _local_5 = NewsItem(_local_4);
               _local_5.resize(_arg_1);
               _local_5.y = _local_2;
               _local_2 += _local_5.getHeight() + NEWS_VERTICAL_GAP;
            }
            if(_local_4 is LabelBase)
            {
               _local_6 = LabelBase(_local_4);
               _local_6.x = _arg_1 - _local_6.textWidth >> 1;
               _local_6.y = _local_2;
               _local_2 = _local_6.y + _local_6.textHeight + VERTICAL_GAP;
            }
            _local_3++;
         }
         return _local_2;
      }
      
      public function addNewsItems(_arg_1:Vector.<NewsItemData>) : void
      {
         var _local_3:NewsItemData = null;
         var _local_4:NewsItem = null;
         var _local_5:String = null;
         var _local_6:LabelBase = null;
         this.clearAll();
         var _local_2:String = "";
         for each(_local_3 in _arg_1)
         {
            _local_4 = this.createNewsItem(_local_3);
            if(_local_4 != null)
            {
               _local_5 = _local_3.dateInSeconds;
               if(_local_2 != _local_5)
               {
                  _local_2 = _local_5;
                  _local_6 = new LabelBase();
                  _local_6.htmlText = _local_2;
                  _local_6.textColor = ColorConstants.NEWS_DATE;
                  this.scrollContainer.addChild(_local_6);
               }
               this.newsId2NewsItem[_local_3.id] = _local_4;
               this.scrollContainer.addChild(_local_4);
            }
         }
         this.resize(this._width,this._height);
      }
      
      private function clearAll() : void
      {
         this.scrollContainer = new Sprite();
         this.scrollPaneBottomPadding = new Sprite();
         this.scrollContainer.addChild(this.scrollPaneBottomPadding);
         this.scrollPane.source = this.scrollContainer;
         this.scrollPane.update();
         newsService.clearExpiredReadNews();
      }
      
      public function destroy() : void
      {
         var _local_2:NewsItem = null;
         var _local_1:int = 0;
         newsService.resetNewsAddingCallback();
         this.scrollPane.removeEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
         newsService.removeEventListener(NewsServiceEvent.NEWS_ITEM_IS_SENT,this.onNewsItemAdded);
         newsService.removeEventListener(NewsServiceEvent.NEWS_ITEM_IS_REMOVED,this.onNewsItemRemoved);
         removeEventListener(MouseEvent.CLICK,this.onClick);
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

