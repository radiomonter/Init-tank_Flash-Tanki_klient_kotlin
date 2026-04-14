package alternativa.tanks.help
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   
   public class ScoreHelper extends BubbleHelper
   {
      
      public function ScoreHelper()
      {
         super();
         var _local_1:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         text = _local_1.getText(TextConst.STRING_HELP_PANEL_SCORE_HELPER_TEXT);
         arrowLehgth = int(_local_1.getText(TextConst.STRING_HELP_PANEL_SCORE_HELPER_ARROW_LENGTH));
         arrowAlign = HelperAlign.TOP_LEFT;
         _showLimit = 3;
         _targetPoint.x = 79;
         _targetPoint.y = 25;
      }
   }
}

