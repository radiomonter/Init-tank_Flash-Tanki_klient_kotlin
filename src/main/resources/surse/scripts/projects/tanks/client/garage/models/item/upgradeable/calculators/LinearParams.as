package projects.tanks.client.garage.models.item.upgradeable.calculators
{
   public class LinearParams
   {
      
      private var _initialValue:Number;
      
      private var _step:Number;
      
      public function LinearParams(_arg_1:Number = 0, _arg_2:Number = 0)
      {
         super();
         this._initialValue = _arg_1;
         this._step = _arg_2;
      }
      
      public function get initialValue() : Number
      {
         return this._initialValue;
      }
      
      public function set initialValue(_arg_1:Number) : void
      {
         this._initialValue = _arg_1;
      }
      
      public function get step() : Number
      {
         return this._step;
      }
      
      public function set step(_arg_1:Number) : void
      {
         this._step = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "LinearParams [";
         _local_1 += "initialValue = " + this.initialValue + " ";
         _local_1 += "step = " + this.step + " ";
         return _local_1 + "]";
      }
   }
}

