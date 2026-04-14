package alternativa.physics.collision.colliders
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.primitives.CollisionRect;
   import alternativa.physics.collision.primitives.CollisionTriangle;
   
   public class ColliderUtils
   {
      
      private static const _basisAxisX:Vector3 = new Vector3();
      
      private static const _basisAxisY:Vector3 = new Vector3();
      
      public function ColliderUtils()
      {
         super();
      }
      
      public static function buildContactBasis(_arg_1:Vector3, _arg_2:Matrix4, _arg_3:Matrix4, _arg_4:Matrix4) : void
      {
         var _local_5:Vector3 = _basisAxisX;
         var _local_6:Vector3 = _basisAxisY;
         if(Math.abs(_arg_1.x) < Math.abs(_arg_1.y))
         {
            _local_5.x = 0;
            _local_5.y = _arg_1.z;
            _local_5.z = -_arg_1.y;
         }
         else
         {
            _local_5.x = -_arg_1.z;
            _local_5.y = 0;
            _local_5.z = _arg_1.x;
         }
         _local_5.normalize();
         _local_6.x = _arg_1.y * _local_5.z - _arg_1.z * _local_5.y;
         _local_6.y = _arg_1.z * _local_5.x - _arg_1.x * _local_5.z;
         _local_6.z = _arg_1.x * _local_5.y - _arg_1.y * _local_5.x;
         _arg_4.m00 = _local_5.x;
         _arg_4.m10 = _local_5.y;
         _arg_4.m20 = _local_5.z;
         _arg_4.m01 = _local_6.x;
         _arg_4.m11 = _local_6.y;
         _arg_4.m21 = _local_6.z;
         _arg_4.m02 = _arg_1.x;
         _arg_4.m12 = _arg_1.y;
         _arg_4.m22 = _arg_1.z;
      }
      
      public static function transformFaceToReferenceSpace(_arg_1:Matrix4, _arg_2:Matrix4, _arg_3:Vector.<Vertex>, _arg_4:int) : void
      {
         var _local_5:Vertex = null;
         var _local_6:int = 0;
         while(_local_6 < _arg_4)
         {
            _local_5 = _arg_3[_local_6];
            _arg_2.transformVector(_local_5.local,_local_5.global);
            _arg_1.transformVectorInverse(_local_5.global,_local_5.transformed);
            _local_6++;
         }
      }
      
      public static function getBoxFaceVerticesInCCWOrder(_arg_1:CollisionBox, _arg_2:Vector3, _arg_3:FaceSide, _arg_4:Vector.<Vertex>) : void
      {
         var _local_13:Vector3 = null;
         var _local_14:Vector3 = null;
         var _local_15:Vertex = null;
         var _local_17:int = 0;
         var _local_5:Number = NaN;
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         var _local_9:Number = NaN;
         var _local_10:Number = NaN;
         var _local_11:Number = NaN;
         var _local_12:Number = NaN;
         var _local_16:Matrix4 = _arg_1.transform;
         _local_9 = _local_16.m00;
         _local_10 = _local_16.m10;
         _local_11 = _local_16.m20;
         _local_5 = _local_9 * _arg_2.x + _local_10 * _arg_2.y + _local_11 * _arg_2.z;
         _local_6 = Math.abs(_local_5);
         _local_9 = _local_16.m01;
         _local_10 = _local_16.m11;
         _local_11 = _local_16.m21;
         _local_8 = _local_9 * _arg_2.x + _local_10 * _arg_2.y + _local_11 * _arg_2.z;
         _local_7 = Math.abs(_local_8);
         if(_local_7 > _local_6)
         {
            _local_6 = _local_7;
            _local_5 = _local_8;
            _local_17 = 1;
         }
         _local_9 = _local_16.m02;
         _local_10 = _local_16.m12;
         _local_11 = _local_16.m22;
         _local_8 = _local_9 * _arg_2.x + _local_10 * _arg_2.y + _local_11 * _arg_2.z;
         _local_7 = Math.abs(_local_8);
         if(_local_7 > _local_6)
         {
            _local_5 = _local_8;
            _local_17 = 2;
         }
         _local_12 = _local_5 > 0 ? Number(1) : Number(-1);
         if(_arg_3 == FaceSide.BACK)
         {
            _local_12 = -_local_12;
         }
         _local_14 = _arg_1.hs;
         switch(_local_17)
         {
            case 0:
               _local_13 = Vertex(_arg_4[0]).local;
               _local_13.x = _local_12 * _local_14.x;
               _local_13.y = _local_14.y;
               _local_13.z = _local_14.z;
               _local_13 = Vertex(_arg_4[1]).local;
               _local_13.x = _local_12 * _local_14.x;
               _local_13.y = -_local_14.y;
               _local_13.z = _local_14.z;
               _local_13 = Vertex(_arg_4[2]).local;
               _local_13.x = _local_12 * _local_14.x;
               _local_13.y = -_local_14.y;
               _local_13.z = -_local_14.z;
               _local_13 = Vertex(_arg_4[3]).local;
               _local_13.x = _local_12 * _local_14.x;
               _local_13.y = _local_14.y;
               _local_13.z = -_local_14.z;
               break;
            case 1:
               _local_13 = Vertex(_arg_4[0]).local;
               _local_13.x = _local_14.x;
               _local_13.y = _local_12 * _local_14.y;
               _local_13.z = _local_14.z;
               _local_13 = Vertex(_arg_4[1]).local;
               _local_13.x = _local_14.x;
               _local_13.y = _local_12 * _local_14.y;
               _local_13.z = -_local_14.z;
               _local_13 = Vertex(_arg_4[2]).local;
               _local_13.x = -_local_14.x;
               _local_13.y = _local_12 * _local_14.y;
               _local_13.z = -_local_14.z;
               _local_13 = Vertex(_arg_4[3]).local;
               _local_13.x = -_local_14.x;
               _local_13.y = _local_12 * _local_14.y;
               _local_13.z = _local_14.z;
               break;
            case 2:
               _local_13 = Vertex(_arg_4[0]).local;
               _local_13.x = _local_14.x;
               _local_13.y = _local_14.y;
               _local_13.z = _local_12 * _local_14.z;
               _local_13 = Vertex(_arg_4[1]).local;
               _local_13.x = -_local_14.x;
               _local_13.y = _local_14.y;
               _local_13.z = _local_12 * _local_14.z;
               _local_13 = Vertex(_arg_4[2]).local;
               _local_13.x = -_local_14.x;
               _local_13.y = -_local_14.y;
               _local_13.z = _local_12 * _local_14.z;
               _local_13 = Vertex(_arg_4[3]).local;
               _local_13.x = _local_14.x;
               _local_13.y = -_local_14.y;
               _local_13.z = _local_12 * _local_14.z;
               break;
            default:
               throw new Error();
         }
         if(_local_5 < 0)
         {
            _local_15 = _arg_4[0];
            _arg_4[0] = _arg_4[3];
            _arg_4[3] = _local_15;
            _local_15 = _arg_4[1];
            _arg_4[1] = _arg_4[2];
            _arg_4[2] = _local_15;
         }
      }
      
      public static function getRectFaceInCCWOrder(_arg_1:CollisionRect, _arg_2:Vector3, _arg_3:Vector.<Vertex>) : void
      {
         var _local_4:Vertex = null;
         var _local_5:Vector3 = _arg_1.hs;
         _local_4 = _arg_3[0];
         _local_4.local.x = _local_5.x;
         _local_4.local.y = _local_5.y;
         _local_4.local.z = 0;
         _local_4 = _arg_3[1];
         _local_4.local.x = -_local_5.x;
         _local_4.local.y = _local_5.y;
         _local_4.local.z = 0;
         _local_4 = _arg_3[2];
         _local_4.local.x = -_local_5.x;
         _local_4.local.y = -_local_5.y;
         _local_4.local.z = 0;
         _local_4 = _arg_3[3];
         _local_4.local.x = _local_5.x;
         _local_4.local.y = -_local_5.y;
         _local_4.local.z = 0;
         var _local_6:Matrix4 = _arg_1.transform;
         var _local_7:Number = _arg_2.x * _local_6.m02 + _arg_2.y * _local_6.m12 + _arg_2.z * _local_6.m22;
         if(_local_7 < 0)
         {
            _local_4 = _arg_3[0];
            _arg_3[0] = _arg_3[3];
            _arg_3[3] = _local_4;
            _local_4 = _arg_3[1];
            _arg_3[1] = _arg_3[2];
            _arg_3[2] = _local_4;
         }
      }
      
      public static function getTriangleFaceInCCWOrder(_arg_1:CollisionTriangle, _arg_2:Vector3, _arg_3:Vector.<Vertex>) : void
      {
         var _local_4:Vertex = null;
         _local_4 = _arg_3[0];
         _local_4.local.x = _arg_1.v0.x;
         _local_4.local.y = _arg_1.v0.y;
         _local_4.local.z = 0;
         _local_4 = _arg_3[1];
         _local_4.local.x = _arg_1.v1.x;
         _local_4.local.y = _arg_1.v1.y;
         _local_4.local.z = 0;
         _local_4 = _arg_3[2];
         _local_4.local.x = _arg_1.v2.x;
         _local_4.local.y = _arg_1.v2.y;
         _local_4.local.z = 0;
         var _local_5:Matrix4 = _arg_1.transform;
         var _local_6:Number = _arg_2.x * _local_5.m02 + _arg_2.y * _local_5.m12 + _arg_2.z * _local_5.m22;
         if(_local_6 < 0)
         {
            _local_4 = _arg_3[0];
            _arg_3[0] = _arg_3[2];
            _arg_3[2] = _local_4;
         }
      }
   }
}

