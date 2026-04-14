package forms.registration.bubbles
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.BubbleHelper;
   import alternativa.tanks.help.HelperAlign;
   import alternativa.tanks.locale.constants.TextConst;
   
   public class EmailInvalidBubble extends BubbleHelper
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function EmailInvalidBubble()
      {
         super();
         text = localeService.getText(TextConst.STRING_ERROR_EMAIL_INVALID);
         arrowLehgth = 20;
         arrowAlign = HelperAlign.TOP_LEFT;
         _showLimit = 3;
      }
   }
}

