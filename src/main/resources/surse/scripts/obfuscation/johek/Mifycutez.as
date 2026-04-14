package obfuscation.johek
{
   import alternativa.physics.Body;
   import alternativa.tanks.models.weapon.shared.Zyzeri;
   
   public class Mifycutez implements Zyzeri
   {
      
      public function Mifycutez()
      {
         super();
      }
      
      public function bokepowan(_arg_1:Body) : Number
      {
         return _arg_1.tank.tankData.health > 0 ? Number(1) : Number(0);
      }
      
      public function muqa(_arg_1:Body) : Boolean
      {
         return false;
      }
   }
}

