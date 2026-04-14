package alternativa.tanks.models.battle.battlefield
{
   public class BattleType
   {
      
      public static const DM:BattleType = new BattleType(0);
      
      public static const TDM:BattleType = new BattleType(1);
      
      public static const CTF:BattleType = new BattleType(2);
      
      public static const rovicateto:BattleType = new BattleType(3);
      
      public static const JGR:BattleType = new BattleType(6);
      
      private var _value:int;
      
      public function BattleType(_arg_1:int)
      {
         super();
         this._value = _arg_1;
      }
      
      public function get value() : int
      {
         return this._value;
      }
   }
}

