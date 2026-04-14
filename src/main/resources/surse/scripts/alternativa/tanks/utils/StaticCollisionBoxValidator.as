package alternativa.tanks.utils
{
   import alternativa.physics.collision.primitives.CollisionBox;
   
   public class StaticCollisionBoxValidator extends StaticCollisionPrimitiveValidator
   {
      
      private var vectorValidator:Vector3Validator;
      
      public function StaticCollisionBoxValidator(_arg_1:CollisionBox)
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

