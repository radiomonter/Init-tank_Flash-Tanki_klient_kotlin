package projects.tanks.client.garage.models.item.discount
{
   public class DiscountCC
   {
      
      private var _discount:Number;
      
      private var _timeLeftInSeconds:int;
      
      private var _timeToStartInSeconds:int;
      
      public function DiscountCC(_arg_1:Number = 0, _arg_2:int = 0, _arg_3:int = 0)
      {
         super();
         this._discount = _arg_1;
         this._timeLeftInSeconds = _arg_2;
         this._timeToStartInSeconds = _arg_3;
      }
      
      public function get discount() : Number
      {
         return this._discount;
      }
      
      public function set discount(_arg_1:Number) : void
      {
         this._discount = _arg_1;
      }
      
      public function get timeLeftInSeconds() : int
      {
         return this._timeLeftInSeconds;
      }
      
      public function set timeLeftInSeconds(_arg_1:int) : void
      {
         this._timeLeftInSeconds = _arg_1;
      }
      
      public function get timeToStartInSeconds() : int
      {
         return this._timeToStartInSeconds;
      }
      
      public function set timeToStartInSeconds(_arg_1:int) : void
      {
         this._timeToStartInSeconds = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "DiscountCC [";
         _local_1 += "discount = " + this.discount + " ";
         _local_1 += "timeLeftInSeconds = " + this.timeLeftInSeconds + " ";
         _local_1 += "timeToStartInSeconds = " + this.timeToStartInSeconds + " ";
         return _local_1 + "]";
      }
   }
}

