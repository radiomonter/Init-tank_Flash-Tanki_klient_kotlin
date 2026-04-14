package projects.tanks.client.garage.models.garage.upgrade
{
   public class UpgradeGarageItemCC
   {
      
      private var _enabledUpgrades:Boolean;
      
      private var _speedUpCoeff:Number;
      
      public function UpgradeGarageItemCC(_arg_1:Boolean = false, _arg_2:Number = 0)
      {
         super();
         this._enabledUpgrades = _arg_1;
         this._speedUpCoeff = _arg_2;
      }
      
      public function get enabledUpgrades() : Boolean
      {
         return this._enabledUpgrades;
      }
      
      public function set enabledUpgrades(_arg_1:Boolean) : void
      {
         this._enabledUpgrades = _arg_1;
      }
      
      public function get speedUpCoeff() : Number
      {
         return this._speedUpCoeff;
      }
      
      public function set speedUpCoeff(_arg_1:Number) : void
      {
         this._speedUpCoeff = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "UpgradeGarageItemCC [";
         _local_1 += "enabledUpgrades = " + this.enabledUpgrades + " ";
         _local_1 += "speedUpCoeff = " + this.speedUpCoeff + " ";
         return _local_1 + "]";
      }
   }
}

