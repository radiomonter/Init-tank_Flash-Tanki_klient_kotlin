package projects.tanks.client.garage.models.item.item
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class ItemModelCC
   {
      
      private var _maxRank:int;
      
      private var _minRank:int;
      
      private var _position:int;
      
      private var _preview:ImageResource;
      
      public function ItemModelCC(_arg_1:int = 0, _arg_2:int = 0, _arg_3:int = 0, _arg_4:ImageResource = null)
      {
         super();
         this._maxRank = _arg_1;
         this._minRank = _arg_2;
         this._position = _arg_3;
         this._preview = _arg_4;
      }
      
      public function get maxRank() : int
      {
         return this._maxRank;
      }
      
      public function set maxRank(_arg_1:int) : void
      {
         this._maxRank = _arg_1;
      }
      
      public function get minRank() : int
      {
         return this._minRank;
      }
      
      public function set minRank(_arg_1:int) : void
      {
         this._minRank = _arg_1;
      }
      
      public function get position() : int
      {
         return this._position;
      }
      
      public function set position(_arg_1:int) : void
      {
         this._position = _arg_1;
      }
      
      public function get preview() : ImageResource
      {
         return this._preview;
      }
      
      public function set preview(_arg_1:ImageResource) : void
      {
         this._preview = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ItemModelCC [";
         _local_1 += "maxRank = " + this.maxRank + " ";
         _local_1 += "minRank = " + this.minRank + " ";
         _local_1 += "position = " + this.position + " ";
         _local_1 += "preview = " + this.preview + " ";
         return _local_1 + "]";
      }
   }
}

