package obfuscation.joni
{
   import obfuscation.bude.BattleTeam;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   
   public class Momo
   {
      
      private var _userId:String;
      
      private var _uid:String;
      
      private var _rank:int;
      
      private var _loaded:Boolean;
      
      private var _suspicious:Boolean;
      
      private var baneh:BattleTeam;
      
      private var _chatModeratorLevel:ChatModeratorLevel;
      
      public function Momo(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:Boolean, _arg_5:Boolean, _arg_6:BattleTeam, _arg_7:ChatModeratorLevel)
      {
         super();
         this._userId = _arg_1;
         this._uid = _arg_2;
         this._rank = _arg_3;
         this._loaded = _arg_4;
         this._suspicious = _arg_5;
         this.baneh = _arg_6;
         this._chatModeratorLevel = _arg_7;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function set userId(_arg_1:String) : void
      {
         this._userId = _arg_1;
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function set uid(_arg_1:String) : void
      {
         this._uid = _arg_1;
      }
      
      public function get rank() : int
      {
         return this._rank;
      }
      
      public function set rank(_arg_1:int) : void
      {
         this._rank = _arg_1;
      }
      
      public function get loaded() : Boolean
      {
         return this._loaded;
      }
      
      public function set loaded(_arg_1:Boolean) : void
      {
         this._loaded = _arg_1;
      }
      
      public function get suspicious() : Boolean
      {
         return this._suspicious;
      }
      
      public function set suspicious(_arg_1:Boolean) : void
      {
         this._suspicious = _arg_1;
      }
      
      public function get teamType() : BattleTeam
      {
         return this.baneh;
      }
      
      public function set teamType(_arg_1:BattleTeam) : void
      {
         this.baneh = _arg_1;
      }
      
      public function get chatModeratorLevel() : ChatModeratorLevel
      {
         return this._chatModeratorLevel;
      }
      
      public function set chatModeratorLevel(_arg_1:ChatModeratorLevel) : void
      {
         this._chatModeratorLevel = _arg_1;
      }
      
      public function getShortUserInfo() : ShortUserInfo
      {
         var _local_1:ShortUserInfo = new ShortUserInfo();
         _local_1.userId = this._userId;
         _local_1.uid = this._uid;
         _local_1.rank = this._rank;
         _local_1.suspicious = this._suspicious;
         _local_1.teamType = this.baneh;
         _local_1.chatModeratorLevel = this._chatModeratorLevel;
         return _local_1;
      }
   }
}

