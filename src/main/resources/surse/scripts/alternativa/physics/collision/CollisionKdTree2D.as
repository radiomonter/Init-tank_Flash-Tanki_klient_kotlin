package alternativa.physics.collision
{
   import alternativa.physics.collision.types.AABB;
   
   public class CollisionKdTree2D
   {
      
      private static const nodeBoundBoxThreshold:AABB = new AABB();
      
      private static const splitCoordsX:Vector.<Number> = new Vector.<Number>();
      
      private static const splitCoordsY:Vector.<Number> = new Vector.<Number>();
      
      private static const splitCoordsZ:Vector.<Number> = new Vector.<Number>();
      
      private static const _nodeBB:Vector.<Number> = new Vector.<Number>(6);
      
      private static const _bb:Vector.<Number> = new Vector.<Number>(6);
      
      public var threshold:Number = 0.1;
      
      public var minPrimitivesPerNode:int = 1;
      
      public var parentTree:CollisionKdTree;
      
      public var parentNode:CollisionKdNode;
      
      public var rootNode:CollisionKdNode;
      
      private var splitAxis:int;
      
      private var splitCost:Number;
      
      private var splitCoord:Number;
      
      public function CollisionKdTree2D(_arg_1:CollisionKdTree, _arg_2:CollisionKdNode)
      {
         super();
         this.parentTree = _arg_1;
         this.parentNode = _arg_2;
      }
      
      public function createTree() : void
      {
         var _local_2:int = 0;
         this.rootNode = new CollisionKdNode();
         this.rootNode.boundBox = this.parentNode.boundBox.clone();
         this.rootNode.indices = new Vector.<int>();
         var _local_1:int = int(this.parentNode.splitIndices.length);
         while(_local_2 < _local_1)
         {
            this.rootNode.indices[_local_2] = this.parentNode.splitIndices[_local_2];
            _local_2++;
         }
         this.splitNode(this.rootNode);
         splitCoordsX.length = splitCoordsY.length = splitCoordsZ.length = 0;
      }
      
      private function splitNode(_arg_1:CollisionKdNode) : void
      {
         var _local_2:Vector.<int> = null;
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_5:AABB = null;
         var _local_6:int = 0;
         var _local_7:int = 0;
         var _local_8:int = 0;
         var _local_9:AABB = null;
         var _local_19:* = undefined;
         var _local_10:Number = NaN;
         var _local_11:Number = NaN;
         if(_arg_1.indices.length <= this.minPrimitivesPerNode)
         {
            return;
         }
         _local_2 = _arg_1.indices;
         _local_5 = _arg_1.boundBox;
         nodeBoundBoxThreshold.minX = _local_5.minX + this.threshold;
         nodeBoundBoxThreshold.minY = _local_5.minY + this.threshold;
         nodeBoundBoxThreshold.minZ = _local_5.minZ + this.threshold;
         nodeBoundBoxThreshold.maxX = _local_5.maxX - this.threshold;
         nodeBoundBoxThreshold.maxY = _local_5.maxY - this.threshold;
         nodeBoundBoxThreshold.maxZ = _local_5.maxZ - this.threshold;
         var _local_12:Number = this.threshold * 2;
         var _local_13:Vector.<AABB> = this.parentTree.staticBoundBoxes;
         var _local_14:int = int(_local_2.length);
         _local_3 = 0;
         while(_local_3 < _local_14)
         {
            _local_9 = _local_13[_local_2[_local_3]];
            if(this.parentNode.axis != 0)
            {
               if(_local_9.minX > nodeBoundBoxThreshold.minX)
               {
                  _local_19 = _local_6++;
                  splitCoordsX[_local_19] = _local_9.minX;
               }
               if(_local_9.maxX < nodeBoundBoxThreshold.maxX)
               {
                  _local_19 = _local_6++;
                  splitCoordsX[_local_19] = _local_9.maxX;
               }
            }
            if(this.parentNode.axis != 1)
            {
               if(_local_9.minY > nodeBoundBoxThreshold.minY)
               {
                  _local_19 = _local_7++;
                  splitCoordsY[_local_19] = _local_9.minY;
               }
               if(_local_9.maxY < nodeBoundBoxThreshold.maxY)
               {
                  _local_19 = _local_7++;
                  splitCoordsY[_local_19] = _local_9.maxY;
               }
            }
            if(this.parentNode.axis != 2)
            {
               if(_local_9.minZ > nodeBoundBoxThreshold.minZ)
               {
                  _local_19 = _local_8++;
                  splitCoordsZ[_local_19] = _local_9.minZ;
               }
               if(_local_9.maxZ < nodeBoundBoxThreshold.maxZ)
               {
                  _local_19 = _local_8++;
                  splitCoordsZ[_local_19] = _local_9.maxZ;
               }
            }
            _local_3++;
         }
         this.splitAxis = -1;
         this.splitCost = 1e+308;
         _nodeBB[0] = _local_5.minX;
         _nodeBB[1] = _local_5.minY;
         _nodeBB[2] = _local_5.minZ;
         _nodeBB[3] = _local_5.maxX;
         _nodeBB[4] = _local_5.maxY;
         _nodeBB[5] = _local_5.maxZ;
         if(this.parentNode.axis != 0)
         {
            this.checkNodeAxis(_arg_1,0,_local_6,splitCoordsX,_nodeBB);
         }
         if(this.parentNode.axis != 1)
         {
            this.checkNodeAxis(_arg_1,1,_local_7,splitCoordsY,_nodeBB);
         }
         if(this.parentNode.axis != 2)
         {
            this.checkNodeAxis(_arg_1,2,_local_8,splitCoordsZ,_nodeBB);
         }
         if(this.splitAxis < 0)
         {
            return;
         }
         var _local_15:* = this.splitAxis == 0;
         var _local_16:* = this.splitAxis == 1;
         _arg_1.axis = this.splitAxis;
         _arg_1.coord = this.splitCoord;
         _arg_1.negativeNode = new CollisionKdNode();
         _arg_1.negativeNode.parent = _arg_1;
         _arg_1.negativeNode.boundBox = _local_5.clone();
         _arg_1.positiveNode = new CollisionKdNode();
         _arg_1.positiveNode.parent = _arg_1;
         _arg_1.positiveNode.boundBox = _local_5.clone();
         if(Boolean(_local_15))
         {
            _arg_1.negativeNode.boundBox.maxX = _arg_1.positiveNode.boundBox.minX = this.splitCoord;
         }
         else if(Boolean(_local_16))
         {
            _arg_1.negativeNode.boundBox.maxY = _arg_1.positiveNode.boundBox.minY = this.splitCoord;
         }
         else
         {
            _arg_1.negativeNode.boundBox.maxZ = _arg_1.positiveNode.boundBox.minZ = this.splitCoord;
         }
         var _local_17:Number = this.splitCoord - this.threshold;
         var _local_18:Number = this.splitCoord + this.threshold;
         _local_3 = 0;
         while(_local_3 < _local_14)
         {
            _local_9 = _local_13[_local_2[_local_3]];
            _local_10 = !_local_15 ? (!_local_16 ? Number(_local_9.minZ) : Number(_local_9.minY)) : Number(_local_9.minX);
            _local_11 = !_local_15 ? (!_local_16 ? Number(_local_9.maxZ) : Number(_local_9.maxY)) : Number(_local_9.maxX);
            if(_local_11 <= _local_18)
            {
               if(_local_10 < _local_17)
               {
                  if(_arg_1.negativeNode.indices == null)
                  {
                     _arg_1.negativeNode.indices = new Vector.<int>();
                  }
                  _arg_1.negativeNode.indices.push(_local_2[_local_3]);
                  _local_2[_local_3] = -1;
               }
            }
            else if(_local_10 >= _local_17)
            {
               if(_local_11 > _local_18)
               {
                  if(_arg_1.positiveNode.indices == null)
                  {
                     _arg_1.positiveNode.indices = new Vector.<int>();
                  }
                  _arg_1.positiveNode.indices.push(_local_2[_local_3]);
                  _local_2[_local_3] = -1;
               }
            }
            _local_3++;
         }
         _local_3 = 0;
         _local_4 = 0;
         while(_local_3 < _local_14)
         {
            if(_local_2[_local_3] >= 0)
            {
               _local_19 = _local_4++;
               _local_2[_local_19] = _local_2[_local_3];
            }
            _local_3++;
         }
         if(_local_4 > 0)
         {
            _local_2.length = _local_4;
         }
         else
         {
            _arg_1.indices = null;
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
         var _local_22:int = 0;
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         var _local_9:Number = NaN;
         var _local_10:Number = NaN;
         var _local_16:Number = NaN;
         var _local_18:int = (_arg_2 + 1) % 3;
         var _local_19:int = (_arg_2 + 2) % 3;
         var _local_20:Number = (_arg_5[_local_18 + 3] - _arg_5[_local_18]) * (_arg_5[_local_19 + 3] - _arg_5[_local_19]);
         var _local_21:Vector.<AABB> = this.parentTree.staticBoundBoxes;
         while(_local_22 < _arg_3)
         {
            _local_6 = _arg_4[_local_22];
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
                  _local_17 = _local_21[_arg_1.indices[_local_15]];
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
               _local_15 = _local_22 + 1;
               while(_local_15 < _arg_3)
               {
                  if(_arg_4[_local_15] >= _local_6 - this.threshold && _arg_4[_local_15] <= _local_6 + this.threshold)
                  {
                     _arg_4[_local_15] = NaN;
                  }
                  _local_15++;
               }
            }
            _local_22++;
         }
      }
      
      public function destroyTree() : void
      {
         this.parentTree = null;
         this.parentNode = null;
         if(Boolean(this.rootNode))
         {
            this.rootNode.destroy();
            this.rootNode = null;
         }
      }
   }
}

