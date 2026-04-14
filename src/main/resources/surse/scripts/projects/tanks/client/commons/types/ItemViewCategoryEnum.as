package projects.tanks.client.commons.types
{
   public class ItemViewCategoryEnum
   {
      
      public static const WEAPON:ItemViewCategoryEnum = new ItemViewCategoryEnum(0,"WEAPON");
      
      public static const ARMOR:ItemViewCategoryEnum = new ItemViewCategoryEnum(1,"ARMOR");
      
      public static const PAINT:ItemViewCategoryEnum = new ItemViewCategoryEnum(2,"PAINT");
      
      public static const INVENTORY:ItemViewCategoryEnum = new ItemViewCategoryEnum(3,"INVENTORY");
      
      public static const KIT:ItemViewCategoryEnum = new ItemViewCategoryEnum(4,"KIT");
      
      public static const SPECIAL:ItemViewCategoryEnum = new ItemViewCategoryEnum(5,"SPECIAL");
      
      public static const GIVEN_PRESENTS:ItemViewCategoryEnum = new ItemViewCategoryEnum(6,"GIVEN_PRESENTS");
      
      public static const RESISTANCE:ItemViewCategoryEnum = new ItemViewCategoryEnum(7,"RESISTANCE");
      
      private var _value:int;
      
      private var _name:String;
      
      public function ItemViewCategoryEnum(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<ItemViewCategoryEnum>
      {
         var _local_1:Vector.<ItemViewCategoryEnum> = new Vector.<ItemViewCategoryEnum>();
         _local_1.push(WEAPON);
         _local_1.push(ARMOR);
         _local_1.push(PAINT);
         _local_1.push(INVENTORY);
         _local_1.push(KIT);
         _local_1.push(SPECIAL);
         _local_1.push(GIVEN_PRESENTS);
         _local_1.push(RESISTANCE);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "ItemViewCategoryEnum [" + this._name + "]";
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

