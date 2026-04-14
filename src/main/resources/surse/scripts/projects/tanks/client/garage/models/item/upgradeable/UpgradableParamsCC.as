package projects.tanks.client.garage.models.item.upgradeable
{
   import projects.tanks.client.garage.models.item.upgradeable.types.GaragePropertyData;
   import projects.tanks.client.garage.models.item.upgradeable.types.UpgradingPropertyInfo;
   
   public class UpgradableParamsCC
   {
      
      private var _info:UpgradingPropertyInfo;
      
      private var _properties:Vector.<GaragePropertyData>;
      
      public function UpgradableParamsCC(_arg_1:UpgradingPropertyInfo = null, _arg_2:Vector.<GaragePropertyData> = null)
      {
         super();
         this._info = _arg_1;
         this._properties = _arg_2;
      }
      
      public function get info() : UpgradingPropertyInfo
      {
         return this._info;
      }
      
      public function set info(_arg_1:UpgradingPropertyInfo) : void
      {
         this._info = _arg_1;
      }
      
      public function get properties() : Vector.<GaragePropertyData>
      {
         return this._properties;
      }
      
      public function set properties(_arg_1:Vector.<GaragePropertyData>) : void
      {
         this._properties = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "UpgradableParamsCC [";
         _local_1 += "info = " + this.info + " ";
         _local_1 += "properties = " + this.properties + " ";
         return _local_1 + "]";
      }
   }
}

