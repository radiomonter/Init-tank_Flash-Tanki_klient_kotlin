package alternativa.tanks.models.weapon.shaft
{
   public class Huq
   {
      
      public static const IDLE:Huq = new Huq(1);
      
      public static const READY_TO_SHOOT:Huq = new Huq(2);
      
      public static const cafetuqyz:Huq = new Huq(3);
      
      public static const kokavoz:Huq = new Huq(4);
      
      private var value:int;
      
      public function Huq(_arg_1:int)
      {
         super();
         this.value = _arg_1;
      }
      
      [Obfuscation(rename="false")]
      public function toString() : String
      {
         return this.value.toString();
      }
   }
}

