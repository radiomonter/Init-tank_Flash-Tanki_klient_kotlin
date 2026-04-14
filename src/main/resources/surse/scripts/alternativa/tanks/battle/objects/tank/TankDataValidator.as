package alternativa.tanks.battle.objects.tank
{
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.tanks.utils.DataValidatorType;
   import alternativa.tanks.utils.EncryptedCollisionBoxData;
   
   public class TankDataValidator implements DataUnitValidator
   {
      
      private var mezyd:Vector.<EncryptedCollisionBoxData>;
      
      public function TankDataValidator(_arg_1:Vector.<CollisionShape>)
      {
         var _local_2:int = 0;
         super();
         this.mezyd = new Vector.<EncryptedCollisionBoxData>(_arg_1.length);
         while(_local_2 < _arg_1.length)
         {
            this.mezyd[_local_2] = new EncryptedCollisionBoxData(CollisionBox(_arg_1[_local_2]));
            _local_2++;
         }
      }
      
      public function hasIncorrectData() : Boolean
      {
         var _local_1:EncryptedCollisionBoxData = null;
         for each(_local_1 in this.mezyd)
         {
            if(_local_1.isInvalid())
            {
               return true;
            }
         }
         return false;
      }
      
      public function getType() : int
      {
         return DataValidatorType.TANK;
      }
      
      public function destroy() : void
      {
         this.mezyd.length = 0;
      }
   }
}

