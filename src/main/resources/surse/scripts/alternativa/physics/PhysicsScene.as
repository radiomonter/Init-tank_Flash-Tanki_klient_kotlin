package alternativa.physics
{
   import alternativa.math.Vector3;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.contactislands.ContactIsland;
   import alternativa.physics.contactislands.IslandsGenerator;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   
   public class PhysicsScene
   {
      
      private static const thousandth:EncryptedInt = new EncryptedIntImpl(1000);
      
      public const gravity:Vector3 = new Vector3(0,0,-9.8);
      
      private const bodyContacts:Vector.<BodyContact> = new Vector.<BodyContact>();
      
      public var penetrationErrorCorrection:Number = 0.7;
      
      public var maxCorrectablePenetration:Number = 10;
      
      public var allowedPenetration:Number = 0.01;
      
      public var collisionIterations:int = 4;
      
      public var contactIterations:int = 4;
      
      public var freezeSteps:int = 10;
      
      public var linSpeedFreezeLimit:Number = 5;
      
      public var angSpeedFreezeLimit:Number = 0.05;
      
      public var collisionDetector:CollisionDetector;
      
      public var bodies:Vector.<Body> = new Vector.<Body>();
      
      public var timeStamp:int;
      
      public var time:int;
      
      public var dt:Number;
      
      private var islandsGenerator:IslandsGenerator;
      
      public function PhysicsScene()
      {
         super();
         this.islandsGenerator = new IslandsGenerator(this);
      }
      
      public function addBody(_arg_1:Body) : void
      {
         _arg_1.scene = this;
         _arg_1.id = this.bodies.length;
         this.bodies.push(_arg_1);
      }
      
      public function removeBody(_arg_1:Body) : void
      {
         var _local_2:int = 0;
         var _local_3:Body = null;
         var _local_4:int = this.bodies.indexOf(_arg_1);
         if(_local_4 > -1)
         {
            _local_2 = this.bodies.length - 1;
            _local_3 = this.bodies[_local_2];
            this.bodies[_local_4] = _local_3;
            _local_3.id = _local_4;
            this.bodies.length = _local_2;
            _arg_1.scene = null;
         }
      }
      
      public function update(_arg_1:int) : void
      {
         ++this.timeStamp;
         this.time += _arg_1;
         this.dt = _arg_1 / thousandth.getInt();
         this.applyForces();
         this.detectCollisions();
         this.prepareBodyContacts(this.bodyContacts,this.dt);
         this.islandsGenerator.generate(this.bodyContacts,this.bodies.length);
         this.resolveCollisions(this.islandsGenerator.contactIslands);
         this.intergateVelocities(this.dt);
         this.resolveContacts(this.islandsGenerator.contactIslands);
         this.islandsGenerator.clear();
         this.disposeBodyContacts(this.bodyContacts);
         this.integratePositions(this.dt);
         this.postPhysics();
      }
      
      private function applyForces() : void
      {
         var _local_1:Body = null;
         var _local_3:int = 0;
         var _local_2:int = int(this.bodies.length);
         while(_local_3 < _local_2)
         {
            _local_1 = this.bodies[_local_3];
            _local_1.calcAccelerations();
            if(_local_1.movable && !_local_1.frozen)
            {
               _local_1.acceleration.x += this.gravity.x;
               _local_1.acceleration.y += this.gravity.y;
               _local_1.acceleration.z += this.gravity.z;
            }
            _local_3++;
         }
      }
      
      private function detectCollisions() : void
      {
         this.calculateBodiesDerivedData();
         this.collisionDetector.getBodyContacts(this.bodyContacts);
      }
      
      private function calculateBodiesDerivedData() : void
      {
         var _local_1:Body = null;
         var _local_3:int = 0;
         var _local_2:int = int(this.bodies.length);
         while(_local_3 < _local_2)
         {
            _local_1 = this.bodies[_local_3];
            if(!_local_1.frozen)
            {
               _local_1.saveState();
               _local_1.calcDerivedData();
            }
            _local_3++;
         }
      }
      
      private function prepareBodyContacts(_arg_1:Vector.<BodyContact>, _arg_2:Number) : void
      {
         var _local_3:BodyContact = null;
         var _local_5:int = 0;
         var _local_4:int = int(_arg_1.length);
         while(_local_5 < _local_4)
         {
            _local_3 = _arg_1[_local_5];
            this.prepareShapeContacts(_local_3.shapeContacts,_arg_2);
            _local_5++;
         }
      }
      
      private function prepareShapeContacts(_arg_1:Vector.<ShapeContact>, _arg_2:Number) : void
      {
         var _local_3:ShapeContact = null;
         var _local_5:int = 0;
         var _local_4:int = int(_arg_1.length);
         while(_local_5 < _local_4)
         {
            _local_3 = _arg_1[_local_5];
            _local_3.calculatePersistentFrameData();
            _local_3.calcualteDynamicFrameData(this.allowedPenetration,this.penetrationErrorCorrection,this.maxCorrectablePenetration,_arg_2);
            _local_5++;
         }
      }
      
      private function resolveCollisions(_arg_1:Vector.<ContactIsland>) : void
      {
         var _local_2:ContactIsland = null;
         var _local_4:int = 0;
         var _local_3:int = int(_arg_1.length);
         while(_local_4 < _local_3)
         {
            _local_2 = _arg_1[_local_4];
            _local_2.collisionPhase(this.collisionIterations);
            _local_4++;
         }
      }
      
      private function resolveContacts(_arg_1:Vector.<ContactIsland>) : void
      {
         var _local_2:ContactIsland = null;
         var _local_4:int = 0;
         var _local_3:int = int(_arg_1.length);
         while(_local_4 < _local_3)
         {
            _local_2 = _arg_1[_local_4];
            _local_2.contactPhase(this.contactIterations);
            _local_4++;
         }
      }
      
      private function intergateVelocities(_arg_1:Number) : void
      {
         var _local_2:Body = null;
         var _local_4:int = 0;
         var _local_3:int = int(this.bodies.length);
         while(_local_4 < _local_3)
         {
            _local_2 = this.bodies[_local_4];
            _local_2.integrateVelocity(_arg_1);
            _local_4++;
         }
      }
      
      private function integratePositions(_arg_1:Number) : void
      {
         var _local_2:Body = null;
         var _local_4:int = 0;
         var _local_3:int = int(this.bodies.length);
         while(_local_4 < _local_3)
         {
            _local_2 = this.bodies[_local_4];
            if(_local_2.movable && !_local_2.frozen)
            {
               _local_2.integratePosition(_arg_1);
               _local_2.integratePseudoVelocity(_arg_1);
            }
            _local_4++;
         }
      }
      
      private function postPhysics() : void
      {
         var _local_1:Body = null;
         var _local_2:BodyState = null;
         var _local_4:int = 0;
         var _local_3:int = int(this.bodies.length);
         while(_local_4 < _local_3)
         {
            _local_1 = this.bodies[_local_4];
            _local_1.clearAccumulators();
            _local_1.calcDerivedData();
            if(_local_1.canFreeze && !_local_1.frozen)
            {
               _local_2 = _local_1.state;
               if(_local_2.velocity.length() < this.linSpeedFreezeLimit && _local_2.angularVelocity.length() < this.angSpeedFreezeLimit)
               {
                  ++_local_1.freezeCounter;
                  if(_local_1.freezeCounter >= this.freezeSteps)
                  {
                     _local_1.frozen = true;
                  }
               }
               else
               {
                  _local_1.freezeCounter = 0;
                  _local_1.frozen = false;
               }
            }
            _local_4++;
         }
      }
      
      private function disposeBodyContacts(_arg_1:Vector.<BodyContact>) : void
      {
         var _local_2:BodyContact = null;
         var _local_4:int = 0;
         var _local_3:int = int(_arg_1.length);
         while(_local_4 < _local_3)
         {
            _local_2 = _arg_1[_local_4];
            _local_2.dispose();
            _local_4++;
         }
         _arg_1.length = 0;
      }
   }
}

