package obfuscation.nabi
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.Helper;
   import flash.display.Bitmap;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class ControlsHelper extends Helper
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public static const puse:String = "Tank.ControlsHelper";
      
      public static const vacipa:int = 1;
      
      private var quvydoj:Bitmap;
      
      public function ControlsHelper()
      {
         super();
         this.init();
      }
      
      [Obfuscation(rename="false")]
      override public function align(_arg_1:int, _arg_2:int) : void
      {
         this.quvydoj.x = (_arg_1 - this.quvydoj.width) / 2;
         this.quvydoj.y = (_arg_2 - this.quvydoj.height) / 2;
      }
      
      private function init() : void
      {
         this.quvydoj = new Bitmap(localeService.getImage(TanksLocale.IMAGE_FULL_BATTLE_HELP));
         addChild(this.quvydoj);
         _showLimit = 10;
         showDuration = 8000;
      }
   }
}

