package alternativa.tanks.utils
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class PieceWordDeclensionUtil
   {
      
      [Inject]
      public static var localeService:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
      
      private static const NOMINATIVE_ONE_DECLENSION:String = "NominativeOneDeclension";
      
      private static const NOMINATIVE_MANY_DECLENSION:String = "NominativeManyDeclension";
      
      private static const GENITIVE_MANY_DECLENSION:String = "GenitiveManyDeclension";
      
      public function PieceWordDeclensionUtil()
      {
         super();
      }
      
      public static function getLocalizedDeclension(_arg_1:int) : String
      {
         var _local_2:String = _arg_1 + " ";
         if(localeService.language == "ru")
         {
            switch(determineRussianWordFormType(_arg_1))
            {
               case NOMINATIVE_ONE_DECLENSION:
                  _local_2 += localeService.getText(TanksLocale.TEXT_PIECE_1);
                  break;
               case NOMINATIVE_MANY_DECLENSION:
                  _local_2 += localeService.getText(TanksLocale.TEXT_PIECE_2);
                  break;
               case GENITIVE_MANY_DECLENSION:
                  _local_2 += localeService.getText(TanksLocale.TEXT_PIECE_3);
            }
         }
         else
         {
            _local_2 += _arg_1 == 1 ? localeService.getText(TanksLocale.TEXT_PIECE_1) : localeService.getText(TanksLocale.TEXT_PIECE_2);
         }
         return _local_2;
      }
      
      private static function determineRussianWordFormType(_arg_1:int) : String
      {
         var _local_3:int = 0;
         var _local_2:String = NOMINATIVE_ONE_DECLENSION;
         if(_arg_1 % 100 >= 10 && _arg_1 % 100 <= 20)
         {
            _local_2 = GENITIVE_MANY_DECLENSION;
         }
         else
         {
            _local_3 = _arg_1 % 10;
            if(_local_3 == 1)
            {
               _local_2 = NOMINATIVE_ONE_DECLENSION;
            }
            else if(_local_3 >= 2 && _local_3 <= 4)
            {
               _local_2 = NOMINATIVE_MANY_DECLENSION;
            }
            else
            {
               _local_2 = GENITIVE_MANY_DECLENSION;
            }
         }
         return _local_2;
      }
   }
}

