package obfuscation.qedajyt
{
   public class Juva
   {
      
      private var guzinybup:int;
      
      private var _timeLimitInSec:int;
      
      public function Juva(_arg_1:int = 0, _arg_2:int = 0)
      {
         super();
         this.guzinybup = _arg_1;
         this._timeLimitInSec = _arg_2;
      }
      
      public function get scoreLimit() : int
      {
         return this.guzinybup;
      }
      
      public function set scoreLimit(_arg_1:int) : void
      {
         this.guzinybup = _arg_1;
      }
      
      public function get timeLimitInSec() : int
      {
         return this._timeLimitInSec;
      }
      
      public function set timeLimitInSec(_arg_1:int) : void
      {
         this._timeLimitInSec = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BattleLimits [";
         _local_1 += "scoreLimit = " + this.scoreLimit + " ";
         _local_1 += "timeLimitInSec = " + this.timeLimitInSec + " ";
         return _local_1 + "]";
      }
   }
}

