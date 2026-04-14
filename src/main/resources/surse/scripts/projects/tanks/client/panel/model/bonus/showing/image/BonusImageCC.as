package projects.tanks.client.panel.model.bonus.showing.image
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class BonusImageCC
   {
      
      private var _image:ImageResource;
      
      public function BonusImageCC(_arg_1:ImageResource = null)
      {
         super();
         this._image = _arg_1;
      }
      
      public function get image() : ImageResource
      {
         return this._image;
      }
      
      public function set image(_arg_1:ImageResource) : void
      {
         this._image = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BonusImageCC [";
         _local_1 += "image = " + this.image + " ";
         return _local_1 + "]";
      }
   }
}

