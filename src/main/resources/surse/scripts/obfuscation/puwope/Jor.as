package obfuscation.puwope
{
   import alternativa.osgi.service.locale.ILocaleService;
   import obfuscation.fulegod.Dymi;
   import obfuscation.fulegod.Vow;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import services.alertservice.AlertAnswer;
   
   public class Jor extends Dymi implements Vow
   {
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function Jor()
      {
         super();
      }
      
      public function show(_arg_1:String) : void
      {
         alertService.showAlert(_arg_1,Vector.<String>([localeService.getText(AlertAnswer.OK)]));
      }
   }
}

