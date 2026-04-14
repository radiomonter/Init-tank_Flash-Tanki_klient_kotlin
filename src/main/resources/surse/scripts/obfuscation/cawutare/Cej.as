package obfuscation.cawutare
{
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   import flash.events.Event;
   import obfuscation.garud.Rocuva;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Cej implements AutoClosable
   {
      
      [Inject]
      public static var settings:ISettingsService;
      
      private var controller:Rocuva;
      
      public function Cej(_arg_1:Rocuva)
      {
         super();
         this.controller = _arg_1;
         settings.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.onSettingsAccepted);
      }
      
      private function onSettingsAccepted(_arg_1:Event) : void
      {
         this.controller.mitug(settings.inverseBackDriving);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.controller = null;
         settings.removeEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.onSettingsAccepted);
      }
   }
}

