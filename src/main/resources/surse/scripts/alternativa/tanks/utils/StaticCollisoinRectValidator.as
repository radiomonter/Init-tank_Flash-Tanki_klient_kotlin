package alternativa.tanks.utils
{
   import alternativa.physics.collision.primitives.CollisionRect;
   
   public class StaticCollisoinRectValidator extends StaticCollisionPrimitiveValidator
   {
      
      private var vectorValidator:Vector3Validator;
      
      public function StaticCollisoinRectValidator(_arg_1:CollisionRect)
      {
         super(_arg_1);
         this.vectorValidator = new Vector3Validator(_arg_1.hs);
      }
      
      override public function hasIncorrectData() : Boolean
      {
         return Boolean(super.hasIncorrectData()) || this.vectorValidator.isInvalid();
      }
   }
}

