package projects.tanks.client.clans.clan.permissions
{
   public class ClanPermission
   {
      
      public static const SUPREME_COMMANDER:ClanPermission = new ClanPermission(0,"SUPREME_COMMANDER");
      
      public static const COMMANDER:ClanPermission = new ClanPermission(1,"COMMANDER");
      
      public static const OFFICER:ClanPermission = new ClanPermission(2,"OFFICER");
      
      public static const SERGEANT:ClanPermission = new ClanPermission(3,"SERGEANT");
      
      public static const VETERAN:ClanPermission = new ClanPermission(4,"VETERAN");
      
      public static const PRIVATE:ClanPermission = new ClanPermission(5,"PRIVATE");
      
      public static const NOVICE:ClanPermission = new ClanPermission(6,"NOVICE");
      
      private var _value:int;
      
      private var _name:String;
      
      public function ClanPermission(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<ClanPermission>
      {
         var _local_1:Vector.<ClanPermission> = new Vector.<ClanPermission>();
         _local_1.push(SUPREME_COMMANDER);
         _local_1.push(COMMANDER);
         _local_1.push(OFFICER);
         _local_1.push(SERGEANT);
         _local_1.push(VETERAN);
         _local_1.push(PRIVATE);
         _local_1.push(NOVICE);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "ClanPermission [" + this._name + "]";
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

