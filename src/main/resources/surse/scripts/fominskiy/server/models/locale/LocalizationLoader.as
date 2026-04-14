package fominskiy.server.models.locale
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   
   public class LocalizationLoader
   {
      
      public static var localeService:ILocaleService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
      
      public function LocalizationLoader()
      {
         super();
      }
      
      public function init(_arg_1:String) : *
      {
         var _local_3:* = undefined;
         var _local_2:Object = JSON.parse(_arg_1);
         for each(_local_3 in _local_2.struct)
         {
            localeService.setText(_local_3.key,_local_3.value);
         }
      }
   }
}

