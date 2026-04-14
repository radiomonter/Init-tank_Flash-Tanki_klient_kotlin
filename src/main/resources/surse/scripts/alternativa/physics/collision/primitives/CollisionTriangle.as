package alternativa.physics.collision.primitives
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.types.AABB;
   
   public class CollisionTriangle extends CollisionShape
   {
      
      public var v0:Vector3 = new Vector3();
      
      public var v1:Vector3 = new Vector3();
      
      public var v2:Vector3 = new Vector3();
      
      public var e0:Vector3 = new Vector3();
      
      public var e1:Vector3 = new Vector3();
      
      public var e2:Vector3 = new Vector3();
      
      public function CollisionTriangle(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3, _arg_4:int, _arg_5:PhysicsMaterial)
      {
         super(TRIANGLE,_arg_4,_arg_5);
         this.initVertices(_arg_1,_arg_2,_arg_3);
      }
      
      override public function calculateAABB() : AABB
      {
         var _local_1:Number = NaN;
         var _local_2:Number = NaN;
         var _local_3:AABB = this.aabb;
         var _local_4:Matrix4 = this.transform;
         var _local_5:Number = 0.005;
         var _local_6:Number = _local_5 * _local_4.m02;
         var _local_7:Number = _local_5 * _local_4.m12;
         var _local_8:Number = _local_5 * _local_4.m22;
         _local_1 = this.v0.x * _local_4.m00 + this.v0.y * _local_4.m01;
         _local_3.minX = _local_3.maxX = _local_1 + _local_6;
         _local_2 = _local_1 - _local_6;
         if(_local_2 > _local_3.maxX)
         {
            _local_3.maxX = _local_2;
         }
         else if(_local_2 < _local_3.minX)
         {
            _local_3.minX = _local_2;
         }
         _local_1 = this.v0.x * _local_4.m10 + this.v0.y * _local_4.m11;
         _local_3.minY = _local_3.maxY = _local_1 + _local_7;
         _local_2 = _local_1 - _local_7;
         if(_local_2 > _local_3.maxY)
         {
            _local_3.maxY = _local_2;
         }
         else if(_local_2 < _local_3.minY)
         {
            _local_3.minY = _local_2;
         }
         _local_1 = this.v0.x * _local_4.m20 + this.v0.y * _local_4.m21;
         _local_3.minZ = _local_3.maxZ = _local_1 + _local_8;
         _local_2 = _local_1 - _local_8;
         if(_local_2 > _local_3.maxZ)
         {
            _local_3.maxZ = _local_2;
         }
         else if(_local_2 < _local_3.minZ)
         {
            _local_3.minZ = _local_2;
         }
         _local_1 = this.v1.x * _local_4.m00 + this.v1.y * _local_4.m01;
         _local_2 = _local_1 + _local_6;
         if(_local_2 > _local_3.maxX)
         {
            _local_3.maxX = _local_2;
         }
         else if(_local_2 < _local_3.minX)
         {
            _local_3.minX = _local_2;
         }
         _local_2 = _local_1 - _local_6;
         if(_local_2 > _local_3.maxX)
         {
            _local_3.maxX = _local_2;
         }
         else if(_local_2 < _local_3.minX)
         {
            _local_3.minX = _local_2;
         }
         _local_1 = this.v1.x * _local_4.m10 + this.v1.y * _local_4.m11;
         _local_2 = _local_1 + _local_7;
         if(_local_2 > _local_3.maxY)
         {
            _local_3.maxY = _local_2;
         }
         else if(_local_2 < _local_3.minY)
         {
            _local_3.minY = _local_2;
         }
         _local_2 = _local_1 - _local_7;
         if(_local_2 > _local_3.maxY)
         {
            _local_3.maxY = _local_2;
         }
         else if(_local_2 < _local_3.minY)
         {
            _local_3.minY = _local_2;
         }
         _local_1 = this.v1.x * _local_4.m20 + this.v1.y * _local_4.m21;
         _local_2 = _local_1 + _local_8;
         if(_local_2 > _local_3.maxZ)
         {
            _local_3.maxZ = _local_2;
         }
         else if(_local_2 < _local_3.minZ)
         {
            _local_3.minZ = _local_2;
         }
         _local_2 = _local_1 - _local_8;
         if(_local_2 > _local_3.maxZ)
         {
            _local_3.maxZ = _local_2;
         }
         else if(_local_2 < _local_3.minZ)
         {
            _local_3.minZ = _local_2;
         }
         _local_1 = this.v2.x * _local_4.m00 + this.v2.y * _local_4.m01;
         _local_2 = _local_1 + _local_6;
         if(_local_2 > _local_3.maxX)
         {
            _local_3.maxX = _local_2;
         }
         else if(_local_2 < _local_3.minX)
         {
            _local_3.minX = _local_2;
         }
         _local_2 = _local_1 - _local_6;
         if(_local_2 > _local_3.maxX)
         {
            _local_3.maxX = _local_2;
         }
         else if(_local_2 < _local_3.minX)
         {
            _local_3.minX = _local_2;
         }
         _local_1 = this.v2.x * _local_4.m10 + this.v2.y * _local_4.m11;
         _local_2 = _local_1 + _local_7;
         if(_local_2 > _local_3.maxY)
         {
            _local_3.maxY = _local_2;
         }
         else if(_local_2 < _local_3.minY)
         {
            _local_3.minY = _local_2;
         }
         _local_2 = _local_1 - _local_7;
         if(_local_2 > _local_3.maxY)
         {
            _local_3.maxY = _local_2;
         }
         else if(_local_2 < _local_3.minY)
         {
            _local_3.minY = _local_2;
         }
         _local_1 = this.v2.x * _local_4.m20 + this.v2.y * _local_4.m21;
         _local_2 = _local_1 + _local_8;
         if(_local_2 > _local_3.maxZ)
         {
            _local_3.maxZ = _local_2;
         }
         else if(_local_2 < _local_3.minZ)
         {
            _local_3.minZ = _local_2;
         }
         _local_2 = _local_1 - _local_8;
         if(_local_2 > _local_3.maxZ)
         {
            _local_3.maxZ = _local_2;
         }
         else if(_local_2 < _local_3.minZ)
         {
            _local_3.minZ = _local_2;
         }
         _local_3.minX += _local_4.m03;
         _local_3.maxX += _local_4.m03;
         _local_3.minY += _local_4.m13;
         _local_3.maxY += _local_4.m13;
         _local_3.minZ += _local_4.m23;
         _local_3.maxZ += _local_4.m23;
         return _local_3;
      }
      
      override public function raycast(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number, _arg_4:Vector3) : Number
      {
         var _local_5:Matrix4 = null;
         _local_5 = this.transform;
         var _local_6:Number = _arg_2.x * _local_5.m02 + _arg_2.y * _local_5.m12 + _arg_2.z * _local_5.m22;
         if(_local_6 < _arg_3 && _local_6 > -_arg_3)
         {
            return -1;
         }
         var _local_7:Number = _arg_1.x - _local_5.m03;
         var _local_8:Number = _arg_1.y - _local_5.m13;
         var _local_9:Number = _arg_1.z - _local_5.m23;
         var _local_10:Number = _local_7 * _local_5.m02 + _local_8 * _local_5.m12 + _local_9 * _local_5.m22;
         var _local_11:Number = -_local_10 / _local_6;
         if(_local_11 < 0)
         {
            return -1;
         }
         var _local_12:Number = _local_7 * _local_5.m00 + _local_8 * _local_5.m10 + _local_9 * _local_5.m20;
         var _local_13:Number = _local_7 * _local_5.m01 + _local_8 * _local_5.m11 + _local_9 * _local_5.m21;
         _local_7 = _local_12 + _local_11 * (_arg_2.x * _local_5.m00 + _arg_2.y * _local_5.m10 + _arg_2.z * _local_5.m20);
         _local_8 = _local_13 + _local_11 * (_arg_2.x * _local_5.m01 + _arg_2.y * _local_5.m11 + _arg_2.z * _local_5.m21);
         if(this.e0.x * (_local_8 - this.v0.y) - this.e0.y * (_local_7 - this.v0.x) < 0 || this.e1.x * (_local_8 - this.v1.y) - this.e1.y * (_local_7 - this.v1.x) < 0 || this.e2.x * (_local_8 - this.v2.y) - this.e2.y * (_local_7 - this.v2.x) < 0)
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
         return _local_11;
      }
      
      override public function copyFrom(_arg_1:CollisionShape) : CollisionShape
      {
         super.copyFrom(_arg_1);
         var _local_2:CollisionTriangle = _arg_1 as CollisionTriangle;
         if(_local_2 != null)
         {
            this.v0.copy(_local_2.v0);
            this.v1.copy(_local_2.v1);
            this.v2.copy(_local_2.v2);
            this.e0.copy(_local_2.e0);
            this.e1.copy(_local_2.e1);
            this.e2.copy(_local_2.e2);
         }
         return this;
      }
      
      override protected function createPrimitive() : CollisionShape
      {
         return new CollisionTriangle(this.v0,this.v1,this.v2,collisionGroup,material);
      }
      
      private function initVertices(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3) : void
      {
         this.v0.copy(_arg_1);
         this.v1.copy(_arg_2);
         this.v2.copy(_arg_3);
         this.e0.diff(_arg_2,_arg_1);
         this.e0.normalize();
         this.e1.diff(_arg_3,_arg_2);
         this.e1.normalize();
         this.e2.diff(_arg_1,_arg_3);
         this.e2.normalize();
      }
   }
}

