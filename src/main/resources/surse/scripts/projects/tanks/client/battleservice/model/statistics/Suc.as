package projects.tanks.client.battleservice.model.statistics
{
   public class Suc
   {
      
      private var cuqo:int;
      
      private var _kills:int;
      
      private var _score:int;
      
      private var _user:String;
      
      public function Suc(_arg_1:int = 0, _arg_2:int = 0, _arg_3:int = 0, _arg_4:String = null)
      {
         super();
         this.cuqo = _arg_1;
         this._kills = _arg_2;
         this._score = _arg_3;
         this._user = _arg_4;
      }
      
      public function get deaths() : int
      {
         return this.cuqo;
      }
      
      public function set deaths(_arg_1:int) : void
      {
         this.cuqo = _arg_1;
      }
      
      public function get kills() : int
      {
         return this._kills;
      }
      
      public function set kills(_arg_1:int) : void
      {
         this._kills = _arg_1;
      }
      
      public function get score() : int
      {
         return this._score;
      }
      
      public function set score(_arg_1:int) : void
      {
         this._score = _arg_1;
      }
      
      public function get user() : String
      {
         return this._user;
      }
      
      public function set user(_arg_1:String) : void
      {
         this._user = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "UserStat [";
         _local_1 += "deaths = " + this.deaths + " ";
         _local_1 += "kills = " + this.kills + " ";
         _local_1 += "score = " + this.score + " ";
         _local_1 += "user = " + this.user + " ";
         return _local_1 + "]";
      }
   }
}

