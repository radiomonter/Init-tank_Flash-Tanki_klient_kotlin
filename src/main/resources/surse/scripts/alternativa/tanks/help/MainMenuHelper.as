package alternativa.tanks.help
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   
   public class MainMenuHelper extends PanelBubbleHelper
   {
      
      public function MainMenuHelper(_arg_1:Number, _arg_2:Number, _arg_3:Number)
      {
         super(_arg_1,_arg_2,_arg_3);
         var _local_4:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         text = _local_4.getText(TextConst.STRING_HELP_PANEL_MAIN_MENU_HELPER_TEXT);
         arrowLehgth = int(_local_4.getText(TextConst.STRING_HELP_PANEL_MAIN_MENU_HELPER_ARROW_LENGTH));
         arrowAlign = HelperAlign.TOP_LEFT;
      }
   }
}

