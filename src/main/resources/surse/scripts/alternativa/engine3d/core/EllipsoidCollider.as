package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   
   use namespace alternativa3d;
   
   public class EllipsoidCollider
   {
      
      public var radiusX:Number;
      
      public var radiusY:Number;
      
      public var radiusZ:Number;
      
      public var threshold:Number = 0.001;
      
      private var matrix:Object3D = new Object3D();
      
      private var faces:Vector.<Face> = new Vector.<Face>();
      
      private var facesLength:int;
      
      private var radius:Number;
      
      private var src:Vector3D = new Vector3D();
      
      private var displ:Vector3D = new Vector3D();
      
      private var dest:Vector3D = new Vector3D();
      
      private var collisionPoint:Vector3D = new Vector3D();
      
      private var collisionPlane:Vector3D = new Vector3D();
      
      private var vCenter:Vector3D = new Vector3D();
      
      private var vA:Vector3D = new Vector3D();
      
      private var vB:Vector3D = new Vector3D();
      
      private var vC:Vector3D = new Vector3D();
      
      private var vD:Vector3D = new Vector3D();
      
      public function EllipsoidCollider(param1:Number, param2:Number, param3:Number)
      {
         super();
         this.radiusX = param1;
         this.radiusY = param2;
         this.radiusZ = param3;
      }
      
      private function prepare(param1:Vector3D, param2:Vector3D, param3:Object3D, param4:Dictionary, param5:Boolean) : void
      {
         var _loc6_:Number = NaN;
         this.radius = this.radiusX;
         if(this.radiusY > this.radius)
         {
            this.radius = this.radiusY;
         }
         if(this.radiusZ > this.radius)
         {
            this.radius = this.radiusZ;
         }
         this.matrix.scaleX = this.radiusX / this.radius;
         this.matrix.scaleY = this.radiusY / this.radius;
         this.matrix.scaleZ = this.radiusZ / this.radius;
         this.matrix.x = param1.x;
         this.matrix.y = param1.y;
         this.matrix.z = param1.z;
         this.matrix.composeMatrix();
         this.matrix.invertMatrix();
         this.src.x = 0;
         this.src.y = 0;
         this.src.z = 0;
         this.displ.x = this.matrix.ma * param2.x + this.matrix.mb * param2.y + this.matrix.mc * param2.z;
         this.displ.y = this.matrix.me * param2.x + this.matrix.mf * param2.y + this.matrix.mg * param2.z;
         this.displ.z = this.matrix.mi * param2.x + this.matrix.mj * param2.y + this.matrix.mk * param2.z;
         this.dest.x = this.src.x + this.displ.x;
         this.dest.y = this.src.y + this.displ.y;
         this.dest.z = this.src.z + this.displ.z;
         if(param5)
         {
            this.vCenter.x = this.displ.x / 2;
            this.vCenter.y = this.displ.y / 2;
            this.vCenter.z = this.displ.z / 2;
            _loc6_ = this.radius + this.displ.length / 2;
         }
         else
         {
            this.vCenter.x = 0;
            this.vCenter.y = 0;
            this.vCenter.z = 0;
            _loc6_ = this.radius + this.displ.length;
         }
         this.vA.x = -_loc6_;
         this.vA.y = -_loc6_;
         this.vA.z = -_loc6_;
         this.vB.x = _loc6_;
         this.vB.y = -_loc6_;
         this.vB.z = -_loc6_;
         this.vC.x = _loc6_;
         this.vC.y = _loc6_;
         this.vC.z = -_loc6_;
         this.vD.x = -_loc6_;
         this.vD.y = _loc6_;
         this.vD.z = -_loc6_;
         param3.composeAndAppend(this.matrix);
         param3.collectPlanes(this.vCenter,this.vA,this.vB,this.vC,this.vD,this.faces,param4);
         this.facesLength = this.faces.length;
      }
      
      public function calculateDestination(param1:Vector3D, param2:Vector3D, param3:Object3D, param4:Dictionary = null) : Vector3D
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         if(param2.length <= this.threshold)
         {
            return param1.clone();
         }
         this.prepare(param1,param2,param3,param4,false);
         if(this.facesLength > 0)
         {
            _loc5_ = 50;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               if(!this.checkCollision())
               {
                  break;
               }
               _loc7_ = this.radius + this.threshold + this.collisionPlane.w - this.dest.x * this.collisionPlane.x - this.dest.y * this.collisionPlane.y - this.dest.z * this.collisionPlane.z;
               this.dest.x += this.collisionPlane.x * _loc7_;
               this.dest.y += this.collisionPlane.y * _loc7_;
               this.dest.z += this.collisionPlane.z * _loc7_;
               this.src.x = this.collisionPoint.x + this.collisionPlane.x * (this.radius + this.threshold);
               this.src.y = this.collisionPoint.y + this.collisionPlane.y * (this.radius + this.threshold);
               this.src.z = this.collisionPoint.z + this.collisionPlane.z * (this.radius + this.threshold);
               this.displ.x = this.dest.x - this.src.x;
               this.displ.y = this.dest.y - this.src.y;
               this.displ.z = this.dest.z - this.src.z;
               if(this.displ.length < this.threshold)
               {
                  break;
               }
               _loc6_++;
            }
            this.faces.length = 0;
            this.matrix.composeMatrix();
            return new Vector3D(this.matrix.ma * this.dest.x + this.matrix.mb * this.dest.y + this.matrix.mc * this.dest.z + this.matrix.md,this.matrix.me * this.dest.x + this.matrix.mf * this.dest.y + this.matrix.mg * this.dest.z + this.matrix.mh,this.matrix.mi * this.dest.x + this.matrix.mj * this.dest.y + this.matrix.mk * this.dest.z + this.matrix.ml);
         }
         return new Vector3D(param1.x + param2.x,param1.y + param2.y,param1.z + param2.z);
      }
      
      public function getCollision(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Vector3D, param5:Object3D, param6:Dictionary = null) : Boolean
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         if(param2.length <= this.threshold)
         {
            return false;
         }
         this.prepare(param1,param2,param5,param6,true);
         if(this.facesLength > 0)
         {
            if(this.checkCollision())
            {
               this.matrix.composeMatrix();
               param3.x = this.matrix.ma * this.collisionPoint.x + this.matrix.mb * this.collisionPoint.y + this.matrix.mc * this.collisionPoint.z + this.matrix.md;
               param3.y = this.matrix.me * this.collisionPoint.x + this.matrix.mf * this.collisionPoint.y + this.matrix.mg * this.collisionPoint.z + this.matrix.mh;
               param3.z = this.matrix.mi * this.collisionPoint.x + this.matrix.mj * this.collisionPoint.y + this.matrix.mk * this.collisionPoint.z + this.matrix.ml;
               if(this.collisionPlane.x < this.collisionPlane.y)
               {
                  if(this.collisionPlane.x < this.collisionPlane.z)
                  {
                     _loc7_ = 0;
                     _loc8_ = -this.collisionPlane.z;
                     _loc9_ = this.collisionPlane.y;
                  }
                  else
                  {
                     _loc7_ = -this.collisionPlane.y;
                     _loc8_ = this.collisionPlane.x;
                     _loc9_ = 0;
                  }
               }
               else if(this.collisionPlane.y < this.collisionPlane.z)
               {
                  _loc7_ = this.collisionPlane.z;
                  _loc8_ = 0;
                  _loc9_ = -this.collisionPlane.x;
               }
               else
               {
                  _loc7_ = -this.collisionPlane.y;
                  _loc8_ = this.collisionPlane.x;
                  _loc9_ = 0;
               }
               _loc10_ = this.collisionPlane.z * _loc8_ - this.collisionPlane.y * _loc9_;
               _loc11_ = this.collisionPlane.x * _loc9_ - this.collisionPlane.z * _loc7_;
               _loc12_ = this.collisionPlane.y * _loc7_ - this.collisionPlane.x * _loc8_;
               _loc13_ = this.matrix.ma * _loc7_ + this.matrix.mb * _loc8_ + this.matrix.mc * _loc9_;
               _loc14_ = this.matrix.me * _loc7_ + this.matrix.mf * _loc8_ + this.matrix.mg * _loc9_;
               _loc15_ = this.matrix.mi * _loc7_ + this.matrix.mj * _loc8_ + this.matrix.mk * _loc9_;
               _loc16_ = this.matrix.ma * _loc10_ + this.matrix.mb * _loc11_ + this.matrix.mc * _loc12_;
               _loc17_ = this.matrix.me * _loc10_ + this.matrix.mf * _loc11_ + this.matrix.mg * _loc12_;
               _loc18_ = this.matrix.mi * _loc10_ + this.matrix.mj * _loc11_ + this.matrix.mk * _loc12_;
               param4.x = _loc15_ * _loc17_ - _loc14_ * _loc18_;
               param4.y = _loc13_ * _loc18_ - _loc15_ * _loc16_;
               param4.z = _loc14_ * _loc16_ - _loc13_ * _loc17_;
               param4.normalize();
               param4.w = param3.x * param4.x + param3.y * param4.y + param3.z * param4.z;
               this.faces.length = 0;
               return true;
            }
            this.faces.length = 0;
            return false;
         }
         return false;
      }
      
      private function checkCollision() : Boolean
      {
         var _loc4_:Face = null;
         var _loc5_:Wrapper = null;
         var _loc6_:Vertex = null;
         var _loc7_:Vertex = null;
         var _loc8_:Vertex = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Boolean = false;
         var _loc29_:Wrapper = null;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc43_:Number = NaN;
         var _loc44_:Number = NaN;
         var _loc45_:Number = NaN;
         var _loc46_:Number = NaN;
         var _loc1_:Number = 1;
         var _loc2_:Number = this.displ.length;
         var _loc3_:int = 0;
         while(_loc3_ < this.facesLength)
         {
            _loc4_ = this.faces[_loc3_];
            _loc5_ = _loc4_.wrapper;
            _loc6_ = _loc5_.vertex;
            _loc5_ = _loc5_.next;
            _loc7_ = _loc5_.vertex;
            _loc5_ = _loc5_.next;
            _loc8_ = _loc5_.vertex;
            _loc9_ = _loc7_.cameraX - _loc6_.cameraX;
            _loc10_ = _loc7_.cameraY - _loc6_.cameraY;
            _loc11_ = _loc7_.cameraZ - _loc6_.cameraZ;
            _loc12_ = _loc8_.cameraX - _loc6_.cameraX;
            _loc13_ = _loc8_.cameraY - _loc6_.cameraY;
            _loc14_ = _loc8_.cameraZ - _loc6_.cameraZ;
            _loc15_ = _loc14_ * _loc10_ - _loc13_ * _loc11_;
            _loc16_ = _loc12_ * _loc11_ - _loc14_ * _loc9_;
            _loc17_ = _loc13_ * _loc9_ - _loc12_ * _loc10_;
            _loc18_ = _loc15_ * _loc15_ + _loc16_ * _loc16_ + _loc17_ * _loc17_;
            if(_loc18_ > 0.001)
            {
               _loc18_ = 1 / Math.sqrt(_loc18_);
               _loc15_ *= _loc18_;
               _loc16_ *= _loc18_;
               _loc17_ *= _loc18_;
               _loc19_ = _loc6_.cameraX * _loc15_ + _loc6_.cameraY * _loc16_ + _loc6_.cameraZ * _loc17_;
               _loc20_ = this.src.x * _loc15_ + this.src.y * _loc16_ + this.src.z * _loc17_ - _loc19_;
               if(_loc20_ < this.radius)
               {
                  _loc21_ = this.src.x - _loc15_ * _loc20_;
                  _loc22_ = this.src.y - _loc16_ * _loc20_;
                  _loc23_ = this.src.z - _loc17_ * _loc20_;
               }
               else
               {
                  _loc33_ = (_loc20_ - this.radius) / (_loc20_ - this.dest.x * _loc15_ - this.dest.y * _loc16_ - this.dest.z * _loc17_ + _loc19_);
                  _loc21_ = this.src.x + this.displ.x * _loc33_ - _loc15_ * this.radius;
                  _loc22_ = this.src.y + this.displ.y * _loc33_ - _loc16_ * this.radius;
                  _loc23_ = this.src.z + this.displ.z * _loc33_ - _loc17_ * this.radius;
               }
               _loc27_ = 1e+22;
               _loc28_ = true;
               _loc29_ = _loc4_.wrapper;
               while(_loc29_ != null)
               {
                  _loc6_ = _loc29_.vertex;
                  _loc7_ = _loc29_.next != null ? _loc29_.next.vertex : _loc4_.wrapper.vertex;
                  _loc9_ = _loc7_.cameraX - _loc6_.cameraX;
                  _loc10_ = _loc7_.cameraY - _loc6_.cameraY;
                  _loc11_ = _loc7_.cameraZ - _loc6_.cameraZ;
                  _loc12_ = _loc21_ - _loc6_.cameraX;
                  _loc13_ = _loc22_ - _loc6_.cameraY;
                  _loc14_ = _loc23_ - _loc6_.cameraZ;
                  _loc34_ = _loc14_ * _loc10_ - _loc13_ * _loc11_;
                  _loc35_ = _loc12_ * _loc11_ - _loc14_ * _loc9_;
                  _loc36_ = _loc13_ * _loc9_ - _loc12_ * _loc10_;
                  if(_loc34_ * _loc15_ + _loc35_ * _loc16_ + _loc36_ * _loc17_ < 0)
                  {
                     _loc37_ = _loc9_ * _loc9_ + _loc10_ * _loc10_ + _loc11_ * _loc11_;
                     _loc38_ = (_loc34_ * _loc34_ + _loc35_ * _loc35_ + _loc36_ * _loc36_) / _loc37_;
                     if(_loc38_ < _loc27_)
                     {
                        _loc37_ = Math.sqrt(_loc37_);
                        _loc9_ /= _loc37_;
                        _loc10_ /= _loc37_;
                        _loc11_ /= _loc37_;
                        _loc33_ = _loc9_ * _loc12_ + _loc10_ * _loc13_ + _loc11_ * _loc14_;
                        if(_loc33_ < 0)
                        {
                           _loc39_ = _loc12_ * _loc12_ + _loc13_ * _loc13_ + _loc14_ * _loc14_;
                           if(_loc39_ < _loc27_)
                           {
                              _loc27_ = _loc39_;
                              _loc24_ = _loc6_.cameraX;
                              _loc25_ = _loc6_.cameraY;
                              _loc26_ = _loc6_.cameraZ;
                           }
                        }
                        else if(_loc33_ > _loc37_)
                        {
                           _loc12_ = _loc21_ - _loc7_.cameraX;
                           _loc13_ = _loc22_ - _loc7_.cameraY;
                           _loc14_ = _loc23_ - _loc7_.cameraZ;
                           _loc39_ = _loc12_ * _loc12_ + _loc13_ * _loc13_ + _loc14_ * _loc14_;
                           if(_loc39_ < _loc27_)
                           {
                              _loc27_ = _loc39_;
                              _loc24_ = _loc7_.cameraX;
                              _loc25_ = _loc7_.cameraY;
                              _loc26_ = _loc7_.cameraZ;
                           }
                        }
                        else
                        {
                           _loc27_ = _loc38_;
                           _loc24_ = _loc6_.cameraX + _loc9_ * _loc33_;
                           _loc25_ = _loc6_.cameraY + _loc10_ * _loc33_;
                           _loc26_ = _loc6_.cameraZ + _loc11_ * _loc33_;
                        }
                     }
                     _loc28_ = false;
                  }
                  _loc29_ = _loc29_.next;
               }
               if(_loc28_)
               {
                  _loc24_ = _loc21_;
                  _loc25_ = _loc22_;
                  _loc26_ = _loc23_;
               }
               _loc30_ = this.src.x - _loc24_;
               _loc31_ = this.src.y - _loc25_;
               _loc32_ = this.src.z - _loc26_;
               if(_loc30_ * this.displ.x + _loc31_ * this.displ.y + _loc32_ * this.displ.z <= 0)
               {
                  _loc40_ = -this.displ.x / _loc2_;
                  _loc41_ = -this.displ.y / _loc2_;
                  _loc42_ = -this.displ.z / _loc2_;
                  _loc43_ = _loc30_ * _loc30_ + _loc31_ * _loc31_ + _loc32_ * _loc32_;
                  _loc44_ = _loc30_ * _loc40_ + _loc31_ * _loc41_ + _loc32_ * _loc42_;
                  _loc45_ = this.radius * this.radius - _loc43_ + _loc44_ * _loc44_;
                  if(_loc45_ > 0)
                  {
                     _loc46_ = (_loc44_ - Math.sqrt(_loc45_)) / _loc2_;
                     if(_loc46_ < _loc1_)
                     {
                        _loc1_ = _loc46_;
                        this.collisionPoint.x = _loc24_;
                        this.collisionPoint.y = _loc25_;
                        this.collisionPoint.z = _loc26_;
                        if(_loc28_)
                        {
                           this.collisionPlane.x = _loc15_;
                           this.collisionPlane.y = _loc16_;
                           this.collisionPlane.z = _loc17_;
                           this.collisionPlane.w = _loc19_;
                        }
                        else
                        {
                           _loc43_ = Math.sqrt(_loc43_);
                           this.collisionPlane.x = _loc30_ / _loc43_;
                           this.collisionPlane.y = _loc31_ / _loc43_;
                           this.collisionPlane.z = _loc32_ / _loc43_;
                           this.collisionPlane.w = this.collisionPoint.x * this.collisionPlane.x + this.collisionPoint.y * this.collisionPlane.y + this.collisionPoint.z * this.collisionPlane.z;
                        }
                     }
                  }
               }
            }
            _loc3_++;
         }
         return _loc1_ < 1;
      }
   }
}

