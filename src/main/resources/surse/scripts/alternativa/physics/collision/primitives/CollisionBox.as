package alternativa.physics.collision.primitives
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.types.AABB;
   
   public class CollisionBox extends CollisionShape
   {
      
      public var hs:Vector3 = new Vector3();
      
      public function CollisionBox(_arg_1:Vector3, _arg_2:int, _arg_3:PhysicsMaterial)
      {
         super(BOX,_arg_2,_arg_3);
         this.hs.copy(_arg_1);
      }
      
      override public function calculateAABB() : AABB
      {
         var _local_1:Matrix4 = null;
         var _local_2:AABB = null;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         _local_1 = transform;
         _local_2 = this.aabb;
         _local_3 = _local_1.m00 < 0 ? Number(-_local_1.m00) : Number(_local_1.m00);
         _local_4 = _local_1.m01 < 0 ? Number(-_local_1.m01) : Number(_local_1.m01);
         _local_5 = _local_1.m02 < 0 ? Number(-_local_1.m02) : Number(_local_1.m02);
         _local_2.maxX = this.hs.x * _local_3 + this.hs.y * _local_4 + this.hs.z * _local_5;
         _local_2.minX = -_local_2.maxX;
         _local_3 = _local_1.m10 < 0 ? Number(-_local_1.m10) : Number(_local_1.m10);
         _local_4 = _local_1.m11 < 0 ? Number(-_local_1.m11) : Number(_local_1.m11);
         _local_5 = _local_1.m12 < 0 ? Number(-_local_1.m12) : Number(_local_1.m12);
         _local_2.maxY = this.hs.x * _local_3 + this.hs.y * _local_4 + this.hs.z * _local_5;
         _local_2.minY = -_local_2.maxY;
         _local_3 = _local_1.m20 < 0 ? Number(-_local_1.m20) : Number(_local_1.m20);
         _local_4 = _local_1.m21 < 0 ? Number(-_local_1.m21) : Number(_local_1.m21);
         _local_5 = _local_1.m22 < 0 ? Number(-_local_1.m22) : Number(_local_1.m22);
         _local_2.maxZ = this.hs.x * _local_3 + this.hs.y * _local_4 + this.hs.z * _local_5;
         _local_2.minZ = -_local_2.maxZ;
         _local_2.minX += _local_1.m03;
         _local_2.maxX += _local_1.m03;
         _local_2.minY += _local_1.m13;
         _local_2.maxY += _local_1.m13;
         _local_2.minZ += _local_1.m23;
         _local_2.maxZ += _local_1.m23;
         return _local_2;
      }
      
      override public function copyFrom(_arg_1:CollisionShape) : CollisionShape
      {
         var _local_2:CollisionBox = _arg_1 as CollisionBox;
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
         return new CollisionBox(this.hs,collisionGroup,material);
      }
      
      override public function raycast(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number, _arg_4:Vector3) : Number
      {
         var _local_5:Number = NaN;
         var _local_6:Number = NaN;
         var _local_7:Matrix4 = this.transform;
         var _local_8:Number = -1;
         var _local_9:Number = 1e+308;
         var _local_10:Number = _arg_1.x - _local_7.m03;
         var _local_11:Number = _arg_1.y - _local_7.m13;
         var _local_12:Number = _arg_1.z - _local_7.m23;
         var _local_13:Number = _local_7.m00 * _local_10 + _local_7.m10 * _local_11 + _local_7.m20 * _local_12;
         var _local_14:Number = _local_7.m01 * _local_10 + _local_7.m11 * _local_11 + _local_7.m21 * _local_12;
         var _local_15:Number = _local_7.m02 * _local_10 + _local_7.m12 * _local_11 + _local_7.m22 * _local_12;
         _local_10 = _local_7.m00 * _arg_2.x + _local_7.m10 * _arg_2.y + _local_7.m20 * _arg_2.z;
         _local_11 = _local_7.m01 * _arg_2.x + _local_7.m11 * _arg_2.y + _local_7.m21 * _arg_2.z;
         _local_12 = _local_7.m02 * _arg_2.x + _local_7.m12 * _arg_2.y + _local_7.m22 * _arg_2.z;
         if(_local_10 < _arg_3 && _local_10 > -_arg_3)
         {
            if(_local_13 < -this.hs.x || _local_13 > this.hs.x)
            {
               return -1;
            }
         }
         else
         {
            _local_5 = (-this.hs.x - _local_13) / _local_10;
            _local_6 = (this.hs.x - _local_13) / _local_10;
            if(_local_5 < _local_6)
            {
               if(_local_5 > _local_8)
               {
                  _local_8 = _local_5;
                  _arg_4.x = -1;
                  _arg_4.y = _arg_4.z = 0;
               }
               if(_local_6 < _local_9)
               {
                  _local_9 = _local_6;
               }
            }
            else
            {
               if(_local_6 > _local_8)
               {
                  _local_8 = _local_6;
                  _arg_4.x = 1;
                  _arg_4.y = _arg_4.z = 0;
               }
               if(_local_5 < _local_9)
               {
                  _local_9 = _local_5;
               }
            }
            if(_local_9 < _local_8)
            {
               return -1;
            }
         }
         if(_local_11 < _arg_3 && _local_11 > -_arg_3)
         {
            if(_local_14 < -this.hs.y || _local_14 > this.hs.y)
            {
               return -1;
            }
         }
         else
         {
            _local_5 = (-this.hs.y - _local_14) / _local_11;
            _local_6 = (this.hs.y - _local_14) / _local_11;
            if(_local_5 < _local_6)
            {
               if(_local_5 > _local_8)
               {
                  _local_8 = _local_5;
                  _arg_4.y = -1;
                  _arg_4.x = _arg_4.z = 0;
               }
               if(_local_6 < _local_9)
               {
                  _local_9 = _local_6;
               }
            }
            else
            {
               if(_local_6 > _local_8)
               {
                  _local_8 = _local_6;
                  _arg_4.y = 1;
                  _arg_4.x = _arg_4.z = 0;
               }
               if(_local_5 < _local_9)
               {
                  _local_9 = _local_5;
               }
            }
            if(_local_9 < _local_8)
            {
               return -1;
            }
         }
         if(_local_12 < _arg_3 && _local_12 > -_arg_3)
         {
            if(_local_15 < -this.hs.z || _local_15 > this.hs.z)
            {
               return -1;
            }
         }
         else
         {
            _local_5 = (-this.hs.z - _local_15) / _local_12;
            _local_6 = (this.hs.z - _local_15) / _local_12;
            if(_local_5 < _local_6)
            {
               if(_local_5 > _local_8)
               {
                  _local_8 = _local_5;
                  _arg_4.z = -1;
                  _arg_4.x = _arg_4.y = 0;
               }
               if(_local_6 < _local_9)
               {
                  _local_9 = _local_6;
               }
            }
            else
            {
               if(_local_6 > _local_8)
               {
                  _local_8 = _local_6;
                  _arg_4.z = 1;
                  _arg_4.x = _arg_4.y = 0;
               }
               if(_local_5 < _local_9)
               {
                  _local_9 = _local_5;
               }
            }
            if(_local_9 < _local_8)
            {
               return -1;
            }
         }
         _local_10 = _arg_4.x;
         _local_11 = _arg_4.y;
         _local_12 = _arg_4.z;
         _arg_4.x = _local_7.m00 * _local_10 + _local_7.m01 * _local_11 + _local_7.m02 * _local_12;
         _arg_4.y = _local_7.m10 * _local_10 + _local_7.m11 * _local_11 + _local_7.m12 * _local_12;
         _arg_4.z = _local_7.m20 * _local_10 + _local_7.m21 * _local_11 + _local_7.m22 * _local_12;
         return _local_8;
      }
   }
}

