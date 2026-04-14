package alternativa.math
{
   import flash.geom.Vector3D;
   import flash.utils.getQualifiedClassName;
   
   public class Quaternion
   {
      
      private static const _q:Quaternion = new Quaternion();
      
      public var w:Number;
      
      public var x:Number;
      
      public var y:Number;
      
      public var z:Number;
      
      public function Quaternion(_arg_1:Number = 1, _arg_2:Number = 0, _arg_3:Number = 0, _arg_4:Number = 0)
      {
         super();
         this.w = _arg_1;
         this.x = _arg_2;
         this.y = _arg_3;
         this.z = _arg_4;
      }
      
      public static function multiply(_arg_1:Quaternion, _arg_2:Quaternion, _arg_3:Quaternion) : void
      {
         _arg_3.w = _arg_1.w * _arg_2.w - _arg_1.x * _arg_2.x - _arg_1.y * _arg_2.y - _arg_1.z * _arg_2.z;
         _arg_3.x = _arg_1.w * _arg_2.x + _arg_1.x * _arg_2.w + _arg_1.y * _arg_2.z - _arg_1.z * _arg_2.y;
         _arg_3.y = _arg_1.w * _arg_2.y + _arg_1.y * _arg_2.w + _arg_1.z * _arg_2.x - _arg_1.x * _arg_2.z;
         _arg_3.z = _arg_1.w * _arg_2.z + _arg_1.z * _arg_2.w + _arg_1.x * _arg_2.y - _arg_1.y * _arg_2.x;
      }
      
      public static function createFromAxisAngle(_arg_1:Vector3, _arg_2:Number) : Quaternion
      {
         var _local_3:Quaternion = new Quaternion();
         _local_3.setFromAxisAngle(_arg_1,_arg_2);
         return _local_3;
      }
      
      public static function createFromAxisAngleComponents(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number) : Quaternion
      {
         var _local_5:Quaternion = new Quaternion();
         _local_5.setFromAxisAngleComponents(_arg_1,_arg_2,_arg_3,_arg_4);
         return _local_5;
      }
      
      public function reset(_arg_1:Number = 1, _arg_2:Number = 0, _arg_3:Number = 0, _arg_4:Number = 0) : Quaternion
      {
         this.w = _arg_1;
         this.x = _arg_2;
         this.y = _arg_3;
         this.z = _arg_4;
         return this;
      }
      
      public function normalize() : Quaternion
      {
         var _local_1:Number = this.w * this.w + this.x * this.x + this.y * this.y + this.z * this.z;
         if(_local_1 == 0)
         {
            this.w = 1;
         }
         else
         {
            _local_1 = 1 / Math.sqrt(_local_1);
            this.w *= _local_1;
            this.x *= _local_1;
            this.y *= _local_1;
            this.z *= _local_1;
         }
         return this;
      }
      
      public function prepend(_arg_1:Quaternion) : Quaternion
      {
         var _local_2:Number = this.w * _arg_1.w - this.x * _arg_1.x - this.y * _arg_1.y - this.z * _arg_1.z;
         var _local_3:Number = this.w * _arg_1.x + this.x * _arg_1.w + this.y * _arg_1.z - this.z * _arg_1.y;
         var _local_4:Number = this.w * _arg_1.y + this.y * _arg_1.w + this.z * _arg_1.x - this.x * _arg_1.z;
         var _local_5:Number = this.w * _arg_1.z + this.z * _arg_1.w + this.x * _arg_1.y - this.y * _arg_1.x;
         this.w = _local_2;
         this.x = _local_3;
         this.y = _local_4;
         this.z = _local_5;
         return this;
      }
      
      public function append(_arg_1:Quaternion) : Quaternion
      {
         var _local_2:Number = _arg_1.w * this.w - _arg_1.x * this.x - _arg_1.y * this.y - _arg_1.z * this.z;
         var _local_3:Number = _arg_1.w * this.x + _arg_1.x * this.w + _arg_1.y * this.z - _arg_1.z * this.y;
         var _local_4:Number = _arg_1.w * this.y + _arg_1.y * this.w + _arg_1.z * this.x - _arg_1.x * this.z;
         var _local_5:Number = _arg_1.w * this.z + _arg_1.z * this.w + _arg_1.x * this.y - _arg_1.y * this.x;
         this.w = _local_2;
         this.x = _local_3;
         this.y = _local_4;
         this.z = _local_5;
         return this;
      }
      
      public function rotateByVector(_arg_1:Vector3) : Quaternion
      {
         var _local_2:Number = -_arg_1.x * this.x - _arg_1.y * this.y - _arg_1.z * this.z;
         var _local_3:Number = _arg_1.x * this.w + _arg_1.y * this.z - _arg_1.z * this.y;
         var _local_4:Number = _arg_1.y * this.w + _arg_1.z * this.x - _arg_1.x * this.z;
         var _local_5:Number = _arg_1.z * this.w + _arg_1.x * this.y - _arg_1.y * this.x;
         this.w = _local_2;
         this.x = _local_3;
         this.y = _local_4;
         this.z = _local_5;
         return this;
      }
      
      public function addScaledVector(_arg_1:Vector3, _arg_2:Number) : Quaternion
      {
         var _local_3:Number = _arg_1.x * _arg_2;
         var _local_4:Number = _arg_1.y * _arg_2;
         var _local_5:Number = _arg_1.z * _arg_2;
         var _local_6:Number = -this.x * _local_3 - this.y * _local_4 - this.z * _local_5;
         var _local_7:Number = _local_3 * this.w + _local_4 * this.z - _local_5 * this.y;
         var _local_8:Number = _local_4 * this.w + _local_5 * this.x - _local_3 * this.z;
         var _local_9:Number = _local_5 * this.w + _local_3 * this.y - _local_4 * this.x;
         this.w += 0.5 * _local_6;
         this.x += 0.5 * _local_7;
         this.y += 0.5 * _local_8;
         this.z += 0.5 * _local_9;
         var _local_10:Number = this.w * this.w + this.x * this.x + this.y * this.y + this.z * this.z;
         if(_local_10 == 0)
         {
            this.w = 1;
         }
         else
         {
            _local_10 = 1 / Math.sqrt(_local_10);
            this.w *= _local_10;
            this.x *= _local_10;
            this.y *= _local_10;
            this.z *= _local_10;
         }
         return this;
      }
      
      public function toMatrix3(_arg_1:Matrix3) : Quaternion
      {
         var _local_2:Number = NaN;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         var _local_5:Number = 2 * this.x * this.x;
         var _local_6:Number = 2 * this.y * this.y;
         var _local_7:Number = 2 * this.z * this.z;
         var _local_8:Number = 2 * this.x * this.y;
         var _local_9:Number = 2 * this.y * this.z;
         _local_2 = 2 * this.z * this.x;
         _local_3 = 2 * this.w * this.x;
         _local_4 = 2 * this.w * this.y;
         var _local_10:Number = 2 * this.w * this.z;
         _arg_1.m00 = 1 - _local_6 - _local_7;
         _arg_1.m01 = _local_8 - _local_10;
         _arg_1.m02 = _local_2 + _local_4;
         _arg_1.m10 = _local_8 + _local_10;
         _arg_1.m11 = 1 - _local_5 - _local_7;
         _arg_1.m12 = _local_9 - _local_3;
         _arg_1.m20 = _local_2 - _local_4;
         _arg_1.m21 = _local_9 + _local_3;
         _arg_1.m22 = 1 - _local_5 - _local_6;
         return this;
      }
      
      public function getYAxis(_arg_1:Vector3) : Vector3
      {
         var _local_2:Number = NaN;
         var _local_3:Number = 2 * this.x * this.x;
         _local_2 = 2 * this.z * this.z;
         var _local_4:Number = 2 * this.x * this.y;
         var _local_5:Number = 2 * this.y * this.z;
         var _local_6:Number = 2 * this.w * this.x;
         var _local_7:Number = 2 * this.w * this.z;
         _arg_1.x = _local_4 - _local_7;
         _arg_1.y = 1 - _local_3 - _local_2;
         _arg_1.z = _local_5 + _local_6;
         return _arg_1;
      }
      
      public function getZAxis(_arg_1:Vector3) : Vector3
      {
         var _local_2:Number = NaN;
         var _local_3:Number = 2 * this.x * this.x;
         var _local_4:Number = 2 * this.y * this.y;
         var _local_5:Number = 2 * this.y * this.z;
         var _local_6:Number = 2 * this.z * this.x;
         _local_2 = 2 * this.w * this.x;
         var _local_7:Number = 2 * this.w * this.y;
         _arg_1.x = _local_6 + _local_7;
         _arg_1.y = _local_5 - _local_2;
         _arg_1.z = 1 - _local_3 - _local_4;
         return _arg_1;
      }
      
      public function toMatrix4(_arg_1:Matrix4) : Quaternion
      {
         var _local_2:Number = NaN;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         _local_2 = 2 * this.x * this.x;
         var _local_6:Number = 2 * this.y * this.y;
         _local_3 = 2 * this.z * this.z;
         var _local_7:Number = 2 * this.x * this.y;
         _local_4 = 2 * this.y * this.z;
         var _local_8:Number = 2 * this.z * this.x;
         _local_5 = 2 * this.w * this.x;
         var _local_9:Number = 2 * this.w * this.y;
         var _local_10:Number = 2 * this.w * this.z;
         _arg_1.m00 = 1 - _local_6 - _local_3;
         _arg_1.m01 = _local_7 - _local_10;
         _arg_1.m02 = _local_8 + _local_9;
         _arg_1.m10 = _local_7 + _local_10;
         _arg_1.m11 = 1 - _local_2 - _local_3;
         _arg_1.m12 = _local_4 - _local_5;
         _arg_1.m20 = _local_8 - _local_9;
         _arg_1.m21 = _local_4 + _local_5;
         _arg_1.m22 = 1 - _local_2 - _local_6;
         return this;
      }
      
      public function length() : Number
      {
         return Math.sqrt(this.w * this.w + this.x * this.x + this.y * this.y + this.z * this.z);
      }
      
      public function lengthSqr() : Number
      {
         return this.w * this.w + this.x * this.x + this.y * this.y + this.z * this.z;
      }
      
      public function setFromAxisAngle(_arg_1:Vector3, _arg_2:Number) : Quaternion
      {
         this.w = Math.cos(0.5 * _arg_2);
         var _local_3:Number = Math.sin(0.5 * _arg_2) / Math.sqrt(_arg_1.x * _arg_1.x + _arg_1.y * _arg_1.y + _arg_1.z * _arg_1.z);
         this.x = _arg_1.x * _local_3;
         this.y = _arg_1.y * _local_3;
         this.z = _arg_1.z * _local_3;
         return this;
      }
      
      public function setFromAxisAngleComponents(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number) : Quaternion
      {
         this.w = Math.cos(0.5 * _arg_4);
         var _local_5:Number = Math.sin(0.5 * _arg_4) / Math.sqrt(_arg_1 * _arg_1 + _arg_2 * _arg_2 + _arg_3 * _arg_3);
         this.x = _arg_1 * _local_5;
         this.y = _arg_2 * _local_5;
         this.z = _arg_3 * _local_5;
         return this;
      }
      
      public function toAxisVector(_arg_1:Vector3 = null) : Vector3
      {
         var _local_2:Number = NaN;
         var _local_3:Number = NaN;
         if(this.w < -1 || this.w > 1)
         {
            this.normalize();
         }
         if(_arg_1 == null)
         {
            _arg_1 = new Vector3();
         }
         if(this.w > -1 && this.w < 1)
         {
            if(this.w == 0)
            {
               _arg_1.x = this.x;
               _arg_1.y = this.y;
               _arg_1.z = this.z;
            }
            else
            {
               _local_2 = 2 * Math.acos(this.w);
               _local_3 = 1 / Math.sqrt(1 - this.w * this.w);
               _arg_1.x = this.x * _local_3 * _local_2;
               _arg_1.y = this.y * _local_3 * _local_2;
               _arg_1.z = this.z * _local_3 * _local_2;
            }
         }
         else
         {
            _arg_1.x = 0;
            _arg_1.y = 0;
            _arg_1.z = 0;
         }
         return _arg_1;
      }
      
      public function getEulerAngles(_arg_1:Vector3) : Vector3
      {
         var _local_2:Number = 2 * this.x * this.x;
         var _local_3:Number = 2 * this.y * this.y;
         var _local_4:Number = 2 * this.z * this.z;
         var _local_5:Number = 2 * this.x * this.y;
         var _local_6:Number = 2 * this.y * this.z;
         var _local_7:Number = 2 * this.z * this.x;
         var _local_8:Number = 2 * this.w * this.x;
         var _local_9:Number = 2 * this.w * this.y;
         var _local_10:Number = 2 * this.w * this.z;
         var _local_11:Number = 1 - _local_3 - _local_4;
         var _local_12:Number = _local_5 - _local_10;
         var _local_13:Number = _local_5 + _local_10;
         var _local_14:Number = 1 - _local_2 - _local_4;
         var _local_15:Number = _local_7 - _local_9;
         var _local_16:Number = _local_6 + _local_8;
         var _local_17:Number = 1 - _local_2 - _local_3;
         if(-1 < _local_15 && _local_15 < 1)
         {
            if(_arg_1 == null)
            {
               _arg_1 = new Vector3(Math.atan2(_local_16,_local_17),-Math.asin(_local_15),Math.atan2(_local_13,_local_11));
            }
            else
            {
               _arg_1.x = Math.atan2(_local_16,_local_17);
               _arg_1.y = -Math.asin(_local_15);
               _arg_1.z = Math.atan2(_local_13,_local_11);
            }
         }
         else if(_arg_1 == null)
         {
            _arg_1 = new Vector3(0,0.5 * (_local_15 <= -1 ? Math.PI : -Math.PI),Math.atan2(-_local_12,_local_14));
         }
         else
         {
            _arg_1.x = 0;
            _arg_1.y = _local_15 <= -1 ? Number(Math.PI) : Number(-Math.PI);
            _arg_1.y *= 0.5;
            _arg_1.z = Math.atan2(-_local_12,_local_14);
         }
         return _arg_1;
      }
      
      public function setFromEulerAnglesXYZ(_arg_1:Number, _arg_2:Number, _arg_3:Number) : void
      {
         this.setFromAxisAngleComponents(1,0,0,_arg_1);
         _q.setFromAxisAngleComponents(0,1,0,_arg_2);
         this.append(_q);
         this.normalize();
         _q.setFromAxisAngleComponents(0,0,1,_arg_3);
         this.append(_q);
         this.normalize();
      }
      
      public function setFromEulerAngles(_arg_1:Vector3) : void
      {
         this.setFromEulerAnglesXYZ(_arg_1.x,_arg_1.y,_arg_1.z);
      }
      
      public function conjugate() : void
      {
         this.x = -this.x;
         this.y = -this.y;
         this.z = -this.z;
      }
      
      public function nlerp(_arg_1:Quaternion, _arg_2:Quaternion, _arg_3:Number) : Quaternion
      {
         var _local_4:Number = 1 - _arg_3;
         this.w = _arg_1.w * _local_4 + _arg_2.w * _arg_3;
         this.x = _arg_1.x * _local_4 + _arg_2.x * _arg_3;
         this.y = _arg_1.y * _local_4 + _arg_2.y * _arg_3;
         this.z = _arg_1.z * _local_4 + _arg_2.z * _arg_3;
         _local_4 = this.w * this.w + this.x * this.x + this.y * this.y + this.z * this.z;
         if(_local_4 == 0)
         {
            this.w = 1;
         }
         else
         {
            _local_4 = 1 / Math.sqrt(_local_4);
            this.w *= _local_4;
            this.x *= _local_4;
            this.y *= _local_4;
            this.z *= _local_4;
         }
         return this;
      }
      
      public function subtract(_arg_1:Quaternion) : Quaternion
      {
         this.w -= _arg_1.w;
         this.x -= _arg_1.x;
         this.y -= _arg_1.y;
         this.z -= _arg_1.z;
         return this;
      }
      
      public function diff(_arg_1:Quaternion, _arg_2:Quaternion) : Quaternion
      {
         this.w = _arg_2.w - _arg_1.w;
         this.x = _arg_2.x - _arg_1.x;
         this.y = _arg_2.y - _arg_1.y;
         this.z = _arg_2.z - _arg_1.z;
         return this;
      }
      
      public function copy(_arg_1:Quaternion) : Quaternion
      {
         this.w = _arg_1.w;
         this.x = _arg_1.x;
         this.y = _arg_1.y;
         this.z = _arg_1.z;
         return this;
      }
      
      public function toVector3D(_arg_1:Vector3D) : Vector3D
      {
         _arg_1.x = this.x;
         _arg_1.y = this.y;
         _arg_1.z = this.z;
         _arg_1.w = this.w;
         return _arg_1;
      }
      
      public function clone() : Quaternion
      {
         return new Quaternion(this.w,this.x,this.y,this.z);
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + "(" + this.w + ", " + this.x + ", " + this.y + ", " + this.z + ")";
      }
      
      public function slerp(_arg_1:Quaternion, _arg_2:Quaternion, _arg_3:Number) : Quaternion
      {
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         var _local_9:Number = NaN;
         var _local_10:Number = 1;
         var _local_11:Number = _arg_1.w * _arg_2.w + _arg_1.x * _arg_2.x + _arg_1.y * _arg_2.y + _arg_1.z * _arg_2.z;
         if(_local_11 < 0)
         {
            _local_11 = -_local_11;
            _local_10 = -1;
         }
         if(1 - _local_11 < 0.001)
         {
            _local_4 = 1 - _arg_3;
            _local_5 = _arg_3 * _local_10;
            this.w = _arg_1.w * _local_4 + _arg_2.w * _local_5;
            this.x = _arg_1.x * _local_4 + _arg_2.x * _local_5;
            this.y = _arg_1.y * _local_4 + _arg_2.y * _local_5;
            this.z = _arg_1.z * _local_4 + _arg_2.z * _local_5;
            this.normalize();
         }
         else
         {
            _local_6 = Math.acos(_local_11);
            _local_7 = Math.sin(_local_6);
            _local_8 = Math.sin((1 - _arg_3) * _local_6) / _local_7;
            _local_9 = Math.sin(_arg_3 * _local_6) / _local_7 * _local_10;
            this.w = _arg_1.w * _local_8 + _arg_2.w * _local_9;
            this.x = _arg_1.x * _local_8 + _arg_2.x * _local_9;
            this.y = _arg_1.y * _local_8 + _arg_2.y * _local_9;
            this.z = _arg_1.z * _local_8 + _arg_2.z * _local_9;
         }
         return this;
      }
      
      public function isFiniteQuaternion() : Boolean
      {
         return isFinite(this.w) && isFinite(this.x) && isFinite(this.y) && isFinite(this.z);
      }
   }
}

