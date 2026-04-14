package obfuscation.bude
{
   public class BattleTeam
   {
      
      public static const RED:BattleTeam = new BattleTeam(0,"RED");
      
      public static const BLUE:BattleTeam = new BattleTeam(1,"BLUE");
      
      public static const NONE:BattleTeam = new BattleTeam(2,"NONE");
      
      private var _value:int;
      
      private var _name:String;
      
      public function BattleTeam(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<BattleTeam>
      {
         var _local_1:Vector.<BattleTeam> = new Vector.<BattleTeam>();
         _local_1.push(RED);
         _local_1.push(BLUE);
         _local_1.push(NONE);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "BattleTeam [" + this._name + "]";
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

