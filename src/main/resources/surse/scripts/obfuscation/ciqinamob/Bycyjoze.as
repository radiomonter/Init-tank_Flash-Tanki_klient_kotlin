package obfuscation.ciqinamob
{
   public class Bycyjoze
   {
      
      public static const SUMMER:Bycyjoze = new Bycyjoze(0,"SUMMER");
      
      public static const WINTER:Bycyjoze = new Bycyjoze(1,"WINTER");
      
      public static const SPACE:Bycyjoze = new Bycyjoze(2,"SPACE");
      
      public static const SUMMER_DAY:Bycyjoze = new Bycyjoze(3,"SUMMER_DAY");
      
      public static const EVENING:Bycyjoze = new Bycyjoze(4,"EVENING");
      
      public static const HALLOWEEN:Bycyjoze = new Bycyjoze(5,"HALLOWEEN");
      
      public static const NEWYEAR:Bycyjoze = new Bycyjoze(6,"NEWYEAR");
      
      public static const SUMMER_NIGHT:Bycyjoze = new Bycyjoze(7,"SUMMER_NIGHT");
      
      public static const WINTER_DAY:Bycyjoze = new Bycyjoze(8,"WINTER_DAY");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Bycyjoze(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<Bycyjoze>
      {
         var _local_1:Vector.<Bycyjoze> = new Vector.<Bycyjoze>();
         _local_1.push(SUMMER);
         _local_1.push(WINTER);
         _local_1.push(SPACE);
         _local_1.push(SUMMER_DAY);
         _local_1.push(EVENING);
         _local_1.push(HALLOWEEN);
         _local_1.push(NEWYEAR);
         _local_1.push(SUMMER_NIGHT);
         _local_1.push(WINTER_DAY);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "MapTheme [" + this._name + "]";
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

