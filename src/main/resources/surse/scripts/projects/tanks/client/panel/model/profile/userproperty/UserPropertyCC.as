package projects.tanks.client.panel.model.profile.userproperty
{
   public class UserPropertyCC
   {
      
      private var _crystals:int;
      
      private var _currentRankScore:int;
      
      private var _daysFromLastVisit:int;
      
      private var _daysFromRegistration:int;
      
      private var _durationCrystalAbonement:int;
      
      private var _gameHost:String;
      
      private var _hasDoubleCrystal:Boolean;
      
      private var _id:String;
      
      private var _nextRankScore:int;
      
      private var _place:int;
      
      private var _rank:int;
      
      private var _rating:Number;
      
      private var _score:int;
      
      private var _serverNumber:int;
      
      private var _templateBattlePage:String;
      
      private var _uid:String;
      
      private var _userProfileUrl:String;
      
      private var _clantag:String;
      
      public function UserPropertyCC(_arg_1:int = 0, _arg_2:int = 0, _arg_3:int = 0, _arg_4:int = 0, _arg_5:int = 0, _arg_6:String = null, _arg_7:Boolean = false, _arg_8:String = null, _arg_9:int = 0, _arg_10:int = 0, _arg_11:int = 0, _arg_12:Number = 0, _arg_13:int = 0, _arg_14:int = 0, _arg_15:String = null, _arg_16:String = null, _arg_17:String = null, _arg_18:String = null)
      {
         super();
         this._crystals = _arg_1;
         this._currentRankScore = _arg_2;
         this._daysFromLastVisit = _arg_3;
         this._daysFromRegistration = _arg_4;
         this._durationCrystalAbonement = _arg_5;
         this._gameHost = _arg_6;
         this._hasDoubleCrystal = _arg_7;
         this._id = _arg_8;
         this._nextRankScore = _arg_9;
         this._place = _arg_10;
         this._rank = _arg_11;
         this._rating = _arg_12;
         this._score = _arg_13;
         this._serverNumber = _arg_14;
         this._templateBattlePage = _arg_15;
         this._uid = _arg_16;
         this._userProfileUrl = _arg_17;
         this._clantag = _arg_18;
      }
      
      public function get crystals() : int
      {
         return this._crystals;
      }
      
      public function set crystals(_arg_1:int) : void
      {
         this._crystals = _arg_1;
      }
      
      public function get currentRankScore() : int
      {
         return this._currentRankScore;
      }
      
      public function set currentRankScore(_arg_1:int) : void
      {
         this._currentRankScore = _arg_1;
      }
      
      public function get daysFromLastVisit() : int
      {
         return this._daysFromLastVisit;
      }
      
      public function set daysFromLastVisit(_arg_1:int) : void
      {
         this._daysFromLastVisit = _arg_1;
      }
      
      public function get daysFromRegistration() : int
      {
         return this._daysFromRegistration;
      }
      
      public function set daysFromRegistration(_arg_1:int) : void
      {
         this._daysFromRegistration = _arg_1;
      }
      
      public function get durationCrystalAbonement() : int
      {
         return this._durationCrystalAbonement;
      }
      
      public function set durationCrystalAbonement(_arg_1:int) : void
      {
         this._durationCrystalAbonement = _arg_1;
      }
      
      public function get gameHost() : String
      {
         return this._gameHost;
      }
      
      public function set gameHost(_arg_1:String) : void
      {
         this._gameHost = _arg_1;
      }
      
      public function get hasDoubleCrystal() : Boolean
      {
         return this._hasDoubleCrystal;
      }
      
      public function set hasDoubleCrystal(_arg_1:Boolean) : void
      {
         this._hasDoubleCrystal = _arg_1;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(_arg_1:String) : void
      {
         this._id = _arg_1;
      }
      
      public function get nextRankScore() : int
      {
         return this._nextRankScore;
      }
      
      public function set nextRankScore(_arg_1:int) : void
      {
         this._nextRankScore = _arg_1;
      }
      
      public function get place() : int
      {
         return this._place;
      }
      
      public function set place(_arg_1:int) : void
      {
         this._place = _arg_1;
      }
      
      public function get rank() : int
      {
         return this._rank;
      }
      
      public function set rank(_arg_1:int) : void
      {
         this._rank = _arg_1;
      }
      
      public function get rating() : Number
      {
         return this._rating;
      }
      
      public function set rating(_arg_1:Number) : void
      {
         this._rating = _arg_1;
      }
      
      public function get score() : int
      {
         return this._score;
      }
      
      public function set score(_arg_1:int) : void
      {
         this._score = _arg_1;
      }
      
      public function get serverNumber() : int
      {
         return this._serverNumber;
      }
      
      public function set serverNumber(_arg_1:int) : void
      {
         this._serverNumber = _arg_1;
      }
      
      public function get templateBattlePage() : String
      {
         return this._templateBattlePage;
      }
      
      public function set templateBattlePage(_arg_1:String) : void
      {
         this._templateBattlePage = _arg_1;
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function set uid(_arg_1:String) : void
      {
         this._uid = _arg_1;
      }
      
      public function get userProfileUrl() : String
      {
         return this._userProfileUrl;
      }
      
      public function set userProfileUrl(_arg_1:String) : void
      {
         this._userProfileUrl = _arg_1;
      }
      
      public function get clantag() : String
      {
         return this._clantag;
      }
      
      public function set clantag(_arg_1:String) : void
      {
         this._clantag = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "UserPropertyCC [";
         _local_1 += "crystals = " + this.crystals + " ";
         _local_1 += "currentRankScore = " + this.currentRankScore + " ";
         _local_1 += "daysFromLastVisit = " + this.daysFromLastVisit + " ";
         _local_1 += "daysFromRegistration = " + this.daysFromRegistration + " ";
         _local_1 += "durationCrystalAbonement = " + this.durationCrystalAbonement + " ";
         _local_1 += "gameHost = " + this.gameHost + " ";
         _local_1 += "hasDoubleCrystal = " + this.hasDoubleCrystal + " ";
         _local_1 += "id = " + this.id + " ";
         _local_1 += "nextRankScore = " + this.nextRankScore + " ";
         _local_1 += "place = " + this.place + " ";
         _local_1 += "rank = " + this.rank + " ";
         _local_1 += "rating = " + this.rating + " ";
         _local_1 += "score = " + this.score + " ";
         _local_1 += "serverNumber = " + this.serverNumber + " ";
         _local_1 += "templateBattlePage = " + this.templateBattlePage + " ";
         _local_1 += "uid = " + this.uid + " ";
         _local_1 += "userProfileUrl = " + this.userProfileUrl + " ";
         _local_1 += "clantag = " + this._clantag + " ";
         return _local_1 + "]";
      }
   }
}

