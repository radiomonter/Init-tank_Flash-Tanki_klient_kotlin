package alternativa.physics.collision.colliders
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.CollisionShape;
   import flash.geom.Point;
   
   public class PolygonsIntersectionUtils
   {
      
      private static const projectedPoints1:Vector.<Point> = Vector.<Point>([new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point()]);
      
      private static const projectedPoints2:Vector.<Point> = Vector.<Point>([new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point()]);
      
      private static const intersection:Vector.<Point> = Vector.<Point>([new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point()]);
      
      private static var points1:Vector.<Point> = Vector.<Point>([new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point()]);
      
      private static var points2:Vector.<Point> = Vector.<Point>([new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point(),new Point()]);
      
      private static const point:Point = new Point();
      
      private static const normal1:Vector3 = new Vector3();
      
      private static const normal2:Vector3 = new Vector3();
      
      public function PolygonsIntersectionUtils()
      {
         super();
      }
      
      public static function findContacts(_arg_1:CollisionShape, _arg_2:Vector.<Vertex>, _arg_3:int, _arg_4:CollisionShape, _arg_5:Vector.<Vertex>, _arg_6:int, _arg_7:Matrix4, _arg_8:Vector.<ShapeContact>) : void
      {
         var _local_9:Point = null;
         var _local_12:ShapeContact = null;
         var _local_13:Vector3 = null;
         var _local_15:int = 0;
         var _local_10:Number = NaN;
         var _local_11:Number = NaN;
         calculateFaceNormal(_arg_2,normal1);
         calculateFaceNormal(_arg_5,normal2);
         fillProjectedPoints(_arg_2,_arg_3,projectedPoints1);
         fillProjectedPoints(_arg_5,_arg_6,projectedPoints2);
         var _local_14:int = findPolygonsIntersection(projectedPoints1,_arg_3,projectedPoints2,_arg_6,intersection);
         while(_local_15 < _local_14)
         {
            _local_9 = intersection[_local_15];
            _local_10 = getFaceZ(_local_9,Vertex(_arg_2[0]).transformed,normal1);
            _local_11 = getFaceZ(_local_9,Vertex(_arg_5[0]).transformed,normal2);
            if(_local_11 > _local_10)
            {
               _local_12 = ShapeContact.create();
               _local_12.shape1 = _arg_1;
               _local_12.shape2 = _arg_4;
               _local_13 = _local_12.position;
               _local_13.x = _local_9.x;
               _local_13.y = _local_9.y;
               _local_13.z = 0.5 * (_local_10 + _local_11);
               _local_13.transform4(_arg_7);
               _local_12.penetration = _local_11 - _local_10;
               _local_12.normal.x = _arg_7.m02;
               _local_12.normal.y = _arg_7.m12;
               _local_12.normal.z = _arg_7.m22;
               _arg_8[_arg_8.length] = _local_12;
            }
            _local_15++;
         }
      }
      
      private static function calculateFaceNormal(_arg_1:Vector.<Vertex>, _arg_2:Vector3) : void
      {
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         var _local_6:Number = NaN;
         var _local_7:Vertex = _arg_1[0];
         var _local_8:Vertex = _arg_1[1];
         var _local_9:Vertex = _arg_1[2];
         var _local_10:Vector3 = _local_7.transformed;
         var _local_11:Vector3 = _local_8.transformed;
         var _local_12:Vector3 = _local_9.transformed;
         _local_3 = _local_11.x - _local_10.x;
         var _local_13:Number = _local_11.y - _local_10.y;
         _local_4 = _local_11.z - _local_10.z;
         _local_5 = _local_12.x - _local_10.x;
         var _local_14:Number = _local_12.y - _local_10.y;
         _local_6 = _local_12.z - _local_10.z;
         _arg_2.x = _local_13 * _local_6 - _local_4 * _local_14;
         _arg_2.y = _local_4 * _local_5 - _local_3 * _local_6;
         _arg_2.z = _local_3 * _local_14 - _local_13 * _local_5;
         _arg_2.normalize();
      }
      
      private static function fillProjectedPoints(_arg_1:Vector.<Vertex>, _arg_2:int, _arg_3:Vector.<Point>) : void
      {
         var _local_4:Vertex = null;
         var _local_5:Point = null;
         var _local_6:int = 0;
         while(_local_6 < _arg_2)
         {
            _local_4 = _arg_1[_local_6];
            _local_5 = _arg_3[_local_6];
            _local_5.x = _local_4.transformed.x;
            _local_5.y = _local_4.transformed.y;
            _local_6++;
         }
      }
      
      private static function findPolygonsIntersection(_arg_1:Vector.<Point>, _arg_2:int, _arg_3:Vector.<Point>, _arg_4:int, _arg_5:Vector.<Point>) : int
      {
         var _local_6:Point = null;
         var _local_7:Vector.<Point> = null;
         var _local_10:int = 0;
         copyPoints(_arg_3,points1,_arg_4);
         var _local_8:int = _arg_4;
         var _local_9:Point = _arg_1[_arg_2 - 1];
         while(_local_10 < _arg_2)
         {
            _local_6 = _arg_1[_local_10];
            _local_8 = clip(_local_9,_local_6,points1,points2,_local_8);
            if(_local_8 == 0)
            {
               break;
            }
            _local_9 = _local_6;
            _local_7 = points1;
            points1 = points2;
            points2 = _local_7;
            _local_10++;
         }
         copyPoints(points1,_arg_5,_local_8);
         return _local_8;
      }
      
      private static function copyPoints(_arg_1:Vector.<Point>, _arg_2:Vector.<Point>, _arg_3:int) : void
      {
         var _local_4:Point = null;
         var _local_5:Point = null;
         var _local_6:int = 0;
         while(_local_6 < _arg_3)
         {
            _local_4 = _arg_1[_local_6];
            _local_5 = _arg_2[_local_6];
            _local_5.x = _local_4.x;
            _local_5.y = _local_4.y;
            _local_6++;
         }
      }
      
      private static function clip(_arg_1:Point, _arg_2:Point, _arg_3:Vector.<Point>, _arg_4:Vector.<Point>, _arg_5:int) : int
      {
         var _local_6:Point = null;
         var _local_7:Boolean = false;
         var _local_10:int = 0;
         var _local_11:int = 0;
         var _local_8:Point = _arg_3[_arg_5 - 1];
         var _local_9:Boolean = arePointsCCW(_arg_1,_arg_2,_local_8);
         while(_local_11 < _arg_5)
         {
            _local_6 = _arg_3[_local_11];
            _local_7 = arePointsCCW(_arg_1,_arg_2,_local_6);
            if(_local_7)
            {
               if(!_local_9)
               {
                  calculateIntersection(_arg_1,_arg_2,_local_8,_local_6,point);
                  setPoint(point,_arg_4,_local_10++);
               }
               setPoint(_local_6,_arg_4,_local_10++);
            }
            else if(_local_9)
            {
               calculateIntersection(_arg_1,_arg_2,_local_8,_local_6,point);
               setPoint(point,_arg_4,_local_10++);
            }
            _local_9 = _local_7;
            _local_8 = _local_6;
            _local_11++;
         }
         return _local_10;
      }
      
      private static function setPoint(_arg_1:Point, _arg_2:Vector.<Point>, _arg_3:int) : void
      {
         var _local_4:Point = _arg_2[_arg_3];
         _local_4.x = _arg_1.x;
         _local_4.y = _arg_1.y;
      }
      
      private static function arePointsCCW(_arg_1:Point, _arg_2:Point, _arg_3:Point) : Boolean
      {
         var _local_4:Number = _arg_2.x - _arg_1.x;
         var _local_5:Number = _arg_2.y - _arg_1.y;
         var _local_6:Number = _arg_3.x - _arg_1.x;
         var _local_7:Number = _arg_3.y - _arg_1.y;
         return _local_4 * _local_7 - _local_5 * _local_6 > 0;
      }
      
      private static function calculateIntersection(_arg_1:Point, _arg_2:Point, _arg_3:Point, _arg_4:Point, _arg_5:Point) : void
      {
         var _local_6:Number = _arg_2.x - _arg_1.x;
         var _local_7:Number = _arg_2.y - _arg_1.y;
         var _local_8:Number = _arg_4.x - _arg_3.x;
         var _local_9:Number = _arg_4.y - _arg_3.y;
         var _local_10:Number = _arg_3.x - _arg_1.x;
         var _local_11:Number = _arg_3.y - _arg_1.y;
         var _local_12:Number = (_local_6 * _local_11 - _local_7 * _local_10) / (_local_7 * _local_8 - _local_6 * _local_9);
         _arg_5.x = _arg_3.x + _local_12 * _local_8;
         _arg_5.y = _arg_3.y + _local_12 * _local_9;
      }
      
      private static function getFaceZ(_arg_1:Point, _arg_2:Vector3, _arg_3:Vector3) : Number
      {
         var _local_4:Number = _arg_2.dot(_arg_3);
         return (_local_4 - _arg_1.x * _arg_3.x - _arg_1.y * _arg_3.y) / _arg_3.z;
      }
   }
}

