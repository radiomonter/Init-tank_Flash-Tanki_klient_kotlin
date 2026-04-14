package obfuscation.hasitaze
{
   public class Gypuza
   {
      
      public static const OFF:Gypuza = new Gypuza(0,"OFF");
      
      public static const IDLE:Gypuza = new Gypuza(1,"IDLE");
      
      public static const HEALING:Gypuza = new Gypuza(2,"HEALING");
      
      public static const DAMAGING:Gypuza = new Gypuza(3,"DAMAGING");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Gypuza(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<Gypuza>
      {
         var _local_1:Vector.<Gypuza> = new Vector.<Gypuza>();
         _local_1.push(OFF);
         _local_1.push(IDLE);
         _local_1.push(HEALING);
         _local_1.push(DAMAGING);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "IsisState [" + this._name + "]";
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

