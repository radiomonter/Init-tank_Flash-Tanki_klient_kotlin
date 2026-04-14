package projects.tanks.client.clans.panel.loadingclan
{
   public class ClanLoadingPanelCC
   {
      
      private var _clanButtonVisible:Boolean;
      
      private var _minRankForCreateClan:int;
      
      public function ClanLoadingPanelCC(_arg_1:Boolean = false, _arg_2:int = 0)
      {
         super();
         this._clanButtonVisible = _arg_1;
         this._minRankForCreateClan = _arg_2;
      }
      
      public function get clanButtonVisible() : Boolean
      {
         return this._clanButtonVisible;
      }
      
      public function set clanButtonVisible(_arg_1:Boolean) : void
      {
         this._clanButtonVisible = _arg_1;
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
         var _local_1:String = "ClanLoadingPanelCC [";
         _local_1 += "clanButtonVisible = " + this.clanButtonVisible + " ";
         _local_1 += "minRankForCreateClan = " + this.minRankForCreateClan + " ";
         return _local_1 + "]";
      }
   }
}

