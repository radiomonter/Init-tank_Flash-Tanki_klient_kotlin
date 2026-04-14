package alternativa.tanks.gui
{
   import flash.events.Event;
   import platform.client.fp10.core.type.IGameObject;
   
   public class GarageWindowEvent extends Event
   {
      
      public static const WAREHOUSE_ITEM_SELECTED:String = "GarageWindowEventWirehouseItemSelected";
      
      public static const STORE_ITEM_SELECTED:String = "GarageWindowEventStoreItemSelected";
      
      public static const BUY_ITEM:String = "GarageWindowEventBuyItem";
      
      public static const SETUP_ITEM:String = "GarageWindowEventSetupItem";
      
      public static const UPGRADE_ITEM:String = "GarageWindowEventUpgradeItem";
      
      public static const ADD_CRYSTALS:String = "GarageWindowEventAddCrystals";
      
      public static const DELETE_PRESENT:String = "GarageWindowEventDeletePresent";
      
      public var item:IGameObject;
      
      public var crystalsToBuy:int = 0;
      
      public function GarageWindowEvent(_arg_1:String, _arg_2:IGameObject, _arg_3:int = 0)
      {
         super(_arg_1,true,false);
         this.item = _arg_2;
         this.crystalsToBuy = _arg_3;
      }
   }
}

