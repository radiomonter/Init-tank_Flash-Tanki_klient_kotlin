package alternativa.math
{
   import flash.geom.Vector3D;
   import flash.utils.getQualifiedClassName;
   import obfuscation.kofen.Vector3d;
   
   public class Vector3
   {
      
      public static const ZERO:Vector3 = new Vector3(0,0,0);
      
      public static const X_AXIS:Vector3 = new Vector3(1,0,0);
      
      public static const Y_AXIS:Vector3 = new Vector3(0,1,0);
      
      public static const Z_AXIS:Vector3 = new Vector3(0,0,1);
      
      public static const DOWN:Vector3 = new Vector3(0,0,-1);
      
      public var x:Number;
      
      public var y:Number;
      
      public var z:Number;
      
      public function Vector3(_arg_1:Number = 0, _arg_2:Number = 0, _arg_3:Number = 0)
      {
         super();
         this.x = _arg_1;
         this.y = _arg_2;
         this.z = _arg_3;
      }
      
      public static function isFiniteVector(_arg_1:Vector3) : Boolean
      {
         return _arg_1 != null && isFinite(_arg_1.x) && isFinite(_arg_1.y) && isFinite(_arg_1.z);
      }
      
      public static function interpolate(_arg_1:Number, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Vector3) : void
      {
         _arg_4.x = _arg_2.x + _arg_1 * (_arg_3.x - _arg_2.x);
         _arg_4.y = _arg_2.y + _arg_1 * (_arg_3.y - _arg_2.y);
         _arg_4.z = _arg_2.z + _arg_1 * (_arg_3.z - _arg_2.z);
      }
      
      public static function distanceBetween(_arg_1:Vector3, _arg_2:Vector3) : Number
      {
         var _local_3:Number = _arg_1.x - _arg_2.x;
         var _local_4:Number = _arg_1.y - _arg_2.y;
         var _local_5:Number = _arg_1.z - _arg_2.z;
         return Math.sqrt(_local_3 * _local_3 + _local_4 * _local_4 + _local_5 * _local_5);
      }
      
      public function interpolate(_arg_1:Number, _arg_2:Vector3, _arg_3:Vector3) : void
      {
         this.x = _arg_2.x + _arg_1 * (_arg_3.x - _arg_2.x);
         this.y = _arg_2.y + _arg_1 * (_arg_3.y - _arg_2.y);
         this.z = _arg_2.z + _arg_1 * (_arg_3.z - _arg_2.z);
      }
      
      public function isFiniteVector() : Boolean
      {
         return isFinite(this.x) && isFinite(this.y) && isFinite(this.z);
      }
      
      public function length() : Number
      {
         return Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
      }
      
      public function lengthSqr() : Number
      {
         return this.x * this.x + this.y * this.y + this.z * this.z;
      }
      
      public function setLength(_arg_1:Number) : Vector3
      {
         var _local_2:Number = NaN;
         var _local_3:Number = this.x * this.x + this.y * this.y + this.z * this.z;
         if(_local_3 == 0)
         {
            this.x = _arg_1;
         }
         else
         {
            _local_2 = _arg_1 / Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
            this.x *= _local_2;
            this.y *= _local_2;
            this.z *= _local_2;
         }
         return this;
      }
      
      public function normalize() : Vector3
      {
         var _local_1:Number = this.x * this.x + this.y * this.y + this.z * this.z;
         if(_local_1 == 0)
         {
            this.x = 1;
         }
         else
         {
            _local_1 = Math.sqrt(_local_1);
            this.x /= _local_1;
            this.y /= _local_1;
            this.z /= _local_1;
         }
         return this;
      }
      
      public function add(_arg_1:Vector3) : Vector3
      {
         this.x += _arg_1.x;
         this.y += _arg_1.y;
         this.z += _arg_1.z;
         return this;
      }
      
      public function addScaled(_arg_1:Number, _arg_2:Vector3) : Vector3
      {
         this.x += _arg_1 * _arg_2.x;
         this.y += _arg_1 * _arg_2.y;
         this.z += _arg_1 * _arg_2.z;
         return this;
      }
      
      public function subtract(_arg_1:Vector3) : Vector3
      {
         this.x -= _arg_1.x;
         this.y -= _arg_1.y;
         this.z -= _arg_1.z;
         return this;
      }
      
      public function sum(_arg_1:Vector3, _arg_2:Vector3) : Vector3
      {
         this.x = _arg_1.x + _arg_2.x;
         this.y = _arg_1.y + _arg_2.y;
         this.z = _arg_1.z + _arg_2.z;
         return this;
      }
      
      public function diff(_arg_1:Vector3, _arg_2:Vector3) : Vector3
      {
         this.x = _arg_1.x - _arg_2.x;
         this.y = _arg_1.y - _arg_2.y;
         this.z = _arg_1.z - _arg_2.z;
         return this;
      }
      
      public function diff2d(_arg_1:Vector3, _arg_2:Vector3) : Vector3
      {
         this.x = _arg_1.x - _arg_2.x;
         this.y = _arg_1.y - _arg_2.y;
         this.z = 0;
         return this;
      }
      
      public function scale(_arg_1:Number) : Vector3
      {
         this.x *= _arg_1;
         this.y *= _arg_1;
         this.z *= _arg_1;
         return this;
      }
      
      public function reverse() : Vector3
      {
         this.x = -this.x;
         this.y = -this.y;
         this.z = -this.z;
         return this;
      }
      
      public function dot(_arg_1:Vector3) : Number
      {
         return this.x * _arg_1.x + this.y * _arg_1.y + this.z * _arg_1.z;
      }
      
      public function cross(_arg_1:Vector3) : Vector3
      {
         var _local_2:Number = this.y * _arg_1.z - this.z * _arg_1.y;
         var _local_3:Number = this.z * _arg_1.x - this.x * _arg_1.z;
         var _local_4:Number = this.x * _arg_1.y - this.y * _arg_1.x;
         this.x = _local_2;
         this.y = _local_3;
         this.z = _local_4;
         return this;
      }
      
      public function cross2(_arg_1:Vector3, _arg_2:Vector3) : Vector3
      {
         this.x = _arg_1.y * _arg_2.z - _arg_1.z * _arg_2.y;
         this.y = _arg_1.z * _arg_2.x - _arg_1.x * _arg_2.z;
         this.z = _arg_1.x * _arg_2.y - _arg_1.y * _arg_2.x;
         return this;
      }
      
      public function transform3(_arg_1:Matrix3) : Vector3
      {
         var _local_2:Number = this.x;
         var _local_3:Number = this.y;
         var _local_4:Number = this.z;
         this.x = _arg_1.m00 * _local_2 + _arg_1.m01 * _local_3 + _arg_1.m02 * _local_4;
         this.y = _arg_1.m10 * _local_2 + _arg_1.m11 * _local_3 + _arg_1.m12 * _local_4;
         this.z = _arg_1.m20 * _local_2 + _arg_1.m21 * _local_3 + _arg_1.m22 * _local_4;
         return this;
      }
      
      public function transformTransposed3(_arg_1:Matrix3) : Vector3
      {
         var _local_2:Number = this.x;
         var _local_3:Number = this.y;
         var _local_4:Number = this.z;
         this.x = _arg_1.m00 * _local_2 + _arg_1.m10 * _local_3 + _arg_1.m20 * _local_4;
         this.y = _arg_1.m01 * _local_2 + _arg_1.m11 * _local_3 + _arg_1.m21 * _local_4;
         this.z = _arg_1.m02 * _local_2 + _arg_1.m12 * _local_3 + _arg_1.m22 * _local_4;
         return this;
      }
      
      public function transform4(_arg_1:Matrix4) : Vector3
      {
         var _local_2:Number = this.x;
         var _local_3:Number = this.y;
         var _local_4:Number = this.z;
         this.x = _arg_1.m00 * _local_2 + _arg_1.m01 * _local_3 + _arg_1.m02 * _local_4 + _arg_1.m03;
         this.y = _arg_1.m10 * _local_2 + _arg_1.m11 * _local_3 + _arg_1.m12 * _local_4 + _arg_1.m13;
         this.z = _arg_1.m20 * _local_2 + _arg_1.m21 * _local_3 + _arg_1.m22 * _local_4 + _arg_1.m23;
         return this;
      }
      
      public function transformInverse4(_arg_1:Matrix4) : Vector3
      {
         var _local_2:Number = this.x - _arg_1.m03;
         var _local_3:Number = this.y - _arg_1.m13;
         var _local_4:Number = this.z - _arg_1.m23;
         this.x = _arg_1.m00 * _local_2 + _arg_1.m10 * _local_3 + _arg_1.m20 * _local_4;
         this.y = _arg_1.m01 * _local_2 + _arg_1.m11 * _local_3 + _arg_1.m21 * _local_4;
         this.z = _arg_1.m02 * _local_2 + _arg_1.m12 * _local_3 + _arg_1.m22 * _local_4;
         return this;
      }
      
      public function transformVector4(_arg_1:Matrix4) : Vector3
      {
         var _local_2:Number = this.x;
         var _local_3:Number = this.y;
         var _local_4:Number = this.z;
         this.x = _arg_1.m00 * _local_2 + _arg_1.m01 * _local_3 + _arg_1.m02 * _local_4;
         this.y = _arg_1.m10 * _local_2 + _arg_1.m11 * _local_3 + _arg_1.m12 * _local_4;
         this.z = _arg_1.m20 * _local_2 + _arg_1.m21 * _local_3 + _arg_1.m22 * _local_4;
         return this;
      }
      
      public function reset(_arg_1:Number = 0, _arg_2:Number = 0, _arg_3:Number = 0) : Vector3
      {
         this.x = _arg_1;
         this.y = _arg_2;
         this.z = _arg_3;
         return this;
      }
      
      public function copy(_arg_1:Vector3) : Vector3
      {
         this.x = _arg_1.x;
         this.y = _arg_1.y;
         this.z = _arg_1.z;
         return this;
      }
      
      public function clone() : Vector3
      {
         return new Vector3(this.x,this.y,this.z);
      }
      
      public function toVector3D(_arg_1:Vector3D) : Vector3D
      {
         _arg_1.x = this.x;
         _arg_1.y = this.y;
         _arg_1.z = this.z;
         return _arg_1;
      }
      
      public function copyFromVector3D(_arg_1:Vector3D) : Vector3
      {
         this.x = _arg_1.x;
         this.y = _arg_1.y;
         this.z = _arg_1.z;
         return this;
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + " (" + this.x.toFixed(5) + ", " + this.y.toFixed(5) + ", " + this.z.toFixed(5) + ")";
      }
      
      public function distanceToXYSquared(_arg_1:Vector3) : Number
      {
         var _local_2:Number = this.x - _arg_1.x;
         var _local_3:Number = this.y - _arg_1.y;
         return _local_2 * _local_2 + _local_3 * _local_3;
      }
      
      public function distanceToXY(_arg_1:Vector3) : Number
      {
         var _local_2:Number = this.x - _arg_1.x;
         var _local_3:Number = this.y - _arg_1.y;
         return Math.sqrt(_local_2 * _local_2 + _local_3 * _local_3);
      }
      
      public function distanceTo(_arg_1:Vector3) : Number
      {
         var _local_2:Number = this.x - _arg_1.x;
         var _local_3:Number = this.y - _arg_1.y;
         var _local_4:Number = this.z - _arg_1.z;
         return Math.sqrt(_local_2 * _local_2 + _local_3 * _local_3 + _local_4 * _local_4);
      }
      
      public function distanceToSquared(_arg_1:Vector3) : Number
      {
         var _local_2:Number = this.x - _arg_1.x;
         var _local_3:Number = this.y - _arg_1.y;
         var _local_4:Number = this.z - _arg_1.z;
         return _local_2 * _local_2 + _local_3 * _local_3 + _local_4 * _local_4;
      }
      
      public function setLengthAlongDirection(_arg_1:Vector3, _arg_2:Number) : void
      {
         var _local_3:Number = this.x * _arg_1.x + this.y * _arg_1.y + this.z * _arg_1.z;
         var _local_4:Number = _arg_2 - _local_3;
         this.x += _local_4 * _arg_1.x;
         this.y += _local_4 * _arg_1.y;
         this.z += _local_4 * _arg_1.z;
      }
      
      public function projectOnPlane(_arg_1:Vector3) : void
      {
         var _local_2:Number = this.x * _arg_1.x + this.y * _arg_1.y + this.z * _arg_1.z;
         this.x -= _local_2 * _arg_1.x;
         this.y -= _local_2 * _arg_1.y;
         this.z -= _local_2 * _arg_1.z;
      }
      
      public function toVector3d() : Vector3d
      {
         return new Vector3d(this.x,this.y,this.z);
      }
   }
}

