package alternativa.tanks.gui.upgrade
{
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import controls.timer.CountDownTimer;
   import flash.events.Event;
   
   public class ItemPropertyUpgradeEvent extends Event
   {
      
      public static const SELECT_WINDOW_CLOSED:String = "ItemPropertyUpgradeEventSelectWindowClosed";
      
      public static const UPGRADE_STARTED:String = "ItemPropertyUpgradeEventUpgradeStarted";
      
      public static const SPEED_UP:String = "ItemPropertyUpgradeEventSpeedUp";
      
      public static const FLUSH_UPGRADES:String = "ItemPropertyUpgradeEventFlushUpgrades";
      
      private var property:UpgradableItemPropertyValue;
      
      private var timer:CountDownTimer;
      
      public function ItemPropertyUpgradeEvent(_arg_1:String, _arg_2:UpgradableItemPropertyValue = null, _arg_3:CountDownTimer = null, _arg_4:Boolean = false, _arg_5:Boolean = false)
      {
         super(_arg_1,_arg_4,_arg_5);
         this.property = _arg_2;
         this.timer = _arg_3;
      }
      
      public function getPropertyValue() : UpgradableItemPropertyValue
      {
         return this.property;
      }
      
      public function getTimer() : CountDownTimer
      {
         return this.timer;
      }
   }
}

