package alternativa.physics.collision.primitives
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.types.AABB;
   
   public class CollisionRect extends CollisionShape
   {
      
      private static const EPSILON:Number = 0.005;
      
      public var hs:Vector3 = new Vector3();
      
      public function CollisionRect(_arg_1:Vector3, _arg_2:int, _arg_3:PhysicsMaterial)
      {
         super(RECT,_arg_2,_arg_3);
         this.hs.copy(_arg_1);
      }
      
      override public function calculateAABB() : AABB
      {
         var _local_1:Matrix4 = null;
         _local_1 = null;
         _local_1 = transform;
         var _local_2:Number = _local_1.m00 < 0 ? Number(-_local_1.m00) : Number(_local_1.m00);
         var _local_3:Number = _local_1.m01 < 0 ? Number(-_local_1.m01) : Number(_local_1.m01);
         var _local_4:Number = _local_1.m02 < 0 ? Number(-_local_1.m02) : Number(_local_1.m02);
         var _local_5:AABB = this.aabb;
         _local_5.maxX = this.hs.x * _local_2 + this.hs.y * _local_3 + EPSILON * _local_4;
         _local_5.minX = -_local_5.maxX;
         _local_2 = _local_1.m10 < 0 ? Number(-_local_1.m10) : Number(_local_1.m10);
         _local_3 = _local_1.m11 < 0 ? Number(-_local_1.m11) : Number(_local_1.m11);
         _local_4 = _local_1.m12 < 0 ? Number(-_local_1.m12) : Number(_local_1.m12);
         _local_5.maxY = this.hs.x * _local_2 + this.hs.y * _local_3 + EPSILON * _local_4;
         _local_5.minY = -_local_5.maxY;
         _local_2 = _local_1.m20 < 0 ? Number(-_local_1.m20) : Number(_local_1.m20);
         _local_3 = _local_1.m21 < 0 ? Number(-_local_1.m21) : Number(_local_1.m21);
         _local_4 = _local_1.m22 < 0 ? Number(-_local_1.m22) : Number(_local_1.m22);
         _local_5.maxZ = this.hs.x * _local_2 + this.hs.y * _local_3 + EPSILON * _local_4;
         _local_5.minZ = -_local_5.maxZ;
         _local_5.minX += _local_1.m03;
         _local_5.maxX += _local_1.m03;
         _local_5.minY += _local_1.m13;
         _local_5.maxY += _local_1.m13;
         _local_5.minZ += _local_1.m23;
         _local_5.maxZ += _local_1.m23;
         return _local_5;
      }
      
      override public function copyFrom(_arg_1:CollisionShape) : CollisionShape
      {
         var _local_2:CollisionRect = _arg_1 as CollisionRect;
         if(_local_2 == null)
         {
            return this;
         }
         super.copyFrom(_local_2);
         this.hs.copy(_local_2.hs);
         return this;
      }
      
      override protected function createPrimitive() : CollisionShape
      {
         return new CollisionRect(this.hs,collisionGroup,material);
      }
      
      override public function raycast(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number, _arg_4:Vector3) : Number
      {
         var _local_5:Matrix4 = null;
         _local_5 = this.transform;
         var _local_6:Number = _arg_1.x - _local_5.m03;
         var _local_7:Number = _arg_1.y - _local_5.m13;
         var _local_8:Number = _arg_1.z - _local_5.m23;
         var _local_9:Number = _local_5.m00 * _local_6 + _local_5.m10 * _local_7 + _local_5.m20 * _local_8;
         var _local_10:Number = _local_5.m01 * _local_6 + _local_5.m11 * _local_7 + _local_5.m21 * _local_8;
         var _local_11:Number = _local_5.m02 * _local_6 + _local_5.m12 * _local_7 + _local_5.m22 * _local_8;
         _local_6 = _local_5.m00 * _arg_2.x + _local_5.m10 * _arg_2.y + _local_5.m20 * _arg_2.z;
         _local_7 = _local_5.m01 * _arg_2.x + _local_5.m11 * _arg_2.y + _local_5.m21 * _arg_2.z;
         _local_8 = _local_5.m02 * _arg_2.x + _local_5.m12 * _arg_2.y + _local_5.m22 * _arg_2.z;
         if(_local_8 > -_arg_3 && _local_8 < _arg_3)
         {
            return -1;
         }
         var _local_12:Number = -_local_11 / _local_8;
         if(_local_12 < 0)
         {
            return -1;
         }
         _local_9 += _local_6 * _local_12;
         _local_10 += _local_7 * _local_12;
         _local_11 = 0;
         if(_local_9 < -this.hs.x - _arg_3 || _local_9 > this.hs.x + _arg_3 || _local_10 < -this.hs.y - _arg_3 || _local_10 > this.hs.y + _arg_3)
         {
            return -1;
         }
         if(_arg_2.x * _local_5.m02 + _arg_2.y * _local_5.m12 + _arg_2.z * _local_5.m22 > 0)
         {
            _arg_4.x = -_local_5.m02;
            _arg_4.y = -_local_5.m12;
            _arg_4.z = -_local_5.m22;
         }
         else
         {
            _arg_4.x = _local_5.m02;
            _arg_4.y = _local_5.m12;
            _arg_4.z = _local_5.m22;
         }
         return _local_12;
      }
   }
}

