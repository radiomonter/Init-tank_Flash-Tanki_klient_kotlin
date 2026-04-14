package projects.tanks.client.clans.clan.permissions
{
   public class ClanPermissionsCC
   {
      
      private var _actions:Vector.<ClanAction>;
      
      public function ClanPermissionsCC(_arg_1:Vector.<ClanAction> = null)
      {
         super();
         this._actions = _arg_1;
      }
      
      public function get actions() : Vector.<ClanAction>
      {
         return this._actions;
      }
      
      public function set actions(_arg_1:Vector.<ClanAction>) : void
      {
         this._actions = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "ClanPermissionsCC [";
         _local_1 += "actions = " + this.actions + " ";
         return _local_1 + "]";
      }
   }
}

