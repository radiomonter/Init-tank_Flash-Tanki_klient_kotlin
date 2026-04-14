package projects.tanks.client.garage.models.item.lootbox
{
   public class LootBoxCategory
   {
      
      public static const COMMON:LootBoxCategory = new LootBoxCategory(0,"COMMON");
      
      public static const UNCOMMON:LootBoxCategory = new LootBoxCategory(1,"UNCOMMON");
      
      public static const RARE:LootBoxCategory = new LootBoxCategory(2,"RARE");
      
      public static const EPIC:LootBoxCategory = new LootBoxCategory(3,"EPIC");
      
      public static const LEGENDARY:LootBoxCategory = new LootBoxCategory(4,"LEGENDARY");
      
      public static const EXOTIC:LootBoxCategory = new LootBoxCategory(5,"EXOTIC");
      
      private var _value:int;
      
      private var _name:String;
      
      public function LootBoxCategory(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<LootBoxCategory>
      {
         var _local_1:Vector.<LootBoxCategory> = new Vector.<LootBoxCategory>();
         _local_1.push(COMMON);
         _local_1.push(UNCOMMON);
         _local_1.push(RARE);
         _local_1.push(EPIC);
         _local_1.push(LEGENDARY);
         _local_1.push(EXOTIC);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "LootBoxCategory [" + this._name + "]";
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

