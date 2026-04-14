package alternativa.tanks.help.achievements
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.BubbleHelper;
   import alternativa.tanks.help.HelperAlign;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class FirstPurchaseHelper extends BubbleHelper
   {
      
      public function FirstPurchaseHelper()
      {
         super();
         var _local_1:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         text = _local_1.getText(TanksLocale.TEXT_HELP_PANEL_ACHIEVEMENTS_FIRST_PURCHASE_TEXT);
         arrowLehgth = int(_local_1.getText(TanksLocale.TEXT_HELP_PANEL_ACHIEVEMENTS_FIRST_PURCHASE_ARROW_LENGTH));
         arrowAlign = HelperAlign.TOP_LEFT;
         _showLimit = 3;
      }
   }
}

