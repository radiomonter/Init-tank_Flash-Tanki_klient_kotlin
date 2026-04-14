package obfuscation.nabi
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.IHelpService;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import obfuscation.garud.Sudyhuma;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Lotime extends Sprite
   {
      
      [Inject]
      public static var helpService:IHelpService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var fytiqosa:Bitmap;
      
      private var buzedac:Bitmap;
      
      public function Lotime()
      {
         super();
         this.fytiqosa = new Bitmap(localeService.getImage(TanksLocale.IMAGE_HELP_CONTROLS_MINI));
         this.buzedac = new Bitmap(localeService.getImage(TanksLocale.IMAGE_HELP_MOUSE_MINI));
         addEventListener(MouseEvent.CLICK,luvim);
         this.kyfiq(Sudyhuma.pobyhevam);
      }
      
      private static function luvim(_arg_1:MouseEvent) : void
      {
         helpService.showHelp();
         _arg_1.stopPropagation();
      }
      
      public function kyfiq(_arg_1:int) : void
      {
         if(this.fytiqosa.parent != null)
         {
            removeChild(this.fytiqosa);
         }
         if(this.buzedac.parent != null)
         {
            removeChild(this.buzedac);
         }
         if(_arg_1 == Sudyhuma.pobyhevam)
         {
            addChild(this.fytiqosa);
         }
         else
         {
            addChild(this.buzedac);
         }
      }
   }
}

