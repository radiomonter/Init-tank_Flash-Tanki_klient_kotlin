package projects.tanks.client.garage.models.item.properties
{
   public class ItemPropertiesCC
   {
      
      private var _properties:Vector.<ItemGaragePropertyData>;
      
      public function ItemPropertiesCC(_arg_1:Vector.<ItemGaragePropertyData> = null)
      {
         super();
         this._properties = _arg_1;
      }
      
      public function get properties() : Vector.<ItemGaragePropertyData>
      {
         return this._properties;
      }
      
      public function set properties(_arg_1:Vector.<ItemGaragePropertyData>) : void
      {
         this._properties = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ItemPropertiesCC [";
         _local_1 += "properties = " + this.properties + " ";
         return _local_1 + "]";
      }
   }
}

