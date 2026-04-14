package projects.tanks.client.garage.models.item.properties
{
   public class ItemGaragePropertyData
   {
      
      private var _property:ItemGarageProperty;
      
      private var _value:String;
      
      public function ItemGaragePropertyData(_arg_1:ItemGarageProperty = null, _arg_2:String = null)
      {
         super();
         this._property = _arg_1;
         this._value = _arg_2;
      }
      
      public function get property() : ItemGarageProperty
      {
         return this._property;
      }
      
      public function set property(_arg_1:ItemGarageProperty) : void
      {
         this._property = _arg_1;
      }
      
      public function get value() : String
      {
         return this._value;
      }
      
      public function set value(_arg_1:String) : void
      {
         this._value = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ItemGaragePropertyData [";
         _local_1 += "property = " + this.property + " ";
         _local_1 += "value = " + this.value + " ";
         return _local_1 + "]";
      }
   }
}

