package alternativa.tanks.model
{
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingEnum;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   
   public class ChatSettingsTracker
   {
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      private var chat:ShowChat;
      
      public function ChatSettingsTracker(_arg_1:ShowChat)
      {
         super();
         this.chat = _arg_1;
         _arg_1.setShowChat(settingsService.showChat);
         settingsService.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.onSettingsAccepted);
      }
      
      private function onSettingsAccepted(_arg_1:SettingsServiceEvent) : void
      {
         if(_arg_1.pegutu() == SettingEnum.wygo)
         {
            this.chat.setShowChat(settingsService.showChat);
         }
      }
      
      public function close() : void
      {
         this.chat = null;
         settingsService.removeEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.onSettingsAccepted);
      }
   }
}

