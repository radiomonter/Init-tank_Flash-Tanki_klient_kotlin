package projects.tanks.client.battlefield.models.battle.jgr.killstreak
{
   public class KillStreakCC
   {
      
      private var _items:Vector.<KillStreakItem>;
      
      public function KillStreakCC(_arg_1:Vector.<KillStreakItem> = null)
      {
         super();
         this._items = _arg_1;
      }
      
      public function get items() : Vector.<KillStreakItem>
      {
         return this._items;
      }
      
      public function set items(_arg_1:Vector.<KillStreakItem>) : void
      {
         this._items = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "KillStreakCC [";
         _local_1 += "items = " + this.items + " ";
         return _local_1 + "]";
      }
   }
}

