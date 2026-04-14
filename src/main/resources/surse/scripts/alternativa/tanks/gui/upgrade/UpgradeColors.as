package alternativa.tanks.gui.upgrade
{
   import alternativa.tanks.model.item.properties.ItemPropertyValue;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   
   public class UpgradeColors
   {
      
      public static const GREEN:int = 65291;
      
      public static const WHITE:int = 16777215;
      
      public static const GOLD:int = 16580352;
      
      public static const LIGHT_GREEN:int = 8847108;
      
      public function UpgradeColors()
      {
         super();
      }
      
      public static function getColorForValue(_arg_1:ItemPropertyValue) : int
      {
         var _local_2:UpgradableItemPropertyValue = null;
         if(_arg_1.isUpgradable())
         {
            _local_2 = _arg_1.getUpgradableValue();
            if(_local_2.getMaxLevel() == _local_2.getLevel())
            {
               return GOLD;
            }
            if(_local_2.getLevel() > 0)
            {
               return LIGHT_GREEN;
            }
            return WHITE;
         }
         if(_arg_1.getProperty() == ItemGarageProperty.ALL_RESISTANCE)
         {
            return GOLD;
         }
         return WHITE;
      }
   }
}

