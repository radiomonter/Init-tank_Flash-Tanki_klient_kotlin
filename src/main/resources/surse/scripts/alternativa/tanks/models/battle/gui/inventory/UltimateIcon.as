package alternativa.tanks.models.battle.gui.inventory
{
   import alternativa.tanks.models.inventory.InventoryItemType;
   import flash.display.Bitmap;
   
   public class UltimateIcon extends InventoryIcons
   {
      
      private var ultimateIndex:int;
      
      public function UltimateIcon(_arg_1:int)
      {
         this.ultimateIndex = _arg_1;
         super(InventoryItemType.ULTIMATE);
      }
      
      override protected function getNeutralIcon(_arg_1:int) : *
      {
         return new Bitmap(HudInventoryIcon.getUltimateIcon(this.ultimateIndex));
      }
      
      override protected function getEffectIcon(_arg_1:int) : Bitmap
      {
         return new Bitmap(HudInventoryIcon.getUltimateIcon(this.ultimateIndex));
      }
      
      override protected function getCooldownIcon(_arg_1:int) : Bitmap
      {
         return new Bitmap(HudInventoryIcon.getUltimateIcon(this.ultimateIndex));
      }
   }
}

