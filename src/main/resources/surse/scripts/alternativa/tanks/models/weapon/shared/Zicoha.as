package alternativa.tanks.models.weapon.shared
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.tanks.battle.BattleService;
   import obfuscation.kyre.Myw;
   import obfuscation.kyre.TanksCollisionDetector;
   
   public class Zicoha
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const nolelubuf:Number = 6.5;
      
      private static const medyge:Vector3 = new Vector3();
      
      private static const namibe:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const axis:Vector3 = new Vector3();
      
      private static const COS_ONE_DEGREE:Number = Math.cos(Math.PI / 180);
      
      private static const collisionBox:CollisionBox = new CollisionBox(new Vector3(1,1,1),Myw.dyhan,PhysicsMaterial.DEFAULT_MATERIAL);
      
      public function Zicoha()
      {
         super();
      }
      
      public static function fyfujuwub(_arg_1:Vector3, _arg_2:Vector3) : Boolean
      {
         zuzyz(_arg_1,_arg_2);
         var _local_3:TanksCollisionDetector = battleService.getBattleRunner().soc();
         return _local_3.sezu(collisionBox);
      }
      
      private static function zuzyz(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         namibe.diff(_arg_1,_arg_2);
         namibe.y = namibe.length() / 2;
         namibe.x = nolelubuf;
         namibe.z = nolelubuf;
         collisionBox.hs.copy(namibe);
         medyge.sum(_arg_1,_arg_2);
         medyge.scale(0.5);
         var _local_3:Matrix4 = collisionBox.transform;
         _local_3.toIdentity();
         _local_3.setPosition(medyge);
         direction.diff(_arg_2,_arg_1);
         direction.normalize();
         var _local_4:Number = direction.dot(Vector3.Y_AXIS);
         if(Math.abs(direction.y) < COS_ONE_DEGREE)
         {
            axis.cross2(Vector3.Y_AXIS,direction);
            axis.normalize();
            _local_3.fromAxisAngle(axis,Math.acos(_local_4));
         }
         collisionBox.calculateAABB();
      }
   }
}

