package alternativa.physics
{
   import alternativa.math.Matrix3;
   import alternativa.math.Matrix4;
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   import alternativa.physics.collision.BodyCollisionFilter;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.types.AABB;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Body
   {
      
      public static var linearDamping:Number = 0.997;
      
      public static var rotationalDamping:Number = 0.997;
      
      private static const MAX_SPEED_Z:Number = 1500;
      
      private static const _r:Vector3 = new Vector3();
      
      private static const _f:Vector3 = new Vector3();
      
      public var id:int;
      
      public var tank:Tank;
      
      public var scene:PhysicsScene;
      
      public var movable:Boolean = true;
      
      public var canFreeze:Boolean = false;
      
      public var freezeCounter:int;
      
      public var frozen:Boolean = false;
      
      public var slipperyMode:Boolean = false;
      
      public var aabb:AABB = new AABB();
      
      public var postCollisionFilter:BodyCollisionFilter;
      
      public var acceleration:Vector3 = new Vector3();
      
      public var angularAcceleration:Vector3 = new Vector3();
      
      public var prevState:BodyState = new BodyState();
      
      public var mass:Number = 1;
      
      public var invMass:Number = 1;
      
      public var invInertia:Matrix3 = new Matrix3();
      
      public var invInertiaWorld:Matrix3 = new Matrix3();
      
      public var baseMatrix:Matrix3 = new Matrix3();
      
      public var previousVelocity:Vector3 = new Vector3();
      
      public var state:BodyState = new BodyState();
      
      private var maxSpeedXY:EncryptedNumber = new EncryptedNumberImpl(0);
      
      private var maxZSpeedDelta:Number = 600;
      
      private var minZAcceleration:Number = -1100;
      
      public var collisionShapes:Vector.<CollisionShape>;
      
      public var numCollisionShapes:int;
      
      public var forceAccum:Vector3 = new Vector3();
      
      public var torqueAccum:Vector3 = new Vector3();
      
      public var pseudoVelocity:Vector3 = new Vector3();
      
      public var pseudoAngularVelocity:Vector3 = new Vector3();
      
      public function Body(_arg_1:Number, _arg_2:Matrix3, _arg_3:Number)
      {
         super();
         this.mass = _arg_1;
         this.invMass = 1 / _arg_1;
         this.invInertia.copy(_arg_2);
         this.maxSpeedXY.setNumber(_arg_3);
      }
      
      public function addCollisionShape(_arg_1:CollisionShape, _arg_2:Matrix4 = null) : void
      {
         if(_arg_1 == null)
         {
            throw new ArgumentError("Parameter is null");
         }
         if(this.collisionShapes == null)
         {
            this.collisionShapes = new Vector.<CollisionShape>();
            this.numCollisionShapes = 0;
         }
         this.collisionShapes.push(_arg_1);
         this.numCollisionShapes = this.collisionShapes.length;
         _arg_1.setBody(this,_arg_2);
      }
      
      public function removeCollisionShape(_arg_1:CollisionShape) : void
      {
         var _local_2:int = 0;
         if(this.collisionShapes != null)
         {
            if(this.numCollisionShapes > 0)
            {
               _local_2 = this.collisionShapes.indexOf(_arg_1);
               if(_local_2 >= 0)
               {
                  _arg_1.setBody(null);
                  this.collisionShapes[_local_2] = this.collisionShapes[--this.numCollisionShapes];
                  if(this.numCollisionShapes == 0)
                  {
                     this.collisionShapes = null;
                  }
                  else
                  {
                     this.collisionShapes.length = this.numCollisionShapes;
                  }
               }
            }
         }
      }
      
      public function interpolate(_arg_1:Number, _arg_2:Vector3, _arg_3:Quaternion) : void
      {
         var _local_4:Number = NaN;
         _local_4 = 1 - _arg_1;
         _arg_2.x = this.prevState.position.x * _local_4 + this.state.position.x * _arg_1;
         _arg_2.y = this.prevState.position.y * _local_4 + this.state.position.y * _arg_1;
         _arg_2.z = this.prevState.position.z * _local_4 + this.state.position.z * _arg_1;
         _arg_3.w = this.prevState.orientation.w * _local_4 + this.state.orientation.w * _arg_1;
         _arg_3.x = this.prevState.orientation.x * _local_4 + this.state.orientation.x * _arg_1;
         _arg_3.y = this.prevState.orientation.y * _local_4 + this.state.orientation.y * _arg_1;
         _arg_3.z = this.prevState.orientation.z * _local_4 + this.state.orientation.z * _arg_1;
      }
      
      public function setPosition(_arg_1:Vector3) : void
      {
         this.state.position.copy(_arg_1);
      }
      
      public function setPositionXYZ(_arg_1:Number, _arg_2:Number, _arg_3:Number) : void
      {
         this.state.position.reset(_arg_1,_arg_2,_arg_3);
      }
      
      public function setVelocity(_arg_1:Vector3) : void
      {
         this.state.velocity.copy(_arg_1);
      }
      
      public function setVelocityXYZ(_arg_1:Number, _arg_2:Number, _arg_3:Number) : void
      {
         this.state.velocity.reset(_arg_1,_arg_2,_arg_3);
      }
      
      public function setRotation(_arg_1:Vector3) : void
      {
         this.state.angularVelocity.copy(_arg_1);
      }
      
      public function setRotationXYZ(_arg_1:Number, _arg_2:Number, _arg_3:Number) : void
      {
         this.state.angularVelocity.reset(_arg_1,_arg_2,_arg_3);
      }
      
      public function setOrientation(_arg_1:Quaternion) : void
      {
         this.state.orientation.copy(_arg_1);
      }
      
      public function setMaxSpeedXY(_arg_1:Number) : void
      {
         this.maxSpeedXY.setNumber(_arg_1);
      }
      
      public function applyWorldImpulseAtLocalPoint(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number) : void
      {
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         var _local_6:Number = _arg_3 * this.invMass;
         this.state.velocity.x += _local_6 * _arg_2.x;
         this.state.velocity.y += _local_6 * _arg_2.y;
         this.state.velocity.z += _local_6 * _arg_2.z;
         _local_4 = (_arg_1.y * _arg_2.z - _arg_1.z * _arg_2.y) * _arg_3;
         _local_5 = (_arg_1.z * _arg_2.x - _arg_1.x * _arg_2.z) * _arg_3;
         var _local_7:Number = (_arg_1.x * _arg_2.y - _arg_1.y * _arg_2.x) * _arg_3;
         this.state.angularVelocity.x += this.invInertiaWorld.m00 * _local_4 + this.invInertiaWorld.m01 * _local_5 + this.invInertiaWorld.m02 * _local_7;
         this.state.angularVelocity.y += this.invInertiaWorld.m10 * _local_4 + this.invInertiaWorld.m11 * _local_5 + this.invInertiaWorld.m12 * _local_7;
         this.state.angularVelocity.z += this.invInertiaWorld.m20 * _local_4 + this.invInertiaWorld.m21 * _local_5 + this.invInertiaWorld.m22 * _local_7;
      }
      
      public function applyWorldPseudoImpulseAtLocalPoint(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number) : void
      {
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         var _local_6:Number = _arg_3 * this.invMass;
         this.pseudoVelocity.x += _local_6 * _arg_2.x;
         this.pseudoVelocity.y += _local_6 * _arg_2.y;
         this.pseudoVelocity.z += _local_6 * _arg_2.z;
         _local_4 = (_arg_1.y * _arg_2.z - _arg_1.z * _arg_2.y) * _arg_3;
         var _local_7:Number = (_arg_1.z * _arg_2.x - _arg_1.x * _arg_2.z) * _arg_3;
         _local_5 = (_arg_1.x * _arg_2.y - _arg_1.y * _arg_2.x) * _arg_3;
         this.pseudoAngularVelocity.x += this.invInertiaWorld.m00 * _local_4 + this.invInertiaWorld.m01 * _local_7 + this.invInertiaWorld.m02 * _local_5;
         this.pseudoAngularVelocity.y += this.invInertiaWorld.m10 * _local_4 + this.invInertiaWorld.m11 * _local_7 + this.invInertiaWorld.m12 * _local_5;
         this.pseudoAngularVelocity.z += this.invInertiaWorld.m20 * _local_4 + this.invInertiaWorld.m21 * _local_7 + this.invInertiaWorld.m22 * _local_5;
      }
      
      public function applyImpulse(_arg_1:Vector3, _arg_2:Number) : void
      {
         var _local_3:Number = _arg_2 * this.invMass;
         this.state.velocity.x += _local_3 * _arg_1.x;
         this.state.velocity.y += _local_3 * _arg_1.y;
         this.state.velocity.z += _local_3 * _arg_1.z;
      }
      
      public function addForce(_arg_1:Vector3) : void
      {
         this.forceAccum.add(_arg_1);
      }
      
      public function addScaledForce(_arg_1:Vector3, _arg_2:Number) : void
      {
         this.forceAccum.addScaled(_arg_2,_arg_1);
      }
      
      public function addForceXYZ(_arg_1:Number, _arg_2:Number, _arg_3:Number) : void
      {
         this.forceAccum.x += _arg_1;
         this.forceAccum.y += _arg_2;
         this.forceAccum.z += _arg_3;
      }
      
      public function addWorldForceXYZ(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number) : void
      {
         this.forceAccum.x += _arg_4;
         this.forceAccum.y += _arg_5;
         this.forceAccum.z += _arg_6;
         var _local_7:Vector3 = this.state.position;
         var _local_8:Number = _arg_1 - _local_7.x;
         var _local_9:Number = _arg_2 - _local_7.y;
         var _local_10:Number = _arg_3 - _local_7.z;
         this.torqueAccum.x += _local_9 * _arg_6 - _local_10 * _arg_5;
         this.torqueAccum.y += _local_10 * _arg_4 - _local_8 * _arg_6;
         this.torqueAccum.z += _local_8 * _arg_5 - _local_9 * _arg_4;
      }
      
      public function addWorldForce(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         this.forceAccum.add(_arg_2);
         this.torqueAccum.add(_r.diff(_arg_1,this.state.position).cross(_arg_2));
      }
      
      public function addWorldForceScaled(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number) : void
      {
         var _local_4:Number = NaN;
         var _local_5:Number = _arg_3 * _arg_2.x;
         var _local_6:Number = _arg_3 * _arg_2.y;
         var _local_7:Number = _arg_3 * _arg_2.z;
         this.forceAccum.x += _local_5;
         this.forceAccum.y += _local_6;
         this.forceAccum.z += _local_7;
         var _local_8:Vector3 = this.state.position;
         var _local_9:Number = _arg_1.x - _local_8.x;
         var _local_10:Number = _arg_1.y - _local_8.y;
         _local_4 = _arg_1.z - _local_8.z;
         this.torqueAccum.x += _local_10 * _local_7 - _local_4 * _local_6;
         this.torqueAccum.y += _local_4 * _local_5 - _local_9 * _local_7;
         this.torqueAccum.z += _local_9 * _local_6 - _local_10 * _local_5;
      }
      
      public function addLocalForce(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         this.baseMatrix.transformVector(_arg_1,_r);
         this.baseMatrix.transformVector(_arg_2,_f);
         this.forceAccum.add(_f);
         this.torqueAccum.add(_r.cross(_f));
      }
      
      public function addWorldForceAtLocalPoint(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         this.baseMatrix.transformVector(_arg_1,_r);
         this.forceAccum.add(_arg_2);
         this.torqueAccum.add(_r.cross(_arg_2));
      }
      
      public function addScaledWorldForceAtLocalPoint(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number) : void
      {
         this.baseMatrix.transformVector(_arg_1,_r);
         this.forceAccum.addScaled(_arg_3,_arg_2);
         this.torqueAccum.addScaled(_arg_3,_r.cross(_arg_2));
      }
      
      public function addTorque(_arg_1:Vector3) : void
      {
         this.torqueAccum.add(_arg_1);
      }
      
      public function clearAccumulators() : void
      {
         this.forceAccum.x = this.forceAccum.y = this.forceAccum.z = 0;
         this.torqueAccum.x = this.torqueAccum.y = this.torqueAccum.z = 0;
      }
      
      public function calcAccelerations() : void
      {
         this.acceleration.x = this.forceAccum.x * this.invMass;
         this.acceleration.y = this.forceAccum.y * this.invMass;
         this.acceleration.z = this.forceAccum.z * this.invMass;
         this.angularAcceleration.x = this.invInertiaWorld.m00 * this.torqueAccum.x + this.invInertiaWorld.m01 * this.torqueAccum.y + this.invInertiaWorld.m02 * this.torqueAccum.z;
         this.angularAcceleration.y = this.invInertiaWorld.m10 * this.torqueAccum.x + this.invInertiaWorld.m11 * this.torqueAccum.y + this.invInertiaWorld.m12 * this.torqueAccum.z;
         this.angularAcceleration.z = this.invInertiaWorld.m20 * this.torqueAccum.x + this.invInertiaWorld.m21 * this.torqueAccum.y + this.invInertiaWorld.m22 * this.torqueAccum.z;
      }
      
      public function calcDerivedData() : void
      {
         var _local_1:int = 0;
         var _local_2:CollisionShape = null;
         this.state.orientation.toMatrix3(this.baseMatrix);
         this.invInertiaWorld.copy(this.invInertia).append(this.baseMatrix).prependTransposed(this.baseMatrix);
         if(this.collisionShapes != null)
         {
            this.aabb.infinity();
            _local_1 = 0;
            while(_local_1 < this.numCollisionShapes)
            {
               _local_2 = this.collisionShapes[_local_1];
               _local_2.transform.setFromMatrix3(this.baseMatrix,this.state.position);
               if(_local_2.localTransform != null)
               {
                  _local_2.transform.prepend(_local_2.localTransform);
               }
               _local_2.calculateAABB();
               this.aabb.addBoundBox(_local_2.aabb);
               _local_1++;
            }
         }
      }
      
      public function saveState() : void
      {
         this.prevState.copy(this.state);
      }
      
      public function restoreState() : void
      {
         this.state.copy(this.prevState);
      }
      
      public function integrateVelocity(_arg_1:Number) : void
      {
         this.integrateLinearVelocity(_arg_1);
         this.integrateAngularVelocity(_arg_1);
      }
      
      private function integrateLinearVelocity(_arg_1:Number) : void
      {
         var _local_2:Number = NaN;
         this.previousVelocity.copy(this.state.velocity);
         if(this.acceleration.z < this.minZAcceleration)
         {
            this.acceleration.z = this.minZAcceleration;
         }
         this.state.velocity = this.state.velocity.clone();
         this.state.velocity.x += this.acceleration.x * _arg_1;
         this.state.velocity.y += this.acceleration.y * _arg_1;
         this.state.velocity.z += this.acceleration.z * _arg_1;
         this.state.velocity.x *= linearDamping;
         this.state.velocity.y *= linearDamping;
         this.state.velocity.z *= linearDamping;
         var _local_3:Number = Math.abs(this.state.velocity.z);
         if(_local_3 > MAX_SPEED_Z)
         {
            this.state.velocity.z *= MAX_SPEED_Z / _local_3;
         }
         if(this.state.velocity.z - this.previousVelocity.z > this.maxZSpeedDelta)
         {
            this.state.velocity.z = this.previousVelocity.z + this.maxZSpeedDelta;
         }
         var _local_4:Number = this.state.velocity.x;
         var _local_5:Number = this.state.velocity.y;
         var _local_6:Number = Math.sqrt(_local_4 * _local_4 + _local_5 * _local_5);
         var _local_7:Number = this.maxSpeedXY.getNumber();
         if(_local_6 > _local_7)
         {
            _local_2 = _local_7 / _local_6;
            this.state.velocity.x *= _local_2;
            this.state.velocity.y *= _local_2;
         }
      }
      
      private function integrateAngularVelocity(_arg_1:Number) : void
      {
         this.state.angularVelocity.x += this.angularAcceleration.x * _arg_1;
         this.state.angularVelocity.y += this.angularAcceleration.y * _arg_1;
         this.state.angularVelocity.z += this.angularAcceleration.z * _arg_1;
         this.state.angularVelocity.x *= rotationalDamping;
         this.state.angularVelocity.y *= rotationalDamping;
         this.state.angularVelocity.z *= rotationalDamping;
         if(this.state.angularVelocity.length() > 10)
         {
            this.state.angularVelocity.setLength(10);
         }
      }
      
      public function integratePosition(_arg_1:Number) : void
      {
         var _local_2:Vector3 = new Vector3();
         var _local_3:Vector3 = this.state.position;
         var _local_4:Vector3 = this.state.velocity;
         _local_2.x = _local_3.x + _local_4.x * _arg_1;
         _local_2.y = _local_3.y + _local_4.y * _arg_1;
         _local_2.z = _local_3.z + _local_4.z * _arg_1;
         this.state.position = _local_2;
         this.state.orientation.addScaledVector(this.state.angularVelocity,_arg_1);
      }
      
      public function integratePseudoVelocity(_arg_1:Number) : void
      {
         this.state.position.x += this.pseudoVelocity.x * _arg_1;
         this.state.position.y += this.pseudoVelocity.y * _arg_1;
         this.state.position.z += this.pseudoVelocity.z * _arg_1;
         this.state.orientation.addScaledVector(this.pseudoAngularVelocity,_arg_1);
         this.pseudoVelocity.reset();
         this.pseudoAngularVelocity.reset();
      }
   }
}

