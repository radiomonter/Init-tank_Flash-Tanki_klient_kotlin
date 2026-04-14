package alternativa.physics.collision.colliders
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.Collider;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.primitives.CollisionRect;
   
   public class BoxRectCollider implements Collider
   {
      
      private static const boxFaceVertices:Vector.<Vertex> = Vector.<Vertex>([new Vertex(),new Vertex(),new Vertex(),new Vertex()]);
      
      private static const rectFaceVertices:Vector.<Vertex> = Vector.<Vertex>([new Vertex(),new Vertex(),new Vertex(),new Vertex()]);
      
      private static const _basisMatrix:Matrix4 = new Matrix4();
      
      private const _vectorToBox:Vector3 = new Vector3();
      
      private const _axis:Vector3 = new Vector3();
      
      private const axis10:Vector3 = new Vector3();
      
      private const axis11:Vector3 = new Vector3();
      
      private const axis12:Vector3 = new Vector3();
      
      private const axis20:Vector3 = new Vector3();
      
      private const axis21:Vector3 = new Vector3();
      
      private const axis22:Vector3 = new Vector3();
      
      private const minOverlapAxis:Vector3 = new Vector3();
      
      private var minOverlap:Number;
      
      private var epsilon:Number;
      
      public function BoxRectCollider(_arg_1:Number)
      {
         super();
         this.epsilon = _arg_1;
      }
      
      public function getContacts(_arg_1:CollisionShape, _arg_2:CollisionShape, _arg_3:Vector.<ShapeContact>) : void
      {
         var _local_4:CollisionRect = null;
         var _local_5:CollisionBox = null;
         if(this.haveCollision(_arg_1,_arg_2))
         {
            if(_arg_1 is CollisionRect)
            {
               _local_4 = CollisionRect(_arg_1);
               _local_5 = CollisionBox(_arg_2);
            }
            else
            {
               _local_4 = CollisionRect(_arg_2);
               _local_5 = CollisionBox(_arg_1);
            }
            this.findContacts(_local_5,_local_4,this.minOverlapAxis,_arg_3);
         }
      }
      
      public function haveCollision(_arg_1:CollisionShape, _arg_2:CollisionShape) : Boolean
      {
         var _local_3:CollisionBox = null;
         var _local_4:CollisionRect = null;
         this.minOverlap = 10000000000;
         if(_arg_1 is CollisionBox)
         {
            _local_3 = CollisionBox(_arg_1);
            _local_4 = CollisionRect(_arg_2);
         }
         else
         {
            _local_3 = CollisionBox(_arg_2);
            _local_4 = CollisionRect(_arg_1);
         }
         var _local_5:Matrix4 = _local_3.transform;
         var _local_6:Matrix4 = _local_4.transform;
         this._vectorToBox.x = _local_5.m03 - _local_6.m03;
         this._vectorToBox.y = _local_5.m13 - _local_6.m13;
         this._vectorToBox.z = _local_5.m23 - _local_6.m23;
         this.axis22.x = _local_6.m02;
         this.axis22.y = _local_6.m12;
         this.axis22.z = _local_6.m22;
         if(!this.testMainAxis(_local_3,_local_4,this.axis22,this._vectorToBox))
         {
            return false;
         }
         this.axis10.x = _local_5.m00;
         this.axis10.y = _local_5.m10;
         this.axis10.z = _local_5.m20;
         if(!this.testMainAxis(_local_3,_local_4,this.axis10,this._vectorToBox))
         {
            return false;
         }
         this.axis11.x = _local_5.m01;
         this.axis11.y = _local_5.m11;
         this.axis11.z = _local_5.m21;
         if(!this.testMainAxis(_local_3,_local_4,this.axis11,this._vectorToBox))
         {
            return false;
         }
         this.axis12.x = _local_5.m02;
         this.axis12.y = _local_5.m12;
         this.axis12.z = _local_5.m22;
         if(!this.testMainAxis(_local_3,_local_4,this.axis12,this._vectorToBox))
         {
            return false;
         }
         this.axis20.x = _local_6.m00;
         this.axis20.y = _local_6.m10;
         this.axis20.z = _local_6.m20;
         this.axis21.x = _local_6.m01;
         this.axis21.y = _local_6.m11;
         this.axis21.z = _local_6.m21;
         if(!this.testDerivedAxis(_local_3,_local_4,this.axis10,this.axis20,this._vectorToBox))
         {
            return false;
         }
         if(!this.testDerivedAxis(_local_3,_local_4,this.axis10,this.axis21,this._vectorToBox))
         {
            return false;
         }
         if(!this.testDerivedAxis(_local_3,_local_4,this.axis11,this.axis20,this._vectorToBox))
         {
            return false;
         }
         if(!this.testDerivedAxis(_local_3,_local_4,this.axis11,this.axis21,this._vectorToBox))
         {
            return false;
         }
         if(!this.testDerivedAxis(_local_3,_local_4,this.axis12,this.axis20,this._vectorToBox))
         {
            return false;
         }
         if(!this.testDerivedAxis(_local_3,_local_4,this.axis12,this.axis21,this._vectorToBox))
         {
            return false;
         }
         return true;
      }
      
      private function testMainAxis(_arg_1:CollisionBox, _arg_2:CollisionRect, _arg_3:Vector3, _arg_4:Vector3) : Boolean
      {
         var _local_5:Number = this.getOverlapOnAxis(_arg_1,_arg_2,_arg_3,_arg_4);
         return this.registerOverlap(_local_5,_arg_3);
      }
      
      private function testDerivedAxis(_arg_1:CollisionBox, _arg_2:CollisionRect, _arg_3:Vector3, _arg_4:Vector3, _arg_5:Vector3) : Boolean
      {
         var _local_6:Number = NaN;
         this._axis.x = _arg_3.y * _arg_4.z - _arg_3.z * _arg_4.y;
         this._axis.y = _arg_3.z * _arg_4.x - _arg_3.x * _arg_4.z;
         this._axis.z = _arg_3.x * _arg_4.y - _arg_3.y * _arg_4.x;
         var _local_7:Number = this._axis.x * this._axis.x + this._axis.y * this._axis.y + this._axis.z * this._axis.z;
         if(_local_7 < 1e-10)
         {
            return true;
         }
         _local_6 = 1 / Math.sqrt(_local_7);
         this._axis.x *= _local_6;
         this._axis.y *= _local_6;
         this._axis.z *= _local_6;
         var _local_8:Number = this.getOverlapOnAxis(_arg_1,_arg_2,this._axis,_arg_5);
         return this.registerOverlap(_local_8,this._axis);
      }
      
      private function getOverlapOnAxis(_arg_1:CollisionBox, _arg_2:CollisionRect, _arg_3:Vector3, _arg_4:Vector3) : Number
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
         _local_6 = _arg_4.x * _arg_3.x + _arg_4.y * _arg_3.y + _arg_4.z * _arg_3.z;
         if(_local_6 < 0)
         {
            _local_6 = -_local_6;
         }
         return _local_7 - _local_6;
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
      
      private function findContacts(_arg_1:CollisionBox, _arg_2:CollisionRect, _arg_3:Vector3, _arg_4:Vector.<ShapeContact>) : void
      {
         var _local_5:Matrix4 = null;
         var _local_6:ShapeContact = null;
         var _local_7:Vector3 = null;
         var _local_8:Number = NaN;
         var _local_9:Number = NaN;
         var _local_10:Number = NaN;
         _local_5 = _arg_1.transform;
         var _local_11:Matrix4 = _arg_2.transform;
         var _local_12:Vector3 = this._vectorToBox;
         _local_12.x = _local_5.m03 - _local_11.m03;
         _local_12.y = _local_5.m13 - _local_11.m13;
         _local_12.z = _local_5.m23 - _local_11.m23;
         if(_arg_3.x * _local_12.x + _arg_3.y * _local_12.y + _arg_3.z * _local_12.z < 0)
         {
            _arg_3.x = -_arg_3.x;
            _arg_3.y = -_arg_3.y;
            _arg_3.z = -_arg_3.z;
         }
         var _local_13:Matrix4 = _basisMatrix;
         ColliderUtils.buildContactBasis(_arg_3,_local_5,_local_11,_local_13);
         ColliderUtils.getBoxFaceVerticesInCCWOrder(_arg_1,_arg_3,FaceSide.BACK,boxFaceVertices);
         ColliderUtils.getRectFaceInCCWOrder(_arg_2,_arg_3,rectFaceVertices);
         ColliderUtils.transformFaceToReferenceSpace(_local_13,_local_5,boxFaceVertices,4);
         ColliderUtils.transformFaceToReferenceSpace(_local_13,_local_11,rectFaceVertices,4);
         var _local_14:int = int(_arg_4.length);
         PolygonsIntersectionUtils.findContacts(_arg_1,boxFaceVertices,4,_arg_2,rectFaceVertices,4,_local_13,_arg_4);
         var _local_15:int = int(_arg_4.length);
         var _local_16:int = _local_14;
         while(_local_16 < _local_15)
         {
            _local_6 = _arg_4[_local_16];
            _local_7 = _local_6.normal;
            _local_8 = _local_11.m02;
            _local_9 = _local_11.m12;
            _local_10 = _local_11.m22;
            if(_local_7.x * _local_8 + _local_7.y * _local_9 + _local_7.z * _local_10 < 0)
            {
               _local_6.dispose();
               _local_15--;
               _arg_4[_local_16] = _arg_4[_local_15];
               _arg_4[_local_15] = null;
               _local_16--;
            }
            else if(Math.abs(_local_11.m22) > 0.999)
            {
               _local_7.x = _local_8;
               _local_7.y = _local_9;
               _local_7.z = _local_10;
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

