package obfuscation.lelomifom
{
   import projects.tanks.client.battleservice.model.statistics.Bamapylaq;
   
   public class Mikiqejav
   {
      
      private var kota:int;
      
      private var qoryji:int;
      
      private var _usersInfoBlue:Vector.<Bamapylaq>;
      
      private var _usersInfoRed:Vector.<Bamapylaq>;
      
      public function Mikiqejav(_arg_1:int = 0, _arg_2:int = 0, _arg_3:Vector.<Bamapylaq> = null, _arg_4:Vector.<Bamapylaq> = null)
      {
         super();
         this.kota = _arg_1;
         this.qoryji = _arg_2;
         this._usersInfoBlue = _arg_3;
         this._usersInfoRed = _arg_4;
      }
      
      public function get blueScore() : int
      {
         return this.kota;
      }
      
      public function set blueScore(_arg_1:int) : void
      {
         this.kota = _arg_1;
      }
      
      public function get redScore() : int
      {
         return this.qoryji;
      }
      
      public function set redScore(_arg_1:int) : void
      {
         this.qoryji = _arg_1;
      }
      
      public function get qirycuf() : Vector.<Bamapylaq>
      {
         return this._usersInfoBlue;
      }
      
      public function set qirycuf(_arg_1:Vector.<Bamapylaq>) : void
      {
         this._usersInfoBlue = _arg_1;
      }
      
      public function get jikudof() : Vector.<Bamapylaq>
      {
         return this._usersInfoRed;
      }
      
      public function set jikudof(_arg_1:Vector.<Bamapylaq>) : void
      {
         this._usersInfoRed = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "StatisticsTeamCC [";
         _local_1 += "blueScore = " + this.blueScore + " ";
         _local_1 += "redScore = " + this.redScore + " ";
         _local_1 += "usersInfoBlue = " + this.qirycuf + " ";
         _local_1 += "usersInfoRed = " + this.jikudof + " ";
         return _local_1 + "]";
      }
   }
}

