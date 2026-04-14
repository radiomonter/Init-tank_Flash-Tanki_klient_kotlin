package obfuscation.kyre
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.BodyContact;
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.Collider;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.CollisionKdNode;
   import alternativa.physics.collision.CollisionKdTree;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.IRayCollisionFilter;
   import alternativa.physics.collision.colliders.BoxBoxCollider;
   import alternativa.physics.collision.colliders.BoxRectCollider;
   import alternativa.physics.collision.colliders.BoxTriangleCollider;
   import alternativa.physics.collision.types.AABB;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.objects.tank.Tank;
   
   public class TanksCollisionDetector implements CollisionDetector
   {
      
      private static const tihudesi:Number = 0.01;
      
      private const colliders:Object = {};
      
      private const verumonuv:RayHit = new RayHit();
      
      private const nyhivewor:Musibo = new Musibo();
      
      private const sej:Vector3 = new Vector3();
      
      private const sut:Vector3 = new Vector3();
      
      private const mudyzacu:RayHit = new RayHit();
      
      private const zegider:AABB = new AABB();
      
      private const shapeContacts:Vector.<ShapeContact> = new Vector.<ShapeContact>();
      
      private var sukogel:CollisionKdTree = new CollisionKdTree();
      
      private var threshold:Number = 0.0001;
      
      private var baqa:Vector.<Vuwuci> = new Vector.<Vuwuci>();
      
      private var kobeqo:Body;
      
      public function TanksCollisionDetector()
      {
         super();
         var _local_1:Number = 0.000001;
         this.fivo(CollisionShape.BOX,CollisionShape.BOX,new BoxBoxCollider(_local_1));
         this.fivo(CollisionShape.BOX,CollisionShape.RECT,new BoxRectCollider(_local_1));
         this.fivo(CollisionShape.BOX,CollisionShape.TRIANGLE,new BoxTriangleCollider(_local_1));
         this.fizy();
      }
      
      private function fivo(_arg_1:int, _arg_2:int, _arg_3:Collider) : void
      {
         this.colliders[_arg_1 | _arg_2] = _arg_3;
      }
      
      private function fizy() : void
      {
         this.kobeqo = new Body(1,new Matrix3(),10000000000);
         this.kobeqo.movable = false;
      }
      
      public function dypulefa(_arg_1:Vector.<CollisionShape>, _arg_2:AABB = null) : void
      {
         var _local_3:CollisionShape = null;
         for each(_local_3 in _arg_1)
         {
            _local_3.body = this.kobeqo;
         }
         this.sukogel.createTree(_arg_1,_arg_2);
      }
      
      public function polatemu(_arg_1:Vuwuci) : void
      {
         _arg_1.coruziva = false;
         this.baqa.push(_arg_1);
      }
      
      public function jag(_arg_1:Vuwuci) : void
      {
         var _local_2:int = 0;
         var _local_3:int = this.baqa.indexOf(_arg_1);
         if(_local_3 > -1)
         {
            _local_2 = this.baqa.length - 1;
            this.baqa[_local_3] = this.baqa[_local_2];
            this.baqa.length = _local_2;
         }
      }
      
      public function getTankBodies() : Vector.<Vuwuci>
      {
         return this.baqa;
      }
      
      public function getBodyContacts(_arg_1:Vector.<BodyContact>) : void
      {
         var _local_2:Vuwuci = null;
         var _local_3:Tank = null;
         var _local_4:int = 0;
         var _local_6:int = 0;
         var _local_5:int = int(this.baqa.length);
         while(_local_6 < _local_5)
         {
            _local_2 = this.baqa[_local_6];
            _local_2.lurivih = _local_2.coruziva;
            _local_3 = _local_2.body.tank;
            _local_2.coruziva = _local_3.zafet();
            _local_2.vopuruce.length = 0;
            _local_6++;
         }
         _local_6 = 0;
         while(_local_6 < _local_5)
         {
            _local_2 = this.baqa[_local_6];
            _local_4 = int(_arg_1.length);
            this.hure(_local_2,_arg_1);
            if(_local_4 != _arg_1.length)
            {
               _local_2.coruziva = true;
            }
            _local_4 = int(_arg_1.length);
            this.miky(_local_2,_local_6 + 1,_arg_1);
            _local_6++;
         }
      }
      
      public function cagijep(_arg_1:CollisionShape, _arg_2:Vector.<ShapeContact>) : void
      {
         return this.lipiky(this.sukogel.rootNode,_arg_1,_arg_2);
      }
      
      private function hure(_arg_1:Vuwuci, _arg_2:Vector.<BodyContact>) : void
      {
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_5:BodyContact = null;
         if(!_arg_1.body.frozen)
         {
            _local_3 = int(_arg_1.dusiruv.length);
            _local_4 = 0;
            while(_local_4 < _local_3)
            {
               this.lipiky(this.sukogel.rootNode,_arg_1.dusiruv[_local_4],this.shapeContacts);
               _local_4++;
            }
            if(this.shapeContacts.length > 0)
            {
               _local_5 = BodyContact.create();
               _local_5.body1 = _arg_1.body;
               _local_5.body2 = this.kobeqo;
               _local_5.setShapeContacts(this.shapeContacts);
               this.shapeContacts.length = 0;
               _arg_2[_arg_2.length] = _local_5;
            }
         }
      }
      
      private function miky(_arg_1:Vuwuci, _arg_2:int, _arg_3:Vector.<BodyContact>) : void
      {
         var _local_4:Vuwuci = null;
         var _local_5:Body = null;
         var _local_6:Body = null;
         var _local_7:int = 0;
         var _local_8:Boolean = false;
         var _local_9:Boolean = false;
         var _local_10:BodyContact = null;
         var _local_11:int = 0;
         var _local_12:ShapeContact = null;
         var _local_13:int = int(this.baqa.length);
         var _local_14:int = _arg_2;
         while(_local_14 < _local_13)
         {
            _local_4 = this.baqa[_local_14];
            _local_5 = _arg_1.body;
            _local_6 = _local_4.body;
            if(!(_local_5.frozen && _local_6.frozen) && _local_5.aabb.intersects(_local_6.aabb,tihudesi))
            {
               this.getContacts(_arg_1.paqu,_local_4.paqu,this.shapeContacts);
               _local_7 = int(this.shapeContacts.length);
               if(_local_7 > 0)
               {
                  _local_8 = _local_5.postCollisionFilter == null || _local_5.postCollisionFilter.considerBodies(_local_5,_local_6);
                  _local_9 = _local_6.postCollisionFilter == null || _local_6.postCollisionFilter.considerBodies(_local_6,_local_5);
                  if(_local_8 && _local_9)
                  {
                     _local_10 = BodyContact.create();
                     _local_10.body1 = _local_5;
                     _local_10.body2 = _local_6;
                     _local_10.setShapeContacts(this.shapeContacts);
                     _arg_3[_arg_3.length] = _local_10;
                     _arg_1.vopuruce.push(_local_6);
                     _local_4.vopuruce.push(_local_5);
                  }
                  else
                  {
                     _local_11 = 0;
                     while(_local_11 < _local_7)
                     {
                        _local_12 = this.shapeContacts[_local_11];
                        _local_12.dispose();
                        _local_11++;
                     }
                  }
                  this.shapeContacts.length = 0;
               }
            }
            _local_14++;
         }
      }
      
      public function getContacts(_arg_1:CollisionShape, _arg_2:CollisionShape, _arg_3:Vector.<ShapeContact>) : void
      {
         if((_arg_1.collisionGroup & _arg_2.collisionGroup) == 0)
         {
            return;
         }
         if(_arg_1.body == _arg_2.body)
         {
            return;
         }
         if(!_arg_1.aabb.intersects(_arg_2.aabb,tihudesi))
         {
            return;
         }
         var _local_4:Collider = this.colliders[_arg_1.type | _arg_2.type];
         _local_4.getContacts(_arg_1,_arg_2,_arg_3);
      }
      
      public function testCollision(_arg_1:CollisionShape, _arg_2:CollisionShape) : Boolean
      {
         if((_arg_1.collisionGroup & _arg_2.collisionGroup) == 0)
         {
            return false;
         }
         if(_arg_1.body == _arg_2.body)
         {
            return false;
         }
         if(!_arg_1.aabb.intersects(_arg_2.aabb,tihudesi))
         {
            return false;
         }
         var _local_3:Collider = this.colliders[_arg_1.type | _arg_2.type];
         return _local_3.haveCollision(_arg_1,_arg_2);
      }
      
      public function raycast(_arg_1:Vector3, _arg_2:Vector3, _arg_3:int, _arg_4:Number, _arg_5:IRayCollisionFilter, _arg_6:RayHit) : Boolean
      {
         var _local_7:Boolean = this.raycastStatic(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6);
         var _local_8:Boolean = this.qeriwi(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,this.mudyzacu);
         if(!(_local_8 || _local_7))
         {
            return false;
         }
         if(_local_8 && _local_7)
         {
            if(_arg_6.t > this.mudyzacu.t)
            {
               _arg_6.copy(this.mudyzacu);
            }
            this.mudyzacu.clear();
            return true;
         }
         if(_local_7)
         {
            this.mudyzacu.clear();
            return true;
         }
         _arg_6.copy(this.mudyzacu);
         this.mudyzacu.clear();
         return true;
      }
      
      public function raycastStatic(_arg_1:Vector3, _arg_2:Vector3, _arg_3:int, _arg_4:Number, _arg_5:IRayCollisionFilter, _arg_6:RayHit) : Boolean
      {
         if(!this.nudinyt(_arg_1,_arg_2,this.sukogel.rootNode.boundBox,this.nyhivewor))
         {
            return false;
         }
         if(this.nyhivewor.max < 0 || this.nyhivewor.min > _arg_4)
         {
            return false;
         }
         if(this.nyhivewor.min <= 0)
         {
            this.nyhivewor.min = 0;
            this.sut.x = _arg_1.x;
            this.sut.y = _arg_1.y;
            this.sut.z = _arg_1.z;
         }
         else
         {
            this.sut.x = _arg_1.x + this.nyhivewor.min * _arg_2.x;
            this.sut.y = _arg_1.y + this.nyhivewor.min * _arg_2.y;
            this.sut.z = _arg_1.z + this.nyhivewor.min * _arg_2.z;
         }
         if(this.nyhivewor.max > _arg_4)
         {
            this.nyhivewor.max = _arg_4;
         }
         var _local_7:Boolean = this.qasobi(this.sukogel.rootNode,_arg_1,this.sut,_arg_2,_arg_3,this.nyhivewor.min,this.nyhivewor.max,_arg_5,_arg_6);
         return !_local_7 ? Boolean(false) : Boolean(_arg_6.t <= _arg_4);
      }
      
      public function hasStaticHit(_arg_1:Vector3, _arg_2:Vector3, _arg_3:int, _arg_4:Number, _arg_5:IRayCollisionFilter = null) : Boolean
      {
         var _local_6:Boolean = this.raycastStatic(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,this.verumonuv);
         this.verumonuv.clear();
         return _local_6;
      }
      
      private function lipiky(_arg_1:CollisionKdNode, _arg_2:CollisionShape, _arg_3:Vector.<ShapeContact>) : void
      {
         var _local_6:Vector.<CollisionShape> = null;
         var _local_7:Vector.<int> = null;
         var _local_8:int = 0;
         var _local_9:int = 0;
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         if(_arg_1.indices != null)
         {
            _local_6 = this.sukogel.staticChildren;
            _local_7 = _arg_1.indices;
            _local_8 = int(_local_7.length);
            _local_9 = 0;
            while(_local_9 < _local_8)
            {
               this.getContacts(_arg_2,_local_6[_local_7[_local_9]],_arg_3);
               _local_9++;
            }
         }
         if(_arg_1.axis == -1)
         {
            return;
         }
         switch(_arg_1.axis)
         {
            case 0:
               _local_4 = _arg_2.aabb.minX;
               _local_5 = _arg_2.aabb.maxX;
               break;
            case 1:
               _local_4 = _arg_2.aabb.minY;
               _local_5 = _arg_2.aabb.maxY;
               break;
            case 2:
               _local_4 = _arg_2.aabb.minZ;
               _local_5 = _arg_2.aabb.maxZ;
         }
         if(_local_4 < _arg_1.coord)
         {
            this.lipiky(_arg_1.negativeNode,_arg_2,_arg_3);
         }
         if(_local_5 > _arg_1.coord)
         {
            this.lipiky(_arg_1.positiveNode,_arg_2,_arg_3);
         }
         if(_arg_1.splitTree != null && _local_4 < _arg_1.coord && _local_5 > _arg_1.coord)
         {
            this.lipiky(_arg_1.splitTree.rootNode,_arg_2,_arg_3);
         }
      }
      
      private function japy(_arg_1:CollisionShape, _arg_2:CollisionKdNode) : Boolean
      {
         var _local_5:Vector.<CollisionShape> = null;
         var _local_6:Vector.<int> = null;
         var _local_7:int = 0;
         var _local_8:int = 0;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         if(_arg_2.indices != null)
         {
            _local_5 = this.sukogel.staticChildren;
            _local_6 = _arg_2.indices;
            _local_7 = int(_local_6.length);
            _local_8 = 0;
            while(_local_8 < _local_7)
            {
               if(this.testCollision(_arg_1,_local_5[_local_6[_local_8]]))
               {
                  return true;
               }
               _local_8++;
            }
         }
         if(_arg_2.axis == -1)
         {
            return false;
         }
         switch(_arg_2.axis)
         {
            case 0:
               _local_3 = _arg_1.aabb.minX;
               _local_4 = _arg_1.aabb.maxX;
               break;
            case 1:
               _local_3 = _arg_1.aabb.minY;
               _local_4 = _arg_1.aabb.maxY;
               break;
            case 2:
               _local_3 = _arg_1.aabb.minZ;
               _local_4 = _arg_1.aabb.maxZ;
         }
         if(_arg_2.splitTree != null && _local_3 < _arg_2.coord && _local_4 > _arg_2.coord)
         {
            if(this.japy(_arg_1,_arg_2.splitTree.rootNode))
            {
               return true;
            }
         }
         if(_local_3 < _arg_2.coord)
         {
            if(this.japy(_arg_1,_arg_2.negativeNode))
            {
               return true;
            }
         }
         if(_local_4 > _arg_2.coord)
         {
            if(this.japy(_arg_1,_arg_2.positiveNode))
            {
               return true;
            }
         }
         return false;
      }
      
      private function qeriwi(_arg_1:Vector3, _arg_2:Vector3, _arg_3:int, _arg_4:Number, _arg_5:IRayCollisionFilter, _arg_6:RayHit) : Boolean
      {
         var _local_7:Vuwuci = null;
         var _local_8:Body = null;
         var _local_9:AABB = null;
         var _local_10:int = 0;
         var _local_11:CollisionShape = null;
         var _local_18:int = 0;
         var _local_12:Number = NaN;
         var _local_13:Number = _arg_1.x + _arg_2.x * _arg_4;
         var _local_14:Number = _arg_1.y + _arg_2.y * _arg_4;
         var _local_15:Number = _arg_1.z + _arg_2.z * _arg_4;
         if(_local_13 < _arg_1.x)
         {
            this.zegider.minX = _local_13;
            this.zegider.maxX = _arg_1.x;
         }
         else
         {
            this.zegider.minX = _arg_1.x;
            this.zegider.maxX = _local_13;
         }
         if(_local_14 < _arg_1.y)
         {
            this.zegider.minY = _local_14;
            this.zegider.maxY = _arg_1.y;
         }
         else
         {
            this.zegider.minY = _arg_1.y;
            this.zegider.maxY = _local_14;
         }
         if(_local_15 < _arg_1.z)
         {
            this.zegider.minZ = _local_15;
            this.zegider.maxZ = _arg_1.z;
         }
         else
         {
            this.zegider.minZ = _arg_1.z;
            this.zegider.maxZ = _local_15;
         }
         var _local_16:Number = _arg_4 + 1;
         var _local_17:int = int(this.baqa.length);
         while(_local_18 < _local_17)
         {
            _local_7 = this.baqa[_local_18];
            _local_8 = _local_7.body;
            _local_9 = _local_8.aabb;
            if(!(this.zegider.maxX < _local_9.minX || this.zegider.minX > _local_9.maxX || this.zegider.maxY < _local_9.minY || this.zegider.minY > _local_9.maxY || this.zegider.maxZ < _local_9.minZ || this.zegider.minZ > _local_9.maxZ))
            {
               _local_10 = 0;
               while(_local_10 < _local_8.numCollisionShapes)
               {
                  _local_11 = _local_8.collisionShapes[_local_10];
                  if((_local_11.collisionGroup & _arg_3) != 0)
                  {
                     _local_9 = _local_11.aabb;
                     if(!(this.zegider.maxX < _local_9.minX || this.zegider.minX > _local_9.maxX || this.zegider.maxY < _local_9.minY || this.zegider.minY > _local_9.maxY || this.zegider.maxZ < _local_9.minZ || this.zegider.minZ > _local_9.maxZ))
                     {
                        if(!(_arg_5 != null && !_arg_5.considerBody(_local_8)))
                        {
                           _local_12 = _local_11.raycast(_arg_1,_arg_2,this.threshold,this.sej);
                           if(_local_12 >= 0 && _local_12 < _local_16)
                           {
                              _local_16 = _local_12;
                              _arg_6.shape = _local_11;
                              _arg_6.normal.x = this.sej.x;
                              _arg_6.normal.y = this.sej.y;
                              _arg_6.normal.z = this.sej.z;
                           }
                        }
                     }
                  }
                  _local_10++;
               }
            }
            _local_18++;
         }
         if(_local_16 > _arg_4)
         {
            return false;
         }
         _arg_6.position.x = _arg_1.x + _arg_2.x * _local_16;
         _arg_6.position.y = _arg_1.y + _arg_2.y * _local_16;
         _arg_6.position.z = _arg_1.z + _arg_2.z * _local_16;
         _arg_6.t = _local_16;
         return true;
      }
      
      private function nudinyt(_arg_1:Vector3, _arg_2:Vector3, _arg_3:AABB, _arg_4:Musibo) : Boolean
      {
         var _local_7:int = 0;
         var _local_5:Number = NaN;
         var _local_6:Number = NaN;
         _arg_4.min = -1;
         for(_arg_4.max = 1e+308; _local_7 < 3; _local_7++)
         {
            switch(_local_7)
            {
               case 0:
                  if(!(_arg_2.x < this.threshold && _arg_2.x > -this.threshold))
                  {
                     _local_5 = (_arg_3.minX - _arg_1.x) / _arg_2.x;
                     _local_6 = (_arg_3.maxX - _arg_1.x) / _arg_2.x;
                     break;
                  }
                  if(_arg_1.x < _arg_3.minX || _arg_1.x > _arg_3.maxX)
                  {
                     return false;
                  }
                  continue;
               case 1:
                  if(!(_arg_2.y < this.threshold && _arg_2.y > -this.threshold))
                  {
                     _local_5 = (_arg_3.minY - _arg_1.y) / _arg_2.y;
                     _local_6 = (_arg_3.maxY - _arg_1.y) / _arg_2.y;
                     break;
                  }
                  if(_arg_1.y < _arg_3.minY || _arg_1.y > _arg_3.maxY)
                  {
                     return false;
                  }
                  continue;
               case 2:
                  if(!(_arg_2.z < this.threshold && _arg_2.z > -this.threshold))
                  {
                     _local_5 = (_arg_3.minZ - _arg_1.z) / _arg_2.z;
                     _local_6 = (_arg_3.maxZ - _arg_1.z) / _arg_2.z;
                     break;
                  }
                  if(_arg_1.z < _arg_3.minZ || _arg_1.z > _arg_3.maxZ)
                  {
                     return false;
                  }
                  continue;
            }
            if(_local_5 < _local_6)
            {
               if(_local_5 > _arg_4.min)
               {
                  _arg_4.min = _local_5;
               }
               if(_local_6 < _arg_4.max)
               {
                  _arg_4.max = _local_6;
               }
            }
            else
            {
               if(_local_6 > _arg_4.min)
               {
                  _arg_4.min = _local_6;
               }
               if(_local_5 < _arg_4.max)
               {
                  _arg_4.max = _local_5;
               }
            }
            if(_arg_4.max < _arg_4.min)
            {
               return false;
            }
         }
         return true;
      }
      
      private function qasobi(_arg_1:CollisionKdNode, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Vector3, _arg_5:int, _arg_6:Number, _arg_7:Number, _arg_8:IRayCollisionFilter, _arg_9:RayHit) : Boolean
      {
         var _local_11:CollisionKdNode = null;
         var _local_12:Boolean = false;
         var _local_13:CollisionKdNode = null;
         var _local_14:int = 0;
         var _local_15:int = 0;
         var _local_16:CollisionShape = null;
         var _local_10:Number = NaN;
         if(_arg_1.indices != null && this.moh(_arg_2,_arg_4,_arg_5,this.sukogel.staticChildren,_arg_1.indices,_arg_8,_arg_9))
         {
            return true;
         }
         if(_arg_1.axis == -1)
         {
            return false;
         }
         switch(_arg_1.axis)
         {
            case 0:
               if(_arg_4.x > -this.threshold && _arg_4.x < this.threshold)
               {
                  _local_10 = _arg_7 + 1;
               }
               else
               {
                  _local_10 = (_arg_1.coord - _arg_2.x) / _arg_4.x;
               }
               _local_11 = _arg_3.x < _arg_1.coord ? _arg_1.negativeNode : _arg_1.positiveNode;
               break;
            case 1:
               if(_arg_4.y > -this.threshold && _arg_4.y < this.threshold)
               {
                  _local_10 = _arg_7 + 1;
               }
               else
               {
                  _local_10 = (_arg_1.coord - _arg_2.y) / _arg_4.y;
               }
               _local_11 = _arg_3.y < _arg_1.coord ? _arg_1.negativeNode : _arg_1.positiveNode;
               break;
            case 2:
               if(_arg_4.z > -this.threshold && _arg_4.z < this.threshold)
               {
                  _local_10 = _arg_7 + 1;
               }
               else
               {
                  _local_10 = (_arg_1.coord - _arg_2.z) / _arg_4.z;
               }
               _local_11 = _arg_3.z < _arg_1.coord ? _arg_1.negativeNode : _arg_1.positiveNode;
         }
         if(_local_10 < _arg_6 || _local_10 > _arg_7)
         {
            return this.qasobi(_local_11,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6,_arg_7,_arg_8,_arg_9);
         }
         _local_12 = this.qasobi(_local_11,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6,_local_10,_arg_8,_arg_9);
         if(_local_12)
         {
            return true;
         }
         this.sut.x = _arg_2.x + _local_10 * _arg_4.x;
         this.sut.y = _arg_2.y + _local_10 * _arg_4.y;
         this.sut.z = _arg_2.z + _local_10 * _arg_4.z;
         if(_arg_1.splitTree != null)
         {
            _local_13 = _arg_1.splitTree.rootNode;
            while(_local_13 != null && _local_13.axis != -1)
            {
               switch(_local_13.axis)
               {
                  case 0:
                     _local_13 = this.sut.x < _local_13.coord ? _local_13.negativeNode : _local_13.positiveNode;
                     break;
                  case 1:
                     _local_13 = this.sut.y < _local_13.coord ? _local_13.negativeNode : _local_13.positiveNode;
                     break;
                  case 2:
                     _local_13 = this.sut.z < _local_13.coord ? _local_13.negativeNode : _local_13.positiveNode;
               }
            }
            if(_local_13 != null && _local_13.indices != null)
            {
               _local_14 = int(_local_13.indices.length);
               _local_15 = 0;
               while(_local_15 < _local_14)
               {
                  _local_16 = this.sukogel.staticChildren[_local_13.indices[_local_15]];
                  if((_local_16.collisionGroup & _arg_5) != 0)
                  {
                     if(!(_arg_8 != null && !_arg_8.considerBody(_local_16.body)))
                     {
                        _arg_9.t = _local_16.raycast(_arg_2,_arg_4,this.threshold,_arg_9.normal);
                        if(_arg_9.t >= 0)
                        {
                           _arg_9.position.copy(this.sut);
                           _arg_9.shape = _local_16;
                           return true;
                        }
                     }
                  }
                  _local_15++;
               }
            }
         }
         return this.qasobi(_local_11 == _arg_1.negativeNode ? _arg_1.positiveNode : _arg_1.negativeNode,_arg_2,this.sut,_arg_4,_arg_5,_local_10,_arg_7,_arg_8,_arg_9);
      }
      
      private function moh(_arg_1:Vector3, _arg_2:Vector3, _arg_3:int, _arg_4:Vector.<CollisionShape>, _arg_5:Vector.<int>, _arg_6:IRayCollisionFilter, _arg_7:RayHit) : Boolean
      {
         var _local_8:CollisionShape = null;
         var _local_12:int = 0;
         var _local_9:Number = NaN;
         var _local_10:int = int(_arg_5.length);
         var _local_11:Number = 1e+308;
         while(_local_12 < _local_10)
         {
            _local_8 = _arg_4[_arg_5[_local_12]];
            if((_local_8.collisionGroup & _arg_3) != 0)
            {
               if(!(_arg_6 != null && !_arg_6.considerBody(_local_8.body)))
               {
                  _local_9 = _local_8.raycast(_arg_1,_arg_2,this.threshold,this.sej);
                  if(_local_9 > 0 && _local_9 < _local_11)
                  {
                     _local_11 = _local_9;
                     _arg_7.shape = _local_8;
                     _arg_7.normal.x = this.sej.x;
                     _arg_7.normal.y = this.sej.y;
                     _arg_7.normal.z = this.sej.z;
                  }
               }
            }
            _local_12++;
         }
         if(_local_11 == 1e+308)
         {
            return false;
         }
         _arg_7.position.x = _arg_1.x + _arg_2.x * _local_11;
         _arg_7.position.y = _arg_1.y + _arg_2.y * _local_11;
         _arg_7.position.z = _arg_1.z + _arg_2.z * _local_11;
         _arg_7.t = _local_11;
         return true;
      }
      
      public function sezu(_arg_1:CollisionShape) : Boolean
      {
         return this.japy(_arg_1,this.sukogel.rootNode);
      }
      
      public function destroy() : void
      {
         var _local_1:Vuwuci = null;
         if(this.sukogel == null)
         {
            return;
         }
         this.sukogel.destroyTree();
         this.sukogel = null;
         for each(_local_1 in this.baqa)
         {
            _local_1.destroy();
         }
         this.baqa.length = 0;
         this.kobeqo = null;
      }
   }
}

