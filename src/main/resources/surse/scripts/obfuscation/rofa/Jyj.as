package obfuscation.rofa
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   
   public class Jyj
   {
      
      private static var axis1:Vector3 = new Vector3();
      
      private static var kuz:Vector3 = new Vector3();
      
      private static var eulerAngles:Vector3 = new Vector3();
      
      private static var birecym:Vector3 = new Vector3();
      
      private static var nunug:Vector3 = new Vector3();
      
      private static var jeli:Matrix3 = new Matrix3();
      
      private static var pyh:Matrix3 = new Matrix3();
      
      public function Jyj()
      {
         super();
      }
      
      public static function moruqogi(_arg_1:Object3D, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Vector3) : void
      {
         var _local_5:Number = NaN;
         if(_arg_3.y < -0.99999 || _arg_3.y > 0.99999)
         {
            axis1.x = 0;
            axis1.y = 0;
            axis1.z = 1;
            _local_5 = _arg_3.y < 0 ? Math.PI : 0;
         }
         else
         {
            axis1.x = _arg_3.z;
            axis1.y = 0;
            axis1.z = -_arg_3.x;
            axis1.normalize();
            _local_5 = Math.acos(_arg_3.y);
         }
         jeli.fromAxisAngle(axis1,_local_5);
         birecym.x = _arg_4.x - _arg_2.x;
         birecym.y = _arg_4.y - _arg_2.y;
         birecym.z = _arg_4.z - _arg_2.z;
         var _local_6:Number = birecym.x * _arg_3.x + birecym.y * _arg_3.y + birecym.z * _arg_3.z;
         birecym.x -= _local_6 * _arg_3.x;
         birecym.y -= _local_6 * _arg_3.y;
         birecym.z -= _local_6 * _arg_3.z;
         birecym.normalize();
         jeli.transformVector(Vector3.Z_AXIS,nunug);
         _local_6 = nunug.x * birecym.x + nunug.y * birecym.y + nunug.z * birecym.z;
         kuz.x = nunug.y * birecym.z - nunug.z * birecym.y;
         kuz.y = nunug.z * birecym.x - nunug.x * birecym.z;
         kuz.z = nunug.x * birecym.y - nunug.y * birecym.x;
         kuz.normalize();
         _local_5 = Math.acos(_local_6);
         pyh.fromAxisAngle(kuz,_local_5);
         jeli.append(pyh);
         jeli.getEulerAngles(eulerAngles);
         _arg_1.rotationX = eulerAngles.x;
         _arg_1.rotationY = eulerAngles.y;
         _arg_1.rotationZ = eulerAngles.z;
         _arg_1.x = _arg_2.x;
         _arg_1.y = _arg_2.y;
         _arg_1.z = _arg_2.z;
      }
   }
}

