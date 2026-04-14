package projects.tanks.client.clans.clan.permissions
{
   public class ClanAction
   {
      
      public static const DELETE_CLAN:ClanAction = new ClanAction(0,"DELETE_CLAN");
      
      public static const PERMISSION_DISTRIBUTION:ClanAction = new ClanAction(1,"PERMISSION_DISTRIBUTION");
      
      public static const REMOVE_FROM_CLAN:ClanAction = new ClanAction(2,"REMOVE_FROM_CLAN");
      
      public static const ADDING_TO_CLAN:ClanAction = new ClanAction(3,"ADDING_TO_CLAN");
      
      public static const ACCESS_BLOCK:ClanAction = new ClanAction(4,"ACCESS_BLOCK");
      
      public static const BATTLE_GROUPS:ClanAction = new ClanAction(5,"BATTLE_GROUPS");
      
      public static const INVITE_TO_CLAN:ClanAction = new ClanAction(6,"INVITE_TO_CLAN");
      
      public static const EDIT_PROFILE:ClanAction = new ClanAction(7,"EDIT_PROFILE");
      
      private var _value:int;
      
      private var _name:String;
      
      public function ClanAction(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<ClanAction>
      {
         var _local_1:Vector.<ClanAction> = new Vector.<ClanAction>();
         _local_1.push(DELETE_CLAN);
         _local_1.push(PERMISSION_DISTRIBUTION);
         _local_1.push(REMOVE_FROM_CLAN);
         _local_1.push(ADDING_TO_CLAN);
         _local_1.push(ACCESS_BLOCK);
         _local_1.push(BATTLE_GROUPS);
         _local_1.push(INVITE_TO_CLAN);
         _local_1.push(EDIT_PROFILE);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "ClanAction [" + this._name + "]";
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

