package projects.tanks.client.panel.model.dailyquest
{
   public class Nokomojob
   {
      
      private var _count:int;
      
      private var _name:String;
      
      public function Nokomojob(_arg_1:int = 0, _arg_2:String = null)
      {
         super();
         this._count = _arg_1;
         this._name = _arg_2;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set count(_arg_1:int) : void
      {
         this._count = _arg_1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(_arg_1:String) : void
      {
         this._name = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "DailyQuestPrizeInfo [";
         _local_1 += "count = " + this.count + " ";
         _local_1 += "name = " + this.name + " ";
         return _local_1 + "]";
      }
   }
}

