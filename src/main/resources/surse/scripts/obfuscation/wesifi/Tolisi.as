package obfuscation.wesifi
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import flash.globalization.DateTimeFormatter;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Tolisi
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var logService:LogService;
      
      private static var qekohas:DateTimeFormatter;
      
      private static var lejywapop:DateTimeFormatter;
      
      private static var vujoluq:DateTimeFormatter;
      
      public function Tolisi()
      {
         super();
      }
      
      public static function mahy(_arg_1:Date) : String
      {
         if(qekohas == null)
         {
            qekohas = new DateTimeFormatter("");
            qekohas.setDateTimePattern(localeService.getText(TanksLocale.TEXT_DATE_FORMAT));
         }
         return qekohas.format(_arg_1);
      }
      
      public static function formatTime(_arg_1:Date) : String
      {
         if(lejywapop == null)
         {
            lejywapop = new DateTimeFormatter("");
            lejywapop.setDateTimePattern("HH:mm");
         }
         return lejywapop.format(_arg_1);
      }
      
      public static function towi(_arg_1:Date) : String
      {
         if(vujoluq == null)
         {
            vujoluq = new DateTimeFormatter("");
            vujoluq.setDateTimePattern("HH:mm");
         }
         return vujoluq.format(_arg_1);
      }
   }
}

