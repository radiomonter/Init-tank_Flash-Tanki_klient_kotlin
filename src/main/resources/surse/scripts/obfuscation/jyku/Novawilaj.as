package obfuscation.jyku
{
   public class Novawilaj
   {
      
      public static const NORMAL:Novawilaj = new Novawilaj(0,"NORMAL");
      
      public static const CRITICAL:Novawilaj = new Novawilaj(1,"CRITICAL");
      
      public static const FATAL:Novawilaj = new Novawilaj(2,"FATAL");
      
      public static const HEAL:Novawilaj = new Novawilaj(3,"HEAL");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Novawilaj(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function Jul(_arg_1:String) : Novawilaj
      {
         var _local_2:Novawilaj = null;
         switch(_arg_1)
         {
            case "NORMAL":
               _local_2 = NORMAL;
               break;
            case "CRITICAL":
               _local_2 = CRITICAL;
               break;
            case "FATAL":
               _local_2 = FATAL;
               break;
            case "HEAL":
               _local_2 = HEAL;
         }
         return _local_2;
      }
      
      public static function get values() : Vector.<Novawilaj>
      {
         var _local_1:Vector.<Novawilaj> = new Vector.<Novawilaj>();
         _local_1.push(NORMAL);
         _local_1.push(CRITICAL);
         _local_1.push(FATAL);
         _local_1.push(HEAL);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "DamageIndicatorType [" + this._name + "]";
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

