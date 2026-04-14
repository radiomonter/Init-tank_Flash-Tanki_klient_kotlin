package alternativa.physics
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   
   public class PhysicsUtils
   {
      
      public function PhysicsUtils()
      {
         super();
      }
      
      public static function setBoxInvInertia(_arg_1:Number, _arg_2:Vector3, _arg_3:Matrix3) : void
      {
         if(_arg_1 <= 0)
         {
            throw new ArgumentError();
         }
         _arg_3.copy(Matrix3.ZERO);
         if(_arg_1 == Infinity)
         {
            return;
         }
         var _local_4:Number = _arg_2.x * _arg_2.x;
         var _local_5:Number = _arg_2.y * _arg_2.y;
         var _local_6:Number = _arg_2.z * _arg_2.z;
         _arg_3.m00 = 3 / (_arg_1 * (_local_5 + _local_6));
         _arg_3.m11 = 3 / (_arg_1 * (_local_6 + _local_4));
         _arg_3.m22 = 3 / (_arg_1 * (_local_4 + _local_5));
      }
      
      public static function getCylinderInvInertia(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Matrix3) : void
      {
         if(_arg_1 <= 0)
         {
            throw new ArgumentError();
         }
         _arg_4.copy(Matrix3.ZERO);
         if(_arg_1 == Infinity)
         {
            return;
         }
         _arg_4.m00 = _arg_4.m11 = 1 / (_arg_1 * (_arg_3 * _arg_3 / 12 + _arg_2 * _arg_2 / 4));
         _arg_4.m22 = 2 / (_arg_1 * _arg_2 * _arg_2);
      }
   }
}

