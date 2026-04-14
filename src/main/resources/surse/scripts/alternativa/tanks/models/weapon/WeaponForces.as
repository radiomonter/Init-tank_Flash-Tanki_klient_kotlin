package alternativa.tanks.models.weapon
{
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class WeaponForces
   {
      
      private var impactForce:EncryptedNumber;
      
      private var pepezemu:EncryptedNumber;
      
      public function WeaponForces(_arg_1:Number, _arg_2:Number)
      {
         super();
         this.impactForce = new EncryptedNumberImpl(_arg_1);
         this.pepezemu = new EncryptedNumberImpl(_arg_2);
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

