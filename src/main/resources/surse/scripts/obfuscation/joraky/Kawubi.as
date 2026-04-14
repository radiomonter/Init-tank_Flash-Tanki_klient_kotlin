package obfuscation.joraky
{
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingEnum;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.utils.removeDisplayObject;
   import obfuscation.qir.Beg;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Kawubi implements AutoClosable
   {
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var kyb:BattleGUIService;
      
      private var genetyti:Beg;
      
      public function Kawubi(_arg_1:Beg)
      {
         super();
         this.genetyti = _arg_1;
         settingsService.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.onSettingsAccepted);
      }
      
      private function onSettingsAccepted(_arg_1:SettingsServiceEvent) : void
      {
         if(_arg_1.pegutu() != SettingEnum.sujutyb)
         {
            return;
         }
         if(settingsService.showFPS)
         {
            kyb.fez().addChild(this.genetyti);
         }
         else
         {
            removeDisplayObject(this.genetyti);
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.genetyti = null;
         settingsService.removeEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.onSettingsAccepted);
      }
   }
}

