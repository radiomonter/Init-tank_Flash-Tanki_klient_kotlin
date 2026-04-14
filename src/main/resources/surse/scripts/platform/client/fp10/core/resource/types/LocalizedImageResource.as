package platform.client.fp10.core.resource.types
{
   import alternativa.osgi.service.locale.ILocaleService;
   import platform.client.fp10.core.resource.ResourceInfo;
   
   public class LocalizedImageResource extends ImageResource
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function LocalizedImageResource(_arg_1:ResourceInfo)
      {
         super(_arg_1,null);
      }
   }
}

