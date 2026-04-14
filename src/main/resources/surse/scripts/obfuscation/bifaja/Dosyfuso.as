package obfuscation.bifaja
{
   public class Dosyfuso
   {
      
      private var _proBattleEnterPrice:int;
      
      private var kitokaqef:int;
      
      public function Dosyfuso(_arg_1:int = 0, _arg_2:int = 0)
      {
         super();
         this._proBattleEnterPrice = _arg_1;
         this.kitokaqef = _arg_2;
      }
      
      public function get proBattleEnterPrice() : int
      {
         return this._proBattleEnterPrice;
      }
      
      public function set proBattleEnterPrice(_arg_1:int) : void
      {
         this._proBattleEnterPrice = _arg_1;
      }
      
      public function get timeLeftInSec() : int
      {
         return this.kitokaqef;
      }
      
      public function set timeLeftInSec(_arg_1:int) : void
      {
         this.kitokaqef = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ProBattleCC [";
         _local_1 += "proBattleEnterPrice = " + this.proBattleEnterPrice + " ";
         _local_1 += "timeLeftInSec = " + this.timeLeftInSec + " ";
         return _local_1 + "]";
      }
   }
}

