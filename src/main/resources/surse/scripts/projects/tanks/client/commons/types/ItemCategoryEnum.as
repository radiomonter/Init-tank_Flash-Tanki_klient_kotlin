package projects.tanks.client.commons.types
{
   public class ItemCategoryEnum
   {
      
      public static const WEAPON:ItemCategoryEnum = new ItemCategoryEnum(0,"WEAPON");
      
      public static const ARMOR:ItemCategoryEnum = new ItemCategoryEnum(1,"ARMOR");
      
      public static const COLOR:ItemCategoryEnum = new ItemCategoryEnum(2,"COLOR");
      
      public static const INVENTORY:ItemCategoryEnum = new ItemCategoryEnum(3,"INVENTORY");
      
      public static const PLUGIN:ItemCategoryEnum = new ItemCategoryEnum(4,"PLUGIN");
      
      public static const KIT:ItemCategoryEnum = new ItemCategoryEnum(5,"KIT");
      
      public static const EMBLEM:ItemCategoryEnum = new ItemCategoryEnum(6,"EMBLEM");
      
      public static const PRESENT:ItemCategoryEnum = new ItemCategoryEnum(7,"PRESENT");
      
      public static const GIVEN_PRESENT:ItemCategoryEnum = new ItemCategoryEnum(8,"GIVEN_PRESENT");
      
      public static const RESISTANCE_MODULE:ItemCategoryEnum = new ItemCategoryEnum(9,"RESISTANCE");
      
      public static const LOOT_BOX:ItemCategoryEnum = new ItemCategoryEnum(10,"LOOT_BOX");
      
      private var _value:int;
      
      private var _name:String;
      
      public function ItemCategoryEnum(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<ItemCategoryEnum>
      {
         var _local_1:Vector.<ItemCategoryEnum> = new Vector.<ItemCategoryEnum>();
         _local_1.push(WEAPON);
         _local_1.push(ARMOR);
         _local_1.push(COLOR);
         _local_1.push(INVENTORY);
         _local_1.push(PLUGIN);
         _local_1.push(KIT);
         _local_1.push(EMBLEM);
         _local_1.push(RESISTANCE_MODULE);
         _local_1.push(LOOT_BOX);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "ItemCategoryEnum [" + this._name + "]";
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

