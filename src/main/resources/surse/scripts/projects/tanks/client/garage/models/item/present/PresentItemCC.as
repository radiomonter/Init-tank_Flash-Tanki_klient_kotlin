package projects.tanks.client.garage.models.item.present
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class PresentItemCC
   {
      
      private var _date:Number;
      
      private var _image:ImageResource;
      
      private var _presenter:String;
      
      private var _text:String;
      
      private var _id:int;
      
      public function PresentItemCC(_arg_1:Number = 0, _arg_2:ImageResource = null, _arg_3:String = null, _arg_4:String = null, _arg_5:int = 0)
      {
         super();
         this._date = _arg_1;
         this._image = _arg_2;
         this._presenter = _arg_3;
         this._text = _arg_4;
         this._id = _arg_5;
      }
      
      public function get date() : Number
      {
         return this._date;
      }
      
      public function set date(_arg_1:Number) : void
      {
         this._date = _arg_1;
      }
      
      public function get image() : ImageResource
      {
         return this._image;
      }
      
      public function set image(_arg_1:ImageResource) : void
      {
         this._image = _arg_1;
      }
      
      public function get presenter() : String
      {
         return this._presenter;
      }
      
      public function set presenter(_arg_1:String) : void
      {
         this._presenter = _arg_1;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function set text(_arg_1:String) : void
      {
         this._text = _arg_1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set id(_arg_1:int) : void
      {
         this._id = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "PresentItemCC [";
         _local_1 += "date = " + this.date + " ";
         _local_1 += "image = " + this.image + " ";
         _local_1 += "presenter = " + this.presenter + " ";
         _local_1 += "text = " + this.text + " ";
         _local_1 += "id = " + this.id + " ";
         return _local_1 + "]";
      }
   }
}

