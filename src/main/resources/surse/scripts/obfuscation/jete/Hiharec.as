package obfuscation.jete
{
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Hiharec
   {
      
      private var energyCapacity:EncryptedNumber;
      
      private var energyDischargeSpeed:EncryptedNumber;
      
      private var energyRechargeSpeed:EncryptedNumber;
      
      private var tickIntervalMsec:EncryptedNumber;
      
      public function Hiharec(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number)
      {
         super();
         this.energyCapacity = new EncryptedNumberImpl(_arg_1);
         this.energyDischargeSpeed = new EncryptedNumberImpl(_arg_2);
         this.energyRechargeSpeed = new EncryptedNumberImpl(_arg_3);
         this.tickIntervalMsec = new EncryptedNumberImpl(_arg_4);
      }
      
      public function waqatyw() : Number
      {
         return this.energyCapacity.getNumber();
      }
      
      public function gefifoho() : Number
      {
         return this.energyDischargeSpeed.getNumber();
      }
      
      public function bezab() : Number
      {
         return this.energyRechargeSpeed.getNumber();
      }
      
      public function huzyz() : Number
      {
         return this.tickIntervalMsec.getNumber();
      }
   }
}

