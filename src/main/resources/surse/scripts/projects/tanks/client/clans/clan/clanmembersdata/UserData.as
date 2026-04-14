package projects.tanks.client.clans.clan.clanmembersdata
{
   import alternativa.types.Long;
   import projects.tanks.client.clans.clan.permissions.ClanPermission;
   
   public class UserData
   {
      
      private var _dateInClanInSec:int;
      
      private var _deaths:int;
      
      private var _kills:int;
      
      private var _lastVisitTime:Long;
      
      private var _permission:ClanPermission;
      
      private var _score:int;
      
      private var _userId:String;
      
      public function UserData(_arg_1:int = 0, _arg_2:int = 0, _arg_3:int = 0, _arg_4:Long = null, _arg_5:ClanPermission = null, _arg_6:int = 0, _arg_7:String = null)
      {
         super();
         this._dateInClanInSec = _arg_1;
         this._deaths = _arg_2;
         this._kills = _arg_3;
         this._lastVisitTime = _arg_4;
         this._permission = _arg_5;
         this._score = _arg_6;
         this._userId = _arg_7;
      }
      
      public function get dateInClanInSec() : int
      {
         return this._dateInClanInSec;
      }
      
      public function set dateInClanInSec(_arg_1:int) : void
      {
         this._dateInClanInSec = _arg_1;
      }
      
      public function get deaths() : int
      {
         return this._deaths;
      }
      
      public function set deaths(_arg_1:int) : void
      {
         this._deaths = _arg_1;
      }
      
      public function get kills() : int
      {
         return this._kills;
      }
      
      public function set kills(_arg_1:int) : void
      {
         this._kills = _arg_1;
      }
      
      public function get lastVisitTime() : Long
      {
         return this._lastVisitTime;
      }
      
      public function set lastVisitTime(_arg_1:Long) : void
      {
         this._lastVisitTime = _arg_1;
      }
      
      public function get permission() : ClanPermission
      {
         return this._permission;
      }
      
      public function set permission(_arg_1:ClanPermission) : void
      {
         this._permission = _arg_1;
      }
      
      public function get score() : int
      {
         return this._score;
      }
      
      public function set score(_arg_1:int) : void
      {
         this._score = _arg_1;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function set userId(_arg_1:String) : void
      {
         this._userId = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "UserData [";
         _local_1 += "dateInClanInSec = " + this.dateInClanInSec + " ";
         _local_1 += "deaths = " + this.deaths + " ";
         _local_1 += "kills = " + this.kills + " ";
         _local_1 += "lastVisitTime = " + this.lastVisitTime + " ";
         _local_1 += "permission = " + this.permission + " ";
         _local_1 += "score = " + this.score + " ";
         _local_1 += "userId = " + this.userId + " ";
         return _local_1 + "]";
      }
   }
}

