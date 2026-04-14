package obfuscation.zuhelo
{
   import alternativa.physics.Body;
   import alternativa.physics.collision.IRayCollisionFilter;
   
   internal class Wuwama implements IRayCollisionFilter
   {
      
      private var body:Body;
      
      public function Wuwama(_arg_1:Body)
      {
         super();
         this.body = _arg_1;
      }
      
      public function considerBody(_arg_1:Body) : Boolean
      {
         return this.body != _arg_1;
      }
   }
}

