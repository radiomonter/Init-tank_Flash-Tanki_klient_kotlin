package alternativa.tanks.models.weapon
{
   import alternativa.physics.Body;
   import alternativa.physics.collision.IRayCollisionFilter;
   
   public class RayCollisionFilter implements IRayCollisionFilter
   {
      
      public var nugagos:Body;
      
      public function RayCollisionFilter()
      {
         super();
      }
      
      public function considerBody(_arg_1:Body) : Boolean
      {
         return this.nugagos != _arg_1;
      }
   }
}

