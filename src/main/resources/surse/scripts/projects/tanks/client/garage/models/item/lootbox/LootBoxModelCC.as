package projects.tanks.client.garage.models.item.lootbox
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class LootBoxModelCC
   {
      
      private var _backgroundImage:ImageResource;
      
      private var _fiveBoxImage:ImageResource;
      
      private var _fiveBoxOpenedImage:ImageResource;
      
      private var _lootBackgroundImage:ImageResource;
      
      private var _oneBoxImage:ImageResource;
      
      private var _oneBoxOpenedImage:ImageResource;
      
      private var _raysImage:ImageResource;
      
      private var _threeBoxImage:ImageResource;
      
      private var _threeBoxOpenedImage:ImageResource;
      
      public function LootBoxModelCC(_arg_1:ImageResource = null, _arg_2:ImageResource = null, _arg_3:ImageResource = null, _arg_4:ImageResource = null, _arg_5:ImageResource = null, _arg_6:ImageResource = null, _arg_7:ImageResource = null, _arg_8:ImageResource = null, _arg_9:ImageResource = null)
      {
         super();
         this._backgroundImage = _arg_1;
         this._fiveBoxImage = _arg_2;
         this._fiveBoxOpenedImage = _arg_3;
         this._lootBackgroundImage = _arg_4;
         this._oneBoxImage = _arg_5;
         this._oneBoxOpenedImage = _arg_6;
         this._raysImage = _arg_7;
         this._threeBoxImage = _arg_8;
         this._threeBoxOpenedImage = _arg_9;
      }
      
      public function get backgroundImage() : ImageResource
      {
         return this._backgroundImage;
      }
      
      public function set backgroundImage(_arg_1:ImageResource) : void
      {
         this._backgroundImage = _arg_1;
      }
      
      public function get fiveBoxImage() : ImageResource
      {
         return this._fiveBoxImage;
      }
      
      public function set fiveBoxImage(_arg_1:ImageResource) : void
      {
         this._fiveBoxImage = _arg_1;
      }
      
      public function get fiveBoxOpenedImage() : ImageResource
      {
         return this._fiveBoxOpenedImage;
      }
      
      public function set fiveBoxOpenedImage(_arg_1:ImageResource) : void
      {
         this._fiveBoxOpenedImage = _arg_1;
      }
      
      public function get lootBackgroundImage() : ImageResource
      {
         return this._lootBackgroundImage;
      }
      
      public function set lootBackgroundImage(_arg_1:ImageResource) : void
      {
         this._lootBackgroundImage = _arg_1;
      }
      
      public function get oneBoxImage() : ImageResource
      {
         return this._oneBoxImage;
      }
      
      public function set oneBoxImage(_arg_1:ImageResource) : void
      {
         this._oneBoxImage = _arg_1;
      }
      
      public function get oneBoxOpenedImage() : ImageResource
      {
         return this._oneBoxOpenedImage;
      }
      
      public function set oneBoxOpenedImage(_arg_1:ImageResource) : void
      {
         this._oneBoxOpenedImage = _arg_1;
      }
      
      public function get raysImage() : ImageResource
      {
         return this._raysImage;
      }
      
      public function set raysImage(_arg_1:ImageResource) : void
      {
         this._raysImage = _arg_1;
      }
      
      public function get threeBoxImage() : ImageResource
      {
         return this._threeBoxImage;
      }
      
      public function set threeBoxImage(_arg_1:ImageResource) : void
      {
         this._threeBoxImage = _arg_1;
      }
      
      public function get threeBoxOpenedImage() : ImageResource
      {
         return this._threeBoxOpenedImage;
      }
      
      public function set threeBoxOpenedImage(_arg_1:ImageResource) : void
      {
         this._threeBoxOpenedImage = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "LootBoxModelCC [";
         _local_1 += "backgroundImage = " + this.backgroundImage + " ";
         _local_1 += "fiveBoxImage = " + this.fiveBoxImage + " ";
         _local_1 += "fiveBoxOpenedImage = " + this.fiveBoxOpenedImage + " ";
         _local_1 += "lootBackgroundImage = " + this.lootBackgroundImage + " ";
         _local_1 += "oneBoxImage = " + this.oneBoxImage + " ";
         _local_1 += "oneBoxOpenedImage = " + this.oneBoxOpenedImage + " ";
         _local_1 += "raysImage = " + this.raysImage + " ";
         _local_1 += "threeBoxImage = " + this.threeBoxImage + " ";
         _local_1 += "threeBoxOpenedImage = " + this.threeBoxOpenedImage + " ";
         return _local_1 + "]";
      }
   }
}

