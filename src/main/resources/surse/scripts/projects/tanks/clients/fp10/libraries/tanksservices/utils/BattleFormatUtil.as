package projects.tanks.clients.fp10.libraries.tanksservices.utils
{
   import alternativa.osgi.service.locale.ILocaleService;
   import obfuscation.gybivyveq.Tiz;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class BattleFormatUtil
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function BattleFormatUtil()
      {
         super();
      }
      
      public function suvo(_arg_1:Tiz, _arg_2:Boolean) : Boolean
      {
         return _arg_2 || _arg_1 != Tiz.NONE;
      }
      
      public function vuqud(_arg_1:Tiz, _arg_2:Boolean) : String
      {
         if(_arg_2)
         {
            return this.sedose();
         }
         switch(_arg_1)
         {
            case Tiz.NONE:
               return "";
            case Tiz.HORNET_RAILGUN:
               return localeService.getText(TanksLocale.TEXT_FORMAT_NAME_XP);
            case Tiz.WASP_RAILGUN:
               return localeService.getText(TanksLocale.TEXT_FORMAT_NAME_BR);
            case Tiz.HORNET_WASP_RAILGUN:
               return localeService.getText(TanksLocale.TEXT_FORMAT_NAME_XPBR);
            default:
               return "";
         }
      }
      
      public function vosuwol(_arg_1:Tiz) : String
      {
         if(_arg_1 == Tiz.NONE)
         {
            return localeService.getText(TanksLocale.TEXT_FORMAT_NAME_NONE);
         }
         return this.vuqud(_arg_1,false);
      }
      
      public function sedose() : String
      {
         return localeService.getText(TanksLocale.TEXT_FORMAT_NAME_PARKOUR);
      }
   }
}

