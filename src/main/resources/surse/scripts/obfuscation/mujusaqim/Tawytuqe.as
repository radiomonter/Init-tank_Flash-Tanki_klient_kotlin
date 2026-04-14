package obfuscation.mujusaqim
{
   public class Tawytuqe
   {
      
      public static const AT_BASE:Tawytuqe = new Tawytuqe(0,"AT_BASE");
      
      public static const DROPPED:Tawytuqe = new Tawytuqe(1,"DROPPED");
      
      public static const CARRIED:Tawytuqe = new Tawytuqe(2,"CARRIED");
      
      private var _value:int;
      
      private var jur:String;
      
      public function Tawytuqe(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this.jur = _arg_2;
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function toString() : String
      {
         return "CTFFlagState [" + this.jur + "]";
      }
   }
}

