package projects.tanks.client.panel.model.news.showing
{
   import projects.tanks.client.chat.models.news.showing.NewsItemData;
   
   public class NewsShowingCC
   {
      
      private var _newsItems:Vector.<NewsItemData>;
      
      public function NewsShowingCC(_arg_1:Vector.<NewsItemData> = null)
      {
         super();
         this._newsItems = _arg_1;
      }
      
      public function get newsItems() : Vector.<NewsItemData>
      {
         return this._newsItems;
      }
      
      public function set newsItems(_arg_1:Vector.<NewsItemData>) : void
      {
         this._newsItems = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "NewsShowingCC [";
         _local_1 += "newsItems = " + this.newsItems + " ";
         return _local_1 + "]";
      }
   }
}

