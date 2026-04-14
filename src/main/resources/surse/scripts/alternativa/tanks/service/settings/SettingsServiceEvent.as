package alternativa.tanks.service.settings
{
   import flash.events.Event;
   
   public class SettingsServiceEvent extends Event
   {
      
      public static const SETTINGS_CHANGED:String = "SettingsServiceEvent.SETTINGS_CHANGED";
      
      private var quqyra:SettingEnum;
      
      public function SettingsServiceEvent(_arg_1:String, _arg_2:SettingEnum)
      {
         super(_arg_1,true,false);
         this.quqyra = _arg_2;
      }
      
      public function pegutu() : SettingEnum
      {
         return this.quqyra;
      }
   }
}

