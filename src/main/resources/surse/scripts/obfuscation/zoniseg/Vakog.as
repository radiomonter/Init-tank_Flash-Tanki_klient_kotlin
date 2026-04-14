package obfuscation.zoniseg
{
   import alternativa.physics.Body;
   import alternativa.physics.collision.IRayCollisionFilter;
   import flash.utils.Dictionary;
   
   public class Vakog implements IRayCollisionFilter
   {
      
      private var bodies:Dictionary = new Dictionary();
      
      public function Vakog()
      {
         super();
      }
      
      public function considerBody(_arg_1:Body) : Boolean
      {
         return this.bodies[_arg_1] == null;
      }
      
      public function addBody(_arg_1:Body) : void
      {
         this.bodies[_arg_1] = true;
      }
      
      public function clear() : void
      {
         this.bodies = new Dictionary();
      }
   }
}

