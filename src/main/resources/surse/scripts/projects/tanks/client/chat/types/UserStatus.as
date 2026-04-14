package projects.tanks.client.chat.types
{
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   
   public class UserStatus
   {
      
      private var _chatModeratorLevel:ChatModeratorLevel;
      
      private var _ip:String;
      
      private var _rankIndex:int;
      
      private var _uid:String;
      
      private var _userId:String;
      
      private var _premium:Boolean;
      
      public function UserStatus(_arg_1:ChatModeratorLevel = null, _arg_2:String = null, _arg_3:int = 0, _arg_4:String = null, _arg_5:String = null, _arg_6:Boolean = false)
      {
         super();
         this._chatModeratorLevel = _arg_1;
         this._ip = _arg_2;
         this._rankIndex = _arg_3;
         this._uid = _arg_4;
         this._userId = _arg_5;
         this._premium = _arg_6;
      }
      
      public function get chatModeratorLevel() : ChatModeratorLevel
      {
         return this._chatModeratorLevel;
      }
      
      public function set chatModeratorLevel(_arg_1:ChatModeratorLevel) : void
      {
         this._chatModeratorLevel = _arg_1;
      }
      
      public function get ip() : String
      {
         return this._ip;
      }
      
      public function set ip(_arg_1:String) : void
      {
         this._ip = _arg_1;
      }
      
      public function get rankIndex() : int
      {
         return this._rankIndex;
      }
      
      public function set rankIndex(_arg_1:int) : void
      {
         this._rankIndex = _arg_1;
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function set uid(_arg_1:String) : void
      {
         this._uid = _arg_1;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function set userId(_arg_1:String) : void
      {
         this._userId = _arg_1;
      }
      
      public function get premium() : Boolean
      {
         return this._premium;
      }
      
      public function set premium(_arg_1:Boolean) : void
      {
         this._premium = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "UserStatus [";
         _local_1 += "chatModeratorLevel = " + this.chatModeratorLevel + " ";
         _local_1 += "ip = " + this.ip + " ";
         _local_1 += "rankIndex = " + this.rankIndex + " ";
         _local_1 += "uid = " + this.uid + " ";
         _local_1 += "userId = " + this.userId + " ";
         return _local_1 + "]";
      }
   }
}

