package alternativa.physics.collision.types
{
   import flash.utils.getQualifiedClassName;
   
   public class AABB
   {
      
      public var minX:Number = 1e+308;
      
      public var minY:Number = 1e+308;
      
      public var minZ:Number = 1e+308;
      
      public var maxX:Number = -1e+308;
      
      public var maxY:Number = -1e+308;
      
      public var maxZ:Number = -1e+308;
      
      public function AABB()
      {
         super();
      }
      
      public function setSize(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number) : void
      {
         this.minX = _arg_1;
         this.minY = _arg_2;
         this.minZ = _arg_3;
         this.maxX = _arg_4;
         this.maxY = _arg_5;
         this.maxZ = _arg_6;
      }
      
      public function addBoundBox(_arg_1:AABB) : void
      {
         this.minX = _arg_1.minX < this.minX ? Number(_arg_1.minX) : Number(this.minX);
         this.minY = _arg_1.minY < this.minY ? Number(_arg_1.minY) : Number(this.minY);
         this.minZ = _arg_1.minZ < this.minZ ? Number(_arg_1.minZ) : Number(this.minZ);
         this.maxX = _arg_1.maxX > this.maxX ? Number(_arg_1.maxX) : Number(this.maxX);
         this.maxY = _arg_1.maxY > this.maxY ? Number(_arg_1.maxY) : Number(this.maxY);
         this.maxZ = _arg_1.maxZ > this.maxZ ? Number(_arg_1.maxZ) : Number(this.maxZ);
      }
      
      public function addPoint(_arg_1:Number, _arg_2:Number, _arg_3:Number) : void
      {
         if(_arg_1 < this.minX)
         {
            this.minX = _arg_1;
         }
         if(_arg_1 > this.maxX)
         {
            this.maxX = _arg_1;
         }
         if(_arg_2 < this.minY)
         {
            this.minY = _arg_2;
         }
         if(_arg_2 > this.maxY)
         {
            this.maxY = _arg_2;
         }
         if(_arg_3 < this.minZ)
         {
            this.minZ = _arg_3;
         }
         if(_arg_3 > this.maxZ)
         {
            this.maxZ = _arg_3;
         }
      }
      
      public function infinity() : void
      {
         this.minX = 1e+308;
         this.minY = 1e+308;
         this.minZ = 1e+308;
         this.maxX = -1e+308;
         this.maxY = -1e+308;
         this.maxZ = -1e+308;
      }
      
      public function intersects(_arg_1:AABB, _arg_2:Number) : Boolean
      {
         return !(this.minX > _arg_1.maxX + _arg_2 || this.maxX < _arg_1.minX - _arg_2 || this.minY > _arg_1.maxY + _arg_2 || this.maxY < _arg_1.minY - _arg_2 || this.minZ > _arg_1.maxZ + _arg_2 || this.maxZ < _arg_1.minZ - _arg_2);
      }
      
      public function copyFrom(_arg_1:AABB) : void
      {
         this.minX = _arg_1.minX;
         this.minY = _arg_1.minY;
         this.minZ = _arg_1.minZ;
         this.maxX = _arg_1.maxX;
         this.maxY = _arg_1.maxY;
         this.maxZ = _arg_1.maxZ;
      }
      
      public function clone() : AABB
      {
         var _local_1:AABB = new AABB();
         _local_1.copyFrom(this);
         return _local_1;
      }
      
      public function getSizeX() : Number
      {
         return this.maxX - this.minX;
      }
      
      public function getSizeY() : Number
      {
         return this.maxY - this.minY;
      }
      
      public function getSizeZ() : Number
      {
         return this.maxZ - this.minZ;
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + "(" + this.minX.toFixed(3) + ", " + this.minY.toFixed(3) + ", " + this.minZ.toFixed(3) + ": " + this.maxX.toFixed(3) + ", " + this.maxY.toFixed(3) + ", " + this.maxZ.toFixed(3) + ")";
      }
   }
}

