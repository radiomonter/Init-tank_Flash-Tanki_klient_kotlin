package projects.tanks.client.clans.space.createclan
{
   public class ClanCreateCC
   {
      
      private var _minRankForCreateClan:int;
      
      public function ClanCreateCC(_arg_1:int = 0)
      {
         super();
         this._minRankForCreateClan = _arg_1;
      }
      
      public function get minRankForCreateClan() : int
      {
         return this._minRankForCreateClan;
      }
      
      public function set minRankForCreateClan(_arg_1:int) : void
      {
         this._minRankForCreateClan = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "ClanCreateCC [";
         _local_1 += "minRankForCreateClan = " + this.minRankForCreateClan + " ";
         return _local_1 + "]";
      }
   }
}

