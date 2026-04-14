package alternativa.physics.collision
{
   import alternativa.physics.collision.types.AABB;
   
   public class CollisionKdTree
   {
      
      private static const nodeBoundBoxThreshold:AABB = new AABB();
      
      private static const splitCoordsX:Vector.<Number> = new Vector.<Number>();
      
      private static const splitCoordsY:Vector.<Number> = new Vector.<Number>();
      
      private static const splitCoordsZ:Vector.<Number> = new Vector.<Number>();
      
      private static const _nodeBB:Vector.<Number> = new Vector.<Number>(6);
      
      private static const _bb:Vector.<Number> = new Vector.<Number>(6);
      
      public var threshold:Number = 0.1;
      
      public var minPrimitivesPerNode:int = 1;
      
      public var rootNode:CollisionKdNode;
      
      public var staticChildren:Vector.<CollisionShape>;
      
      public var numStaticChildren:int;
      
      public var staticBoundBoxes:Vector.<AABB> = new Vector.<AABB>();
      
      private var splitAxis:int;
      
      private var splitCoord:Number;
      
      private var splitCost:Number;
      
      public function CollisionKdTree()
      {
         super();
      }
      
      public function createTree(_arg_1:Vector.<CollisionShape>, _arg_2:AABB = null) : void
      {
         var _local_3:CollisionShape = null;
         var _local_4:AABB = null;
         var _local_6:int = 0;
         this.staticChildren = _arg_1.concat();
         this.numStaticChildren = this.staticChildren.length;
         this.rootNode = new CollisionKdNode();
         this.rootNode.indices = new Vector.<int>();
         var _local_5:AABB = this.rootNode.boundBox = _arg_2 != null ? _arg_2 : new AABB();
         while(_local_6 < this.numStaticChildren)
         {
            _local_3 = this.staticChildren[_local_6];
            _local_4 = this.staticBoundBoxes[_local_6] = _local_3.calculateAABB();
            _local_5.addBoundBox(_local_4);
            this.rootNode.indices[_local_6] = _local_6;
            _local_6++;
         }
         this.staticBoundBoxes.length = this.numStaticChildren;
         this.splitNode(this.rootNode);
         splitCoordsX.length = splitCoordsY.length = splitCoordsZ.length = 0;
      }
      
      private function splitNode(_arg_1:CollisionKdNode) : void
      {
         var _local_2:AABB = null;
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_5:AABB = null;
         var _local_11:int = 0;
         var _local_12:int = 0;
         var _local_13:int = 0;
         var _local_18:* = undefined;
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:Vector.<int> = _arg_1.indices;
         var _local_9:int = int(_local_8.length);
         if(_local_9 <= this.minPrimitivesPerNode)
         {
            return;
         }
         _local_2 = _arg_1.boundBox;
         nodeBoundBoxThreshold.minX = _local_2.minX + this.threshold;
         nodeBoundBoxThreshold.minY = _local_2.minY + this.threshold;
         nodeBoundBoxThreshold.minZ = _local_2.minZ + this.threshold;
         nodeBoundBoxThreshold.maxX = _local_2.maxX - this.threshold;
         nodeBoundBoxThreshold.maxY = _local_2.maxY - this.threshold;
         nodeBoundBoxThreshold.maxZ = _local_2.maxZ - this.threshold;
         var _local_10:Number = this.threshold * 2;
         _local_3 = 0;
         while(_local_3 < _local_9)
         {
            _local_5 = this.staticBoundBoxes[_local_8[_local_3]];
            if(_local_5.maxX - _local_5.minX <= _local_10)
            {
               if(_local_5.minX <= nodeBoundBoxThreshold.minX)
               {
                  _local_18 = _local_11++;
                  splitCoordsX[_local_18] = _local_2.minX;
               }
               else if(_local_5.maxX >= nodeBoundBoxThreshold.maxX)
               {
                  _local_18 = _local_11++;
                  splitCoordsX[_local_18] = _local_2.maxX;
               }
               else
               {
                  _local_18 = _local_11++;
                  splitCoordsX[_local_18] = (_local_5.minX + _local_5.maxX) * 0.5;
               }
            }
            else
            {
               if(_local_5.minX > nodeBoundBoxThreshold.minX)
               {
                  _local_18 = _local_11++;
                  splitCoordsX[_local_18] = _local_5.minX;
               }
               if(_local_5.maxX < nodeBoundBoxThreshold.maxX)
               {
                  _local_18 = _local_11++;
                  splitCoordsX[_local_18] = _local_5.maxX;
               }
            }
            if(_local_5.maxY - _local_5.minY <= _local_10)
            {
               if(_local_5.minY <= nodeBoundBoxThreshold.minY)
               {
                  _local_18 = _local_12++;
                  splitCoordsY[_local_18] = _local_2.minY;
               }
               else if(_local_5.maxY >= nodeBoundBoxThreshold.maxY)
               {
                  _local_18 = _local_12++;
                  splitCoordsY[_local_18] = _local_2.maxY;
               }
               else
               {
                  _local_18 = _local_12++;
                  splitCoordsY[_local_18] = (_local_5.minY + _local_5.maxY) * 0.5;
               }
            }
            else
            {
               if(_local_5.minY > nodeBoundBoxThreshold.minY)
               {
                  _local_18 = _local_12++;
                  splitCoordsY[_local_18] = _local_5.minY;
               }
               if(_local_5.maxY < nodeBoundBoxThreshold.maxY)
               {
                  _local_18 = _local_12++;
                  splitCoordsY[_local_18] = _local_5.maxY;
               }
            }
            if(_local_5.maxZ - _local_5.minZ <= _local_10)
            {
               if(_local_5.minZ <= nodeBoundBoxThreshold.minZ)
               {
                  _local_18 = _local_13++;
                  splitCoordsZ[_local_18] = _local_2.minZ;
               }
               else if(_local_5.maxZ >= nodeBoundBoxThreshold.maxZ)
               {
                  _local_18 = _local_13++;
                  splitCoordsZ[_local_18] = _local_2.maxZ;
               }
               else
               {
                  _local_18 = _local_13++;
                  splitCoordsZ[_local_18] = (_local_5.minZ + _local_5.maxZ) * 0.5;
               }
            }
            else
            {
               if(_local_5.minZ > nodeBoundBoxThreshold.minZ)
               {
                  _local_18 = _local_13++;
                  splitCoordsZ[_local_18] = _local_5.minZ;
               }
               if(_local_5.maxZ < nodeBoundBoxThreshold.maxZ)
               {
                  _local_18 = _local_13++;
                  splitCoordsZ[_local_18] = _local_5.maxZ;
               }
            }
            _local_3++;
         }
         this.splitAxis = -1;
         this.splitCost = 1e+308;
         _nodeBB[0] = _local_2.minX;
         _nodeBB[1] = _local_2.minY;
         _nodeBB[2] = _local_2.minZ;
         _nodeBB[3] = _local_2.maxX;
         _nodeBB[4] = _local_2.maxY;
         _nodeBB[5] = _local_2.maxZ;
         this.checkNodeAxis(_arg_1,0,_local_11,splitCoordsX,_nodeBB);
         this.checkNodeAxis(_arg_1,1,_local_12,splitCoordsY,_nodeBB);
         this.checkNodeAxis(_arg_1,2,_local_13,splitCoordsZ,_nodeBB);
         if(this.splitAxis < 0)
         {
            return;
         }
         var _local_14:* = this.splitAxis == 0;
         var _local_15:* = this.splitAxis == 1;
         _arg_1.axis = this.splitAxis;
         _arg_1.coord = this.splitCoord;
         _arg_1.negativeNode = new CollisionKdNode();
         _arg_1.negativeNode.parent = _arg_1;
         _arg_1.negativeNode.boundBox = _local_2.clone();
         _arg_1.positiveNode = new CollisionKdNode();
         _arg_1.positiveNode.parent = _arg_1;
         _arg_1.positiveNode.boundBox = _local_2.clone();
         if(Boolean(_local_14))
         {
            _arg_1.negativeNode.boundBox.maxX = _arg_1.positiveNode.boundBox.minX = this.splitCoord;
         }
         else if(Boolean(_local_15))
         {
            _arg_1.negativeNode.boundBox.maxY = _arg_1.positiveNode.boundBox.minY = this.splitCoord;
         }
         else
         {
            _arg_1.negativeNode.boundBox.maxZ = _arg_1.positiveNode.boundBox.minZ = this.splitCoord;
         }
         var _local_16:Number = this.splitCoord - this.threshold;
         var _local_17:Number = this.splitCoord + this.threshold;
         _local_3 = 0;
         while(_local_3 < _local_9)
         {
            _local_5 = this.staticBoundBoxes[_local_8[_local_3]];
            _local_6 = !_local_14 ? (!_local_15 ? Number(_local_5.minZ) : Number(_local_5.minY)) : Number(_local_5.minX);
            _local_7 = !_local_14 ? (!_local_15 ? Number(_local_5.maxZ) : Number(_local_5.maxY)) : Number(_local_5.maxX);
            if(_local_7 <= _local_17)
            {
               if(_local_6 < _local_16)
               {
                  if(_arg_1.negativeNode.indices == null)
                  {
                     _arg_1.negativeNode.indices = new Vector.<int>();
                  }
                  _arg_1.negativeNode.indices.push(_local_8[_local_3]);
                  _local_8[_local_3] = -1;
               }
               else
               {
                  if(_arg_1.splitIndices == null)
                  {
                     _arg_1.splitIndices = new Vector.<int>();
                  }
                  _arg_1.splitIndices.push(_local_8[_local_3]);
                  _local_8[_local_3] = -1;
               }
            }
            else if(_local_6 >= _local_16)
            {
               if(_arg_1.positiveNode.indices == null)
               {
                  _arg_1.positiveNode.indices = new Vector.<int>();
               }
               _arg_1.positiveNode.indices.push(_local_8[_local_3]);
               _local_8[_local_3] = -1;
            }
            _local_3++;
         }
         _local_3 = 0;
         _local_4 = 0;
         while(_local_3 < _local_9)
         {
            if(_local_8[_local_3] >= 0)
            {
               _local_18 = _local_4++;
               _local_8[_local_18] = _local_8[_local_3];
            }
            _local_3++;
         }
         if(_local_4 > 0)
         {
            _local_8.length = _local_4;
         }
         else
         {
            _arg_1.indices = null;
         }
         if(_arg_1.splitIndices != null)
         {
            _arg_1.splitTree = new CollisionKdTree2D(this,_arg_1);
            _arg_1.splitTree.createTree();
         }
         if(_arg_1.negativeNode.indices != null)
         {
            this.splitNode(_arg_1.negativeNode);
         }
         if(_arg_1.positiveNode.indices != null)
         {
            this.splitNode(_arg_1.positiveNode);
         }
      }
      
      private function checkNodeAxis(_arg_1:CollisionKdNode, _arg_2:int, _arg_3:int, _arg_4:Vector.<Number>, _arg_5:Vector.<Number>) : void
      {
         var _local_11:int = 0;
         var _local_12:int = 0;
         var _local_13:Boolean = false;
         var _local_14:int = 0;
         var _local_15:int = 0;
         var _local_17:AABB = null;
         var _local_21:int = 0;
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         var _local_9:Number = NaN;
         var _local_10:Number = NaN;
         var _local_16:Number = NaN;
         var _local_18:int = (_arg_2 + 1) % 3;
         var _local_19:int = (_arg_2 + 2) % 3;
         var _local_20:Number = (_arg_5[_local_18 + 3] - _arg_5[_local_18]) * (_arg_5[_local_19 + 3] - _arg_5[_local_19]);
         while(_local_21 < _arg_3)
         {
            _local_6 = _arg_4[_local_21];
            if(!isNaN(_local_6))
            {
               _local_7 = _local_6 - this.threshold;
               _local_8 = _local_6 + this.threshold;
               _local_9 = _local_20 * (_local_6 - _arg_5[_arg_2]);
               _local_10 = _local_20 * (_arg_5[int(_arg_2 + 3)] - _local_6);
               _local_11 = 0;
               _local_12 = 0;
               _local_13 = false;
               _local_14 = int(_arg_1.indices.length);
               _local_15 = 0;
               while(_local_15 < _local_14)
               {
                  _local_17 = this.staticBoundBoxes[_arg_1.indices[_local_15]];
                  _bb[0] = _local_17.minX;
                  _bb[1] = _local_17.minY;
                  _bb[2] = _local_17.minZ;
                  _bb[3] = _local_17.maxX;
                  _bb[4] = _local_17.maxY;
                  _bb[5] = _local_17.maxZ;
                  if(_bb[_arg_2 + 3] <= _local_8)
                  {
                     if(_bb[_arg_2] < _local_7)
                     {
                        _local_11++;
                     }
                  }
                  else
                  {
                     if(_bb[_arg_2] < _local_7)
                     {
                        _local_13 = true;
                        break;
                     }
                     _local_12++;
                  }
                  _local_15++;
               }
               _local_16 = _local_9 * _local_11 + _local_10 * _local_12;
               if(!_local_13 && _local_16 < this.splitCost && _local_11 > 0 && _local_12 > 0)
               {
                  this.splitAxis = _arg_2;
                  this.splitCost = _local_16;
                  this.splitCoord = _local_6;
               }
               _local_15 = _local_21 + 1;
               while(_local_15 < _arg_3)
               {
                  if(_arg_4[_local_15] >= _local_6 - this.threshold && _arg_4[_local_15] <= _local_6 + this.threshold)
                  {
                     _arg_4[_local_15] = NaN;
                  }
                  _local_15++;
               }
            }
            _local_21++;
         }
      }
      
      public function traceTree() : void
      {
         this.traceNode("",this.rootNode);
      }
      
      private function traceNode(_arg_1:String, _arg_2:CollisionKdNode) : void
      {
         if(_arg_2 == null)
         {
            return;
         }
         this.traceNode(_arg_1 + "-",_arg_2.negativeNode);
         this.traceNode(_arg_1 + "+",_arg_2.positiveNode);
      }
      
      public function destroyTree() : void
      {
         if(Boolean(this.rootNode))
         {
            this.rootNode.destroy();
            this.rootNode = null;
         }
         if(Boolean(this.staticChildren))
         {
            this.staticChildren.length = 0;
            this.staticChildren = null;
         }
         this.staticBoundBoxes.length = 0;
      }
   }
}

