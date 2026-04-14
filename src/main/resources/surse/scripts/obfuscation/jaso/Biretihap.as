package obfuscation.jaso
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.service.settings.SettingEnum;
   import base.DiscreteSprite;
   import controls.Slider;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import controls.containers.VerticalStackPanel;
   import forms.events.SliderEvent;
   import obfuscation.qimi.Qokaci;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   
   public class Biretihap extends Qokaci
   {
      
      [Inject]
      public static var dowiruduj:FullscreenService;
      
      [Inject]
      public static var display:IDisplay;
      
      public static const zifed:int = 1;
      
      public static const jegin:int = 20;
      
      private var mouseSensitivity:Slider;
      
      public function Biretihap()
      {
         super();
         var _local_1:TankWindowInner = new TankWindowInner(SettingsWindow.daqowuso,SettingsWindow.fahohaq,TankWindowInner.TRANSPARENT);
         addChildAt(_local_1,0);
         var _local_2:VerticalStackPanel = new VerticalStackPanel();
         _local_2.bujet(MARGIN);
         _local_2.x = MARGIN;
         _local_2.y = lonece;
         if(!dowiruduj.isMouseLockDisabled())
         {
            _local_2.addItem(this.cyho());
         }
         _local_2.addItem(createCheckBox(SettingEnum.lydovez,localeService.getText(TanksLocale.TEXT_SETTINGS_INVERSE_TURN_CONTROL_CHECKBOX_LABEL_TEXT),settingsService.inverseBackDriving));
         _local_2.addItem(new Rihusir());
         addItem(_local_2);
      }
      
      private function cyho() : DiscreteSprite
      {
         var _local_1:VerticalStackPanel = new VerticalStackPanel();
         _local_1.bujet(MARGIN);
         _local_1.addItem(createCheckBox(SettingEnum.kumytasok,localeService.getText(TanksLocale.TEXT_SETTINGS_MOUSE_CONTROL_CHECKBOX),settingsService.mouseControl));
         _local_1.addItem(this.qapohar());
         _local_1.addItem(createCheckBox(SettingEnum.zejum,localeService.getText(TanksLocale.TEXT_SETTINGS_MOUSE_INVERSION_CHECKBOX_LABEL),settingsService.mouseYInverse));
         _local_1.addItem(createCheckBox(SettingEnum.bynerede,localeService.getText(TanksLocale.TEXT_SETTINGS_MOUSE_SHAFT_SCOPE_VERTICAL_INVERSION),settingsService.mouseYInverseShaftAim));
         return _local_1;
      }
      
      private function qapohar() : DiscreteSprite
      {
         var _local_1:DiscreteSprite = null;
         var _local_2:LabelBase = null;
         _local_1 = new DiscreteSprite();
         _local_2 = new LabelBase();
         _local_2.text = localeService.getText(TanksLocale.TEXT_SETTINGS_MOUSE_SENSITIVITY_CHECKBOX_LABEL) + ":";
         _local_1.addChild(_local_2);
         this.mouseSensitivity = new Slider();
         this.mouseSensitivity.maxValue = jegin;
         this.mouseSensitivity.minValue = zifed;
         this.mouseSensitivity.tickInterval = 1;
         this.mouseSensitivity.width = SettingsWindow.daqowuso - MARGIN * 4 - _local_2.width;
         this.mouseSensitivity.x = _local_2.width + MARGIN;
         this.mouseSensitivity.value = settingsService.mouseSensitivity;
         this.mouseSensitivity.addEventListener(SliderEvent.CHANGE_VALUE,this.romacup);
         _local_2.y = Math.round((this.mouseSensitivity.height - _local_2.textHeight) * 0.5) - 2;
         _local_1.addChild(this.mouseSensitivity);
         return _local_1;
      }
      
      private function romacup(_arg_1:SliderEvent) : void
      {
         settingsService.cybyzyjeh(SettingEnum.kaniniqy,this.mouseSensitivity.value);
      }
      
      override public function destroy() : void
      {
         if(!dowiruduj.isMouseLockDisabled())
         {
            this.mouseSensitivity.removeEventListener(SliderEvent.CHANGE_VALUE,this.romacup);
         }
         super.destroy();
      }
   }
}

