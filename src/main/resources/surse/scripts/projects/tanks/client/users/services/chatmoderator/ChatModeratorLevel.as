package projects.tanks.client.users.services.chatmoderator
{
   public class ChatModeratorLevel
   {
      
      public static const NONE:ChatModeratorLevel = new ChatModeratorLevel(0,"NONE");
      
      public static const COMMUNITY_MANAGER:ChatModeratorLevel = new ChatModeratorLevel(1,"COMMUNITY_MANAGER");
      
      public static const ADMINISTRATOR:ChatModeratorLevel = new ChatModeratorLevel(2,"ADMINISTRATOR");
      
      public static const MODERATOR:ChatModeratorLevel = new ChatModeratorLevel(3,"MODERATOR");
      
      public static const CANDIDATE:ChatModeratorLevel = new ChatModeratorLevel(4,"CANDIDATE");
      
      private var _value:int;
      
      private var _name:String;
      
      public function ChatModeratorLevel(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<ChatModeratorLevel>
      {
         var _local_1:Vector.<ChatModeratorLevel> = new Vector.<ChatModeratorLevel>();
         _local_1.push(NONE);
         _local_1.push(COMMUNITY_MANAGER);
         _local_1.push(ADMINISTRATOR);
         _local_1.push(MODERATOR);
         _local_1.push(CANDIDATE);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "ChatModeratorLevel [" + this._name + "]";
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function get name() : String
      {
         return this._name;
      }
   }
}

