package obfuscation.tupujy
{
   public class Qemokumy
   {
      
      private var tawiciqe:Number;
      
      private var _range:Number;
      
      public function Qemokumy(_arg_1:Number = 0, _arg_2:Number = 0)
      {
         super();
         this.tawiciqe = _arg_1;
         this._range = _arg_2;
      }
      
      public function get coneAngle() : Number
      {
         return this.tawiciqe;
      }
      
      public function set coneAngle(_arg_1:Number) : void
      {
         this.tawiciqe = _arg_1;
      }
      
      public function get range() : Number
      {
         return this._range;
      }
      
      public function set range(_arg_1:Number) : void
      {
         this._range = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "FlameThrowerCC [";
         _local_1 += "coneAngle = " + this.coneAngle + " ";
         _local_1 += "range = " + this.range + " ";
         return _local_1 + "]";
      }
   }
}

