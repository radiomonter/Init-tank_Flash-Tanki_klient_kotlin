package alternativa.tanks.help.achievements
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.BubbleHelper;
   import alternativa.tanks.help.HelperAlign;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class BattleStartButtonHelper extends BubbleHelper
   {
      
      public function BattleStartButtonHelper()
      {
         super();
         var _local_1:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         text = _local_1.getText(TanksLocale.TEXT_HELP_PANEL_ACHIEVEMENTS_CREATE_BATTLE_BUTTON_TEXT);
         arrowLehgth = int(_local_1.getText(TanksLocale.TEXT_HELP_PANEL_ACHIEVEMENTS_CREATE_BATTLE_BUTTON_ARROW_LENGTH));
         arrowAlign = HelperAlign.BOTTOM_RIGHT;
         _showLimit = 3;
      }
   }
}

