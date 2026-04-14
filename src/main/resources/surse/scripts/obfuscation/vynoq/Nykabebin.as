package obfuscation.vynoq
{
   import alternativa.physics.Body;
   import alternativa.tanks.models.weapon.shared.Wil;
   
   public class Nykabebin implements Wil
   {
      
      public function Nykabebin()
      {
         super();
      }
      
      public function kesaj(_arg_1:Body) : Boolean
      {
         return _arg_1.tank.tankData.health > 0;
      }
   }
}

