package projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties
{
   import flash.events.EventDispatcher;
   
   public class UserPropertiesService extends EventDispatcher implements IUserPropertiesService
   {
      
      private var _userId:String;
      
      private var _userName:String;
      
      private var _score:int;
      
      private var _rank:int;
      
      private var _userProfileUrl:String;
      
      private var _serverNumber:int;
      
      private var _templateBattlePage:String;
      
      private var _gameHost:String;
      
      public function UserPropertiesService()
      {
         super();
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get rank() : int
      {
         return this._rank;
      }
      
      public function get score() : int
      {
         return this._score;
      }
      
      public function getUserProfileUrl(_arg_1:String) : String
      {
         return this._userProfileUrl + _arg_1;
      }
      
      public function get serverNumber() : int
      {
         return this._serverNumber;
      }
      
      public function get templateBattlePage() : String
      {
         return this._templateBattlePage;
      }
      
      public function get gameHost() : String
      {
         return this._gameHost;
      }
      
      public function updateRank(_arg_1:int) : void
      {
         this._rank = _arg_1;
         dispatchEvent(new UserPropertiesServiceEvent(UserPropertiesServiceEvent.UPDATE_RANK,new UserProperties(this._userId,this._userName,this._score,this._rank)));
      }
      
      public function updateScore(_arg_1:int) : void
      {
         this._score = _arg_1;
         dispatchEvent(new UserPropertiesServiceEvent(UserPropertiesServiceEvent.UPDATE_SCORE,new UserProperties(this._userId,this._userName,this._score,this._rank)));
      }
      
      public function init(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:String, _arg_7:String, _arg_8:String) : void
      {
         this._userId = _arg_1;
         this._userName = _arg_2;
         this._score = _arg_3;
         this._rank = _arg_4;
         this._serverNumber = _arg_5;
         this._templateBattlePage = _arg_6;
         this._gameHost = _arg_7;
         this._userProfileUrl = _arg_8;
      }
   }
}

