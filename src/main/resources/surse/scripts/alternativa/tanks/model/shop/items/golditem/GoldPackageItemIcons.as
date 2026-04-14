package alternativa.tanks.model.shop.items.golditem
{
   import flash.display.BitmapData;
   
   public class GoldPackageItemIcons
   {
      
      private static const goldIconClass:Class = GoldPackageItemIcons_goldIconClass;
      
      public static const goldIcon:BitmapData = new goldIconClass().bitmapData;
      
      private static const goldPackage2Class:Class = GoldPackageItemIcons_goldPackage2Class;
      
      private static const goldPackage3Class:Class = GoldPackageItemIcons_goldPackage3Class;
      
      public static const goldPackages:Array = [new goldIconClass().bitmapData,new goldPackage2Class().bitmapData,new goldPackage3Class().bitmapData];
      
      public function GoldPackageItemIcons()
      {
         super();
      }
   }
}

