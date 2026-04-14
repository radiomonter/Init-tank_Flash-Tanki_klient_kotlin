package alternativa.tanks.loader
{
   import alternativa.osgi.OSGi;
   import flash.display.Bitmap;
   import flash.utils.getDefinitionByName;
   
   public class LoaderTips implements ILoaderTipsService
   {
      
      public static var loader:ILoaderWindowService;
      
      public static const coldload:Class = LoaderTips_coldload;
      
      public static const coldload1:Class = LoaderTips_coldload1;
      
      public static const coldload2:Class = LoaderTips_coldload2;
      
      public static const coldload3:Class = LoaderTips_coldload3;
      
      public static const coldload4:Class = LoaderTips_coldload4;
      
      private static const coldload5:Class = LoaderTips_coldload5;
      
      private static const coldload6:Class = LoaderTips_coldload6;
      
      private static const coldload7:Class = LoaderTips_coldload7;
      
      private static const coldload8:Class = LoaderTips_coldload8;
      
      private static const coldload9:Class = LoaderTips_coldload9;
      
      private static const coldload10:Class = LoaderTips_coldload10;
      
      private static const coldload11:Class = LoaderTips_coldload11;
      
      private static const coldload12:Class = LoaderTips_coldload12;
      
      private static const coldload13:Class = LoaderTips_coldload13;
      
      private static const coldload14:Class = LoaderTips_coldload14;
      
      private static const coldload15:Class = LoaderTips_coldload15;
      
      private static const coldload16:Class = LoaderTips_coldload16;
      
      private static const coldload17:Class = LoaderTips_coldload17;
      
      private static const coldload18:Class = LoaderTips_coldload18;
      
      private static const coldload19:Class = LoaderTips_coldload19;
      
      private static const coldload20:Class = LoaderTips_coldload20;
      
      private static const coldload21:Class = LoaderTips_coldload21;
      
      private static const coldload22:Class = LoaderTips_coldload22;
      
      private static const coldload23:Class = LoaderTips_coldload23;
      
      private static const coldload24:Class = LoaderTips_coldload24;
      
      private static const coldload25:Class = LoaderTips_coldload25;
      
      private static const coldload26:Class = LoaderTips_coldload26;
      
      private static const coldload27:Class = LoaderTips_coldload27;
      
      private static const coldload28:Class = LoaderTips_coldload28;
      
      private static const coldload29:Class = LoaderTips_coldload29;
      
      private static const coldload30:Class = LoaderTips_coldload30;
      
      private static const coldload31:Class = LoaderTips_coldload31;
      
      private static const coldload32:Class = LoaderTips_coldload32;
      
      private static const coldload33:Class = LoaderTips_coldload33;
      
      private static const coldload34:Class = LoaderTips_coldload34;
      
      private static const coldload35:Class = LoaderTips_coldload35;
      
      private static const coldload36:Class = LoaderTips_coldload36;
      
      private static const coldloadEN:Class = LoaderTips_coldloadEN;
      
      private static const coldloadEN1:Class = LoaderTips_coldloadEN1;
      
      private static const coldloadEN2:Class = LoaderTips_coldloadEN2;
      
      private static const coldloadEN3:Class = LoaderTips_coldloadEN3;
      
      private static const coldloadEN4:Class = LoaderTips_coldloadEN4;
      
      private static const coldloadEN5:Class = LoaderTips_coldloadEN5;
      
      private static const coldloadEN6:Class = LoaderTips_coldloadEN6;
      
      private static const coldloadEN7:Class = LoaderTips_coldloadEN7;
      
      private static const coldloadEN8:Class = LoaderTips_coldloadEN8;
      
      private static const coldloadEN9:Class = LoaderTips_coldloadEN9;
      
      private static const coldloadEN10:Class = LoaderTips_coldloadEN10;
      
      private static const coldloadEN11:Class = LoaderTips_coldloadEN11;
      
      private static const coldloadEN12:Class = LoaderTips_coldloadEN12;
      
      private static const coldloadEN13:Class = LoaderTips_coldloadEN13;
      
      private static const coldloadEN14:Class = LoaderTips_coldloadEN14;
      
      private static const coldloadEN15:Class = LoaderTips_coldloadEN15;
      
      private static const coldloadEN16:Class = LoaderTips_coldloadEN16;
      
      private static const coldloadEN17:Class = LoaderTips_coldloadEN17;
      
      private static const coldloadEN18:Class = LoaderTips_coldloadEN18;
      
      private static const coldloadEN19:Class = LoaderTips_coldloadEN19;
      
      private static const coldloadEN20:Class = LoaderTips_coldloadEN20;
      
      private static const coldloadEN21:Class = LoaderTips_coldloadEN21;
      
      private static const coldloadEN22:Class = LoaderTips_coldloadEN22;
      
      private static const coldloadEN23:Class = LoaderTips_coldloadEN23;
      
      private static const coldloadEN24:Class = LoaderTips_coldloadEN24;
      
      private static const coldloadEN25:Class = LoaderTips_coldloadEN25;
      
      private static const coldloadEN26:Class = LoaderTips_coldloadEN26;
      
      private static const coldloadEN27:Class = LoaderTips_coldloadEN27;
      
      private static const coldloadEN28:Class = LoaderTips_coldloadEN28;
      
      private static const coldloadEN29:Class = LoaderTips_coldloadEN29;
      
      private static const coldloadEN30:Class = LoaderTips_coldloadEN30;
      
      private static const coldloadEN31:Class = LoaderTips_coldloadEN31;
      
      private static const coldloadEN32:Class = LoaderTips_coldloadEN32;
      
      private static const coldloadEN33:Class = LoaderTips_coldloadEN33;
      
      private static const coldloadEN34:Class = LoaderTips_coldloadEN34;
      
      public static var items:Array = new Array(coldload,coldload1,coldload2,coldload3,coldload4,coldload5,coldload6,coldload7,coldload8,coldload9,coldload10,coldload11,coldload12,coldload13,coldload14,coldload15,coldload16,coldload17,coldload18,coldload19,coldload20,coldload21,coldload22,coldload23,coldload24,coldload25,coldload26,coldload27,coldload28,coldload29,coldload30,coldload31,coldload32,coldload33,coldload34,coldload35,coldload36);
      
      public static var itemsEn:Array = new Array(coldloadEN,coldloadEN1,coldloadEN2,coldloadEN3,coldloadEN4,coldloadEN5,coldloadEN6,coldloadEN7,coldloadEN8,coldloadEN9,coldloadEN10,coldloadEN11,coldloadEN12,coldloadEN13,coldloadEN14,coldloadEN15,coldloadEN16,coldloadEN17,coldloadEN18,coldloadEN19,coldloadEN20,coldloadEN21,coldloadEN22,coldloadEN23,coldloadEN24,coldloadEN25,coldloadEN26,coldloadEN27,coldloadEN28,coldloadEN29,coldloadEN30,coldloadEN31,coldloadEN32,coldloadEN33,coldloadEN34);
      
      public function LoaderTips()
      {
         loader = OSGi.getInstance().getService(ILoaderWindowService) as ILoaderWindowService;
         super();
      }
      
      public function getTip(_arg_1:String) : void
      {
         var _local_2:int = Math.floor(Math.random() * (_arg_1.toLowerCase() == "ru" ? items.length : itemsEn.length));
         switch(_arg_1.toLowerCase())
         {
            case "ru":
               loader.showTip(new Bitmap(new items[_local_2]().bitmapData));
               return;
            case "en":
            case "pt_BR":
               loader.showTip(new Bitmap(new itemsEn[_local_2]().bitmapData));
               return;
            default:
               return;
         }
      }
   }
}

