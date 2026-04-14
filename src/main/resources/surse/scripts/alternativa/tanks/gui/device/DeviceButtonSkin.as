package alternativa.tanks.gui.device
{
   import alternativa.tanks.model.shop.items.base.ButtonItemSkin;
   
   public class DeviceButtonSkin extends ButtonItemSkin
   {
      
      private static const normalStateClass:Class = DeviceButtonSkin_normalStateClass;
      
      private static const overStateClass:Class = DeviceButtonSkin_overStateClass;
      
      public function DeviceButtonSkin()
      {
         super();
         normalState = new normalStateClass().bitmapData;
         overState = new overStateClass().bitmapData;
      }
   }
}

