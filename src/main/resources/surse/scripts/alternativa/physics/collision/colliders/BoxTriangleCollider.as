package alternativa.physics.collision.colliders
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.Collider;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.primitives.CollisionTriangle;
   
   public class BoxTriangleCollider implements Collider
   {
      
      private const toBox:Vector3 = new Vector3();
      
      private const axis:Vector3 = new Vector3();
      
      private const axis10:Vector3 = new Vector3();
      
      private const axis11:Vector3 = new Vector3();
      
      private const axis12:Vector3 = new Vector3();
      
      private const axis20:Vector3 = new Vector3();
      
      private const axis21:Vector3 = new Vector3();
      
      private const axis22:Vector3 = new Vector3();
      
      private const minOverlapAxis:Vector3 = new Vector3();
      
      private const _basisMatrix:Matrix4 = new Matrix4();
      
      private const boxFaceVertices:Vector.<Vertex> = Vector.<Vertex>([new Vertex(),new Vertex(),new Vertex(),new Vertex()]);
      
      private const triFaceVertices:Vector.<Vertex> = Vector.<Vertex>([new Vertex(),new Vertex(),new Vertex()]);
      
      public var epsilon:Number;
      
      private var minOverlap:Number;
      
      public function BoxTriangleCollider(_arg_1:Number)
      {
         super();
         this.epsilon = _arg_1;
      }
      
      public function getContacts(_arg_1:CollisionShape, _arg_2:CollisionShape, _arg_3:Vector.<ShapeContact>) : void
      {
         var _local_4:CollisionTriangle = null;
         var _local_5:CollisionBox = null;
         if(!this.haveCollision(_arg_1,_arg_2))
         {
            return;
         }
         if(_arg_1 is CollisionBox)
         {
            _local_5 = CollisionBox(_arg_1);
            _local_4 = CollisionTriangle(_arg_2);
         }
         else
         {
            _local_5 = CollisionBox(_arg_2);
            _local_4 = CollisionTriangle(_arg_1);
         }
         this.findContacts(_local_5,_local_4,this.minOverlapAxis,_arg_3);
      }
      
      public function haveCollision(_arg_1:CollisionShape, _arg_2:CollisionShape) : Boolean
      {
         var _local_3:CollisionTriangle = null;
         var _local_4:CollisionBox = null;
         var _local_5:Matrix4 = null;
         var _local_6:Matrix4 = null;
         var _local_7:Vector3 = null;
         if(_arg_1 is CollisionBox)
         {
            _local_4 = CollisionBox(_arg_1);
            _local_3 = CollisionTriangle(_arg_2);
         }
         else
         {
            _local_4 = CollisionBox(_arg_2);
            _local_3 = CollisionTriangle(_arg_1);
         }
         _local_5 = _local_4.transform;
         _local_6 = _local_3.transform;
         this.toBox.x = _local_5.m03 - _local_6.m03;
         this.toBox.y = _local_5.m13 - _local_6.m13;
         this.toBox.z = _local_5.m23 - _local_6.m23;
         this.minOverlap = 10000000000;
         this.axis.x = _local_6.m02;
         this.axis.y = _local_6.m12;
         this.axis.z = _local_6.m22;
         if(!this.testOverlapOnMainAxis(_local_4,_local_3,this.axis,this.toBox))
         {
            return false;
         }
         this.axis10.x = _local_5.m00;
         this.axis10.y = _local_5.m10;
         this.axis10.z = _local_5.m20;
         if(!this.testOverlapOnMainAxis(_local_4,_local_3,this.axis10,this.toBox))
         {
            return false;
         }
         this.axis11.x = _local_5.m01;
         this.axis11.y = _local_5.m11;
         this.axis11.z = _local_5.m21;
         if(!this.testOverlapOnMainAxis(_local_4,_local_3,this.axis11,this.toBox))
         {
            return false;
         }
         this.axis12.x = _local_5.m02;
         this.axis12.y = _local_5.m12;
         this.axis12.z = _local_5.m22;
         if(!this.testOverlapOnMainAxis(_local_4,_local_3,this.axis12,this.toBox))
         {
            return false;
         }
         _local_7 = _local_3.e0;
         this.axis20.x = _local_6.m00 * _local_7.x + _local_6.m01 * _local_7.y + _local_6.m02 * _local_7.z;
         this.axis20.y = _local_6.m10 * _local_7.x + _local_6.m11 * _local_7.y + _local_6.m12 * _local_7.z;
         this.axis20.z = _local_6.m20 * _local_7.x + _local_6.m21 * _local_7.y + _local_6.m22 * _local_7.z;
         if(!this.testOverlapOnDerivedAxis(_local_4,_local_3,this.axis10,this.axis20,this.toBox))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_local_4,_local_3,this.axis11,this.axis20,this.toBox))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_local_4,_local_3,this.axis12,this.axis20,this.toBox))
         {
            return false;
         }
         _local_7 = _local_3.e1;
         this.axis21.x = _local_6.m00 * _local_7.x + _local_6.m01 * _local_7.y + _local_6.m02 * _local_7.z;
         this.axis21.y = _local_6.m10 * _local_7.x + _local_6.m11 * _local_7.y + _local_6.m12 * _local_7.z;
         this.axis21.z = _local_6.m20 * _local_7.x + _local_6.m21 * _local_7.y + _local_6.m22 * _local_7.z;
         if(!this.testOverlapOnDerivedAxis(_local_4,_local_3,this.axis10,this.axis21,this.toBox))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_local_4,_local_3,this.axis11,this.axis21,this.toBox))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_local_4,_local_3,this.axis12,this.axis21,this.toBox))
         {
            return false;
         }
         _local_7 = _local_3.e2;
         this.axis22.x = _local_6.m00 * _local_7.x + _local_6.m01 * _local_7.y + _local_6.m02 * _local_7.z;
         this.axis22.y = _local_6.m10 * _local_7.x + _local_6.m11 * _local_7.y + _local_6.m12 * _local_7.z;
         this.axis22.z = _local_6.m20 * _local_7.x + _local_6.m21 * _local_7.y + _local_6.m22 * _local_7.z;
         if(!this.testOverlapOnDerivedAxis(_local_4,_local_3,this.axis10,this.axis22,this.toBox))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_local_4,_local_3,this.axis11,this.axis22,this.toBox))
         {
            return false;
         }
         return this.testOverlapOnDerivedAxis(_local_4,_local_3,this.axis12,this.axis22,this.toBox);
      }
      
      private function testOverlapOnMainAxis(_arg_1:CollisionBox, _arg_2:CollisionTriangle, _arg_3:Vector3, _arg_4:Vector3) : Boolean
      {
         var _local_5:Number = this.getOverlapOnAxis(_arg_1,_arg_2,_arg_3,_arg_4);
         return this.registerOverlap(_local_5,_arg_3);
      }
      
      private function registerOverlap(_arg_1:Number, _arg_2:Vector3) : Boolean
      {
         if(_arg_1 < this.epsilon)
         {
            return false;
         }
         if(_arg_1 + this.epsilon < this.minOverlap)
         {
            this.minOverlap = _arg_1;
            this.minOverlapAxis.x = _arg_2.x;
            this.minOverlapAxis.y = _arg_2.y;
            this.minOverlapAxis.z = _arg_2.z;
         }
         return true;
      }
      
      private function testOverlapOnDerivedAxis(_arg_1:CollisionBox, _arg_2:CollisionTriangle, _arg_3:Vector3, _arg_4:Vector3, _arg_5:Vector3) : Boolean
      {
         var _local_6:Number = NaN;
         this.axis.x = _arg_3.y * _arg_4.z - _arg_3.z * _arg_4.y;
         this.axis.y = _arg_3.z * _arg_4.x - _arg_3.x * _arg_4.z;
         this.axis.z = _arg_3.x * _arg_4.y - _arg_3.y * _arg_4.x;
         var _local_7:Number = this.axis.x * this.axis.x + this.axis.y * this.axis.y + this.axis.z * this.axis.z;
         if(_local_7 < 1e-10)
         {
            return true;
         }
         _local_6 = 1 / Math.sqrt(_local_7);
         this.axis.x *= _local_6;
         this.axis.y *= _local_6;
         this.axis.z *= _local_6;
         var _local_8:Number = this.getOverlapOnAxis(_arg_1,_arg_2,this.axis,_arg_5);
         return this.registerOverlap(_local_8,this.axis);
      }
      
      private function getOverlapOnAxis(_arg_1:CollisionBox, _arg_2:CollisionTriangle, _arg_3:Vector3, _arg_4:Vector3) : Number
      {
         var _local_5:Number = NaN;
         var _local_6:Matrix4 = _arg_1.transform;
         var _local_7:Vector3 = _arg_1.hs;
         var _local_8:Number = 0;
         _local_5 = (_local_6.m00 * _arg_3.x + _local_6.m10 * _arg_3.y + _local_6.m20 * _arg_3.z) * _local_7.x;
         if(_local_5 < 0)
         {
            _local_8 -= _local_5;
         }
         else
         {
            _local_8 += _local_5;
         }
         _local_5 = (_local_6.m01 * _arg_3.x + _local_6.m11 * _arg_3.y + _local_6.m21 * _arg_3.z) * _local_7.y;
         if(_local_5 < 0)
         {
            _local_8 -= _local_5;
         }
         else
         {
            _local_8 += _local_5;
         }
         _local_5 = (_local_6.m02 * _arg_3.x + _local_6.m12 * _arg_3.y + _local_6.m22 * _arg_3.z) * _local_7.z;
         if(_local_5 < 0)
         {
            _local_8 -= _local_5;
         }
         else
         {
            _local_8 += _local_5;
         }
         var _local_9:Number = _arg_4.x * _arg_3.x + _arg_4.y * _arg_3.y + _arg_4.z * _arg_3.z;
         var _local_10:Matrix4 = _arg_2.transform;
         var _local_11:Number = _local_10.m00 * _arg_3.x + _local_10.m10 * _arg_3.y + _local_10.m20 * _arg_3.z;
         var _local_12:Number = _local_10.m01 * _arg_3.x + _local_10.m11 * _arg_3.y + _local_10.m21 * _arg_3.z;
         var _local_13:Number = _local_10.m02 * _arg_3.x + _local_10.m12 * _arg_3.y + _local_10.m22 * _arg_3.z;
         var _local_14:Number = 0;
         var _local_15:Vector3 = _arg_2.v0;
         var _local_16:Vector3 = _arg_2.v1;
         var _local_17:Vector3 = _arg_2.v2;
         if(_local_9 < 0)
         {
            _local_9 = -_local_9;
            _local_5 = _local_15.x * _local_11 + _local_15.y * _local_12 + _local_15.z * _local_13;
            if(_local_5 < _local_14)
            {
               _local_14 = _local_5;
            }
            _local_5 = _local_16.x * _local_11 + _local_16.y * _local_12 + _local_16.z * _local_13;
            if(_local_5 < _local_14)
            {
               _local_14 = _local_5;
            }
            _local_5 = _local_17.x * _local_11 + _local_17.y * _local_12 + _local_17.z * _local_13;
            if(_local_5 < _local_14)
            {
               _local_14 = _local_5;
            }
            _local_14 = -_local_14;
         }
         else
         {
            _local_5 = _local_15.x * _local_11 + _local_15.y * _local_12 + _local_15.z * _local_13;
            if(_local_5 > _local_14)
            {
               _local_14 = _local_5;
            }
            _local_5 = _local_16.x * _local_11 + _local_16.y * _local_12 + _local_16.z * _local_13;
            if(_local_5 > _local_14)
            {
               _local_14 = _local_5;
            }
            _local_5 = _local_17.x * _local_11 + _local_17.y * _local_12 + _local_17.z * _local_13;
            if(_local_5 > _local_14)
            {
               _local_14 = _local_5;
            }
         }
         return _local_8 + _local_14 - _local_9;
      }
      
      private function findContacts(_arg_1:CollisionBox, _arg_2:CollisionTriangle, _arg_3:Vector3, _arg_4:Vector.<ShapeContact>) : void
      {
         var _local_5:Matrix4 = null;
         var _local_6:Vector3 = null;
         var _local_7:ShapeContact = null;
         var _local_8:Vector3 = null;
         var _local_9:Number = NaN;
         var _local_10:Number = NaN;
         var _local_11:Number = NaN;
         var _local_12:Matrix4 = _arg_1.transform;
         _local_5 = _arg_2.transform;
         _local_6 = this.toBox;
         _local_6.x = _local_12.m03 - _local_5.m03;
         _local_6.y = _local_12.m13 - _local_5.m13;
         _local_6.z = _local_12.m23 - _local_5.m23;
         if(_arg_3.x * _local_6.x + _arg_3.y * _local_6.y + _arg_3.z * _local_6.z < 0)
         {
            _arg_3.x = -_arg_3.x;
            _arg_3.y = -_arg_3.y;
            _arg_3.z = -_arg_3.z;
         }
         var _local_13:Matrix4 = this._basisMatrix;
         ColliderUtils.buildContactBasis(_arg_3,_local_12,_local_5,_local_13);
         ColliderUtils.getBoxFaceVerticesInCCWOrder(_arg_1,_arg_3,FaceSide.BACK,this.boxFaceVertices);
         ColliderUtils.getTriangleFaceInCCWOrder(_arg_2,_arg_3,this.triFaceVertices);
         ColliderUtils.transformFaceToReferenceSpace(_local_13,_local_12,this.boxFaceVertices,4);
         ColliderUtils.transformFaceToReferenceSpace(_local_13,_local_5,this.triFaceVertices,3);
         var _local_14:int = int(_arg_4.length);
         PolygonsIntersectionUtils.findContacts(_arg_1,this.boxFaceVertices,4,_arg_2,this.triFaceVertices,3,_local_13,_arg_4);
         var _local_15:int = int(_arg_4.length);
         var _local_16:int = _local_14;
         while(_local_16 < _local_15)
         {
            _local_7 = _arg_4[_local_16];
            _local_8 = _local_7.normal;
            _local_9 = _local_5.m02;
            _local_10 = _local_5.m12;
            _local_11 = _local_5.m22;
            if(_local_8.x * _local_9 + _local_8.y * _local_10 + _local_8.z * _local_11 < 0)
            {
               _local_7.dispose();
               _local_15--;
               _arg_4[_local_16] = _arg_4[_local_15];
               _arg_4[_local_15] = null;
               _local_16--;
            }
            _local_16++;
         }
         if(_local_15 < _arg_4.length)
         {
            _arg_4.length = _local_15;
         }
      }
   }
}

