package alternativa.init
{
   import alternativa.osgi.CommonBundleActivator;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battle.gui.inventory.InventoryItemModel;
   import alternativa.tanks.models.battle.gui.inventory.InventoryModel;
   import obfuscation.joraky.Kyfaciki;
   
   public class BattlefieldGUIActivator extends CommonBundleActivator
   {
      
      public function BattlefieldGUIActivator()
      {
         super();
      }
      
      override public function start(_arg_1:OSGi) : void
      {
         registerModel(new Kyfaciki(),_arg_1);
         registerModel(new InventoryModel(),_arg_1);
         registerModel(new InventoryItemModel(),_arg_1);
      }
   }
}

