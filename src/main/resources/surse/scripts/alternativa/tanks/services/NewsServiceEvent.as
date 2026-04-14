package alternativa.tanks.services
{
   import alternativa.types.Long;
   import flash.events.Event;
   import projects.tanks.client.chat.models.news.showing.NewsItemData;
   
   public class NewsServiceEvent extends Event
   {
      
      public static const NEWS_ITEM_IS_SENT:String = "NewsServiceEvent.NEWS_ITEM_IS_SENT";
      
      public static const NEWS_ITEM_IS_REMOVED:String = "NewsServiceEvent.NEWS_ITEM_IS_REMOVED";
      
      private var newsItem:NewsItemData;
      
      private var newsId:Long;
      
      public function NewsServiceEvent(_arg_1:String)
      {
         super(_arg_1,true,false);
      }
      
      public function getNewsItem() : NewsItemData
      {
         return this.newsItem;
      }
      
      public function setNewsItem(_arg_1:NewsItemData) : void
      {
         this.newsItem = _arg_1;
      }
      
      public function getNewsId() : Long
      {
         return this.newsId;
      }
      
      public function setNewsId(_arg_1:Long) : void
      {
         this.newsId = _arg_1;
      }
   }
}

