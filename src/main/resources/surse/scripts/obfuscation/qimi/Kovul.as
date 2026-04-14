package obfuscation.qimi
{
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.service.settings.SettingEnum;
   import controls.TankWindowInner;
   import controls.checkbox.TankCheckBox;
   import flash.events.MouseEvent;
   import obfuscation.meruninu.GridLayout;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Kovul extends Jin
   {
      
      private var performanceInner:TankWindowInner;
      
      private var cbShowFPS:TankCheckBox;
      
      private var cbAdaptiveFPS:TankCheckBox;
      
      private var cbShowSkyBox:TankCheckBox;
      
      private var cbAntialiasing:TankCheckBox;
      
      private var cbDynamicLighting:TankCheckBox;
      
      private var cbMipMapping:TankCheckBox;
      
      private var cbFog:TankCheckBox;
      
      private var cbTankShadow:TankCheckBox;
      
      private var cbDynamicShadows:TankCheckBox;
      
      private var cbSoftParticles:TankCheckBox;
      
      private var cbDust:TankCheckBox;
      
      private var cbSSAO:TankCheckBox;
      
      private var cbGraphicsAutoQuality:TankCheckBox;
      
      public function Kovul()
      {
         var _local_1:int = 0;
         super();
         this.performanceInner = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         this.performanceInner.width = SettingsWindow.daqowuso;
         this.performanceInner.x = this.performanceInner.y = 0;
         addChild(this.performanceInner);
         this.cbShowFPS = createCheckBox(SettingEnum.sujutyb,localeService.getText(TanksLocale.TEXT_SETTINGS_SHOW_FPS_CHECKBOX),settingsService.showFPS);
         addChild(this.cbShowFPS);
         this.cbAdaptiveFPS = createCheckBox(SettingEnum.batenyqo,localeService.getText(TanksLocale.TEXT_SETTINGS_ENABLE_ADAPTIVE_FPS_CHECKBOX_LABEL_TEXT),settingsService.adaptiveFPS);
         addChild(this.cbAdaptiveFPS);
         this.cbShowSkyBox = createCheckBox(SettingEnum.lume,localeService.getText(TanksLocale.TEXT_SETTINGS_SHOW_SKYBOX_CHECKBOX_LABEL_TEXT),settingsService.showSkyBox);
         addChild(this.cbShowSkyBox);
         this.cbMipMapping = createCheckBox(SettingEnum.ziqufyred,localeService.getText(TanksLocale.TEXT_SETTINGS_MIPMAPPING_LABEL_TEXT),settingsService.mipMapping);
         addChild(this.cbMipMapping);
         var _local_2:GridLayout = new GridLayout(MARGIN,MARGIN,SettingsWindow.daqowuso * 0.5,this.cbShowFPS.height + MARGIN);
         if(this.seqyzu())
         {
            this.cbFog = createCheckBox(SettingEnum.FOG,localeService.getText(TanksLocale.TEXT_SETTINGS_FOG_LABEL_TEXT),settingsService.fog);
            addChild(this.cbFog);
            this.cbTankShadow = createCheckBox(SettingEnum.qosasor,localeService.getText(TanksLocale.TEXT_SETTINGS_SHADOWS_LABEL_TEXT),settingsService.shadows);
            addChild(this.cbTankShadow);
            this.cbDynamicShadows = createCheckBox(SettingEnum.dugydip,localeService.getText(TanksLocale.TEXT_SETTINGS_DYNAMIC_SHADOWS_LABEL_TEXT),settingsService.dynamicShadows);
            addChild(this.cbDynamicShadows);
            this.cbSoftParticles = createCheckBox(SettingEnum.jyvut,localeService.getText(TanksLocale.TEXT_SETTINGS_SOFT_PARTICLES_LABEL_TEXT),settingsService.wobyza);
            addChild(this.cbSoftParticles);
            this.cbSoftParticles.addEventListener(MouseEvent.CLICK,this.onSoftParticlesClick);
            this.cbDust = createCheckBox(SettingEnum.metyci,localeService.getText(TanksLocale.TEXT_SETTINGS_DUST_LABEL_TEXT),settingsService.dust);
            addChild(this.cbDust);
            this.cbSSAO = createCheckBox(SettingEnum.SSAO,localeService.getText(TanksLocale.TEXT_SETTINGS_SSAO),settingsService.ssao);
            addChild(this.cbSSAO);
            this.cbAntialiasing = createCheckBox(SettingEnum.haqinecy,localeService.getText(TanksLocale.TEXT_SETTINGS_ANTIALIASING),settingsService.antialiasing);
            addChild(this.cbAntialiasing);
            this.cbDynamicLighting = createCheckBox(SettingEnum.jifedag,localeService.getText(TanksLocale.TEXT_SETTINGS_DYNAMIC_LIGHTING),settingsService.dynamicLighting);
            addChild(this.cbDynamicLighting);
            this.createGraphicsAutoQualityCheckBox();
            _local_1 = this.layoutPerformanceFull(_local_2);
            if(this.cbGraphicsAutoQuality.checked)
            {
               _local_1 = this.cbGraphicsAutoQuality.y + this.cbGraphicsAutoQuality.height;
            }
         }
         else
         {
            _local_1 = this.layoutPerformanceConstrained(_local_2);
         }
         this.performanceInner.height = _local_1 + MARGIN;
      }
      
      private function seqyzu() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained;
      }
      
      private function onSoftParticlesClick(_arg_1:MouseEvent) : void
      {
         this.checkDustAvailable();
      }
      
      private function checkDustAvailable() : void
      {
         this.cbDust.visible = Boolean(this.cbSoftParticles) && !this.cbGraphicsAutoQuality.checked && this.cbSoftParticles.checked;
      }
      
      private function createGraphicsAutoQualityCheckBox() : void
      {
         this.cbGraphicsAutoQuality = createCheckBox(SettingEnum.rec,localeService.getText(TanksLocale.TEXT_SETTINGS_GRAPHICS_AUTO_QUALITY),settingsService.graphicsAutoQuality);
         addChild(this.cbGraphicsAutoQuality);
         this.onGraphicsAutQualityClick();
         this.cbGraphicsAutoQuality.addEventListener(MouseEvent.CLICK,this.onGraphicsAutQualityClick);
      }
      
      private function onGraphicsAutQualityClick(_arg_1:MouseEvent = null) : void
      {
         var _local_2:* = !this.cbGraphicsAutoQuality.checked;
         this.cbFog.visible = _local_2;
         this.cbTankShadow.visible = _local_2;
         this.cbDynamicShadows.visible = _local_2;
         this.cbSoftParticles.visible = _local_2;
         this.cbSSAO.visible = _local_2;
         this.cbDynamicLighting.visible = _local_2;
         this.cbAntialiasing.visible = _local_2;
         this.performanceInner.height = !_local_2 ? Number(3 * this.cbShowFPS.height + 4 * MARGIN) : Number(7 * this.cbShowFPS.height + 8 * MARGIN);
         this.checkDustAvailable();
      }
      
      private function layoutPerformanceConstrained(_arg_1:GridLayout) : int
      {
         return _arg_1.layout([[this.cbShowFPS,this.cbAdaptiveFPS],[this.cbShowSkyBox,this.cbMipMapping]]);
      }
      
      private function layoutPerformanceFull(_arg_1:GridLayout) : int
      {
         return _arg_1.layout([[this.cbShowFPS,this.cbAdaptiveFPS],[this.cbShowSkyBox,this.cbMipMapping],[this.cbGraphicsAutoQuality],[this.cbDynamicShadows,this.cbSSAO],[this.cbDynamicLighting,this.cbFog],[this.cbTankShadow,this.cbAntialiasing],[this.cbSoftParticles,this.cbDust]]);
      }
      
      override public function destroy() : void
      {
         if(this.seqyzu())
         {
            this.cbGraphicsAutoQuality.removeEventListener(MouseEvent.CLICK,this.onGraphicsAutQualityClick);
            this.cbSoftParticles.removeEventListener(MouseEvent.CLICK,this.onSoftParticlesClick);
         }
         super.destroy();
      }
   }
}

