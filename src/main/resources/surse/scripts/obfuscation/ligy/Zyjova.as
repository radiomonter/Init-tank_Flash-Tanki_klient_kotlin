package obfuscation.ligy
{
   public class Zyjova
   {
      
      public static const RED:Zyjova = new Zyjova(0,"RED");
      
      public static const BLUE:Zyjova = new Zyjova(1,"BLUE");
      
      public static const NEUTRAL:Zyjova = new Zyjova(2,"NEUTRAL");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Zyjova(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<Zyjova>
      {
         var _local_1:Vector.<Zyjova> = new Vector.<Zyjova>();
         _local_1.push(RED);
         _local_1.push(BLUE);
         _local_1.push(NEUTRAL);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "ControlPointState [" + this._name + "]";
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

