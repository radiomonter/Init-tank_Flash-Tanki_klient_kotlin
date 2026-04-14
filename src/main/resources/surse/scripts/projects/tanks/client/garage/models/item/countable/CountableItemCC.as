package projects.tanks.client.garage.models.item.countable
{
   public class CountableItemCC
   {
      
      private var _count:int;
      
      public function CountableItemCC(_arg_1:int = 0)
      {
         super();
         this._count = _arg_1;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set count(_arg_1:int) : void
      {
         this._count = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "CountableItemCC [";
         _local_1 += "count = " + this.count + " ";
         return _local_1 + "]";
      }
   }
}

