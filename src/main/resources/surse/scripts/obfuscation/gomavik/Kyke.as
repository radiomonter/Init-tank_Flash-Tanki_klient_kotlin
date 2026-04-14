package obfuscation.gomavik
{
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.service.settings.SettingEnum;
   import controls.Label;
   import controls.TankWindowInner;
   import controls.checkbox.TankCheckBox;
   import controls.containers.StackPanel;
   import controls.containers.VerticalStackPanel;
   import flash.events.MouseEvent;
   import obfuscation.qimi.Jin;
   import obfuscation.qimi.Ziqysyrep;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   
   public class Kyke extends Jin
   {
      
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      private var zahyvor:TankCheckBox;
      
      private var zila:TankCheckBox;
      
      private var tubeqo:Ziqysyrep;
      
      public function Kyke(_arg_1:Boolean)
      {
         var _local_5:StackPanel = null;
         super();
         var _local_2:VerticalStackPanel = new VerticalStackPanel();
         _local_2.x = MARGIN;
         _local_2.y = MARGIN;
         _local_2.bujet(MARGIN);
         _local_2.addItem(createCheckBox(SettingEnum.SHOW_DAMAGE,localeService.getText(TanksLocale.TEXT_SHOW_DAMAGE),settingsService.showDamage));
         _local_2.addItem(createCheckBox(SettingEnum.myw,localeService.getText(TanksLocale.TEXT_SETTINGS_SHOW_DROP_ZONES_LABEL_TEXT),settingsService.showDropZones));
         _local_2.addItem(createCheckBox(SettingEnum.cyj,localeService.getText(TanksLocale.TEXT_SETTINGS_ALTERNATE_CAMERA_LABEL_TEXT),settingsService.alternateCamera));
         var _local_3:VerticalStackPanel = new VerticalStackPanel();
         _local_3.bujet(MARGIN);
         _local_3.y = MARGIN;
         _local_3.x = SettingsWindow.daqowuso * 0.5;
         this.zahyvor = this.menidetes(localeService.getText(TanksLocale.TEXT_SETTINGS_MESSAGE_ONLY_FROM_FRIENDS),_arg_1);
         this.zahyvor.addEventListener(MouseEvent.CLICK,this.jinon);
         _local_3.addItem(createCheckBox(SettingEnum.wygo,localeService.getText(TanksLocale.TEXT_SETTINGS_SHOW_CHAT_CHECKBOX_LABEL_TEXT),settingsService.showChat));
         this.zila = this.menidetes(localeService.getText(TanksLocale.TEXT_SHOW_NOTIFICATIONS_LABEL),battleInviteService.receiveBattleInvite);
         this.zila.addEventListener(MouseEvent.CLICK,this.cynenaqum);
         _local_3.addItem(this.zila);
         _local_3.addItem(createCheckBox(SettingEnum.USE_NEW_LOADER,localeService.getText(TextConst.SETTINGS_USE_NEW_LOADER_CHECKBOX_LABEL_TEXT),settingsService.useNewLoader));
         var _local_4:TankWindowInner = new TankWindowInner(SettingsWindow.daqowuso,_local_2.height + 2 * MARGIN,TankWindowInner.TRANSPARENT);
         _local_4.addChild(_local_2);
         _local_4.addChild(_local_3);
         addChild(_local_4);
         _local_5 = this.createSoundPanel();
         _local_5.y = _local_4.y + _local_4.height + nisi;
         addChild(_local_5);
      }
      
      private function createSoundPanel() : StackPanel
      {
         var _local_1:VerticalStackPanel = new VerticalStackPanel();
         _local_1.bujet(noz);
         var _local_2:Label = new Label();
         _local_2.text = localeService.getText(TanksLocale.TEXT_SETTINGS_SOUND_VOLUME_LABEL_TEXT);
         _local_1.addItem(_local_2);
         this.tubeqo = new Ziqysyrep();
         _local_1.addItem(this.tubeqo);
         return _local_1;
      }
      
      private function cynenaqum(_arg_1:MouseEvent) : void
      {
         battleInviteService.receiveBattleInvite = this.zila.checked;
      }
      
      private function jinon(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new ReceivePersonalMessagesSettingEvent(ReceivePersonalMessagesSettingEvent.zido,this.zahyvor.checked));
      }
      
      protected function menidetes(_arg_1:String, _arg_2:Boolean, _arg_3:int = 0, _arg_4:int = 0) : TankCheckBox
      {
         var _local_5:TankCheckBox = new TankCheckBox();
         _local_5.checked = _arg_2;
         _local_5.x = _arg_3;
         _local_5.y = _arg_4;
         _local_5.label = _arg_1;
         return _local_5;
      }
      
      override public function destroy() : void
      {
         this.zila.removeEventListener(MouseEvent.CLICK,this.cynenaqum);
         this.zahyvor.removeEventListener(MouseEvent.CLICK,this.jinon);
         this.tubeqo.destroy();
         super.destroy();
      }
   }
}

