package projects.tanks.client.garage.models.item.properties
{
   public class ItemGarageProperty
   {
      
      public static const HULL_ARMOR:ItemGarageProperty = new ItemGarageProperty(1,"HULL_ARMOR");
      
      public static const HULL_SPEED:ItemGarageProperty = new ItemGarageProperty(2,"HULL_SPEED");
      
      public static const HULL_TURN_SPEED:ItemGarageProperty = new ItemGarageProperty(3,"HULL_TURN_SPEED");
      
      public static const HULL_POWER:ItemGarageProperty = new ItemGarageProperty(4,"HULL_POWER");
      
      public static const HULL_MASS:ItemGarageProperty = new ItemGarageProperty(5,"HULL_MASS");
      
      public static const ALL_RESISTANCE:ItemGarageProperty = new ItemGarageProperty(19,"ALL_RESISTANCE");
      
      public static const FIREBIRD_RESISTANCE:ItemGarageProperty = new ItemGarageProperty(20,"FIREBIRD_RESISTANCE");
      
      public static const SMOKY_RESISTANCE:ItemGarageProperty = new ItemGarageProperty(21,"SMOKY_RESISTANCE");
      
      public static const TWINS_RESISTANCE:ItemGarageProperty = new ItemGarageProperty(22,"TWINS_RESISTANCE");
      
      public static const RAILGUN_RESISTANCE:ItemGarageProperty = new ItemGarageProperty(23,"RAILGUN_RESISTANCE");
      
      public static const ISIS_RESISTANCE:ItemGarageProperty = new ItemGarageProperty(24,"ISIS_RESISTANCE");
      
      public static const MINE_RESISTANCE:ItemGarageProperty = new ItemGarageProperty(25,"MINE_RESISTANCE");
      
      public static const THUNDER_RESISTANCE:ItemGarageProperty = new ItemGarageProperty(26,"THUNDER_RESISTANCE");
      
      public static const FREEZE_RESISTANCE:ItemGarageProperty = new ItemGarageProperty(27,"FREEZE_RESISTANCE");
      
      public static const RICOCHET_RESISTANCE:ItemGarageProperty = new ItemGarageProperty(28,"RICOCHET_RESISTANCE");
      
      public static const SHAFT_RESISTANCE:ItemGarageProperty = new ItemGarageProperty(29,"SHAFT_RESISTANCE");
      
      public static const DAMAGE:ItemGarageProperty = new ItemGarageProperty(40,"DAMAGE");
      
      public static const DAMAGE_PER_SECOND:ItemGarageProperty = new ItemGarageProperty(41,"DAMAGE_PER_SECOND");
      
      public static const WEAPON_COOLDOWN_TIME:ItemGarageProperty = new ItemGarageProperty(42,"WEAPON_COOLDOWN_TIME");
      
      public static const AIMING_MODE_COOLDOWN_TIME:ItemGarageProperty = new ItemGarageProperty(43,"AIMING_MODE_COOLDOWN_TIME");
      
      public static const CRITICAL_HIT_CHANCE:ItemGarageProperty = new ItemGarageProperty(44,"CRITICAL_HIT_CHANCE");
      
      public static const CRITICAL_HIT_DAMAGE:ItemGarageProperty = new ItemGarageProperty(45,"CRITICAL_HIT_DAMAGE");
      
      public static const SHOT_RANGE:ItemGarageProperty = new ItemGarageProperty(46,"SHOT_RANGE");
      
      public static const TURRET_TURN_SPEED:ItemGarageProperty = new ItemGarageProperty(47,"TURRET_TURN_SPEED");
      
      public static const AIMING_ERROR:ItemGarageProperty = new ItemGarageProperty(48,"AIMING_ERROR");
      
      public static const SHOT_AREA:ItemGarageProperty = new ItemGarageProperty(49,"SHOT_AREA");
      
      public static const CONE_ANGLE:ItemGarageProperty = new ItemGarageProperty(50,"CONE_ANGLE");
      
      public static const CHARGING_TIME:ItemGarageProperty = new ItemGarageProperty(51,"CHARGING_TIME");
      
      public static const FIRE_DAMAGE:ItemGarageProperty = new ItemGarageProperty(52,"FIRE_DAMAGE");
      
      public static const WEAPON_WEAKENING_COEFF:ItemGarageProperty = new ItemGarageProperty(53,"WEAPON_WEAKENING_COEFF");
      
      public static const ISIS_RADIUS:ItemGarageProperty = new ItemGarageProperty(54,"ISIS_RADIUS");
      
      public static const ISIS_DAMAGE:ItemGarageProperty = new ItemGarageProperty(55,"ISIS_DAMAGE");
      
      public static const ISIS_HEALING_PER_SECOND:ItemGarageProperty = new ItemGarageProperty(56,"ISIS_HEALING_PER_SECOND");
      
      public static const ISIS_SELF_HEALING_PERCENT:ItemGarageProperty = new ItemGarageProperty(57,"ISIS_SELF_HEALING_PERCENT");
      
      public static const AIMING_MODE_DAMAGE:ItemGarageProperty = new ItemGarageProperty(58,"AIMING_MODE_DAMAGE");
      
      public static const AIMING_WEAPON_DISCHARGE_RATE:ItemGarageProperty = new ItemGarageProperty(59,"AIMING_WEAPON_DISCHARGE_RATE");
      
      public static const SHAFT_AIMED_SHOT_IMPACT:ItemGarageProperty = new ItemGarageProperty(60,"SHAFT_AIMED_SHOT_IMPACT");
      
      public static const SHAFT_TARGETING_SPEED:ItemGarageProperty = new ItemGarageProperty(61,"SHAFT_TARGETING_SPEED");
      
      public static const SHAFT_ARCADE_DAMAGE:ItemGarageProperty = new ItemGarageProperty(62,"SHAFT_ARCADE_DAMAGE");
      
      public static const WEAPON_IMPACT_FORCE:ItemGarageProperty = new ItemGarageProperty(63,"WEAPON_IMPACT_FORCE");
      
      public static const WEAPON_KICKBACK:ItemGarageProperty = new ItemGarageProperty(64,"WEAPON_KICKBACK");
      
      public static const WEAPON_RETICLE_SPEED:ItemGarageProperty = new ItemGarageProperty(65,"WEAPON_RETICLE_SPEED");
      
      public static const WEAPON_CHARGE_RATE:ItemGarageProperty = new ItemGarageProperty(66,"WEAPON_CHARGE_RATE");
      
      public static const WEAPON_MIN_DAMAGE_PERCENT:ItemGarageProperty = new ItemGarageProperty(67,"WEAPON_MIN_DAMAGE_PERCENT");
      
      public static const THUNDER_MIN_SPLASH_DAMAGE_PERCENT:ItemGarageProperty = new ItemGarageProperty(68,"THUNDER_MIN_SPLASH_DAMAGE_PERCENT");
      
      private var _value:int;
      
      private var _name:String;
      
      public function ItemGarageProperty(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<ItemGarageProperty>
      {
         var _local_1:Vector.<ItemGarageProperty> = new Vector.<ItemGarageProperty>();
         _local_1.push(HULL_ARMOR);
         _local_1.push(HULL_SPEED);
         _local_1.push(HULL_TURN_SPEED);
         _local_1.push(HULL_POWER);
         _local_1.push(HULL_MASS);
         _local_1.push(ALL_RESISTANCE);
         _local_1.push(FIREBIRD_RESISTANCE);
         _local_1.push(SMOKY_RESISTANCE);
         _local_1.push(TWINS_RESISTANCE);
         _local_1.push(RAILGUN_RESISTANCE);
         _local_1.push(ISIS_RESISTANCE);
         _local_1.push(MINE_RESISTANCE);
         _local_1.push(THUNDER_RESISTANCE);
         _local_1.push(FREEZE_RESISTANCE);
         _local_1.push(RICOCHET_RESISTANCE);
         _local_1.push(SHAFT_RESISTANCE);
         _local_1.push(DAMAGE);
         _local_1.push(DAMAGE_PER_SECOND);
         _local_1.push(WEAPON_COOLDOWN_TIME);
         _local_1.push(AIMING_MODE_COOLDOWN_TIME);
         _local_1.push(CRITICAL_HIT_CHANCE);
         _local_1.push(CRITICAL_HIT_DAMAGE);
         _local_1.push(SHOT_RANGE);
         _local_1.push(TURRET_TURN_SPEED);
         _local_1.push(AIMING_ERROR);
         _local_1.push(SHOT_AREA);
         _local_1.push(CONE_ANGLE);
         _local_1.push(CHARGING_TIME);
         _local_1.push(FIRE_DAMAGE);
         _local_1.push(WEAPON_WEAKENING_COEFF);
         _local_1.push(ISIS_RADIUS);
         _local_1.push(ISIS_DAMAGE);
         _local_1.push(ISIS_HEALING_PER_SECOND);
         _local_1.push(ISIS_SELF_HEALING_PERCENT);
         _local_1.push(AIMING_MODE_DAMAGE);
         _local_1.push(AIMING_WEAPON_DISCHARGE_RATE);
         _local_1.push(SHAFT_AIMED_SHOT_IMPACT);
         _local_1.push(SHAFT_TARGETING_SPEED);
         _local_1.push(SHAFT_ARCADE_DAMAGE);
         _local_1.push(WEAPON_IMPACT_FORCE);
         _local_1.push(WEAPON_KICKBACK);
         _local_1.push(WEAPON_RETICLE_SPEED);
         _local_1.push(WEAPON_CHARGE_RATE);
         _local_1.push(WEAPON_MIN_DAMAGE_PERCENT);
         _local_1.push(THUNDER_MIN_SPLASH_DAMAGE_PERCENT);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "ItemGarageProperty [" + this._name + "]";
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

