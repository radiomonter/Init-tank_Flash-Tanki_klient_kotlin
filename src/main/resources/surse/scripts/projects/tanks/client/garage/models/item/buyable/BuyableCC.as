package projects.tanks.client.garage.models.item.buyable
{
   public class BuyableCC
   {
      
      private var _buyable:Boolean;
      
      private var _priceWithoutDiscount:int;
      
      public function BuyableCC(_arg_1:Boolean = false, _arg_2:int = 0)
      {
         super();
         this._buyable = _arg_1;
         this._priceWithoutDiscount = _arg_2;
      }
      
      public function get buyable() : Boolean
      {
         return this._buyable;
      }
      
      public function set buyable(_arg_1:Boolean) : void
      {
         this._buyable = _arg_1;
      }
      
      public function get priceWithoutDiscount() : int
      {
         return this._priceWithoutDiscount;
      }
      
      public function set priceWithoutDiscount(_arg_1:int) : void
      {
         this._priceWithoutDiscount = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BuyableCC [";
         _local_1 += "buyable = " + this.buyable + " ";
         _local_1 += "priceWithoutDiscount = " + this.priceWithoutDiscount + " ";
         return _local_1 + "]";
      }
   }
}

