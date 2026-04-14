package alternativa.tanks.model.item.upgradable
{
   import controls.timer.CountDownTimer;
   import controls.timer.CountDownTimerOnCompleteAfter;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.client.garage.models.item.upgradeable.types.UpgradingPropertyInfo;
   
   public class UpgradeableItemData implements CountDownTimerOnCompleteAfter
   {
      
      public var properties:Vector.<UpgradableItemPropertyValue>;
      
      public var upgradingValue:UpgradableItemPropertyValue = null;
      
      public var timer:CountDownTimer = null;
      
      public function UpgradeableItemData(_arg_1:Vector.<UpgradableItemPropertyValue>, _arg_2:UpgradingPropertyInfo, _arg_3:IGameObject)
      {
         var _local_4:int = 0;
         var _local_5:UpgradableItemPropertyValue = null;
         super();
         this.properties = _arg_1;
         if(_arg_2 != null)
         {
         }
      }
      
      private function setTimer(_arg_1:CountDownTimer) : void
      {
         this.timer = _arg_1;
         _arg_1.addListener(CountDownTimerOnCompleteAfter,this);
      }
      
      public function setUpgradingProperty(_arg_1:UpgradableItemPropertyValue, _arg_2:CountDownTimer) : void
      {
         this.upgradingValue = _arg_1;
         this.setTimer(_arg_2);
      }
      
      public function getValue(_arg_1:ItemGarageProperty) : UpgradableItemPropertyValue
      {
         var _local_2:UpgradableItemPropertyValue = null;
         for each(_local_2 in this.properties)
         {
            if(_local_2.getProperty() == _arg_1)
            {
               return _local_2;
            }
         }
         return null;
      }
      
      public function speedUp() : void
      {
         this.upgradingValue.incrementLevel();
         this.upgradingValue = null;
         this.timer.removeListener(CountDownTimerOnCompleteAfter,this);
         this.timer = null;
      }
      
      public function isUpgrading() : Boolean
      {
         return this.upgradingValue != null;
      }
      
      public function onCompleteAfter(_arg_1:CountDownTimer, _arg_2:Boolean) : void
      {
         this.speedUp();
      }
   }
}

