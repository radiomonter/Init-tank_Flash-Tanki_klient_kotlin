package projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties
{
   public class UserProperties
   {
      
      private var _userId:String;
      
      private var _userName:String;
      
      private var _score:int;
      
      private var _rank:int;
      
      public function UserProperties(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:int)
      {
         super();
         this._userId = _arg_1;
         this._userName = _arg_2;
         this._score = _arg_3;
         this._rank = _arg_4;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function set userId(_arg_1:String) : void
      {
         this._userId = _arg_1;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function set userName(_arg_1:String) : void
      {
         this._userName = _arg_1;
      }
      
      public function get score() : int
      {
         return this._score;
      }
      
      public function set score(_arg_1:int) : void
      {
         this._score = _arg_1;
      }
      
      public function get rank() : int
      {
         return this._rank;
      }
      
      public function set rank(_arg_1:int) : void
      {
         this._rank = _arg_1;
      }
   }
}

