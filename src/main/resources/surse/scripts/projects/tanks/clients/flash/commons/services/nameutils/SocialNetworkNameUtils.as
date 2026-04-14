package projects.tanks.clients.flash.commons.services.nameutils
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   
   public class SocialNetworkNameUtils
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function SocialNetworkNameUtils()
      {
         super();
      }
      
      public static function makeSocialNetworkNameFromId(_arg_1:String) : String
      {
         switch(_arg_1)
         {
            case "vkontakte":
               return localeService.getText(TextConst.STRING_VKONTAKTE_NAME);
            case "facebook":
               return localeService.getText(TextConst.STRING_FACEBOOK_NAME);
            default:
               return _arg_1.substr(0,1).toUpperCase() + _arg_1.substr(1);
         }
      }
   }
}

