package projects.tanks.client.panel.model.bonus.showing.info
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class BonusInfoCC
   {
      
      private var _bottomText:String;
      
      private var _image:ImageResource;
      
      private var _topText:String;
      
      public function BonusInfoCC(_arg_1:String = null, _arg_2:ImageResource = null, _arg_3:String = null)
      {
         super();
         this._bottomText = _arg_1;
         this._image = _arg_2;
         this._topText = _arg_3;
      }
      
      public function get bottomText() : String
      {
         return this._bottomText;
      }
      
      public function set bottomText(_arg_1:String) : void
      {
         this._bottomText = _arg_1;
      }
      
      public function get image() : ImageResource
      {
         return this._image;
      }
      
      public function set image(_arg_1:ImageResource) : void
      {
         this._image = _arg_1;
      }
      
      public function get topText() : String
      {
         return this._topText;
      }
      
      public function set topText(_arg_1:String) : void
      {
         this._topText = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BonusInfoCC [";
         _local_1 += "bottomText = " + this.bottomText + " ";
         _local_1 += "image = " + this.image + " ";
         _local_1 += "topText = " + this.topText + " ";
         return _local_1 + "]";
      }
   }
}

