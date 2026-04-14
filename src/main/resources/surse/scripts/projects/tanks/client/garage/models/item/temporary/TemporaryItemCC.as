package projects.tanks.client.garage.models.item.temporary
{
   public class TemporaryItemCC
   {
      
      private var _lifeTimeInSec:int;
      
      private var _remainingTimeInSec:int;
      
      public function TemporaryItemCC(_arg_1:int = 0, _arg_2:int = 0)
      {
         super();
         this._lifeTimeInSec = _arg_1;
         this._remainingTimeInSec = _arg_2;
      }
      
      public function get lifeTimeInSec() : int
      {
         return this._lifeTimeInSec;
      }
      
      public function set lifeTimeInSec(_arg_1:int) : void
      {
         this._lifeTimeInSec = _arg_1;
      }
      
      public function get remainingTimeInSec() : int
      {
         return this._remainingTimeInSec;
      }
      
      public function set remainingTimeInSec(_arg_1:int) : void
      {
         this._remainingTimeInSec = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "TemporaryItemCC [";
         _local_1 += "lifeTimeInSec = " + this.lifeTimeInSec + " ";
         _local_1 += "remainingTimeInSec = " + this.remainingTimeInSec + " ";
         return _local_1 + "]";
      }
   }
}

