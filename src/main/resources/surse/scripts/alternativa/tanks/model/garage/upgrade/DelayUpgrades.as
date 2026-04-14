package alternativa.tanks.model.garage.upgrade
{
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   
   public class DelayUpgrades
   {
      
      private const MAX_DELAY_MS:int = 20000;
      
      private const DELAY_MS:int = 2000;
      
      private var property:ItemGarageProperty;
      
      private var numLevels:int;
      
      private var updradeStarted:Boolean;
      
      private var startUpgradeCost:int;
      
      private var upgradeTime:int;
      
      private var totalCost:int;
      
      private var time:int;
      
      private var flush:FlushUpgrades;
      
      private var timeoutId:int;
      
      private var item:IGameObject;
      
      public function DelayUpgrades(param1:FlushUpgrades)
      {
         super();
         this.flush = param1;
         this.clear();
      }
      
      private function clear() : void
      {
         this.property = null;
         this.item = null;
         this.numLevels = 0;
         this.updradeStarted = false;
         this.totalCost = 0;
         this.timeoutId = -1;
      }
      
      public function startUpgrade(param1:IGameObject, param2:ItemGarageProperty, param3:int, param4:int) : void
      {
         if(!this.isDelayedProperty(param1,param2) || this.updradeStarted)
         {
            if(this.isDelayed())
            {
               this.flushToServer();
            }
            this.item = param1;
            this.property = param2;
            this.time = getTimer();
         }
         this.startUpgradeCost = param3;
         this.updradeStarted = true;
         this.upgradeTime = param4;
         this.delay();
      }
      
      public function speedUp(param1:int) : void
      {
         this.totalCost += param1 + this.startUpgradeCost;
         var _local_2:* = this;
         var _local_3:* = _local_2.numLevels + 1;
         _local_2.numLevels = _local_3;
         this.updradeStarted = false;
         this.delay();
      }
      
      private function delay() : void
      {
         var _loc1_:int = getTimer();
         if(this.timeoutId != -1)
         {
            clearTimeout(this.timeoutId);
            this.timeoutId = -1;
         }
         if(_loc1_ - this.time + this.DELAY_MS > this.MAX_DELAY_MS)
         {
            this.flushToServer();
         }
         else
         {
            this.timeoutId = setTimeout(this.flushToServer,this.DELAY_MS);
         }
      }
      
      public function flushToServer() : void
      {
         if(this.timeoutId != -1)
         {
            clearTimeout(this.timeoutId);
            this.timeoutId = -1;
         }
         this.flush.flushToServer(this,this.item);
         this.clear();
      }
      
      public function isDelayed() : Boolean
      {
         return this.property != null;
      }
      
      public function isDelayedProperty(param1:IGameObject, param2:ItemGarageProperty) : Boolean
      {
         return this.item == param1 && this.property == param2;
      }
      
      public function getProperty() : ItemGarageProperty
      {
         return this.property;
      }
      
      public function getNumLevels() : int
      {
         return this.numLevels;
      }
      
      public function getCost() : int
      {
         return this.totalCost;
      }
      
      public function isUpgradeStarted() : Boolean
      {
         return this.updradeStarted;
      }
      
      public function getStartUpgradeCost() : int
      {
         return this.startUpgradeCost;
      }
      
      public function getUpgradeTime() : int
      {
         return this.upgradeTime;
      }
   }
}

