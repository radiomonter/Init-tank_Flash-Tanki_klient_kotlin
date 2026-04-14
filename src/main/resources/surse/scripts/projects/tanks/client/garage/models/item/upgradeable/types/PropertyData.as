package projects.tanks.client.garage.models.item.upgradeable.types
{
   import projects.tanks.client.garage.models.item.properties.ItemProperty;
   
   public class PropertyData
   {
      
      private var _finalValue:Number;
      
      private var _initialValue:Number;
      
      private var _property:ItemProperty;
      
      public function PropertyData(_arg_1:Number = 0, _arg_2:Number = 0, _arg_3:ItemProperty = null)
      {
         super();
         this._finalValue = _arg_1;
         this._initialValue = _arg_2;
         this._property = _arg_3;
      }
      
      public function get finalValue() : Number
      {
         return this._finalValue;
      }
      
      public function set finalValue(_arg_1:Number) : void
      {
         this._finalValue = _arg_1;
      }
      
      public function get initialValue() : Number
      {
         return this._initialValue;
      }
      
      public function set initialValue(_arg_1:Number) : void
      {
         this._initialValue = _arg_1;
      }
      
      public function get property() : ItemProperty
      {
         return this._property;
      }
      
      public function set property(_arg_1:ItemProperty) : void
      {
         this._property = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "PropertyData [";
         _local_1 += "finalValue = " + this.finalValue + " ";
         _local_1 += "initialValue = " + this.initialValue + " ";
         _local_1 += "property = " + this.property + " ";
         return _local_1 + "]";
      }
   }
}

