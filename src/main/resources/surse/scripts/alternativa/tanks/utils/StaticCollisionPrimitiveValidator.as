package alternativa.tanks.utils
{
   import alternativa.physics.collision.CollisionShape;
   
   public class StaticCollisionPrimitiveValidator implements DataUnitValidator
   {
      
      private var matrixValidator:Matrix4Validator;
      
      public function StaticCollisionPrimitiveValidator(_arg_1:CollisionShape)
      {
         super();
         this.matrixValidator = new Matrix4Validator(_arg_1.transform);
      }
      
      public function hasIncorrectData() : Boolean
      {
         return this.matrixValidator.isInvalid();
      }
      
      public function getType() : int
      {
         return DataValidatorType.MAP_PHYSICS_GEOMETRY;
      }
   }
}

