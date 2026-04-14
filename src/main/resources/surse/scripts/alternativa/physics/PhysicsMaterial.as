package alternativa.physics
{
   public class PhysicsMaterial
   {
      
      public static const DEFAULT_MATERIAL:PhysicsMaterial = new PhysicsMaterial();
      
      public var restitution:Number;
      
      public var friction:Number;
      
      public function PhysicsMaterial(_arg_1:Number = 0, _arg_2:Number = 0.3)
      {
         super();
         this.restitution = _arg_1;
         this.friction = _arg_2;
      }
   }
}

