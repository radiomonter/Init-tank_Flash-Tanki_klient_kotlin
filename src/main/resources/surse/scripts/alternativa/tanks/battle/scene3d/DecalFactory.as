package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.containers.KDContainer;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Decal;
   import alternativa.math.Vector3;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleUtils;
   import flash.geom.Vector3D;
   import obfuscation.kyre.Myw;
   
   public class DecalFactory
   {
      
      private static const kifubul:Number = 85 * Math.PI / 180;
      
      private static const fawevotoj:RayHit = new RayHit();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const right:Vector3 = new Vector3();
      
      private static const up:Vector3 = new Vector3();
      
      private static const normal:Vector3 = new Vector3();
      
      private static const qiwojus:Vector.<Vector3> = Vector.<Vector3>([new Vector3(),new Vector3(),new Vector3(),new Vector3(),new Vector3()]);
      
      private static const setacyhoq:Vector3D = new Vector3D();
      
      private static const rycudonog:Vector3D = new Vector3D();
      
      private var collisionDetector:CollisionDetector;
      
      public function DecalFactory(_arg_1:CollisionDetector)
      {
         super();
         this.collisionDetector = _arg_1;
      }
      
      public function createDecal(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number, _arg_4:TextureMaterial, _arg_5:KDContainer, _arg_6:RotationState) : Decal
      {
         var _local_7:Vector3 = null;
         var _local_8:Number = NaN;
         direction.diff(_arg_1,_arg_2);
         var _local_9:Number = direction.length() + 200;
         direction.normalize();
         right.cross2(direction,Vector3.Z_AXIS).normalize();
         up.cross2(right,direction);
         Vector3(qiwojus[4]).copy(_arg_2);
         Vector3(qiwojus[0]).copy(_arg_2).addScaled(50,right);
         Vector3(qiwojus[1]).copy(_arg_2).addScaled(50,up);
         Vector3(qiwojus[2]).copy(_arg_2).addScaled(-50,right);
         Vector3(qiwojus[3]).copy(_arg_2).addScaled(-50,up);
         normal.reset(0,0,0);
         for each(_local_7 in qiwojus)
         {
            if(this.collisionDetector.raycastStatic(_local_7,direction,Myw.dyhan,_local_9,null,fawevotoj))
            {
               normal.add(fawevotoj.normal);
            }
         }
         normal.normalize();
         BattleUtils.vyb(_arg_1,setacyhoq);
         BattleUtils.vyb(normal,rycudonog);
         _local_8 = this.jijema(_arg_6);
         return _arg_5.createDecal(setacyhoq,rycudonog,_arg_3,_local_8,kifubul,300,_arg_4);
      }
      
      private function jijema(_arg_1:RotationState) : Number
      {
         switch(_arg_1)
         {
            case RotationState.jikimibi:
               return 0;
            default:
               return Math.random() * 2 * Math.PI;
         }
      }
   }
}

