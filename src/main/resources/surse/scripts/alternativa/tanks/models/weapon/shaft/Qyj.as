package alternativa.tanks.models.weapon.shaft
{
   public class Qyj
   {
      
      public static const TRIGGER_PULL:Qyj = new Qyj("TRIGGER_PULL");
      
      public static const TRIGGER_RELEASE:Qyj = new Qyj("TRIGGER_RELEASE");
      
      public static const STOP:Qyj = new Qyj("STOP");
      
      public static const READY_TO_SHOOT:Qyj = new Qyj("READY_TO_SHOOT");
      
      public static const SWITCH:Qyj = new Qyj("SWITCH");
      
      public static const EXIT:Qyj = new Qyj("EXIT");
      
      private var value:String;
      
      public function Qyj(_arg_1:String)
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

