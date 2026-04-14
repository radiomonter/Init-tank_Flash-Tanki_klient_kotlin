package alternativa.engine3d.primitives
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   
   use namespace alternativa3d;
   
   public class GeoSphere extends Mesh
   {
      
      public function GeoSphere(param1:Number = 100, param2:uint = 2, param3:Boolean = false, param4:Material = null)
      {
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc16_:uint = 0;
         var _loc17_:uint = 0;
         var _loc18_:uint = 0;
         var _loc19_:uint = 0;
         var _loc20_:uint = 0;
         var _loc21_:Vertex = null;
         var _loc22_:Vertex = null;
         var _loc23_:Vertex = null;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         super();
         if(param2 < 1)
         {
            throw new ArgumentError(param2 + " segments not enough.");
         }
         param1 = param1 < 0 ? 0 : param1;
         var _loc5_:uint = 20;
         var _loc6_:Number = Math.PI;
         var _loc7_:Number = Math.PI * 2;
         var _loc8_:Vector.<Vertex> = new Vector.<Vertex>();
         var _loc14_:Number = 0.4472136 * param1;
         var _loc15_:Number = 2 * _loc14_;
         _loc8_.push(this.createVertex(0,0,param1));
         _loc9_ = 0;
         while(_loc9_ < 5)
         {
            _loc11_ = _loc7_ * _loc9_ / 5;
            _loc12_ = Math.sin(_loc11_);
            _loc13_ = Math.cos(_loc11_);
            _loc8_.push(this.createVertex(_loc15_ * _loc13_,_loc15_ * _loc12_,_loc14_));
            _loc9_++;
         }
         _loc9_ = 0;
         while(_loc9_ < 5)
         {
            _loc11_ = _loc6_ * ((_loc9_ << 1) + 1) / 5;
            _loc12_ = Math.sin(_loc11_);
            _loc13_ = Math.cos(_loc11_);
            _loc8_.push(this.createVertex(_loc15_ * _loc13_,_loc15_ * _loc12_,-_loc14_));
            _loc9_++;
         }
         _loc8_.push(this.createVertex(0,0,-param1));
         _loc9_ = 1;
         while(_loc9_ < 6)
         {
            this.interpolate(0,_loc9_,param2,_loc8_);
            _loc9_++;
         }
         _loc9_ = 1;
         while(_loc9_ < 6)
         {
            this.interpolate(_loc9_,_loc9_ % 5 + 1,param2,_loc8_);
            _loc9_++;
         }
         _loc9_ = 1;
         while(_loc9_ < 6)
         {
            this.interpolate(_loc9_,_loc9_ + 5,param2,_loc8_);
            _loc9_++;
         }
         _loc9_ = 1;
         while(_loc9_ < 6)
         {
            this.interpolate(_loc9_,(_loc9_ + 3) % 5 + 6,param2,_loc8_);
            _loc9_++;
         }
         _loc9_ = 1;
         while(_loc9_ < 6)
         {
            this.interpolate(_loc9_ + 5,_loc9_ % 5 + 6,param2,_loc8_);
            _loc9_++;
         }
         _loc9_ = 6;
         while(_loc9_ < 11)
         {
            this.interpolate(11,_loc9_,param2,_loc8_);
            _loc9_++;
         }
         _loc10_ = 0;
         while(_loc10_ < 5)
         {
            _loc9_ = 1;
            while(_loc9_ <= param2 - 2)
            {
               this.interpolate(12 + _loc10_ * (param2 - 1) + _loc9_,12 + (_loc10_ + 1) % 5 * (param2 - 1) + _loc9_,_loc9_ + 1,_loc8_);
               _loc9_++;
            }
            _loc10_++;
         }
         _loc10_ = 0;
         while(_loc10_ < 5)
         {
            _loc9_ = 1;
            while(_loc9_ <= param2 - 2)
            {
               this.interpolate(12 + (_loc10_ + 15) * (param2 - 1) + _loc9_,12 + (_loc10_ + 10) * (param2 - 1) + _loc9_,_loc9_ + 1,_loc8_);
               _loc9_++;
            }
            _loc10_++;
         }
         _loc10_ = 0;
         while(_loc10_ < 5)
         {
            _loc9_ = 1;
            while(_loc9_ <= param2 - 2)
            {
               this.interpolate(12 + ((_loc10_ + 1) % 5 + 15) * (param2 - 1) + param2 - 2 - _loc9_,12 + (_loc10_ + 10) * (param2 - 1) + param2 - 2 - _loc9_,_loc9_ + 1,_loc8_);
               _loc9_++;
            }
            _loc10_++;
         }
         _loc10_ = 0;
         while(_loc10_ < 5)
         {
            _loc9_ = 1;
            while(_loc9_ <= param2 - 2)
            {
               this.interpolate(12 + ((_loc10_ + 1) % 5 + 25) * (param2 - 1) + _loc9_,12 + (_loc10_ + 25) * (param2 - 1) + _loc9_,_loc9_ + 1,_loc8_);
               _loc9_++;
            }
            _loc10_++;
         }
         _loc10_ = 0;
         while(_loc10_ < _loc5_)
         {
            _loc16_ = 0;
            while(_loc16_ < param2)
            {
               _loc17_ = 0;
               while(_loc17_ <= _loc16_)
               {
                  _loc18_ = this.findVertices(param2,_loc10_,_loc16_,_loc17_);
                  _loc19_ = this.findVertices(param2,_loc10_,_loc16_ + 1,_loc17_);
                  _loc20_ = this.findVertices(param2,_loc10_,_loc16_ + 1,_loc17_ + 1);
                  _loc21_ = _loc8_[_loc18_];
                  _loc22_ = _loc8_[_loc19_];
                  _loc23_ = _loc8_[_loc20_];
                  if(_loc21_.y >= 0 && _loc21_.x < 0 && (_loc22_.y < 0 || _loc23_.y < 0))
                  {
                     _loc24_ = Math.atan2(_loc21_.y,_loc21_.x) / _loc7_ - 0.5;
                  }
                  else
                  {
                     _loc24_ = Math.atan2(_loc21_.y,_loc21_.x) / _loc7_ + 0.5;
                  }
                  _loc25_ = -Math.asin(_loc21_.z / param1) / _loc6_ + 0.5;
                  if(_loc22_.y >= 0 && _loc22_.x < 0 && (_loc21_.y < 0 || _loc23_.y < 0))
                  {
                     _loc26_ = Math.atan2(_loc22_.y,_loc22_.x) / _loc7_ - 0.5;
                  }
                  else
                  {
                     _loc26_ = Math.atan2(_loc22_.y,_loc22_.x) / _loc7_ + 0.5;
                  }
                  _loc27_ = -Math.asin(_loc22_.z / param1) / _loc6_ + 0.5;
                  if(_loc23_.y >= 0 && _loc23_.x < 0 && (_loc21_.y < 0 || _loc22_.y < 0))
                  {
                     _loc28_ = Math.atan2(_loc23_.y,_loc23_.x) / _loc7_ - 0.5;
                  }
                  else
                  {
                     _loc28_ = Math.atan2(_loc23_.y,_loc23_.x) / _loc7_ + 0.5;
                  }
                  _loc29_ = -Math.asin(_loc23_.z / param1) / _loc6_ + 0.5;
                  if(_loc18_ == 0 || _loc18_ == 11)
                  {
                     _loc24_ = _loc26_ + (_loc28_ - _loc26_) * 0.5;
                  }
                  if(_loc19_ == 0 || _loc19_ == 11)
                  {
                     _loc26_ = _loc24_ + (_loc28_ - _loc24_) * 0.5;
                  }
                  if(_loc20_ == 0 || _loc20_ == 11)
                  {
                     _loc28_ = _loc24_ + (_loc26_ - _loc24_) * 0.5;
                  }
                  if(_loc21_.offset > 0 && _loc21_.u != _loc24_)
                  {
                     _loc21_ = this.createVertex(_loc21_.x,_loc21_.y,_loc21_.z);
                  }
                  _loc21_.u = _loc24_;
                  _loc21_.v = _loc25_;
                  _loc21_.offset = 1;
                  if(_loc22_.offset > 0 && _loc22_.u != _loc26_)
                  {
                     _loc22_ = this.createVertex(_loc22_.x,_loc22_.y,_loc22_.z);
                  }
                  _loc22_.u = _loc26_;
                  _loc22_.v = _loc27_;
                  _loc22_.offset = 1;
                  if(_loc23_.offset > 0 && _loc23_.u != _loc28_)
                  {
                     _loc23_ = this.createVertex(_loc23_.x,_loc23_.y,_loc23_.z);
                  }
                  _loc23_.u = _loc28_;
                  _loc23_.v = _loc29_;
                  _loc23_.offset = 1;
                  if(param3)
                  {
                     this.createFace(_loc21_,_loc23_,_loc22_,param4);
                  }
                  else
                  {
                     this.createFace(_loc21_,_loc22_,_loc23_,param4);
                  }
                  if(_loc17_ < _loc16_)
                  {
                     _loc19_ = this.findVertices(param2,_loc10_,_loc16_,_loc17_ + 1);
                     _loc22_ = _loc8_[_loc19_];
                     if(_loc21_.y >= 0 && _loc21_.x < 0 && (_loc22_.y < 0 || _loc23_.y < 0))
                     {
                        _loc24_ = Math.atan2(_loc21_.y,_loc21_.x) / _loc7_ - 0.5;
                     }
                     else
                     {
                        _loc24_ = Math.atan2(_loc21_.y,_loc21_.x) / _loc7_ + 0.5;
                     }
                     _loc25_ = -Math.asin(_loc21_.z / param1) / _loc6_ + 0.5;
                     if(_loc22_.y >= 0 && _loc22_.x < 0 && (_loc21_.y < 0 || _loc23_.y < 0))
                     {
                        _loc26_ = Math.atan2(_loc22_.y,_loc22_.x) / _loc7_ - 0.5;
                     }
                     else
                     {
                        _loc26_ = Math.atan2(_loc22_.y,_loc22_.x) / _loc7_ + 0.5;
                     }
                     _loc27_ = -Math.asin(_loc22_.z / param1) / _loc6_ + 0.5;
                     if(_loc23_.y >= 0 && _loc23_.x < 0 && (_loc21_.y < 0 || _loc22_.y < 0))
                     {
                        _loc28_ = Math.atan2(_loc23_.y,_loc23_.x) / _loc7_ - 0.5;
                     }
                     else
                     {
                        _loc28_ = Math.atan2(_loc23_.y,_loc23_.x) / _loc7_ + 0.5;
                     }
                     _loc29_ = -Math.asin(_loc23_.z / param1) / _loc6_ + 0.5;
                     if(_loc18_ == 0 || _loc18_ == 11)
                     {
                        _loc24_ = _loc26_ + (_loc28_ - _loc26_) * 0.5;
                     }
                     if(_loc19_ == 0 || _loc19_ == 11)
                     {
                        _loc26_ = _loc24_ + (_loc28_ - _loc24_) * 0.5;
                     }
                     if(_loc20_ == 0 || _loc20_ == 11)
                     {
                        _loc28_ = _loc24_ + (_loc26_ - _loc24_) * 0.5;
                     }
                     if(_loc21_.offset > 0 && _loc21_.u != _loc24_)
                     {
                        _loc21_ = this.createVertex(_loc21_.x,_loc21_.y,_loc21_.z);
                     }
                     _loc21_.u = _loc24_;
                     _loc21_.v = _loc25_;
                     _loc21_.offset = 1;
                     if(_loc22_.offset > 0 && _loc22_.u != _loc26_)
                     {
                        _loc22_ = this.createVertex(_loc22_.x,_loc22_.y,_loc22_.z);
                     }
                     _loc22_.u = _loc26_;
                     _loc22_.v = _loc27_;
                     _loc22_.offset = 1;
                     if(_loc23_.offset > 0 && _loc23_.u != _loc28_)
                     {
                        _loc23_ = this.createVertex(_loc23_.x,_loc23_.y,_loc23_.z);
                     }
                     _loc23_.u = _loc28_;
                     _loc23_.v = _loc29_;
                     _loc23_.offset = 1;
                     if(param3)
                     {
                        this.createFace(_loc21_,_loc22_,_loc23_,param4);
                     }
                     else
                     {
                        this.createFace(_loc21_,_loc23_,_loc22_,param4);
                     }
                  }
                  _loc17_++;
               }
               _loc16_++;
            }
            _loc10_++;
         }
         calculateFacesNormals(true);
         boundMinX = -param1;
         boundMinY = -param1;
         boundMinZ = -param1;
         boundMaxX = param1;
         boundMaxY = param1;
         boundMaxZ = param1;
      }
      
      private function createVertex(param1:Number, param2:Number, param3:Number) : Vertex
      {
         var _loc4_:Vertex = new Vertex();
         _loc4_.x = param1;
         _loc4_.y = param2;
         _loc4_.z = param3;
         _loc4_.offset = -1;
         _loc4_.next = vertexList;
         vertexList = _loc4_;
         return _loc4_;
      }
      
      private function createFace(param1:Vertex, param2:Vertex, param3:Vertex, param4:Material) : void
      {
         var _loc5_:Face = new Face();
         _loc5_.material = param4;
         _loc5_.wrapper = new Wrapper();
         _loc5_.wrapper.vertex = param1;
         _loc5_.wrapper.next = new Wrapper();
         _loc5_.wrapper.next.vertex = param2;
         _loc5_.wrapper.next.next = new Wrapper();
         _loc5_.wrapper.next.next.vertex = param3;
         _loc5_.next = faceList;
         faceList = _loc5_;
      }
      
      private function interpolate(param1:uint, param2:uint, param3:uint, param4:Vector.<Vertex>) : void
      {
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         if(param3 < 2)
         {
            return;
         }
         var _loc5_:Vertex = Vertex(param4[param1]);
         var _loc6_:Vertex = Vertex(param4[param2]);
         var _loc7_:Number = (_loc5_.x * _loc6_.x + _loc5_.y * _loc6_.y + _loc5_.z * _loc6_.z) / (_loc5_.x * _loc5_.x + _loc5_.y * _loc5_.y + _loc5_.z * _loc5_.z);
         _loc7_ = _loc7_ < -1 ? -1 : (_loc7_ > 1 ? 1 : _loc7_);
         var _loc8_:Number = Math.acos(_loc7_);
         var _loc9_:Number = Math.sin(_loc8_);
         var _loc10_:uint = 1;
         while(_loc10_ < param3)
         {
            _loc11_ = _loc8_ * _loc10_ / param3;
            _loc12_ = _loc8_ * (param3 - _loc10_) / param3;
            _loc13_ = Math.sin(_loc11_);
            _loc14_ = Math.sin(_loc12_);
            param4.push(this.createVertex((_loc5_.x * _loc14_ + _loc6_.x * _loc13_) / _loc9_,(_loc5_.y * _loc14_ + _loc6_.y * _loc13_) / _loc9_,(_loc5_.z * _loc14_ + _loc6_.z * _loc13_) / _loc9_));
            _loc10_++;
         }
      }
      
      private function findVertices(param1:uint, param2:uint, param3:uint, param4:uint) : uint
      {
         if(param3 == 0)
         {
            if(param2 < 5)
            {
               return 0;
            }
            if(param2 > 14)
            {
               return 11;
            }
            return param2 - 4;
         }
         if(param3 == param1 && param4 == 0)
         {
            if(param2 < 5)
            {
               return param2 + 1;
            }
            if(param2 < 10)
            {
               return (param2 + 4) % 5 + 6;
            }
            if(param2 < 15)
            {
               return (param2 + 1) % 5 + 1;
            }
            return (param2 + 1) % 5 + 6;
         }
         if(param3 == param1 && param4 == param1)
         {
            if(param2 < 5)
            {
               return (param2 + 1) % 5 + 1;
            }
            if(param2 < 10)
            {
               return param2 + 1;
            }
            if(param2 < 15)
            {
               return param2 - 9;
            }
            return param2 - 9;
         }
         if(param3 == param1)
         {
            if(param2 < 5)
            {
               return 12 + (5 + param2) * (param1 - 1) + param4 - 1;
            }
            if(param2 < 10)
            {
               return 12 + (20 + (param2 + 4) % 5) * (param1 - 1) + param4 - 1;
            }
            if(param2 < 15)
            {
               return 12 + (param2 - 5) * (param1 - 1) + param1 - 1 - param4;
            }
            return 12 + (5 + param2) * (param1 - 1) + param1 - 1 - param4;
         }
         if(param4 == 0)
         {
            if(param2 < 5)
            {
               return 12 + param2 * (param1 - 1) + param3 - 1;
            }
            if(param2 < 10)
            {
               return 12 + (param2 % 5 + 15) * (param1 - 1) + param3 - 1;
            }
            if(param2 < 15)
            {
               return 12 + ((param2 + 1) % 5 + 15) * (param1 - 1) + param1 - 1 - param3;
            }
            return 12 + ((param2 + 1) % 5 + 25) * (param1 - 1) + param3 - 1;
         }
         if(param4 == param3)
         {
            if(param2 < 5)
            {
               return 12 + (param2 + 1) % 5 * (param1 - 1) + param3 - 1;
            }
            if(param2 < 10)
            {
               return 12 + (param2 % 5 + 10) * (param1 - 1) + param3 - 1;
            }
            if(param2 < 15)
            {
               return 12 + (param2 % 5 + 10) * (param1 - 1) + param1 - param3 - 1;
            }
            return 12 + (param2 % 5 + 25) * (param1 - 1) + param3 - 1;
         }
         return 12 + 30 * (param1 - 1) + param2 * (param1 - 1) * (param1 - 2) / 2 + (param3 - 1) * (param3 - 2) / 2 + param4 - 1;
      }
      
      override public function clone() : Object3D
      {
         var _loc1_:GeoSphere = new GeoSphere();
         _loc1_.clonePropertiesFrom(this);
         return _loc1_;
      }
   }
}

