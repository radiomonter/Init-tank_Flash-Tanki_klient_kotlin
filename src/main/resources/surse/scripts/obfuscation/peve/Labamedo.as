package obfuscation.peve
{
   import obfuscation.badu.Wydu;
   
   public class Labamedo
   {
      
      private var lightColor:Wydu;
      
      private var attenuationBegin:Number;
      
      private var attenuationEnd:Number;
      
      public function Labamedo(_arg_1:Wydu, _arg_2:Number, _arg_3:Number)
      {
         super();
         this.lightColor = _arg_1;
         this.attenuationBegin = _arg_2;
         this.attenuationEnd = _arg_3;
      }
      
      public function sof() : Wydu
      {
         return this.lightColor;
      }
      
      public function vehyvoqi() : Number
      {
         return this.attenuationBegin;
      }
      
      public function nuzomypu() : Number
      {
         return this.attenuationEnd;
      }
   }
}

