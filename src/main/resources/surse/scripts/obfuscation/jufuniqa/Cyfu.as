package obfuscation.jufuniqa
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class Cyfu
   {
      
      private var _count:int;
      
      private var bibysele:ImageResource;
      
      public function Cyfu(_arg_1:int = 0, _arg_2:ImageResource = null)
      {
         super();
         this._count = _arg_1;
         this.bibysele = _arg_2;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set count(_arg_1:int) : void
      {
         this._count = _arg_1;
      }
      
      public function get itemImage() : ImageResource
      {
         return this.bibysele;
      }
      
      public function set itemImage(_arg_1:ImageResource) : void
      {
         this.bibysele = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "WeeklyQuestRewardItem [";
         _local_1 += "count = " + this.count + " ";
         _local_1 += "itemImage = " + this.itemImage + " ";
         return _local_1 + "]";
      }
   }
}

