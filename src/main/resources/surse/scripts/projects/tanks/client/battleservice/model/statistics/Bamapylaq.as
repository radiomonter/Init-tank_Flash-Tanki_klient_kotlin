package projects.tanks.client.battleservice.model.statistics
{
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   
   public class Bamapylaq extends Suc
   {
      
      private var _chatModeratorLevel:ChatModeratorLevel;
      
      private var _rank:int;
      
      private var _uid:String;
      
      public function Bamapylaq(_arg_1:ChatModeratorLevel = null, _arg_2:int = 0, _arg_3:String = null)
      {
         super();
         this._chatModeratorLevel = _arg_1;
         this._rank = _arg_2;
         this._uid = _arg_3;
      }
      
      public function get chatModeratorLevel() : ChatModeratorLevel
      {
         return this._chatModeratorLevel;
      }
      
      public function set chatModeratorLevel(_arg_1:ChatModeratorLevel) : void
      {
         this._chatModeratorLevel = _arg_1;
      }
      
      public function get rank() : int
      {
         return this._rank;
      }
      
      public function set rank(_arg_1:int) : void
      {
         this._rank = _arg_1;
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function set uid(_arg_1:String) : void
      {
         this._uid = _arg_1;
      }
      
      override public function toString() : String
      {
         var _local_1:* = "UserInfo [";
         _local_1 += "chatModeratorLevel = " + this.chatModeratorLevel + " ";
         _local_1 += "rank = " + this.rank + " ";
         _local_1 += "uid = " + this.uid + " ";
         _local_1 += super.toString();
         return _local_1 + "]";
      }
   }
}

