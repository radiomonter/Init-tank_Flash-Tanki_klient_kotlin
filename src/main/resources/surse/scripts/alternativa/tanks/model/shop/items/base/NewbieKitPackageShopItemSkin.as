package alternativa.tanks.model.shop.items.base
{
   public class NewbieKitPackageShopItemSkin extends ButtonItemSkin
   {
      
      private static const normalStateClass:Class = NewbieKitPackageNormal;
      
      private static const overStateClass:Class = NewbieKitPackageOver;
      
      public function NewbieKitPackageShopItemSkin()
      {
         super();
      }
      
      public function RedShopItemSkin() : *
      {
         normalState = new normalStateClass().bitmapData;
         overState = new overStateClass().bitmapData;
      }
   }
}

