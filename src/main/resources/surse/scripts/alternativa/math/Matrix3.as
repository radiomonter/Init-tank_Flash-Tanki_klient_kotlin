package alternativa.math
{
   import alternativa.engine3d.core.Object3D;
   import flash.geom.Vector3D;
   import flash.utils.getQualifiedClassName;
   
   public class Matrix3
   {
      
      public static const ZERO:Matrix3 = new Matrix3(0,0,0,0,0,0,0,0,0);
      
      public static const IDENTITY:Matrix3 = new Matrix3();
      
      private static const ziko:Vector3 = new Vector3();
      
      private static const viludane:Vector3 = new Vector3();
      
      private static const kifotabim:Vector3 = new Vector3();
      
      public var m00:Number;
      
      public var m01:Number;
      
      public var m02:Number;
      
      public var m10:Number;
      
      public var m11:Number;
      
      public var m12:Number;
      
      public var m20:Number;
      
      public var m21:Number;
      
      public var m22:Number;
      
      public function Matrix3(_arg_1:Number = 1, _arg_2:Number = 0, _arg_3:Number = 0, _arg_4:Number = 0, _arg_5:Number = 1, _arg_6:Number = 0, _arg_7:Number = 0, _arg_8:Number = 0, _arg_9:Number = 1)
      {
         super();
         this.m00 = _arg_1;
         this.m01 = _arg_2;
         this.m02 = _arg_3;
         this.m10 = _arg_4;
         this.m11 = _arg_5;
         this.m12 = _arg_6;
         this.m20 = _arg_7;
         this.m21 = _arg_8;
         this.m22 = _arg_9;
      }
      
      public function toIdentity() : Matrix3
      {
         this.m00 = this.m11 = this.m22 = 1;
         this.m01 = this.m02 = this.m10 = this.m12 = this.m20 = this.m21 = 0;
         return this;
      }
      
      public function invert() : Matrix3
      {
         var _local_1:Number = this.m00;
         var _local_2:Number = this.m01;
         var _local_3:Number = this.m02;
         var _local_4:Number = this.m10;
         var _local_5:Number = this.m11;
         var _local_6:Number = this.m12;
         var _local_7:Number = this.m20;
         var _local_8:Number = this.m21;
         var _local_9:Number = this.m22;
         var _local_10:Number = 1 / (-_local_3 * _local_5 * _local_7 + _local_2 * _local_6 * _local_7 + _local_3 * _local_4 * _local_8 - _local_1 * _local_6 * _local_8 - _local_2 * _local_4 * _local_9 + _local_1 * _local_5 * _local_9);
         this.m00 = (_local_5 * _local_9 - _local_6 * _local_8) * _local_10;
         this.m01 = (_local_3 * _local_8 - _local_2 * _local_9) * _local_10;
         this.m02 = (_local_2 * _local_6 - _local_3 * _local_5) * _local_10;
         this.m10 = (_local_6 * _local_7 - _local_4 * _local_9) * _local_10;
         this.m11 = (_local_1 * _local_9 - _local_3 * _local_7) * _local_10;
         this.m12 = (_local_3 * _local_4 - _local_1 * _local_6) * _local_10;
         this.m20 = (_local_4 * _local_8 - _local_5 * _local_7) * _local_10;
         this.m21 = (_local_2 * _local_7 - _local_1 * _local_8) * _local_10;
         this.m22 = (_local_1 * _local_5 - _local_2 * _local_4) * _local_10;
         return this;
      }
      
      public function append(_arg_1:Matrix3) : Matrix3
      {
         var _local_2:Number = this.m00;
         var _local_3:Number = this.m01;
         var _local_4:Number = this.m02;
         var _local_5:Number = this.m10;
         var _local_6:Number = this.m11;
         var _local_7:Number = this.m12;
         var _local_8:Number = this.m20;
         var _local_9:Number = this.m21;
         var _local_10:Number = this.m22;
         this.m00 = _arg_1.m00 * _local_2 + _arg_1.m01 * _local_5 + _arg_1.m02 * _local_8;
         this.m01 = _arg_1.m00 * _local_3 + _arg_1.m01 * _local_6 + _arg_1.m02 * _local_9;
         this.m02 = _arg_1.m00 * _local_4 + _arg_1.m01 * _local_7 + _arg_1.m02 * _local_10;
         this.m10 = _arg_1.m10 * _local_2 + _arg_1.m11 * _local_5 + _arg_1.m12 * _local_8;
         this.m11 = _arg_1.m10 * _local_3 + _arg_1.m11 * _local_6 + _arg_1.m12 * _local_9;
         this.m12 = _arg_1.m10 * _local_4 + _arg_1.m11 * _local_7 + _arg_1.m12 * _local_10;
         this.m20 = _arg_1.m20 * _local_2 + _arg_1.m21 * _local_5 + _arg_1.m22 * _local_8;
         this.m21 = _arg_1.m20 * _local_3 + _arg_1.m21 * _local_6 + _arg_1.m22 * _local_9;
         this.m22 = _arg_1.m20 * _local_4 + _arg_1.m21 * _local_7 + _arg_1.m22 * _local_10;
         return this;
      }
      
      public function prepend(_arg_1:Matrix3) : Matrix3
      {
         var _local_2:Number = this.m00;
         var _local_3:Number = this.m01;
         var _local_4:Number = this.m02;
         var _local_5:Number = this.m10;
         var _local_6:Number = this.m11;
         var _local_7:Number = this.m12;
         var _local_8:Number = this.m20;
         var _local_9:Number = this.m21;
         var _local_10:Number = this.m22;
         this.m00 = _local_2 * _arg_1.m00 + _local_3 * _arg_1.m10 + _local_4 * _arg_1.m20;
         this.m01 = _local_2 * _arg_1.m01 + _local_3 * _arg_1.m11 + _local_4 * _arg_1.m21;
         this.m02 = _local_2 * _arg_1.m02 + _local_3 * _arg_1.m12 + _local_4 * _arg_1.m22;
         this.m10 = _local_5 * _arg_1.m00 + _local_6 * _arg_1.m10 + _local_7 * _arg_1.m20;
         this.m11 = _local_5 * _arg_1.m01 + _local_6 * _arg_1.m11 + _local_7 * _arg_1.m21;
         this.m12 = _local_5 * _arg_1.m02 + _local_6 * _arg_1.m12 + _local_7 * _arg_1.m22;
         this.m20 = _local_8 * _arg_1.m00 + _local_9 * _arg_1.m10 + _local_10 * _arg_1.m20;
         this.m21 = _local_8 * _arg_1.m01 + _local_9 * _arg_1.m11 + _local_10 * _arg_1.m21;
         this.m22 = _local_8 * _arg_1.m02 + _local_9 * _arg_1.m12 + _local_10 * _arg_1.m22;
         return this;
      }
      
      public function prependTransposed(_arg_1:Matrix3) : Matrix3
      {
         var _local_2:Number = this.m00;
         var _local_3:Number = this.m01;
         var _local_4:Number = this.m02;
         var _local_5:Number = this.m10;
         var _local_6:Number = this.m11;
         var _local_7:Number = this.m12;
         var _local_8:Number = this.m20;
         var _local_9:Number = this.m21;
         var _local_10:Number = this.m22;
         this.m00 = _local_2 * _arg_1.m00 + _local_3 * _arg_1.m01 + _local_4 * _arg_1.m02;
         this.m01 = _local_2 * _arg_1.m10 + _local_3 * _arg_1.m11 + _local_4 * _arg_1.m12;
         this.m02 = _local_2 * _arg_1.m20 + _local_3 * _arg_1.m21 + _local_4 * _arg_1.m22;
         this.m10 = _local_5 * _arg_1.m00 + _local_6 * _arg_1.m01 + _local_7 * _arg_1.m02;
         this.m11 = _local_5 * _arg_1.m10 + _local_6 * _arg_1.m11 + _local_7 * _arg_1.m12;
         this.m12 = _local_5 * _arg_1.m20 + _local_6 * _arg_1.m21 + _local_7 * _arg_1.m22;
         this.m20 = _local_8 * _arg_1.m00 + _local_9 * _arg_1.m01 + _local_10 * _arg_1.m02;
         this.m21 = _local_8 * _arg_1.m10 + _local_9 * _arg_1.m11 + _local_10 * _arg_1.m12;
         this.m22 = _local_8 * _arg_1.m20 + _local_9 * _arg_1.m21 + _local_10 * _arg_1.m22;
         return this;
      }
      
      public function add(_arg_1:Matrix3) : Matrix3
      {
         this.m00 += _arg_1.m00;
         this.m01 += _arg_1.m01;
         this.m02 += _arg_1.m02;
         this.m10 += _arg_1.m10;
         this.m11 += _arg_1.m11;
         this.m12 += _arg_1.m12;
         this.m20 += _arg_1.m20;
         this.m21 += _arg_1.m21;
         this.m22 += _arg_1.m22;
         return this;
      }
      
      public function subtract(_arg_1:Matrix3) : Matrix3
      {
         this.m00 -= _arg_1.m00;
         this.m01 -= _arg_1.m01;
         this.m02 -= _arg_1.m02;
         this.m10 -= _arg_1.m10;
         this.m11 -= _arg_1.m11;
         this.m12 -= _arg_1.m12;
         this.m20 -= _arg_1.m20;
         this.m21 -= _arg_1.m21;
         this.m22 -= _arg_1.m22;
         return this;
      }
      
      public function transpose() : Matrix3
      {
         var _local_1:Number = this.m01;
         this.m01 = this.m10;
         this.m10 = _local_1;
         _local_1 = this.m02;
         this.m02 = this.m20;
         this.m20 = _local_1;
         _local_1 = this.m12;
         this.m12 = this.m21;
         this.m21 = _local_1;
         return this;
      }
      
      public function transformVector(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         _arg_2.x = this.m00 * _arg_1.x + this.m01 * _arg_1.y + this.m02 * _arg_1.z;
         _arg_2.y = this.m10 * _arg_1.x + this.m11 * _arg_1.y + this.m12 * _arg_1.z;
         _arg_2.z = this.m20 * _arg_1.x + this.m21 * _arg_1.y + this.m22 * _arg_1.z;
      }
      
      public function transformVectorInverse(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         _arg_2.x = this.m00 * _arg_1.x + this.m10 * _arg_1.y + this.m20 * _arg_1.z;
         _arg_2.y = this.m01 * _arg_1.x + this.m11 * _arg_1.y + this.m21 * _arg_1.z;
         _arg_2.z = this.m02 * _arg_1.x + this.m12 * _arg_1.y + this.m22 * _arg_1.z;
      }
      
      public function transformVector3To3D(_arg_1:Vector3, _arg_2:Vector3D) : void
      {
         _arg_2.x = this.m00 * _arg_1.x + this.m01 * _arg_1.y + this.m02 * _arg_1.z;
         _arg_2.y = this.m10 * _arg_1.x + this.m11 * _arg_1.y + this.m12 * _arg_1.z;
         _arg_2.z = this.m20 * _arg_1.x + this.m21 * _arg_1.y + this.m22 * _arg_1.z;
      }
      
      public function createSkewSymmetric(_arg_1:Vector3) : Matrix3
      {
         this.m00 = this.m11 = this.m22 = 0;
         this.m01 = -_arg_1.z;
         this.m02 = _arg_1.y;
         this.m10 = _arg_1.z;
         this.m12 = -_arg_1.x;
         this.m20 = -_arg_1.y;
         this.m21 = _arg_1.x;
         return this;
      }
      
      public function copy(_arg_1:Matrix3) : Matrix3
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
      
      public function setRotationMatrix(_arg_1:Number, _arg_2:Number, _arg_3:Number) : Matrix3
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
      
      public function setRotationMatrixForObject3D(_arg_1:Object3D) : void
      {
         this.setRotationMatrix(_arg_1.rotationX,_arg_1.rotationY,_arg_1.rotationZ);
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
      
      public function clone() : Matrix3
      {
         return new Matrix3(this.m00,this.m01,this.m02,this.m10,this.m11,this.m12,this.m20,this.m21,this.m22);
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + " (" + this.m00 + ", " + this.m01 + ", " + this.m02 + "), (" + this.m10 + ", " + this.m11 + ", " + this.m12 + "), (" + this.m20 + ", " + this.m21 + ", " + this.m22 + ")";
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
               _arg_2.reset(this.m00,this.m10,this.m20);
               return;
            case 1:
               _arg_2.reset(this.m01,this.m11,this.m21);
               return;
            case 2:
               _arg_2.reset(this.m02,this.m12,this.m22);
         }
      }
      
      public function wape(_arg_1:Vector3) : void
      {
         viludane.copy(_arg_1).normalize();
         if(viludane.dot(Vector3.X_AXIS) < 0.9)
         {
            kifotabim.cross2(Vector3.X_AXIS,viludane);
         }
         else
         {
            kifotabim.cross2(viludane,Vector3.Y_AXIS);
         }
         kifotabim.normalize();
         ziko.cross2(viludane,kifotabim).normalize();
         this.lelipeq(ziko,viludane,kifotabim);
      }
      
      public function lelipeq(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3) : void
      {
         this.m00 = _arg_1.x;
         this.m01 = _arg_2.x;
         this.m02 = _arg_3.x;
         this.m10 = _arg_1.y;
         this.m11 = _arg_2.y;
         this.m12 = _arg_3.y;
         this.m20 = _arg_1.z;
         this.m21 = _arg_2.z;
         this.m22 = _arg_3.z;
      }
   }
}

