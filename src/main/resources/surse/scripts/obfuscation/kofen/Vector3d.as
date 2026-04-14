package obfuscation.kofen
{
   public class Vector3d
   {
      
      private var _x:Number;
      
      private var _y:Number;
      
      private var gov:Number;
      
      public function Vector3d(_arg_1:Number = 0, _arg_2:Number = 0, _arg_3:Number = 0)
      {
         super();
         this._x = _arg_1;
         this._y = _arg_2;
         this.gov = _arg_3;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(_arg_1:Number) : void
      {
         this._x = _arg_1;
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function set y(_arg_1:Number) : void
      {
         this._y = _arg_1;
      }
      
      public function get z() : Number
      {
         return this.gov;
      }
      
      public function set z(_arg_1:Number) : void
      {
         this.gov = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "Vector3d [";
         _local_1 += "x = " + this.x + " ";
         _local_1 += "y = " + this.y + " ";
         _local_1 += "z = " + this.z + " ";
         return _local_1 + "]";
      }
   }
}

