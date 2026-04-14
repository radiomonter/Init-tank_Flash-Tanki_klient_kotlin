package alternativa.physics.collision.colliders
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.Collider;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   
   public class BoxBoxCollider implements Collider
   {
      
      private static const _axis:Vector3 = new Vector3();
      
      private static const _axis10:Vector3 = new Vector3();
      
      private static const _axis11:Vector3 = new Vector3();
      
      private static const _axis12:Vector3 = new Vector3();
      
      private static const _axis20:Vector3 = new Vector3();
      
      private static const _axis21:Vector3 = new Vector3();
      
      private static const _axis22:Vector3 = new Vector3();
      
      private static const _vectorToBox:Vector3 = new Vector3();
      
      private static const faceVertices1:Vector.<Vertex> = Vector.<Vertex>([new Vertex(),new Vertex(),new Vertex(),new Vertex()]);
      
      private static const faceVertices2:Vector.<Vertex> = Vector.<Vertex>([new Vertex(),new Vertex(),new Vertex(),new Vertex()]);
      
      private static const _basisMatrix:Matrix4 = new Matrix4();
      
      private const minOverlapAxis:Vector3 = new Vector3();
      
      private var epsilon:Number;
      
      private var minOverlap:Number;
      
      public function BoxBoxCollider(_arg_1:Number)
      {
         super();
         this.epsilon = _arg_1;
      }
      
      public function getContacts(_arg_1:CollisionShape, _arg_2:CollisionShape, _arg_3:Vector.<ShapeContact>) : void
      {
         var _local_4:CollisionBox = null;
         var _local_5:CollisionBox = null;
         if(this.haveCollision(_arg_1,_arg_2))
         {
            _local_4 = CollisionBox(_arg_1);
            _local_5 = CollisionBox(_arg_2);
            this.findContacts(_local_4,_local_5,this.minOverlapAxis,_arg_3);
         }
      }
      
      public function haveCollision(_arg_1:CollisionShape, _arg_2:CollisionShape) : Boolean
      {
         var _local_3:CollisionBox = null;
         var _local_4:Matrix4 = null;
         var _local_5:Vector3 = null;
         this.minOverlap = 10000000000;
         _local_3 = CollisionBox(_arg_1);
         var _local_6:CollisionBox = CollisionBox(_arg_2);
         _local_4 = _local_3.transform;
         var _local_7:Matrix4 = _local_6.transform;
         _local_5 = _vectorToBox;
         _local_5.x = _local_4.m03 - _local_7.m03;
         _local_5.y = _local_4.m13 - _local_7.m13;
         _local_5.z = _local_4.m23 - _local_7.m23;
         _axis10.x = _local_4.m00;
         _axis10.y = _local_4.m10;
         _axis10.z = _local_4.m20;
         if(!this.testOverlapOnMainAxis(_local_3,_local_6,_axis10,_local_5))
         {
            return false;
         }
         _axis11.x = _local_4.m01;
         _axis11.y = _local_4.m11;
         _axis11.z = _local_4.m21;
         if(!this.testOverlapOnMainAxis(_local_3,_local_6,_axis11,_local_5))
         {
            return false;
         }
         _axis12.x = _local_4.m02;
         _axis12.y = _local_4.m12;
         _axis12.z = _local_4.m22;
         if(!this.testOverlapOnMainAxis(_local_3,_local_6,_axis12,_local_5))
         {
            return false;
         }
         _axis20.x = _local_7.m00;
         _axis20.y = _local_7.m10;
         _axis20.z = _local_7.m20;
         if(!this.testOverlapOnMainAxis(_local_3,_local_6,_axis20,_local_5))
         {
            return false;
         }
         _axis21.x = _local_7.m01;
         _axis21.y = _local_7.m11;
         _axis21.z = _local_7.m21;
         if(!this.testOverlapOnMainAxis(_local_3,_local_6,_axis21,_local_5))
         {
            return false;
         }
         _axis22.x = _local_7.m02;
         _axis22.y = _local_7.m12;
         _axis22.z = _local_7.m22;
         if(!this.testOverlapOnMainAxis(_local_3,_local_6,_axis22,_local_5))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_local_3,_local_6,_axis10,_axis20,_local_5))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_local_3,_local_6,_axis10,_axis21,_local_5))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_local_3,_local_6,_axis10,_axis22,_local_5))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_local_3,_local_6,_axis11,_axis20,_local_5))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_local_3,_local_6,_axis11,_axis21,_local_5))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_local_3,_local_6,_axis11,_axis22,_local_5))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_local_3,_local_6,_axis12,_axis20,_local_5))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_local_3,_local_6,_axis12,_axis21,_local_5))
         {
            return false;
         }
         return this.testOverlapOnDerivedAxis(_local_3,_local_6,_axis12,_axis22,_local_5);
      }
      
      private function testOverlapOnMainAxis(_arg_1:CollisionBox, _arg_2:CollisionBox, _arg_3:Vector3, _arg_4:Vector3) : Boolean
      {
         var _local_5:Number = this.getOverlapOnAxis(_arg_1,_arg_2,_arg_3,_arg_4);
         return this.registerOverlap(_local_5,_arg_3);
      }
      
      private function testOverlapOnDerivedAxis(_arg_1:CollisionBox, _arg_2:CollisionBox, _arg_3:Vector3, _arg_4:Vector3, _arg_5:Vector3) : Boolean
      {
         var _local_6:Vector3 = null;
         var _local_7:Number = NaN;
         _local_6 = _axis;
         _local_6.x = _arg_3.y * _arg_4.z - _arg_3.z * _arg_4.y;
         _local_6.y = _arg_3.z * _arg_4.x - _arg_3.x * _arg_4.z;
         _local_6.z = _arg_3.x * _arg_4.y - _arg_3.y * _arg_4.x;
         var _local_8:Number = _local_6.x * _local_6.x + _local_6.y * _local_6.y + _local_6.z * _local_6.z;
         if(_local_8 < 1e-10)
         {
            return true;
         }
         _local_7 = 1 / Math.sqrt(_local_8);
         _local_6.x *= _local_7;
         _local_6.y *= _local_7;
         _local_6.z *= _local_7;
         var _local_9:Number = this.getOverlapOnAxis(_arg_1,_arg_2,_local_6,_arg_5);
         return this.registerOverlap(_local_9,_local_6);
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
      
      public function getOverlapOnAxis(_arg_1:CollisionBox, _arg_2:CollisionBox, _arg_3:Vector3, _arg_4:Vector3) : Number
      {
         var _local_5:Matrix4 = _arg_1.transform;
         var _local_6:Number = (_local_5.m00 * _arg_3.x + _local_5.m10 * _arg_3.y + _local_5.m20 * _arg_3.z) * _arg_1.hs.x;
         if(_local_6 < 0)
         {
            _local_6 = -_local_6;
         }
         var _local_7:Number = _local_6;
         _local_6 = (_local_5.m01 * _arg_3.x + _local_5.m11 * _arg_3.y + _local_5.m21 * _arg_3.z) * _arg_1.hs.y;
         if(_local_6 < 0)
         {
            _local_6 = -_local_6;
         }
         _local_7 += _local_6;
         _local_6 = (_local_5.m02 * _arg_3.x + _local_5.m12 * _arg_3.y + _local_5.m22 * _arg_3.z) * _arg_1.hs.z;
         if(_local_6 < 0)
         {
            _local_6 = -_local_6;
         }
         _local_7 += _local_6;
         _local_5 = _arg_2.transform;
         _local_6 = (_local_5.m00 * _arg_3.x + _local_5.m10 * _arg_3.y + _local_5.m20 * _arg_3.z) * _arg_2.hs.x;
         if(_local_6 < 0)
         {
            _local_6 = -_local_6;
         }
         _local_7 += _local_6;
         _local_6 = (_local_5.m01 * _arg_3.x + _local_5.m11 * _arg_3.y + _local_5.m21 * _arg_3.z) * _arg_2.hs.y;
         if(_local_6 < 0)
         {
            _local_6 = -_local_6;
         }
         _local_7 += _local_6;
         _local_6 = (_local_5.m02 * _arg_3.x + _local_5.m12 * _arg_3.y + _local_5.m22 * _arg_3.z) * _arg_2.hs.z;
         if(_local_6 < 0)
         {
            _local_6 = -_local_6;
         }
         _local_7 += _local_6;
         _local_6 = _arg_4.x * _arg_3.x + _arg_4.y * _arg_3.y + _arg_4.z * _arg_3.z;
         if(_local_6 < 0)
         {
            _local_6 = -_local_6;
         }
         return _local_7 - _local_6;
      }
      
      private function findContacts(_arg_1:CollisionBox, _arg_2:CollisionBox, _arg_3:Vector3, _arg_4:Vector.<ShapeContact>) : void
      {
         var _local_5:Matrix4 = _arg_1.transform;
         var _local_6:Matrix4 = _arg_2.transform;
         var _local_7:Vector3 = _vectorToBox;
         _local_7.x = _local_5.m03 - _local_6.m03;
         _local_7.y = _local_5.m13 - _local_6.m13;
         _local_7.z = _local_5.m23 - _local_6.m23;
         if(_arg_3.x * _local_7.x + _arg_3.y * _local_7.y + _arg_3.z * _local_7.z < 0)
         {
            _arg_3.x = -_arg_3.x;
            _arg_3.y = -_arg_3.y;
            _arg_3.z = -_arg_3.z;
         }
         var _local_8:Matrix4 = _basisMatrix;
         ColliderUtils.buildContactBasis(_arg_3,_local_5,_local_6,_local_8);
         ColliderUtils.getBoxFaceVerticesInCCWOrder(_arg_1,_arg_3,FaceSide.BACK,faceVertices1);
         ColliderUtils.getBoxFaceVerticesInCCWOrder(_arg_2,_arg_3,FaceSide.FRONT,faceVertices2);
         ColliderUtils.transformFaceToReferenceSpace(_local_8,_arg_1.transform,faceVertices1,4);
         ColliderUtils.transformFaceToReferenceSpace(_local_8,_arg_2.transform,faceVertices2,4);
         PolygonsIntersectionUtils.findContacts(_arg_1,faceVertices1,4,_arg_2,faceVertices2,4,_local_8,_arg_4);
      }
   }
}

