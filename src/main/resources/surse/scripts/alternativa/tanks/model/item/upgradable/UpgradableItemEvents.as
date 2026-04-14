package alternativa.tanks.model.item.upgradable
{
   import controls.timer.CountDownTimer;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   
   public class UpgradableItemEvents implements UpgradableItem
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<UpgradableItem>;
      
      public function UpgradableItemEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<UpgradableItem>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function getUpgradableProperties() : Vector.<UpgradableItemPropertyValue>
      {
         var result:Vector.<UpgradableItemPropertyValue> = null;
         var i:int = 0;
         var m:UpgradableItem = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getUpgradableProperties();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function isUpgrading() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:UpgradableItem = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.isUpgrading();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getUpgradingProperty() : ItemGarageProperty
      {
         var result:ItemGarageProperty = null;
         var i:int = 0;
         var m:UpgradableItem = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getUpgradingProperty();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getUpgradingValue() : UpgradableItemPropertyValue
      {
         var result:UpgradableItemPropertyValue = null;
         var i:int = 0;
         var m:UpgradableItem = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getUpgradingValue();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function speedUp() : void
      {
         var i:int = 0;
         var m:UpgradableItem = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.speedUp();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function getCountDownTimer() : CountDownTimer
      {
         var result:CountDownTimer = null;
         var i:int = 0;
         var m:UpgradableItem = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getCountDownTimer();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function setUpgradingProperty(param1:UpgradableItemPropertyValue, param2:CountDownTimer) : void
      {
         var i:int = 0;
         var m:UpgradableItem = null;
         var propertyValue:UpgradableItemPropertyValue = param1;
         var timer:CountDownTimer = param2;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.setUpgradingProperty(propertyValue,timer);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function initializePrecision() : void
      {
         var i:int = 0;
         var m:UpgradableItem = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.initializePrecision();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function traceUpgrades() : void
      {
         var i:int = 0;
         var m:UpgradableItem = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.traceUpgrades();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

