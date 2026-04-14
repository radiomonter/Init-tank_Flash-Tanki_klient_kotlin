package obfuscation.qusen
{
   public class Sunyva
   {
      
      private var zalic:Number;
      
      private var lumyj:int;
      
      public function Sunyva(_arg_1:Number = 0, _arg_2:int = 0)
      {
         super();
         this.zalic = _arg_1;
         this.lumyj = _arg_2;
      }
      
      public function get angle() : Number
      {
         return this.zalic;
      }
      
      public function set angle(_arg_1:Number) : void
      {
         this.zalic = _arg_1;
      }
      
      public function get control() : int
      {
         return this.lumyj;
      }
      
      public function set control(_arg_1:int) : void
      {
         this.lumyj = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "RotateTurretCommand [";
         _local_1 += "angle = " + this.angle + " ";
         _local_1 += "control = " + this.control + " ";
         return _local_1 + "]";
      }
   }
}

