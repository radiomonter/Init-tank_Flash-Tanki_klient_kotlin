package projects.tanks.client.garage.models.item.kit
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class Tam
   {
      
      private var _giftItems:Vector.<KitGiftItem>;
      
      private var powyfune:int;
      
      private var _image:ImageResource;
      
      private var sudetadiv:Vector.<KitItem>;
      
      public function Tam(_arg_1:int = 0, _arg_2:ImageResource = null, _arg_3:Vector.<KitItem> = null, _arg_4:Vector.<KitGiftItem> = null)
      {
         super();
         this._giftItems = _arg_4;
         this.powyfune = _arg_1;
         this._image = _arg_2;
         this.sudetadiv = _arg_3;
      }
      
      public function get giftItems() : Vector.<KitGiftItem>
      {
         return this._giftItems;
      }
      
      public function set giftItems(_arg_1:Vector.<KitGiftItem>) : void
      {
         this._giftItems = _arg_1;
      }
      
      public function get discountInPercent() : int
      {
         return this.powyfune;
      }
      
      public function set discountInPercent(_arg_1:int) : void
      {
         this.powyfune = _arg_1;
      }
      
      public function get image() : ImageResource
      {
         return this._image;
      }
      
      public function set image(_arg_1:ImageResource) : void
      {
         this._image = _arg_1;
      }
      
      public function get kitItems() : Vector.<KitItem>
      {
         return this.sudetadiv;
      }
      
      public function set kitItems(_arg_1:Vector.<KitItem>) : void
      {
         this.sudetadiv = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "GarageKitCC [";
         _local_1 += "discountInPercent = " + this.discountInPercent + " ";
         _local_1 += "image = " + this.image + " ";
         _local_1 += "kitItems = " + this.kitItems + " ";
         return _local_1 + "]";
      }
   }
}

