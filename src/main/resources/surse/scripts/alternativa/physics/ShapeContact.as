package alternativa.physics
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.collision.CollisionShape;
   
   public class ShapeContact
   {
      
      private static var poolSize:int;
      
      private static const pool:Vector.<ShapeContact> = new Vector.<ShapeContact>();
      
      public var position:Vector3 = new Vector3();
      
      public var penetration:Number;
      
      public var normal:Vector3 = new Vector3();
      
      public var tangent1:Vector3 = new Vector3();
      
      public var tangent2:Vector3 = new Vector3();
      
      public var collisionSpeed:Number;
      
      public var contactSeparationSpeed:Number;
      
      public var normalSpeedDelta:Number;
      
      public var tangentSpeedDelta1:Number;
      
      public var tangentSpeedDelta2:Number;
      
      public var normalAngularInertiaTerm1:Number;
      
      public var normalAngularInertiaTerm2:Number;
      
      public var tangentAngularInertiaTerm11:Number;
      
      public var tangentAngularInertiaTerm12:Number;
      
      public var tangentAngularInertiaTerm21:Number;
      
      public var tangentAngularInertiaTerm22:Number;
      
      public var r1:Vector3 = new Vector3();
      
      public var r2:Vector3 = new Vector3();
      
      public var normalImpulse:Number;
      
      public var tangentImpulse1:Number;
      
      public var tangentImpulse2:Number;
      
      public var satisfied:Boolean;
      
      public var restitution:Number;
      
      public var friction:Number;
      
      public var shape1:CollisionShape;
      
      public var shape2:CollisionShape;
      
      public function ShapeContact()
      {
         super();
      }
      
      public static function create() : ShapeContact
      {
         if(poolSize == 0)
         {
            return new ShapeContact();
         }
         --poolSize;
         var _local_1:ShapeContact = pool[poolSize];
         pool[poolSize] = null;
         return _local_1;
      }
      
      public function dispose() : void
      {
         this.shape1 = null;
         this.shape2 = null;
         pool[poolSize] = this;
         ++poolSize;
      }
      
      public function calculatePersistentFrameData() : void
      {
         var _local_1:Body = this.shape1.body;
         var _local_2:Body = this.shape2.body;
         this.restitution = this.shape1.material.restitution;
         var _local_3:Number = this.shape2.material.restitution;
         if(_local_3 < this.restitution)
         {
            this.restitution = _local_3;
         }
         this.friction = this.shape1.material.friction;
         var _local_4:Number = this.shape2.material.friction;
         if(_local_4 < this.friction)
         {
            this.friction = _local_4;
         }
         if(_local_1.slipperyMode && !_local_2.movable || _local_2.slipperyMode && !_local_1.movable)
         {
            this.friction = 0;
         }
         var _local_5:Vector3 = this.shape1.body.state.position;
         this.r1.x = this.position.x - _local_5.x;
         this.r1.y = this.position.y - _local_5.y;
         this.r1.z = this.position.z - _local_5.z;
         _local_5 = this.shape2.body.state.position;
         this.r2.x = this.position.x - _local_5.x;
         this.r2.y = this.position.y - _local_5.y;
         this.r2.z = this.position.z - _local_5.z;
         if(Math.abs(this.normal.x) < Math.abs(this.normal.y))
         {
            this.tangent1.cross2(this.normal,Vector3.X_AXIS).normalize();
         }
         else
         {
            this.tangent1.cross2(this.normal,Vector3.Y_AXIS).normalize();
         }
         this.tangent2.cross2(this.normal,this.tangent1);
         this.normalImpulse = 0;
         this.tangentImpulse1 = 0;
         this.tangentImpulse2 = 0;
         this.normalSpeedDelta = 0;
         this.tangentSpeedDelta1 = 0;
         this.tangentSpeedDelta2 = 0;
         if(_local_1.movable)
         {
            this.normalAngularInertiaTerm1 = this.calculateAngularInertiaTerm(this.normal,this.r1,_local_1.invInertiaWorld);
            this.tangentAngularInertiaTerm11 = this.calculateAngularInertiaTerm(this.tangent1,this.r1,_local_1.invInertiaWorld);
            this.tangentAngularInertiaTerm12 = this.calculateAngularInertiaTerm(this.tangent2,this.r1,_local_1.invInertiaWorld);
            this.normalSpeedDelta += _local_1.invMass + this.normalAngularInertiaTerm1;
            this.tangentSpeedDelta1 += _local_1.invMass + this.tangentAngularInertiaTerm11;
            this.tangentSpeedDelta2 += _local_1.invMass + this.tangentAngularInertiaTerm12;
         }
         if(_local_2.movable)
         {
            this.normalAngularInertiaTerm2 = this.calculateAngularInertiaTerm(this.normal,this.r2,_local_2.invInertiaWorld);
            this.tangentAngularInertiaTerm21 = this.calculateAngularInertiaTerm(this.tangent1,this.r2,_local_2.invInertiaWorld);
            this.tangentAngularInertiaTerm22 = this.calculateAngularInertiaTerm(this.tangent2,this.r2,_local_2.invInertiaWorld);
            this.normalSpeedDelta += _local_2.invMass + this.normalAngularInertiaTerm2;
            this.tangentSpeedDelta1 += _local_2.invMass + this.tangentAngularInertiaTerm21;
            this.tangentSpeedDelta2 += _local_2.invMass + this.tangentAngularInertiaTerm22;
         }
         this.collisionSpeed = this.getSeparationVelocity();
         if(this.collisionSpeed < 0)
         {
            this.collisionSpeed = -this.restitution * this.collisionSpeed;
         }
         else
         {
            this.collisionSpeed = 0;
         }
      }
      
      private function calculateAngularInertiaTerm(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Matrix3) : Number
      {
         var _local_4:Number = _arg_2.y * _arg_1.z - _arg_2.z * _arg_1.y;
         var _local_5:Number = _arg_2.z * _arg_1.x - _arg_2.x * _arg_1.z;
         var _local_6:Number = _arg_2.x * _arg_1.y - _arg_2.y * _arg_1.x;
         var _local_7:Number = _arg_3.m00 * _local_4 + _arg_3.m01 * _local_5 + _arg_3.m02 * _local_6;
         var _local_8:Number = _arg_3.m10 * _local_4 + _arg_3.m11 * _local_5 + _arg_3.m12 * _local_6;
         var _local_9:Number = _arg_3.m20 * _local_4 + _arg_3.m21 * _local_5 + _arg_3.m22 * _local_6;
         _local_4 = _local_8 * _arg_2.z - _local_9 * _arg_2.y;
         _local_5 = _local_9 * _arg_2.x - _local_7 * _arg_2.z;
         _local_6 = _local_7 * _arg_2.y - _local_8 * _arg_2.x;
         return _local_4 * _arg_1.x + _local_5 * _arg_1.y + _local_6 * _arg_1.z;
      }
      
      public function getSeparationVelocity() : Number
      {
         var _local_1:Vector3 = this.shape1.body.state.angularVelocity;
         var _local_2:Number = _local_1.y * this.r1.z - _local_1.z * this.r1.y;
         var _local_3:Number = _local_1.z * this.r1.x - _local_1.x * this.r1.z;
         var _local_4:Number = _local_1.x * this.r1.y - _local_1.y * this.r1.x;
         var _local_5:Vector3 = this.shape1.body.state.velocity;
         var _local_6:Number = _local_5.x + _local_2;
         var _local_7:Number = _local_5.y + _local_3;
         var _local_8:Number = _local_5.z + _local_4;
         _local_1 = this.shape2.body.state.angularVelocity;
         _local_2 = _local_1.y * this.r2.z - _local_1.z * this.r2.y;
         _local_3 = _local_1.z * this.r2.x - _local_1.x * this.r2.z;
         _local_4 = _local_1.x * this.r2.y - _local_1.y * this.r2.x;
         _local_5 = this.shape2.body.state.velocity;
         _local_6 -= _local_5.x + _local_2;
         _local_7 -= _local_5.y + _local_3;
         _local_8 -= _local_5.z + _local_4;
         return _local_6 * this.normal.x + _local_7 * this.normal.y + _local_8 * this.normal.z;
      }
      
      public function calcualteDynamicFrameData(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number) : void
      {
         var _local_5:Number = NaN;
         var _local_6:Body = this.shape1.body;
         var _local_7:Body = this.shape2.body;
         this.normalSpeedDelta = 0;
         this.tangentSpeedDelta1 = 0;
         this.tangentSpeedDelta2 = 0;
         if(_local_6.movable)
         {
            this.normalSpeedDelta += _local_6.invMass + this.normalAngularInertiaTerm1;
            this.tangentSpeedDelta1 += _local_6.invMass + this.tangentAngularInertiaTerm11;
            this.tangentSpeedDelta2 += _local_6.invMass + this.tangentAngularInertiaTerm12;
         }
         if(_local_7.movable)
         {
            this.normalSpeedDelta += _local_7.invMass + this.normalAngularInertiaTerm2;
            this.tangentSpeedDelta1 += _local_7.invMass + this.tangentAngularInertiaTerm21;
            this.tangentSpeedDelta2 += _local_7.invMass + this.tangentAngularInertiaTerm22;
         }
         if(this.penetration > _arg_1)
         {
            _local_5 = this.penetration - _arg_1;
            if(_local_5 > _arg_3)
            {
               _local_5 = _arg_3;
            }
            this.contactSeparationSpeed = _arg_2 * _local_5 / _arg_4;
         }
         else
         {
            this.contactSeparationSpeed = 0;
         }
      }
   }
}

