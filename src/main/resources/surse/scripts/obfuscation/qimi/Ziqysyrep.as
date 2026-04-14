package obfuscation.qimi
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.service.settings.SettingEnum;
   import controls.Slider;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import controls.checkbox.TankCheckBox;
   import forms.events.SliderEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.LocaleServiceLangValues;
   
   public class Ziqysyrep extends Jin
   {
      
      [Inject]
      public static var display:IDisplay;
      
      private var volumeLevel:Slider;
      
      private var bgSound:TankCheckBox;
      
      public function Ziqysyrep()
      {
         var _local_1:TankWindowInner = null;
         var _local_2:LabelBase = null;
         super();
         _local_1 = new TankWindowInner(SettingsWindow.daqowuso,0,TankWindowInner.TRANSPARENT);
         _local_2 = new LabelBase();
         _local_1.addChild(_local_2);
         _local_2.text = localeService.getText(TanksLocale.TEXT_SETTINGS_SOUND_VOLUME_LABEL_TEXT);
         _local_2.x = MARGIN;
         this.volumeLevel = new Slider();
         this.volumeLevel.maxValue = 100;
         this.volumeLevel.minValue = 0;
         this.volumeLevel.tickInterval = 5;
         this.volumeLevel.x = _local_2.x + _local_2.textWidth + MARGIN;
         this.volumeLevel.y = MARGIN;
         this.volumeLevel.width = SettingsWindow.daqowuso - 2 * MARGIN - _local_2.width - 1;
         if(localeService.language == LocaleServiceLangValues.nuvi)
         {
            this.volumeLevel.width -= 4;
         }
         this.volume = settingsService.bazorodum;
         this.volumeLevel.addEventListener(SliderEvent.CHANGE_VALUE,this.onChangeVolume);
         _local_1.addChild(this.volumeLevel);
         this.bgSound = createCheckBox(SettingEnum.zywiqudih,localeService.getText(TanksLocale.TEXT_SETTINGS_BACKGROUND_SOUND_CHECKBOX_LABEL_TEXT),settingsService.bgSound,MARGIN,0);
         this.bgSound.x = MARGIN;
         this.bgSound.y = MARGIN + this.volumeLevel.y + this.volumeLevel.height;
         _local_1.addChild(this.bgSound);
         _local_1.height = MARGIN + this.bgSound.y + this.bgSound.height;
         _local_2.y = this.volumeLevel.y + Math.round((this.volumeLevel.height - _local_2.textHeight) * 0.5) - 2;
         addChild(_local_1);
      }
      
      private function onChangeVolume(_arg_1:SliderEvent) : void
      {
         settingsService.bazorodum = this.volume;
      }
      
      override public function hide() : void
      {
         super.hide();
      }
      
      public function nizuk() : Boolean
      {
         return this.bgSound.checked;
      }
      
      public function sicuv(_arg_1:Boolean) : void
      {
         this.bgSound.checked = _arg_1;
      }
      
      public function get volume() : Number
      {
         return this.volumeLevel.value / 100;
      }
      
      public function set volume(_arg_1:Number) : void
      {
         this.volumeLevel.value = int(_arg_1 * 100);
      }
      
      override public function destroy() : void
      {
         this.volumeLevel.removeEventListener(SliderEvent.CHANGE_VALUE,this.onChangeVolume);
         super.destroy();
      }
   }
}

