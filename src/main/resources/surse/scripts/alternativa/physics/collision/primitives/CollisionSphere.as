package alternativa.physics.collision.primitives
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.types.AABB;
   
   public class CollisionSphere extends CollisionShape
   {
      
      public var r:Number = 0;
      
      public function CollisionSphere(_arg_1:Number, _arg_2:int, _arg_3:PhysicsMaterial)
      {
         super(SPHERE,_arg_2,_arg_3);
         this.r = _arg_1;
      }
      
      override public function calculateAABB() : AABB
      {
         var _local_1:AABB = null;
         var _local_2:Matrix4 = null;
         _local_1 = null;
         _local_2 = null;
         _local_1 = this.aabb;
         _local_2 = this.transform;
         _local_1.maxX = _local_2.m03 + this.r;
         _local_1.minX = _local_2.m03 - this.r;
         _local_1.maxY = _local_2.m13 + this.r;
         _local_1.minY = _local_2.m13 - this.r;
         _local_1.maxZ = _local_2.m23 + this.r;
         _local_1.minZ = _local_2.m23 - this.r;
         return _local_1;
      }
      
      override public function raycast(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number, _arg_4:Vector3) : Number
      {
         var _local_5:Matrix4 = this.transform;
         var _local_6:Number = _arg_1.x - _local_5.m03;
         var _local_7:Number = _arg_1.y - _local_5.m13;
         var _local_8:Number = _arg_1.z - _local_5.m23;
         var _local_9:Number = _arg_2.x * _local_6 + _arg_2.y * _local_7 + _arg_2.z * _local_8;
         if(_local_9 > 0)
         {
            return -1;
         }
         var _local_10:Number = _arg_2.x * _arg_2.x + _arg_2.y * _arg_2.y + _arg_2.z * _arg_2.z;
         var _local_11:Number = _local_9 * _local_9 - _local_10 * (_local_6 * _local_6 + _local_7 * _local_7 + _local_8 * _local_8 - this.r * this.r);
         if(_local_11 < 0)
         {
            return -1;
         }
         return -(_local_9 + Math.sqrt(_local_11)) / _local_10;
      }
      
      override public function copyFrom(_arg_1:CollisionShape) : CollisionShape
      {
         var _local_2:CollisionSphere = _arg_1 as CollisionSphere;
         if(_local_2 == null)
         {
            return this;
         }
         super.copyFrom(_local_2);
         this.r = _local_2.r;
         return this;
      }
      
      override protected function createPrimitive() : CollisionShape
      {
         return new CollisionSphere(this.r,collisionGroup,material);
      }
   }
}

