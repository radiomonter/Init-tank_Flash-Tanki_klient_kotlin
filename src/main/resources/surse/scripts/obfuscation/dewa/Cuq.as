package obfuscation.dewa
{
   public class Cuq
   {
      
      private var ciwug:Number;
      
      private var kenov:Number;
      
      public function Cuq(_arg_1:Number = 0, _arg_2:Number = 0)
      {
         super();
         this.ciwug = _arg_1;
         this.kenov = _arg_2;
      }
      
      public function get damageAreaConeAngle() : Number
      {
         return this.ciwug;
      }
      
      public function set damageAreaConeAngle(_arg_1:Number) : void
      {
         this.ciwug = _arg_1;
      }
      
      public function get damageAreaRange() : Number
      {
         return this.kenov;
      }
      
      public function set damageAreaRange(_arg_1:Number) : void
      {
         this.kenov = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "FreezeCC [";
         _local_1 += "damageAreaConeAngle = " + this.damageAreaConeAngle + " ";
         _local_1 += "damageAreaRange = " + this.damageAreaRange + " ";
         return _local_1 + "]";
      }
   }
}

