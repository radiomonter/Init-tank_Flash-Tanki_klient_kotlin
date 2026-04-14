package projects.tanks.client.panel.model.news.item
{
   public class NewsItemCC
   {
      
      private var _imageUrl:String;
      
      private var _newsDate:String;
      
      private var _newsText:String;
      
      public function NewsItemCC(_arg_1:String = null, _arg_2:String = null, _arg_3:String = null)
      {
         super();
         this._imageUrl = _arg_1;
         this._newsDate = _arg_2;
         this._newsText = _arg_3;
      }
      
      public function get imageUrl() : String
      {
         return this._imageUrl;
      }
      
      public function set imageUrl(_arg_1:String) : void
      {
         this._imageUrl = _arg_1;
      }
      
      public function get newsDate() : String
      {
         return this._newsDate;
      }
      
      public function set newsDate(_arg_1:String) : void
      {
         this._newsDate = _arg_1;
      }
      
      public function get newsText() : String
      {
         return this._newsText;
      }
      
      public function set newsText(_arg_1:String) : void
      {
         this._newsText = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "NewsItemCC [";
         _local_1 += "imageUrl = " + this.imageUrl + " ";
         _local_1 += "newsDate = " + this.newsDate + " ";
         _local_1 += "newsText = " + this.newsText + " ";
         return _local_1 + "]";
      }
   }
}

