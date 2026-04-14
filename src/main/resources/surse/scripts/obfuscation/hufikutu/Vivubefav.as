package obfuscation.hufikutu
{
   public class Vivubefav
   {
      
      private var vawumar:int;
      
      private var ryqanypi:Number;
      
      public function Vivubefav(_arg_1:int = 0, _arg_2:Number = 0)
      {
         super();
         this.vawumar = _arg_1;
         this.ryqanypi = _arg_2;
      }
      
      public function get chargingTimeMsec() : int
      {
         return this.vawumar;
      }
      
      public function set chargingTimeMsec(_arg_1:int) : void
      {
         this.vawumar = _arg_1;
      }
      
      public function get weakeningCoeff() : Number
      {
         return this.ryqanypi;
      }
      
      public function set weakeningCoeff(_arg_1:Number) : void
      {
         this.ryqanypi = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "RailgunCC [";
         _local_1 += "chargingTimeMsec = " + this.chargingTimeMsec + " ";
         _local_1 += "weakeningCoeff = " + this.weakeningCoeff + " ";
         return _local_1 + "]";
      }
   }
}

