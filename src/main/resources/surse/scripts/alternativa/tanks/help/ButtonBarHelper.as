package alternativa.tanks.help
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   
   public class ButtonBarHelper extends PanelBubbleHelper
   {
      
      public function ButtonBarHelper(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Boolean = false)
      {
         super(_arg_1,_arg_2,_arg_3);
         var _local_5:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         text = _local_5.getText(!_arg_4 ? TextConst.STRING_HELP_PANEL_BUTTON_BAR_HELPER_TEXT : TextConst.STRING_PARTNER_HELP_PANEL_BUTTON_BAR_HELPER_TEXT);
         arrowLehgth = int(_local_5.getText(TextConst.STRING_HELP_PANEL_BUTTON_BAR_HELPER_ARROW_LENGTH));
         arrowAlign = HelperAlign.TOP_RIGHT;
      }
   }
}

