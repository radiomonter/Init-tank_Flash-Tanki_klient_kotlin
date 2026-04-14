package alternativa.tanks.model.shop.items.newkit
{
   import flash.display.BitmapData;
   
   public class NewKitPackageDefItemIcons
   {
      
      private static const NewKitDefIconClass:Class = NewKitPackageDefItemIcons_containerIconClass;
      
      public static const NewKitDefIcon:BitmapData = new NewKitDefIconClass().bitmapData;
      
      public function NewKitPackageDefItemIcons()
      {
         super();
      }
   }
}

