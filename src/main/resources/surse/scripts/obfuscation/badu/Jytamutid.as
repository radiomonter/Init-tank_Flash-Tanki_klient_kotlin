package obfuscation.badu
{
   import obfuscation.bude.BattleTeam;
   
   public final class Jytamutid
   {
      
      private var sera:Wydu;
      
      private var jilo:Wydu;
      
      private var hij:Wydu;
      
      private var attenuationBegin:Number;
      
      private var mypoc:Number;
      
      public function Jytamutid(_arg_1:Wydu, _arg_2:Wydu, _arg_3:Wydu, _arg_4:Number, _arg_5:Number)
      {
         super();
         this.sera = _arg_1;
         this.jilo = _arg_2;
         this.hij = _arg_3;
         this.attenuationBegin = _arg_4;
         this.mypoc = _arg_5;
      }
      
      public function kycigove(_arg_1:BattleTeam) : Wydu
      {
         switch(_arg_1.value)
         {
            case BattleTeam.BLUE.value:
               return this.jilo;
            case BattleTeam.NONE.value:
               return this.hij;
            case BattleTeam.RED.value:
               return this.sera;
            default:
               return null;
         }
      }
      
      public function vehyvoqi() : Number
      {
         return this.attenuationBegin;
      }
      
      public function nuzomypu() : Number
      {
         return this.mypoc;
      }
   }
}

