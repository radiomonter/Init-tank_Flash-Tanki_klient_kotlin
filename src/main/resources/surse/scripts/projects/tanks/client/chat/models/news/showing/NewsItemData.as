package projects.tanks.client.chat.models.news.showing
{
   import alternativa.types.Long;
   
   public class NewsItemData
   {
      
      private var _dateInSeconds:String;
      
      private var _description:String;
      
      private var _endDate:int;
      
      private var _header:String;
      
      private var _id:Long;
      
      private var _imageUrl:String;
      
      public function NewsItemData(_arg_1:String = null, _arg_2:String = null, _arg_3:int = 0, _arg_4:String = null, _arg_5:Long = null, _arg_6:String = null)
      {
         super();
         this._dateInSeconds = _arg_1;
         this._description = _arg_2;
         this._endDate = _arg_3;
         this._header = _arg_4;
         this._id = _arg_5;
         this._imageUrl = _arg_6;
      }
      
      public function get dateInSeconds() : String
      {
         return this._dateInSeconds;
      }
      
      public function set dateInSeconds(_arg_1:String) : void
      {
         this._dateInSeconds = _arg_1;
      }
      
      public function get description() : String
      {
         return this._description;
      }
      
      public function set description(_arg_1:String) : void
      {
         this._description = _arg_1;
      }
      
      public function get endDate() : int
      {
         return this._endDate;
      }
      
      public function set endDate(_arg_1:int) : void
      {
         this._endDate = _arg_1;
      }
      
      public function get header() : String
      {
         return this._header;
      }
      
      public function set header(_arg_1:String) : void
      {
         this._header = _arg_1;
      }
      
      public function get id() : Long
      {
         return this._id;
      }
      
      public function set id(_arg_1:Long) : void
      {
         this._id = _arg_1;
      }
      
      public function get imageUrl() : String
      {
         return this._imageUrl;
      }
      
      public function set imageUrl(_arg_1:String) : void
      {
         this._imageUrl = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "NewsItemData [";
         _local_1 += "dateInSeconds = " + this.dateInSeconds + " ";
         _local_1 += "description = " + this.description + " ";
         _local_1 += "endDate = " + this.endDate + " ";
         _local_1 += "header = " + this.header + " ";
         _local_1 += "id = " + this.id + " ";
         _local_1 += "imageUrl = " + this.imageUrl + " ";
         return _local_1 + "]";
      }
   }
}

