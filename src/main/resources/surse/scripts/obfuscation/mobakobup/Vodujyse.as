package obfuscation.mobakobup
{
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Vodujyse
   {
      
      private var sarad:EncryptedNumber;
      
      private var mafoj:EncryptedNumber;
      
      private var impactForce:EncryptedNumber;
      
      private var pepezemu:EncryptedNumber;
      
      public function Vodujyse(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number)
      {
         super();
         this.sarad = new EncryptedNumberImpl(_arg_1);
         this.mafoj = new EncryptedNumberImpl(_arg_2);
         this.impactForce = new EncryptedNumberImpl(_arg_3);
         this.pepezemu = new EncryptedNumberImpl(_arg_4);
      }
      
      public function mikepal() : Number
      {
         return this.sarad.getNumber();
      }
      
      public function fotulite() : Number
      {
         return this.mafoj.getNumber();
      }
      
      public function rokakop() : Number
      {
         return this.impactForce.getNumber();
      }
      
      public function razo() : Number
      {
         return this.pepezemu.getNumber();
      }
   }
}

