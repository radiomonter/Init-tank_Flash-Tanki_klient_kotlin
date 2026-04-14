package obfuscation.fabuqy
{
   public class Suvozimi
   {
      
      public static const DM:Suvozimi = new Suvozimi(0,"DM");
      
      public static const TDM:Suvozimi = new Suvozimi(1,"TDM");
      
      public static const CTF:Suvozimi = new Suvozimi(2,"CTF");
      
      public static const CP:Suvozimi = new Suvozimi(3,"CP");
      
      public static const JGR:Suvozimi = new Suvozimi(4,"JGR");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Suvozimi(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<Suvozimi>
      {
         var _local_1:Vector.<Suvozimi> = new Vector.<Suvozimi>();
         _local_1.push(DM);
         _local_1.push(TDM);
         _local_1.push(CTF);
         _local_1.push(CP);
         _local_1.push(JGR);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "BattleMode [" + this._name + "]";
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

