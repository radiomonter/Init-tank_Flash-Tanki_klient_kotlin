package alternativa.math
{
   import alternativa.engine3d.core.Object3D;
   import flash.geom.Matrix3D;
   import flash.utils.getQualifiedClassName;
   
   public class Matrix4
   {
      
      public static const IDENTITY:Matrix4 = new Matrix4();
      
      public var m00:Number;
      
      public var m01:Number;
      
      public var m02:Number;
      
      public var m03:Number;
      
      public var m10:Number;
      
      public var m11:Number;
      
      public var m12:Number;
      
      public var m13:Number;
      
      public var m20:Number;
      
      public var m21:Number;
      
      public var m22:Number;
      
      public var m23:Number;
      
      public function Matrix4(_arg_1:Number = 1, _arg_2:Number = 0, _arg_3:Number = 0, _arg_4:Number = 0, _arg_5:Number = 0, _arg_6:Number = 1, _arg_7:Number = 0, _arg_8:Number = 0, _arg_9:Number = 0, _arg_10:Number = 0, _arg_11:Number = 1, _arg_12:Number = 0)
      {
         super();
         this.init(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6,_arg_7,_arg_8,_arg_9,_arg_10,_arg_11,_arg_12);
      }
      
      public function init(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number, _arg_8:Number, _arg_9:Number, _arg_10:Number, _arg_11:Number, _arg_12:Number) : void
      {
         this.m00 = _arg_1;
         this.m01 = _arg_2;
         this.m02 = _arg_3;
         this.m03 = _arg_4;
         this.m10 = _arg_5;
         this.m11 = _arg_6;
         this.m12 = _arg_7;
         this.m13 = _arg_8;
         this.m20 = _arg_9;
         this.m21 = _arg_10;
         this.m22 = _arg_11;
         this.m23 = _arg_12;
      }
      
      public function toIdentity() : Matrix4
      {
         this.m00 = this.m11 = this.m22 = 1;
         this.m01 = this.m02 = this.m10 = this.m12 = this.m20 = this.m21 = this.m03 = this.m13 = this.m23 = 0;
         return this;
      }
      
      public function invert() : Matrix4
      {
         var _local_1:Number = this.m00;
         var _local_2:Number = this.m01;
         var _local_3:Number = this.m02;
         var _local_4:Number = this.m03;
         var _local_5:Number = this.m10;
         var _local_6:Number = this.m11;
         var _local_7:Number = this.m12;
         var _local_8:Number = this.m13;
         var _local_9:Number = this.m20;
         var _local_10:Number = this.m21;
         var _local_11:Number = this.m22;
         var _local_12:Number = this.m23;
         var _local_13:Number = -_local_3 * _local_6 * _local_9 + _local_2 * _local_7 * _local_9 + _local_3 * _local_5 * _local_10 - _local_1 * _local_7 * _local_10 - _local_2 * _local_5 * _local_11 + _local_1 * _local_6 * _local_11;
         this.m00 = (-_local_7 * _local_10 + _local_6 * _local_11) / _local_13;
         this.m01 = (_local_3 * _local_10 - _local_2 * _local_11) / _local_13;
         this.m02 = (-_local_3 * _local_6 + _local_2 * _local_7) / _local_13;
         this.m03 = (_local_4 * _local_7 * _local_10 - _local_3 * _local_8 * _local_10 - _local_4 * _local_6 * _local_11 + _local_2 * _local_8 * _local_11 + _local_3 * _local_6 * _local_12 - _local_2 * _local_7 * _local_12) / _local_13;
         this.m10 = (_local_7 * _local_9 - _local_5 * _local_11) / _local_13;
         this.m11 = (-_local_3 * _local_9 + _local_1 * _local_11) / _local_13;
         this.m12 = (_local_3 * _local_5 - _local_1 * _local_7) / _local_13;
         this.m13 = (_local_3 * _local_8 * _local_9 - _local_4 * _local_7 * _local_9 + _local_4 * _local_5 * _local_11 - _local_1 * _local_8 * _local_11 - _local_3 * _local_5 * _local_12 + _local_1 * _local_7 * _local_12) / _local_13;
         this.m20 = (-_local_6 * _local_9 + _local_5 * _local_10) / _local_13;
         this.m21 = (_local_2 * _local_9 - _local_1 * _local_10) / _local_13;
         this.m22 = (-_local_2 * _local_5 + _local_1 * _local_6) / _local_13;
         this.m23 = (_local_4 * _local_6 * _local_9 - _local_2 * _local_8 * _local_9 - _local_4 * _local_5 * _local_10 + _local_1 * _local_8 * _local_10 + _local_2 * _local_5 * _local_12 - _local_1 * _local_6 * _local_12) / _local_13;
         return this;
      }
      
      public function append(_arg_1:Matrix4) : Matrix4
      {
         var _local_2:Number = this.m00;
         var _local_3:Number = this.m01;
         var _local_4:Number = this.m02;
         var _local_5:Number = this.m03;
         var _local_6:Number = this.m10;
         var _local_7:Number = this.m11;
         var _local_8:Number = this.m12;
         var _local_9:Number = this.m13;
         var _local_10:Number = this.m20;
         var _local_11:Number = this.m21;
         var _local_12:Number = this.m22;
         var _local_13:Number = this.m23;
         this.m00 = _arg_1.m00 * _local_2 + _arg_1.m01 * _local_6 + _arg_1.m02 * _local_10;
         this.m01 = _arg_1.m00 * _local_3 + _arg_1.m01 * _local_7 + _arg_1.m02 * _local_11;
         this.m02 = _arg_1.m00 * _local_4 + _arg_1.m01 * _local_8 + _arg_1.m02 * _local_12;
         this.m03 = _arg_1.m00 * _local_5 + _arg_1.m01 * _local_9 + _arg_1.m02 * _local_13 + _arg_1.m03;
         this.m10 = _arg_1.m10 * _local_2 + _arg_1.m11 * _local_6 + _arg_1.m12 * _local_10;
         this.m11 = _arg_1.m10 * _local_3 + _arg_1.m11 * _local_7 + _arg_1.m12 * _local_11;
         this.m12 = _arg_1.m10 * _local_4 + _arg_1.m11 * _local_8 + _arg_1.m12 * _local_12;
         this.m13 = _arg_1.m10 * _local_5 + _arg_1.m11 * _local_9 + _arg_1.m12 * _local_13 + _arg_1.m13;
         this.m20 = _arg_1.m20 * _local_2 + _arg_1.m21 * _local_6 + _arg_1.m22 * _local_10;
         this.m21 = _arg_1.m20 * _local_3 + _arg_1.m21 * _local_7 + _arg_1.m22 * _local_11;
         this.m22 = _arg_1.m20 * _local_4 + _arg_1.m21 * _local_8 + _arg_1.m22 * _local_12;
         this.m23 = _arg_1.m20 * _local_5 + _arg_1.m21 * _local_9 + _arg_1.m22 * _local_13 + _arg_1.m23;
         return this;
      }
      
      public function prepend(_arg_1:Matrix4) : Matrix4
      {
         var _local_2:Number = this.m00;
         var _local_3:Number = this.m01;
         var _local_4:Number = this.m02;
         var _local_5:Number = this.m03;
         var _local_6:Number = this.m10;
         var _local_7:Number = this.m11;
         var _local_8:Number = this.m12;
         var _local_9:Number = this.m13;
         var _local_10:Number = this.m20;
         var _local_11:Number = this.m21;
         var _local_12:Number = this.m22;
         var _local_13:Number = this.m23;
         this.m00 = _local_2 * _arg_1.m00 + _local_3 * _arg_1.m10 + _local_4 * _arg_1.m20;
         this.m01 = _local_2 * _arg_1.m01 + _local_3 * _arg_1.m11 + _local_4 * _arg_1.m21;
         this.m02 = _local_2 * _arg_1.m02 + _local_3 * _arg_1.m12 + _local_4 * _arg_1.m22;
         this.m03 = _local_2 * _arg_1.m03 + _local_3 * _arg_1.m13 + _local_4 * _arg_1.m23 + _local_5;
         this.m10 = _local_6 * _arg_1.m00 + _local_7 * _arg_1.m10 + _local_8 * _arg_1.m20;
         this.m11 = _local_6 * _arg_1.m01 + _local_7 * _arg_1.m11 + _local_8 * _arg_1.m21;
         this.m12 = _local_6 * _arg_1.m02 + _local_7 * _arg_1.m12 + _local_8 * _arg_1.m22;
         this.m13 = _local_6 * _arg_1.m03 + _local_7 * _arg_1.m13 + _local_8 * _arg_1.m23 + _local_9;
         this.m20 = _local_10 * _arg_1.m00 + _local_11 * _arg_1.m10 + _local_12 * _arg_1.m20;
         this.m21 = _local_10 * _arg_1.m01 + _local_11 * _arg_1.m11 + _local_12 * _arg_1.m21;
         this.m22 = _local_10 * _arg_1.m02 + _local_11 * _arg_1.m12 + _local_12 * _arg_1.m22;
         this.m23 = _local_10 * _arg_1.m03 + _local_11 * _arg_1.m13 + _local_12 * _arg_1.m23 + _local_13;
         return this;
      }
      
      public function add(_arg_1:Matrix4) : Matrix4
      {
         this.m00 += _arg_1.m00;
         this.m01 += _arg_1.m01;
         this.m02 += _arg_1.m02;
         this.m03 += _arg_1.m03;
         this.m10 += _arg_1.m10;
         this.m11 += _arg_1.m11;
         this.m12 += _arg_1.m12;
         this.m13 += _arg_1.m13;
         this.m20 += _arg_1.m20;
         this.m21 += _arg_1.m21;
         this.m22 += _arg_1.m22;
         this.m23 += _arg_1.m23;
         return this;
      }
      
      public function subtract(_arg_1:Matrix4) : Matrix4
      {
         this.m00 -= _arg_1.m00;
         this.m01 -= _arg_1.m01;
         this.m02 -= _arg_1.m02;
         this.m03 -= _arg_1.m03;
         this.m10 -= _arg_1.m10;
         this.m11 -= _arg_1.m11;
         this.m12 -= _arg_1.m12;
         this.m13 -= _arg_1.m13;
         this.m20 -= _arg_1.m20;
         this.m21 -= _arg_1.m21;
         this.m22 -= _arg_1.m22;
         this.m23 -= _arg_1.m23;
         return this;
      }
      
      public function transformVector(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         _arg_2.x = this.m00 * _arg_1.x + this.m01 * _arg_1.y + this.m02 * _arg_1.z + this.m03;
         _arg_2.y = this.m10 * _arg_1.x + this.m11 * _arg_1.y + this.m12 * _arg_1.z + this.m13;
         _arg_2.z = this.m20 * _arg_1.x + this.m21 * _arg_1.y + this.m22 * _arg_1.z + this.m23;
      }
      
      public function rotateVector(param1:Vector3, param2:Vector3) : void
      {
         param2.x = this.m00 * param1.x + this.m01 * param1.y + this.m02 * param1.z;
         param2.y = this.m10 * param1.x + this.m11 * param1.y + this.m12 * param1.z;
         param2.z = this.m20 * param1.x + this.m21 * param1.y + this.m22 * param1.z;
      }
      
      public function dunovywet(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Vector3) : void
      {
         _arg_4.x = this.m00 * _arg_1 + this.m01 * _arg_2 + this.m02 * _arg_3 + this.m03;
         _arg_4.y = this.m10 * _arg_1 + this.m11 * _arg_2 + this.m12 * _arg_3 + this.m13;
         _arg_4.z = this.m20 * _arg_1 + this.m21 * _arg_2 + this.m22 * _arg_3 + this.m23;
      }
      
      public function transformVectorInverse(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         var _local_3:Number = _arg_1.x - this.m03;
         var _local_4:Number = _arg_1.y - this.m13;
         var _local_5:Number = _arg_1.z - this.m23;
         _arg_2.x = this.m00 * _local_3 + this.m10 * _local_4 + this.m20 * _local_5;
         _arg_2.y = this.m01 * _local_3 + this.m11 * _local_4 + this.m21 * _local_5;
         _arg_2.z = this.m02 * _local_3 + this.m12 * _local_4 + this.m22 * _local_5;
      }
      
      public function transformVectors(_arg_1:Vector.<Vector3>, _arg_2:Vector.<Vector3>) : void
      {
         var _local_3:Vector3 = null;
         var _local_4:Vector3 = null;
         var _local_6:int = 0;
         var _local_5:int = int(_arg_1.length);
         while(_local_6 < _local_5)
         {
            _local_3 = _arg_1[_local_6];
            _local_4 = _arg_2[_local_6];
            _local_4.x = this.m00 * _local_3.x + this.m01 * _local_3.y + this.m02 * _local_3.z + this.m03;
            _local_4.y = this.m10 * _local_3.x + this.m11 * _local_3.y + this.m12 * _local_3.z + this.m13;
            _local_4.z = this.m20 * _local_3.x + this.m21 * _local_3.y + this.m22 * _local_3.z + this.m23;
            _local_6++;
         }
      }
      
      public function transformVectorsN(_arg_1:Vector.<Vector3>, _arg_2:Vector.<Vector3>, _arg_3:int) : void
      {
         var _local_4:Vector3 = null;
         var _local_5:Vector3 = null;
         var _local_6:int = 0;
         while(_local_6 < _arg_3)
         {
            _local_4 = _arg_1[_local_6];
            _local_5 = _arg_2[_local_6];
            _local_5.x = this.m00 * _local_4.x + this.m01 * _local_4.y + this.m02 * _local_4.z + this.m03;
            _local_5.y = this.m10 * _local_4.x + this.m11 * _local_4.y + this.m12 * _local_4.z + this.m13;
            _local_5.z = this.m20 * _local_4.x + this.m21 * _local_4.y + this.m22 * _local_4.z + this.m23;
            _local_6++;
         }
      }
      
      public function transformVectorsInverse(_arg_1:Vector.<Vector3>, _arg_2:Vector.<Vector3>) : void
      {
         var _local_3:Vector3 = null;
         var _local_4:Vector3 = null;
         var _local_9:int = 0;
         var _local_5:Number = NaN;
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:int = int(_arg_1.length);
         while(_local_9 < _local_8)
         {
            _local_3 = _arg_1[_local_9];
            _local_4 = _arg_2[_local_9];
            _local_5 = _local_3.x - this.m03;
            _local_6 = _local_3.y - this.m13;
            _local_7 = _local_3.z - this.m23;
            _local_4.x = this.m00 * _local_5 + this.m10 * _local_6 + this.m20 * _local_7;
            _local_4.y = this.m01 * _local_5 + this.m11 * _local_6 + this.m21 * _local_7;
            _local_4.z = this.m02 * _local_5 + this.m12 * _local_6 + this.m22 * _local_7;
            _local_9++;
         }
      }
      
      public function transformVectorsInverseN(_arg_1:Vector.<Vector3>, _arg_2:Vector.<Vector3>, _arg_3:int) : void
      {
         var _local_4:Vector3 = null;
         var _local_5:Vector3 = null;
         var _local_9:int = 0;
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         while(_local_9 < _arg_3)
         {
            _local_4 = _arg_1[_local_9];
            _local_5 = _arg_2[_local_9];
            _local_6 = _local_4.x - this.m03;
            _local_7 = _local_4.y - this.m13;
            _local_8 = _local_4.z - this.m23;
            _local_5.x = this.m00 * _local_6 + this.m10 * _local_7 + this.m20 * _local_8;
            _local_5.y = this.m01 * _local_6 + this.m11 * _local_7 + this.m21 * _local_8;
            _local_5.z = this.m02 * _local_6 + this.m12 * _local_7 + this.m22 * _local_8;
            _local_9++;
         }
      }
      
      public function dopewiqi(_arg_1:Vector3) : void
      {
         this.getAxis(0,_arg_1);
      }
      
      public function getForward(_arg_1:Vector3) : void
      {
         this.getAxis(1,_arg_1);
      }
      
      public function getUp(_arg_1:Vector3) : void
      {
         this.getAxis(2,_arg_1);
      }
      
      public function getAxis(_arg_1:int, _arg_2:Vector3) : void
      {
         switch(_arg_1)
         {
            case 0:
               _arg_2.x = this.m00;
               _arg_2.y = this.m10;
               _arg_2.z = this.m20;
               return;
            case 1:
               _arg_2.x = this.m01;
               _arg_2.y = this.m11;
               _arg_2.z = this.m21;
               return;
            case 2:
               _arg_2.x = this.m02;
               _arg_2.y = this.m12;
               _arg_2.z = this.m22;
               return;
            case 3:
               _arg_2.x = this.m03;
               _arg_2.y = this.m13;
               _arg_2.z = this.m23;
               return;
            default:
               return;
         }
      }
      
      public function deltaTransformVector(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         _arg_2.x = this.m00 * _arg_1.x + this.m01 * _arg_1.y + this.m02 * _arg_1.z;
         _arg_2.y = this.m10 * _arg_1.x + this.m11 * _arg_1.y + this.m12 * _arg_1.z;
         _arg_2.z = this.m20 * _arg_1.x + this.m21 * _arg_1.y + this.m22 * _arg_1.z;
      }
      
      public function deltaTransformVectorInverse(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         _arg_2.x = this.m00 * _arg_1.x + this.m10 * _arg_1.y + this.m20 * _arg_1.z;
         _arg_2.y = this.m01 * _arg_1.x + this.m11 * _arg_1.y + this.m21 * _arg_1.z;
         _arg_2.z = this.m02 * _arg_1.x + this.m12 * _arg_1.y + this.m22 * _arg_1.z;
      }
      
      public function copy(_arg_1:Matrix4) : Matrix4
      {
         this.m00 = _arg_1.m00;
         this.m01 = _arg_1.m01;
         this.m02 = _arg_1.m02;
         this.m03 = _arg_1.m03;
         this.m10 = _arg_1.m10;
         this.m11 = _arg_1.m11;
         this.m12 = _arg_1.m12;
         this.m13 = _arg_1.m13;
         this.m20 = _arg_1.m20;
         this.m21 = _arg_1.m21;
         this.m22 = _arg_1.m22;
         this.m23 = _arg_1.m23;
         return this;
      }
      
      public function setFromMatrix3(_arg_1:Matrix3, _arg_2:Vector3) : Matrix4
      {
         this.m00 = _arg_1.m00;
         this.m01 = _arg_1.m01;
         this.m02 = _arg_1.m02;
         this.m03 = _arg_2.x;
         this.m10 = _arg_1.m10;
         this.m11 = _arg_1.m11;
         this.m12 = _arg_1.m12;
         this.m13 = _arg_2.y;
         this.m20 = _arg_1.m20;
         this.m21 = _arg_1.m21;
         this.m22 = _arg_1.m22;
         this.m23 = _arg_2.z;
         return this;
      }
      
      public function setOrientationFromMatrix3(_arg_1:Matrix3) : Matrix4
      {
         this.m00 = _arg_1.m00;
         this.m01 = _arg_1.m01;
         this.m02 = _arg_1.m02;
         this.m10 = _arg_1.m10;
         this.m11 = _arg_1.m11;
         this.m12 = _arg_1.m12;
         this.m20 = _arg_1.m20;
         this.m21 = _arg_1.m21;
         this.m22 = _arg_1.m22;
         return this;
      }
      
      public function setRotationMatrix(_arg_1:Number, _arg_2:Number, _arg_3:Number) : Matrix4
      {
         var _local_4:Number = Math.cos(_arg_1);
         var _local_5:Number = Math.sin(_arg_1);
         var _local_6:Number = Math.cos(_arg_2);
         var _local_7:Number = Math.sin(_arg_2);
         var _local_8:Number = Math.cos(_arg_3);
         var _local_9:Number = Math.sin(_arg_3);
         var _local_10:Number = _local_8 * _local_7;
         var _local_11:Number = _local_9 * _local_7;
         this.m00 = _local_8 * _local_6;
         this.m01 = _local_10 * _local_5 - _local_9 * _local_4;
         this.m02 = _local_10 * _local_4 + _local_9 * _local_5;
         this.m10 = _local_9 * _local_6;
         this.m11 = _local_11 * _local_5 + _local_8 * _local_4;
         this.m12 = _local_11 * _local_4 - _local_8 * _local_5;
         this.m20 = -_local_7;
         this.m21 = _local_6 * _local_5;
         this.m22 = _local_6 * _local_4;
         return this;
      }
      
      public function nov(_arg_1:Object3D) : void
      {
         this.setMatrix(_arg_1.x,_arg_1.y,_arg_1.z,_arg_1.rotationX,_arg_1.rotationY,_arg_1.rotationZ);
      }
      
      public function setMatrix(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number) : Matrix4
      {
         var _local_7:Number = Math.cos(_arg_4);
         var _local_8:Number = Math.sin(_arg_4);
         var _local_9:Number = Math.cos(_arg_5);
         var _local_10:Number = Math.sin(_arg_5);
         var _local_11:Number = Math.cos(_arg_6);
         var _local_12:Number = Math.sin(_arg_6);
         var _local_13:Number = _local_11 * _local_10;
         var _local_14:Number = _local_12 * _local_10;
         this.m00 = _local_11 * _local_9;
         this.m01 = _local_13 * _local_8 - _local_12 * _local_7;
         this.m02 = _local_13 * _local_7 + _local_12 * _local_8;
         this.m03 = _arg_1;
         this.m10 = _local_12 * _local_9;
         this.m11 = _local_14 * _local_8 + _local_11 * _local_7;
         this.m12 = _local_14 * _local_7 - _local_11 * _local_8;
         this.m13 = _arg_2;
         this.m20 = -_local_10;
         this.m21 = _local_9 * _local_8;
         this.m22 = _local_9 * _local_7;
         this.m23 = _arg_3;
         return this;
      }
      
      public function getEulerAngles(_arg_1:Vector3) : void
      {
         if(-1 < this.m20 && this.m20 < 1)
         {
            _arg_1.x = Math.atan2(this.m21,this.m22);
            _arg_1.y = -Math.asin(this.m20);
            _arg_1.z = Math.atan2(this.m10,this.m00);
         }
         else
         {
            _arg_1.x = 0;
            _arg_1.y = this.m20 <= -1 ? Number(Math.PI) : Number(-Math.PI);
            _arg_1.y *= 0.5;
            _arg_1.z = Math.atan2(-this.m01,this.m11);
         }
      }
      
      public function setPosition(_arg_1:Vector3) : void
      {
         this.m03 = _arg_1.x;
         this.m13 = _arg_1.y;
         this.m23 = _arg_1.z;
      }
      
      public function getPosition(_arg_1:Vector3) : void
      {
         _arg_1.x = this.m03;
         _arg_1.y = this.m13;
         _arg_1.z = this.m23;
      }
      
      public function clone() : Matrix4
      {
         return new Matrix4(this.m00,this.m01,this.m02,this.m03,this.m10,this.m11,this.m12,this.m13,this.m20,this.m21,this.m22,this.m23);
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + " (" + this.m00.toFixed(3) + " " + this.m01.toFixed(3) + " " + this.m02.toFixed(3) + " " + this.m03.toFixed(3) + "] [" + this.m10.toFixed(3) + " " + this.m11.toFixed(3) + " " + this.m12.toFixed(3) + " " + this.m13.toFixed(3) + "] [" + this.m20.toFixed(3) + " " + this.m21.toFixed(3) + " " + this.m22.toFixed(3) + " " + this.m23.toFixed(3) + ")";
      }
      
      public function fromAxisAngle(_arg_1:Vector3, _arg_2:Number) : void
      {
         var _local_3:Number = Math.cos(_arg_2);
         var _local_4:Number = Math.sin(_arg_2);
         var _local_5:Number = 1 - _local_3;
         var _local_6:Number = _arg_1.x;
         var _local_7:Number = _arg_1.y;
         var _local_8:Number = _arg_1.z;
         this.m00 = _local_5 * _local_6 * _local_6 + _local_3;
         this.m01 = _local_5 * _local_6 * _local_7 - _local_8 * _local_4;
         this.m02 = _local_5 * _local_6 * _local_8 + _local_7 * _local_4;
         this.m10 = _local_5 * _local_6 * _local_7 + _local_8 * _local_4;
         this.m11 = _local_5 * _local_7 * _local_7 + _local_3;
         this.m12 = _local_5 * _local_7 * _local_8 - _local_6 * _local_4;
         this.m20 = _local_5 * _local_6 * _local_8 - _local_7 * _local_4;
         this.m21 = _local_5 * _local_7 * _local_8 + _local_6 * _local_4;
         this.m22 = _local_5 * _local_8 * _local_8 + _local_3;
      }
      
      public function setFromMatrix3D(_arg_1:Matrix3D) : void
      {
         var _local_2:Vector.<Number> = _arg_1.rawData;
         this.init(_local_2[0],_local_2[4],_local_2[8],_local_2[12],_local_2[1],_local_2[5],_local_2[9],_local_2[13],_local_2[2],_local_2[6],_local_2[10],_local_2[14]);
      }
   }
}

