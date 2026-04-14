package alternativa.tanks.locale.en
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.ImageConst;
   import flash.display.BitmapData;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Image
   {
      
      private static const bitmapReferalHeader:Class = Mikavuc;
      
      public static const REFERAL_WINDOW_HEADER_IMAGE:BitmapData = new bitmapReferalHeader().bitmapData;
      
      private static const controlsHelp:Class = Doly;
      
      private static const FULL_BATTLE_HELP:BitmapData = new controlsHelp().bitmapData;
      
      private static const giftWindow:Class = Image_giftWindow;
      
      private static const GIFT_WINDOW:BitmapData = new giftWindow().bitmapData;
      
      public function Image()
      {
         super();
      }
      
      public static function init(_arg_1:ILocaleService) : void
      {
         _arg_1.setImage(ImageConst.REFERAL_WINDOW_HEADER_IMAGE,Image.REFERAL_WINDOW_HEADER_IMAGE);
         _arg_1.setImage(TanksLocale.IMAGE_FULL_BATTLE_HELP,Image.FULL_BATTLE_HELP);
         _arg_1.setImage(TanksLocale.IMAGE_GIFT_WINDOW,Image.GIFT_WINDOW);
      }
   }
}

