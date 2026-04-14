package alternativa.tanks.models.weapon.shaft
{
   public class Hefad
   {
      
      public static const RECHARGE:Hefad = new Hefad("RECHARGE");
      
      public static const DRAIN:Hefad = new Hefad("DRAIN");
      
      private var value:String;
      
      public function Hefad(_arg_1:String)
      {
         super();
         this.value = _arg_1;
      }
      
      [Obfuscation(rename="false")]
      public function toString() : String
      {
         return this.value;
      }
   }
}

