package projects.tanks.client.battlefield.types
{
   public class DamageType
   {
      
      public static const SMOKY:DamageType = new DamageType(0,"SMOKY");
      
      public static const FIREBIRD:DamageType = new DamageType(1,"FIREBIRD");
      
      public static const TWINS:DamageType = new DamageType(3,"TWINS");
      
      public static const RAILGUN:DamageType = new DamageType(4,"RAILGUN");
      
      public static const ISIS:DamageType = new DamageType(5,"ISIS");
      
      public static const MINE:DamageType = new DamageType(6,"MINE");
      
      public static const THUNDER:DamageType = new DamageType(7,"THUNDER");
      
      public static const RICOCHET:DamageType = new DamageType(8,"RICOCHET");
      
      public static const FREEZE:DamageType = new DamageType(10,"FREEZE");
      
      public static const SHAFT:DamageType = new DamageType(11,"SHAFT");
      
      public static const MACHINE_GUN:DamageType = new DamageType(13,"MACHINE_GUN");
      
      public static const SHOTGUN:DamageType = new DamageType(14,"SHOTGUN");
      
      public static const TERMINATOR:DamageType = new DamageType(19,"TERMINATOR");
      
      private var _value:int;
      
      private var _name:String;
      
      public function DamageType(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<DamageType>
      {
         var _local_1:Vector.<DamageType> = new Vector.<DamageType>();
         _local_1.push(SMOKY);
         _local_1.push(FIREBIRD);
         _local_1.push(TWINS);
         _local_1.push(RAILGUN);
         _local_1.push(ISIS);
         _local_1.push(MINE);
         _local_1.push(THUNDER);
         _local_1.push(RICOCHET);
         _local_1.push(FREEZE);
         _local_1.push(SHAFT);
         _local_1.push(MACHINE_GUN);
         _local_1.push(SHOTGUN);
         _local_1.push(TERMINATOR);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "DamageType [" + this._name + "]";
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

