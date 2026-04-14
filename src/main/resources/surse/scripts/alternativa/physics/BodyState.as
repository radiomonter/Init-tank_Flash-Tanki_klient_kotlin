package alternativa.physics
{
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   
   public class BodyState
   {
      
      public var velocity:Vector3 = new Vector3();
      
      public var orientation:Quaternion = new Quaternion();
      
      public var angularVelocity:Vector3 = new Vector3();
      
      public var position:Vector3 = new Vector3();
      
      public function BodyState()
      {
         super();
      }
      
      public function copy(_arg_1:BodyState) : void
      {
         this.position.copy(_arg_1.position);
         this.orientation.copy(_arg_1.orientation);
         this.velocity.copy(_arg_1.velocity);
         this.angularVelocity.copy(_arg_1.angularVelocity);
      }
      
      public function isValid() : Boolean
      {
         return this.velocity.isFiniteVector() && this.angularVelocity.isFiniteVector() && this.position.isFiniteVector() && this.orientation.isFiniteQuaternion();
      }
   }
}

