package alternativa.physics.collision.colliders
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.Collider;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.primitives.CollisionSphere;
   
   public class BoxSphereCollider implements Collider
   {
      
      private var center:Vector3 = new Vector3();
      
      private var closestPoint:Vector3 = new Vector3();
      
      private var boxPosition:Vector3 = new Vector3();
      
      private var spherePosition:Vector3 = new Vector3();
      
      public function BoxSphereCollider()
      {
         super();
      }
      
      public function getContacts(_arg_1:CollisionShape, _arg_2:CollisionShape, _arg_3:Vector.<ShapeContact>) : void
      {
         var _local_4:CollisionBox = null;
         var _local_5:Matrix4 = null;
         var _local_6:CollisionSphere = _arg_1 as CollisionSphere;
         if(_local_6 == null)
         {
            _local_6 = _arg_2 as CollisionSphere;
            _local_4 = _arg_1 as CollisionBox;
         }
         else
         {
            _local_4 = _arg_2 as CollisionBox;
         }
         var _local_7:Matrix4 = _local_6.transform;
         _local_7.getAxis(3,this.spherePosition);
         _local_5 = _local_4.transform;
         _local_5.getAxis(3,this.boxPosition);
         _local_5.transformVectorInverse(this.spherePosition,this.center);
         var _local_8:Vector3 = _local_4.hs;
         var _local_9:Number = _local_8.x + _local_6.r;
         var _local_10:Number = _local_8.y + _local_6.r;
         var _local_11:Number = _local_8.z + _local_6.r;
         if(this.center.x > _local_9 || this.center.x < -_local_9 || this.center.y > _local_10 || this.center.y < -_local_10 || this.center.z > _local_11 || this.center.z < -_local_11)
         {
            return;
         }
         if(this.center.x > _local_8.x)
         {
            this.closestPoint.x = _local_8.x;
         }
         else if(this.center.x < -_local_8.x)
         {
            this.closestPoint.x = -_local_8.x;
         }
         else
         {
            this.closestPoint.x = this.center.x;
         }
         if(this.center.y > _local_8.y)
         {
            this.closestPoint.y = _local_8.y;
         }
         else if(this.center.y < -_local_8.y)
         {
            this.closestPoint.y = -_local_8.y;
         }
         else
         {
            this.closestPoint.y = this.center.y;
         }
         if(this.center.z > _local_8.z)
         {
            this.closestPoint.z = _local_8.z;
         }
         else if(this.center.z < -_local_8.z)
         {
            this.closestPoint.z = -_local_8.z;
         }
         else
         {
            this.closestPoint.z = this.center.z;
         }
         var _local_12:Number = this.center.subtract(this.closestPoint).lengthSqr();
         if(_local_12 > _local_6.r * _local_6.r)
         {
            return;
         }
         var _local_13:ShapeContact = ShapeContact.create();
         _local_13.shape1 = _local_6;
         _local_13.shape2 = _local_4;
         _local_13.normal.copy(this.closestPoint).transform4(_local_5).subtract(this.spherePosition).normalize().reverse();
         _local_13.penetration = _local_6.r - Math.sqrt(_local_12);
         _local_13.position.copy(_local_13.normal).scale(-_local_6.r).add(this.spherePosition);
         _arg_3[_arg_3.length] = _local_13;
      }
      
      public function haveCollision(_arg_1:CollisionShape, _arg_2:CollisionShape) : Boolean
      {
         var _local_3:CollisionBox = null;
         var _local_4:CollisionSphere = _arg_1 as CollisionSphere;
         if(_local_4 == null)
         {
            _local_4 = _arg_2 as CollisionSphere;
            _local_3 = _arg_1 as CollisionBox;
         }
         else
         {
            _local_3 = _arg_2 as CollisionBox;
         }
         var _local_5:Matrix4 = _local_4.transform;
         _local_5.getAxis(3,this.spherePosition);
         var _local_6:Matrix4 = _local_3.transform;
         _local_6.getAxis(3,this.boxPosition);
         _local_6.transformVectorInverse(this.spherePosition,this.center);
         var _local_7:Vector3 = _local_3.hs;
         var _local_8:Number = _local_7.x + _local_4.r;
         var _local_9:Number = _local_7.y + _local_4.r;
         var _local_10:Number = _local_7.z + _local_4.r;
         if(this.center.x > _local_8 || this.center.x < -_local_8 || this.center.y > _local_9 || this.center.y < -_local_9 || this.center.z > _local_10 || this.center.z < -_local_10)
         {
            return false;
         }
         if(this.center.x > _local_7.x)
         {
            this.closestPoint.x = _local_7.x;
         }
         else if(this.center.x < -_local_7.x)
         {
            this.closestPoint.x = -_local_7.x;
         }
         else
         {
            this.closestPoint.x = this.center.x;
         }
         if(this.center.y > _local_7.y)
         {
            this.closestPoint.y = _local_7.y;
         }
         else if(this.center.y < -_local_7.y)
         {
            this.closestPoint.y = -_local_7.y;
         }
         else
         {
            this.closestPoint.y = this.center.y;
         }
         if(this.center.z > _local_7.z)
         {
            this.closestPoint.z = _local_7.z;
         }
         else if(this.center.z < -_local_7.z)
         {
            this.closestPoint.z = -_local_7.z;
         }
         else
         {
            this.closestPoint.z = this.center.z;
         }
         var _local_11:Number = this.center.subtract(this.closestPoint).lengthSqr();
         return _local_11 <= _local_4.r * _local_4.r;
      }
   }
}

