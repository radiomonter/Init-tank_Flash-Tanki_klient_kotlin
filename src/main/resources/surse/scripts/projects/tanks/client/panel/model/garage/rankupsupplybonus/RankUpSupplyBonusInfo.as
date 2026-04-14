package projects.tanks.client.panel.model.garage.rankupsupplybonus
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class RankUpSupplyBonusInfo
   {
      
      private var _count:int;
      
      private var _preview:ImageResource;
      
      private var _text:String;
      
      public function RankUpSupplyBonusInfo(_arg_1:int = 0, _arg_2:ImageResource = null, _arg_3:String = null)
      {
         super();
         this._count = _arg_1;
         this._preview = _arg_2;
         this._text = _arg_3;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set count(_arg_1:int) : void
      {
         this._count = _arg_1;
      }
      
      public function get preview() : ImageResource
      {
         return this._preview;
      }
      
      public function set preview(_arg_1:ImageResource) : void
      {
         this._preview = _arg_1;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function set text(_arg_1:String) : void
      {
         this._text = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "RankUpSupplyBonusInfo [";
         _local_1 += "count = " + this.count + " ";
         _local_1 += "preview = " + this.preview + " ";
         _local_1 += "text = " + this.text + " ";
         return _local_1 + "]";
      }
   }
}

