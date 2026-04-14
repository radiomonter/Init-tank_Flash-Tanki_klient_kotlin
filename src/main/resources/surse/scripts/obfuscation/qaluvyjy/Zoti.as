package obfuscation.qaluvyjy
{
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class Zoti
   {
      
      private var _users:Vector.<BattleInfoUser>;
      
      public function Zoti(_arg_1:Vector.<BattleInfoUser> = null)
      {
         super();
         this._users = _arg_1;
      }
      
      public function get users() : Vector.<BattleInfoUser>
      {
         return this._users;
      }
      
      public function set users(_arg_1:Vector.<BattleInfoUser>) : void
      {
         this._users = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BattleDMInfoCC [";
         _local_1 += "users = " + this.users + " ";
         return _local_1 + "]";
      }
   }
}

