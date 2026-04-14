package alternativa.tanks.view.bubbles
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.HelperAlign;
   import alternativa.tanks.locale.constants.TextConst;
   import flash.geom.Point;
   
   public class EntranceBubbleFactory
   {
      
      [Inject]
      public static var LocaleService:ILocaleService;
      
      public function EntranceBubbleFactory()
      {
         super();
      }
      
      public static function passwordIsTooEasyBubble() : Bubble
      {
         return customBubble(TextConst.STRING_HELP_PASSWORD_IS_TOO_SIMPLE,HelperAlign.TOP_LEFT);
      }
      
      public static function passwordsDoNotMatchBubble() : Bubble
      {
         return customBubble(TextConst.STRING_HELP_PASSWORDS_DO_NOT_MATCH,HelperAlign.TOP_LEFT);
      }
      
      public static function nameIsIncorrectBubble() : Bubble
      {
         return customBubble(TextConst.STRING_HELP_NAME_IS_FORBIDDEN,HelperAlign.TOP_LEFT);
      }
      
      public static function nameIsNotUniqueBubble() : Bubble
      {
         return customBubble(TextConst.STRING_HELP_NAME_IS_NOT_UNIQUE,HelperAlign.TOP_LEFT);
      }
      
      public static function emailIsBusy() : Bubble
      {
         return customBubble(TextConst.STRING_ERROR_EMAIL_NOT_UNIQUE,HelperAlign.TOP_LEFT);
      }
      
      public static function emailIsInvalidBubble() : Bubble
      {
         return customBubble(TextConst.STRING_ERROR_EMAIL_INVALID,HelperAlign.TOP_LEFT);
      }
      
      public static function emailDomainIsForbidden() : Bubble
      {
         return customBubble(TextConst.STRING_ERROR_EMAIL_DOMAIN_IS_FORBIDDEN,HelperAlign.TOP_LEFT);
      }
      
      public static function emailInvalidBubble() : Bubble
      {
         return customBubble(TextConst.STRING_ERROR_EMAIL_INVALID,HelperAlign.TOP_LEFT);
      }
      
      public static function symbolIsNotAllowedBubble() : Bubble
      {
         return customBubble(TextConst.STRING_HELP_SYMBOL_IS_NOT_ALLOWED,HelperAlign.TOP_LEFT);
      }
      
      public static function nameIsIncorrectinPartnerBubble() : Bubble
      {
         return partnerBubble(TextConst.STRING_HELP_NAME_IS_FORBIDDEN,HelperAlign.BOTTOM_LEFT);
      }
      
      public static function nameIsNotUniqueinPartnerBubble() : Bubble
      {
         return partnerBubble(TextConst.STRING_HELP_NAME_IS_NOT_UNIQUE,HelperAlign.BOTTOM_LEFT);
      }
      
      public static function symbolIsNotAllowedinPartnerBubble() : Bubble
      {
         return partnerWindowBubble(TextConst.STRING_HELP_SYMBOL_IS_NOT_ALLOWED,HelperAlign.BOTTOM_LEFT);
      }
      
      public static function customBubble(_arg_1:String, _arg_2:int) : Bubble
      {
         var _local_3:Bubble = new Bubble(new Point(10,10));
         _local_3.text = LocaleService.getText(_arg_1);
         _local_3.arrowLehgth = 20;
         _local_3.arrowAlign = _arg_2;
         return _local_3;
      }
      
      private static function partnerBubble(_arg_1:String, _arg_2:int) : Bubble
      {
         var _local_3:Bubble = new Bubble(new Point(10,5));
         _local_3.text = LocaleService.getText(_arg_1);
         _local_3.arrowLehgth = 20;
         _local_3.arrowAlign = _arg_2;
         return _local_3;
      }
      
      private static function partnerWindowBubble(_arg_1:String, _arg_2:int) : Bubble
      {
         var _local_3:Bubble = new Bubble(new Point(360,65));
         _local_3.text = LocaleService.getText(_arg_1);
         _local_3.arrowLehgth = 20;
         _local_3.arrowAlign = _arg_2;
         return _local_3;
      }
   }
}

