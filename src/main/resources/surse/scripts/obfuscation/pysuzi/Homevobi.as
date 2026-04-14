package obfuscation.pysuzi
{
   public class Homevobi
   {
      
      private var _users:Vector.<String>;
      
      public function Homevobi(_arg_1:Vector.<String> = null)
      {
         super();
         this._users = _arg_1;
      }
      
      public function get users() : Vector.<String>
      {
         return this._users;
      }
      
      public function set users(_arg_1:Vector.<String>) : void
      {
         this._users = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BattleDMItemCC [";
         _local_1 += "users = " + this.users + " ";
         return _local_1 + "]";
      }
   }
}

