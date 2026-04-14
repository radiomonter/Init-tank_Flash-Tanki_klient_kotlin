package alternativa.tanks.model.news
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.NewsAlertWindow;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import projects.tanks.client.chat.models.news.showing.NewsItemData;
   import projects.tanks.client.panel.model.news.showing.INewsShowingModelBase;
   import projects.tanks.client.panel.model.news.showing.NewsShowingCC;
   import projects.tanks.client.panel.model.news.showing.NewsShowingModelBase;
   
   public class NewsShowingModel extends NewsShowingModelBase implements INewsShowingModelBase, IObjectLoadListener
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var dialogsService:IDialogsService;
      
      private var newsWindow:NewsAlertWindow;
      
      public function NewsShowingModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _local_1:Vector.<NewsItemData> = null;
         var _local_2:int = 0;
         var _local_3:NewsShowingCC = getInitParam();
         var _local_4:Vector.<NewsItemData> = _local_3.newsItems;
         if(_local_4.length > 0)
         {
            _local_1 = new Vector.<NewsItemData>();
            _local_2 = 0;
            while(_local_2 < _local_4.length)
            {
               _local_1.push(_local_4[_local_2]);
               _local_2++;
            }
            this.showNews(_local_1);
         }
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      private function alignNewsWindow(_arg_1:Event = null) : void
      {
         this.newsWindow.x = Math.round((display.stage.stageWidth - this.newsWindow.width) * 0.5);
         this.newsWindow.y = Math.round((display.stage.stageHeight - this.newsWindow.height) * 0.5);
      }
      
      private function closeWindow(_arg_1:MouseEvent = null) : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.alignNewsWindow);
         this.removeDialog(this.newsWindow);
         this.newsWindow = null;
      }
      
      private function addDialog(_arg_1:DisplayObject) : void
      {
         dialogsService.addDialog(_arg_1);
      }
      
      private function removeDialog(_arg_1:DisplayObject) : void
      {
         dialogsService.removeDialog(_arg_1);
      }
      
      private function showNews(_arg_1:Vector.<NewsItemData>) : void
      {
         this.newsWindow = new NewsAlertWindow(_arg_1);
         this.newsWindow.closeButton.addEventListener(MouseEvent.CLICK,this.closeWindow);
         display.stage.addEventListener(Event.RESIZE,this.alignNewsWindow);
         this.addDialog(this.newsWindow);
         this.alignNewsWindow();
      }
   }
}

