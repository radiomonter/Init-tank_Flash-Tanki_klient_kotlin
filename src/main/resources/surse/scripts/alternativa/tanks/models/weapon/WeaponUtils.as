package alternativa.tanks.models.weapon
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   
   public class WeaponUtils
   {
      
      private static const cojo:Matrix4 = new Matrix4();
      
      private static const vubily:Vector3 = new Vector3();
      
      public function WeaponUtils()
      {
         super();
      }
      
      public static function balagur(_arg_1:Object3D, _arg_2:Vector3, _arg_3:AllGlobalGunParams) : void
      {
         cojo.setFromMatrix3D(_arg_1.concatenatedMatrix);
         cojo.transformVector(_arg_2,_arg_3.vegenel);
         vubily.x = _arg_2.x;
         vubily.z = _arg_2.z;
         cojo.transformVector(vubily,_arg_3.hiwanu);
         _arg_3.navi.x = cojo.m00;
         _arg_3.navi.y = cojo.m10;
         _arg_3.navi.z = cojo.m20;
         _arg_3.direction.x = cojo.m01;
         _arg_3.direction.y = cojo.m11;
         _arg_3.direction.z = cojo.m21;
      }
      
      public static function qecygi(_arg_1:Object3D, _arg_2:Vector3, _arg_3:BasicGlobalGunParams) : void
      {
         cojo.setMatrix(_arg_1.x,_arg_1.y,_arg_1.z,_arg_1.rotationX,_arg_1.rotationY,_arg_1.rotationZ);
         cojo.transformVector(_arg_2,_arg_3.vegenel);
         _arg_3.direction.x = cojo.m01;
         _arg_3.direction.y = cojo.m11;
         _arg_3.direction.z = cojo.m21;
      }
   }
}

