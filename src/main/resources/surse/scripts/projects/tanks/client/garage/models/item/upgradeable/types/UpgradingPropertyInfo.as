package projects.tanks.client.garage.models.item.upgradeable.types
{
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   
   public class UpgradingPropertyInfo
   {
      
      private var _property:ItemGarageProperty;
      
      private var _remainingTimeInMS:int;
      
      public function UpgradingPropertyInfo(_arg_1:ItemGarageProperty = null, _arg_2:int = 0)
      {
         super();
         this._property = _arg_1;
         this._remainingTimeInMS = _arg_2;
      }
      
      public function get property() : ItemGarageProperty
      {
         return this._property;
      }
      
      public function set property(_arg_1:ItemGarageProperty) : void
      {
         this._property = _arg_1;
      }
      
      public function get remainingTimeInMS() : int
      {
         return this._remainingTimeInMS;
      }
      
      public function set remainingTimeInMS(_arg_1:int) : void
      {
         this._remainingTimeInMS = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "UpgradingPropertyInfo [";
         _local_1 += "property = " + this.property + " ";
         _local_1 += "remainingTimeInMS = " + this.remainingTimeInMS + " ";
         return _local_1 + "]";
      }
   }
}

