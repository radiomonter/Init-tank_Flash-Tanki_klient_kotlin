package projects.tanks.client.clans.clan.clanmembersdata
{
   public class ClanMembersCC
   {
      
      private var _users:Vector.<UserData>;
      
      public function ClanMembersCC(_arg_1:Vector.<UserData> = null)
      {
         super();
         this._users = _arg_1;
      }
      
      public function get users() : Vector.<UserData>
      {
         return this._users;
      }
      
      public function set users(_arg_1:Vector.<UserData>) : void
      {
         this._users = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "ClanMembersCC [";
         _local_1 += "users = " + this.users + " ";
         return _local_1 + "]";
      }
   }
}

