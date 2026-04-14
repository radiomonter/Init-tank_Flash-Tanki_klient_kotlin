package alternativa.physics.contactislands
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.BodyContact;
   import alternativa.physics.PhysicsScene;
   import alternativa.physics.ShapeContact;
   
   public class ContactIsland
   {
      
      private static var poolSize:int;
      
      private static const pool:Vector.<ContactIsland> = new Vector.<ContactIsland>();
      
      private static const _relativeVelocity:Vector3 = new Vector3();
      
      private static const COLLISION_MODE:int = 0;
      
      private static const CONTACT_MODE:int = 1;
      
      public const bodyContacts:Vector.<BodyContact> = new Vector.<BodyContact>();
      
      private const allShapeContacts:Vector.<ShapeContact> = new Vector.<ShapeContact>();
      
      private const levelShapeContacts:Vector.<ShapeContact> = new Vector.<ShapeContact>();
      
      private const levelBodyContacts:Vector.<BodyContact> = new Vector.<BodyContact>();
      
      private const contactLevels:ContactLevels = new ContactLevels();
      
      private var physicsScene:PhysicsScene;
      
      private var prevLevelBodies:Vector.<Body> = new Vector.<Body>();
      
      private var levelBodies:Vector.<Body> = new Vector.<Body>();
      
      public function ContactIsland()
      {
         super();
      }
      
      public static function create() : ContactIsland
      {
         if(poolSize == 0)
         {
            return new ContactIsland();
         }
         --poolSize;
         var _local_1:ContactIsland = pool[poolSize];
         pool[poolSize] = null;
         return _local_1;
      }
      
      public function dispose() : void
      {
         this.physicsScene = null;
         this.bodyContacts.length = 0;
         this.allShapeContacts.length = 0;
         this.levelShapeContacts.length = 0;
         this.prevLevelBodies.length = 0;
         this.levelBodies.length = 0;
         this.levelBodyContacts.length = 0;
         this.contactLevels.clear();
         var _local_1:* = poolSize++;
         pool[_local_1] = this;
      }
      
      public function init(_arg_1:PhysicsScene) : void
      {
         var _local_2:BodyContact = null;
         var _local_3:Vector.<ShapeContact> = null;
         var _local_4:int = 0;
         var _local_5:int = 0;
         var _local_8:int = 0;
         this.physicsScene = _arg_1;
         var _local_6:int = int(this.bodyContacts.length);
         var _local_7:Vector.<ShapeContact> = this.allShapeContacts;
         while(_local_8 < _local_6)
         {
            _local_2 = this.bodyContacts[_local_8];
            _local_3 = _local_2.shapeContacts;
            _local_4 = int(_local_3.length);
            _local_5 = 0;
            while(_local_5 < _local_4)
            {
               _local_7[_local_7.length] = _local_3[_local_5];
               _local_5++;
            }
            _local_8++;
         }
      }
      
      public function collisionPhase(_arg_1:int) : void
      {
         this.resolveCollisions(_arg_1);
      }
      
      public function contactPhase(_arg_1:int) : void
      {
         this.resolveContacts(_arg_1);
      }
      
      private function resolveCollisions(_arg_1:int) : void
      {
         var _local_2:int = 0;
         var _local_4:int = 0;
         var _local_3:int = int(this.allShapeContacts.length);
         while(_local_4 < _arg_1)
         {
            this.shuffleContacts(this.allShapeContacts);
            _local_2 = 0;
            while(_local_2 < _local_3)
            {
               this.resolveContact(this.allShapeContacts[_local_2],COLLISION_MODE);
               _local_2++;
            }
            _local_4++;
         }
      }
      
      private function resolveContacts(_arg_1:int) : void
      {
         var _local_2:Vector.<Body> = null;
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_5:ShapeContact = null;
         this.processContacts(_arg_1);
         this.contactLevels.init(this.bodyContacts);
         this.contactLevels.getStaticLevel(this.levelBodyContacts,this.levelBodies);
         if(this.levelBodyContacts.length > 0)
         {
            this.getShapeContacts(this.levelBodyContacts,this.levelShapeContacts);
            this.resolveContactsForLevel(_arg_1,this.levelShapeContacts);
            this.calculatePseudoVelocities(_arg_1,this.levelShapeContacts);
            while(this.contactLevels.hasContacts())
            {
               _local_2 = this.prevLevelBodies;
               this.prevLevelBodies = this.levelBodies;
               this.levelBodies = _local_2;
               this.levelBodyContacts.length = 0;
               this.levelBodies.length = 0;
               this.contactLevels.getNextLevel(this.prevLevelBodies,this.levelBodyContacts,this.levelBodies);
               this.setBodiesMobility(this.prevLevelBodies,false);
               this.levelShapeContacts.length = 0;
               this.getShapeContacts(this.levelBodyContacts,this.levelShapeContacts);
               _local_3 = int(this.levelShapeContacts.length);
               _local_4 = 0;
               while(_local_4 < _local_3)
               {
                  _local_5 = this.levelShapeContacts[_local_4];
                  _local_5.calcualteDynamicFrameData(this.physicsScene.allowedPenetration,this.physicsScene.penetrationErrorCorrection,this.physicsScene.maxCorrectablePenetration,this.physicsScene.dt);
                  _local_4++;
               }
               this.resolveContactsForLevel(_arg_1,this.levelShapeContacts);
               this.calculatePseudoVelocities(_arg_1,this.levelShapeContacts);
               this.setBodiesMobility(this.prevLevelBodies,true);
            }
         }
         else
         {
            this.getShapeContacts(this.bodyContacts,this.levelShapeContacts);
            this.resolveContactsForLevel(_arg_1,this.levelShapeContacts);
            this.calculatePseudoVelocities(_arg_1,this.levelShapeContacts);
         }
      }
      
      private function processContacts(_arg_1:int) : void
      {
         var _local_2:int = 0;
         var _local_4:int = 0;
         var _local_3:int = int(this.allShapeContacts.length);
         while(_local_4 < _arg_1)
         {
            this.shuffleContacts(this.allShapeContacts);
            _local_2 = 0;
            while(_local_2 < _local_3)
            {
               this.resolveContact(this.allShapeContacts[_local_2],CONTACT_MODE);
               _local_2++;
            }
            _local_4++;
         }
      }
      
      private function getShapeContacts(_arg_1:Vector.<BodyContact>, _arg_2:Vector.<ShapeContact>) : void
      {
         var _local_3:BodyContact = null;
         var _local_4:Vector.<ShapeContact> = null;
         var _local_5:int = 0;
         var _local_6:int = 0;
         var _local_8:int = 0;
         var _local_7:int = int(_arg_1.length);
         while(_local_8 < _local_7)
         {
            _local_3 = _arg_1[_local_8];
            _local_4 = _local_3.shapeContacts;
            _local_5 = int(_local_4.length);
            _local_6 = 0;
            while(_local_6 < _local_5)
            {
               _arg_2[_arg_2.length] = _local_4[_local_6];
               _local_6++;
            }
            _local_8++;
         }
      }
      
      private function shuffleContacts(_arg_1:Vector.<ShapeContact>) : void
      {
         var _local_2:int = 0;
         var _local_3:ShapeContact = null;
         var _local_4:int = int(_arg_1.length);
         var _local_5:int = 1;
         while(_local_5 < _local_4)
         {
            _local_2 = int(_local_5 * Math.random());
            _local_3 = _arg_1[_local_2];
            _arg_1[_local_2] = _arg_1[_local_5];
            _arg_1[_local_5] = _local_3;
            _local_5++;
         }
      }
      
      private function resolveContactsForLevel(_arg_1:int, _arg_2:Vector.<ShapeContact>) : void
      {
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_5:int = 0;
         while(_local_5 < _arg_1)
         {
            this.shuffleContacts(_arg_2);
            _local_3 = int(_arg_2.length);
            _local_4 = 0;
            while(_local_4 < _local_3)
            {
               this.resolveContact(_arg_2[_local_4],CONTACT_MODE);
               _local_4++;
            }
            _local_5++;
         }
      }
      
      private function calculatePseudoVelocities(_arg_1:int, _arg_2:Vector.<ShapeContact>) : void
      {
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_5:int = 0;
         while(_local_5 < _arg_1)
         {
            this.shuffleContacts(_arg_2);
            _local_3 = int(_arg_2.length);
            _local_4 = 0;
            while(_local_4 < _local_3)
            {
               this.resolveContactPseudoVelocity(_arg_2[_local_4]);
               _local_4++;
            }
            _local_5++;
         }
      }
      
      private function setBodiesMobility(_arg_1:Vector.<Body>, _arg_2:Boolean) : void
      {
         var _local_3:Body = null;
         var _local_5:int = 0;
         var _local_4:int = int(_arg_1.length);
         while(_local_5 < _local_4)
         {
            _local_3 = _arg_1[_local_5];
            _local_3.movable = _arg_2;
            _local_5++;
         }
      }
      
      private function resolveContact(_arg_1:ShapeContact, _arg_2:int) : void
      {
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         var _local_5:Vector3 = _arg_1.normal;
         var _local_6:Body = _arg_1.shape1.body;
         var _local_7:Body = _arg_1.shape2.body;
         var _local_8:Vector3 = _relativeVelocity;
         this.calculateRelativeVelocity(_arg_1,_local_8);
         var _local_9:Number = _local_8.x * _local_5.x + _local_8.y * _local_5.y + _local_8.z * _local_5.z;
         if(_arg_2 == CONTACT_MODE)
         {
            _local_3 = 0;
            if(_local_9 < 0)
            {
               _arg_1.satisfied = false;
            }
            else if(_arg_1.satisfied)
            {
               return;
            }
         }
         else
         {
            _arg_1.satisfied = true;
            _local_3 = _arg_1.collisionSpeed;
         }
         var _local_10:Number = _local_8.dot(_arg_1.tangent1);
         var _local_11:Number = _local_8.dot(_arg_1.tangent2);
         var _local_12:Number = _arg_1.tangentImpulse1 - _local_10 / _arg_1.tangentSpeedDelta1;
         var _local_13:Number = _arg_1.tangentImpulse2 - _local_11 / _arg_1.tangentSpeedDelta2;
         var _local_14:Number = _local_12 * _local_12 + _local_13 * _local_13;
         var _local_15:Number = _arg_1.friction * _arg_1.normalImpulse;
         if(_local_14 > _local_15 * _local_15)
         {
            _local_4 = Math.sqrt(_local_14);
            _local_12 *= _local_15 / _local_4;
            _local_13 *= _local_15 / _local_4;
         }
         var _local_16:Number = _local_12 - _arg_1.tangentImpulse1;
         var _local_17:Number = _local_13 - _arg_1.tangentImpulse2;
         _arg_1.tangentImpulse1 = _local_12;
         _arg_1.tangentImpulse2 = _local_13;
         if(_local_6.movable)
         {
            _local_6.applyWorldImpulseAtLocalPoint(_arg_1.r1,_arg_1.tangent1,_local_16);
            _local_6.applyWorldImpulseAtLocalPoint(_arg_1.r1,_arg_1.tangent2,_local_17);
         }
         if(_local_7.movable)
         {
            _local_7.applyWorldImpulseAtLocalPoint(_arg_1.r2,_arg_1.tangent1,-_local_16);
            _local_7.applyWorldImpulseAtLocalPoint(_arg_1.r2,_arg_1.tangent2,-_local_17);
         }
         this.calculateRelativeVelocity(_arg_1,_local_8);
         _local_9 = _local_8.x * _local_5.x + _local_8.y * _local_5.y + _local_8.z * _local_5.z;
         var _local_18:Number = _local_3 - _local_9;
         var _local_19:Number = _arg_1.normalImpulse + _local_18 / _arg_1.normalSpeedDelta;
         if(_local_19 < 0)
         {
            _local_19 = 0;
         }
         var _local_20:Number = _local_19 - _arg_1.normalImpulse;
         _arg_1.normalImpulse = _local_19;
         if(_local_6.movable)
         {
            _local_6.applyWorldImpulseAtLocalPoint(_arg_1.r1,_arg_1.normal,_local_20);
         }
         if(_local_7.movable)
         {
            _local_7.applyWorldImpulseAtLocalPoint(_arg_1.r2,_arg_1.normal,-_local_20);
         }
      }
      
      private function calculateRelativeVelocity(_arg_1:ShapeContact, _arg_2:Vector3) : void
      {
         var _local_3:Vector3 = null;
         var _local_4:Vector3 = _arg_1.shape1.body.state.angularVelocity;
         _local_3 = _arg_1.r1;
         var _local_5:Number = _local_4.y * _local_3.z - _local_4.z * _local_3.y;
         var _local_6:Number = _local_4.z * _local_3.x - _local_4.x * _local_3.z;
         var _local_7:Number = _local_4.x * _local_3.y - _local_4.y * _local_3.x;
         _local_3 = _arg_1.shape1.body.state.velocity;
         _arg_2.x = _local_3.x + _local_5;
         _arg_2.y = _local_3.y + _local_6;
         _arg_2.z = _local_3.z + _local_7;
         _local_4 = _arg_1.shape2.body.state.angularVelocity;
         _local_3 = _arg_1.r2;
         _local_5 = _local_4.y * _local_3.z - _local_4.z * _local_3.y;
         _local_6 = _local_4.z * _local_3.x - _local_4.x * _local_3.z;
         _local_7 = _local_4.x * _local_3.y - _local_4.y * _local_3.x;
         _local_3 = _arg_1.shape2.body.state.velocity;
         _arg_2.x -= _local_3.x + _local_5;
         _arg_2.y -= _local_3.y + _local_6;
         _arg_2.z -= _local_3.z + _local_7;
      }
      
      private function resolveContactPseudoVelocity(_arg_1:ShapeContact) : void
      {
         var _local_2:Vector3 = _relativeVelocity;
         this.calcPseudoSeparationVelocity(_arg_1,_local_2);
         var _local_3:Number = _local_2.x * _arg_1.normal.x + _local_2.y * _arg_1.normal.y + _local_2.z * _arg_1.normal.z;
         var _local_4:Number = _arg_1.contactSeparationSpeed - _local_3;
         var _local_5:Number = _local_4 / _arg_1.normalSpeedDelta;
         if(_arg_1.shape1.body.movable)
         {
            _arg_1.shape1.body.applyWorldPseudoImpulseAtLocalPoint(_arg_1.r1,_arg_1.normal,_local_5);
         }
         if(_arg_1.shape2.body.movable)
         {
            _arg_1.shape2.body.applyWorldPseudoImpulseAtLocalPoint(_arg_1.r2,_arg_1.normal,-_local_5);
         }
      }
      
      private function calcPseudoSeparationVelocity(_arg_1:ShapeContact, _arg_2:Vector3) : void
      {
         var _local_3:Vector3 = null;
         var _local_4:Number = NaN;
         var _local_5:Vector3 = _arg_1.shape1.body.pseudoAngularVelocity;
         _local_3 = _arg_1.r1;
         var _local_6:Number = _local_5.y * _local_3.z - _local_5.z * _local_3.y;
         var _local_7:Number = _local_5.z * _local_3.x - _local_5.x * _local_3.z;
         _local_4 = _local_5.x * _local_3.y - _local_5.y * _local_3.x;
         _local_3 = _arg_1.shape1.body.pseudoVelocity;
         _arg_2.x = _local_3.x + _local_6;
         _arg_2.y = _local_3.y + _local_7;
         _arg_2.z = _local_3.z + _local_4;
         _local_5 = _arg_1.shape2.body.pseudoAngularVelocity;
         _local_3 = _arg_1.r2;
         _local_6 = _local_5.y * _local_3.z - _local_5.z * _local_3.y;
         _local_7 = _local_5.z * _local_3.x - _local_5.x * _local_3.z;
         _local_4 = _local_5.x * _local_3.y - _local_5.y * _local_3.x;
         _local_3 = _arg_1.shape2.body.pseudoVelocity;
         _arg_2.x -= _local_3.x + _local_6;
         _arg_2.y -= _local_3.y + _local_7;
         _arg_2.z -= _local_3.z + _local_4;
      }
   }
}

