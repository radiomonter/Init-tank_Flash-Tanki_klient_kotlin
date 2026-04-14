package alternativa.tanks.models.battle.gui.ultimate
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.models.battle.gui.inventory.HudInventoryIcon;
   import alternativa.tanks.models.battle.gui.inventory.InventoryIcons;
   import alternativa.tanks.models.battle.gui.inventory.InventoryPanelSlot;
   import alternativa.tanks.models.battle.gui.inventory.UltimateIcon;
   import alternativa.tanks.models.battle.gui.inventory.cooldown.CooldownIndicator;
   import alternativa.tanks.models.battle.gui.inventory.splash.SplashColor;
   import alternativa.tanks.models.battle.gui.inventory.splash.SplashController;
   import alternativa.tanks.models.inventory.InventoryItemType;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import controls.Label;
   import flash.display.Bitmap;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.utils.clearInterval;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import forms.ColorConstants;
   
   public class UltimateIndicator
   {
      
      private static const PANEL_OFFSET_Y:int = 50;
      
      private static const KEY_ICON_OFFSET_X:int = -6;
      
      private static const KEY_ICON_OFFSET_Y:int = -20;
      
      private static const ICON_SIZE:int = 78;
      
      [Inject]
      public static var battleGuiService:BattleGUIService = BattleGUIService(OSGi.getInstance().getService(BattleGUIService));
      
      private var splashController:SplashController;
      
      private var inventoryIcon:InventoryIcons;
      
      private var lockIcon:Bitmap;
      
      private var disabled:Boolean = true;
      
      private var charged:Boolean;
      
      private var resizeTimer:uint;
      
      private var flashTimer:uint;
      
      private var cooldownIndicator:CooldownIndicator;
      
      private var baseContainer:Sprite;
      
      private var percentLabel:Label;
      
      private var keyLabel:Label;
      
      private var display:DisplayObjectContainer;
      
      public function UltimateIndicator(param1:int)
      {
         var _loc2_:Sprite = null;
         var _loc3_:CooldownIndicator = null;
         this.cooldownIndicator = new CooldownIndicator(HudInventoryIcon.getIcon(HudInventoryIcon.OVERDRIVE_COOLDOWN_OVERLAY));
         this.baseContainer = new Sprite();
         this.percentLabel = new Label();
         this.keyLabel = new Label();
         this.display = IDisplay(OSGi.getInstance().getService(IDisplay)).contentUILayer;
         super();
         _loc2_ = new Sprite();
         this.baseContainer.addChild(_loc2_);
         var _loc4_:Bitmap = new Bitmap(HudInventoryIcon.getIcon(HudInventoryIcon.OVERDRIVE_BG));
         _loc2_.addChild(_loc4_);
         _loc3_ = new CooldownIndicator(HudInventoryIcon.getBgdIcon(InventoryItemType.ULTIMATE));
         this.inventoryIcon = new UltimateIcon(param1);
         _loc2_.addChild(this.inventoryIcon);
         _loc2_.addChild(this.cooldownIndicator);
         this.keyLabel.text = "Shift";
         this.keyLabel.x = ICON_SIZE - this.keyLabel.width + KEY_ICON_OFFSET_X;
         this.keyLabel.y = ICON_SIZE + KEY_ICON_OFFSET_Y;
         this.keyLabel.visible = false;
         _loc2_.addChild(this.keyLabel);
         this.percentLabel.y = -19;
         this.percentLabel.color = ColorConstants.WHITE;
         this.percentLabel.autoSize = TextFieldAutoSize.CENTER;
         this.percentLabel.filters = [new GlowFilter(0,0.8,4,4,3)];
         _loc2_.addChild(this.percentLabel);
         this.setPercentText(0);
         this.lockIcon = new Bitmap(HudInventoryIcon.getIcon(HudInventoryIcon.OVERDRIVE_COOLDOWN_OVERLAY));
         this.lockIcon.visible = true;
         _loc2_.addChild(this.lockIcon);
         _loc2_.addChild(_loc3_);
         this.splashController = new SplashController(_loc2_);
         this.onResize();
         _loc2_.visible = true;
         battleGuiService.fez().addChild(this.baseContainer);
         this.display.stage.addEventListener(Event.RESIZE,this.onResize,false,int.MIN_VALUE);
         this.display.stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function startCooldownCallback() : void
      {
      }
      
      public function markDisabled(param1:Boolean) : void
      {
         this.disabled = param1;
         this.updateState();
      }
      
      private function updateState() : void
      {
         this.disableVisual(this.disabled || !this.charged);
      }
      
      private function disableVisual(param1:Boolean) : void
      {
         this.keyLabel.visible = !param1;
         this.lockIcon.visible = param1;
         this.percentLabel.color = param1 ? InventoryPanelSlot.QUANTITY_COLOR_GRAY : InventoryPanelSlot.QUANTITY_COLOR_WHITE;
      }
      
      public function updateCharge(param1:int) : void
      {
         this.charged = param1 >= 100;
         this.setPercentText(param1);
         this.cooldownIndicator.setProgress(param1 / 100,1);
         this.updateState();
      }
      
      private function setPercentText(param1:int) : void
      {
         this.percentLabel.text = param1.toString() + " %";
         this.percentLabel.x = ICON_SIZE - this.percentLabel.width >> 1;
      }
      
      public function onCharged() : void
      {
         this.keyLabel.visible = true;
         this.inventoryIcon.state = InventoryIcons.NEUTRAL_STATE;
         this.flashIcon();
         this.flashTimer = setTimeout(this.flashIcon,350);
      }
      
      private function flashIcon() : void
      {
         this.clearFlashTimer();
         this.splashController.startFlash(SplashColor.WHITE);
      }
      
      private function onResize(param1:Event = null) : void
      {
         if(this.resizeTimer == 0)
         {
            this.resizeTimer = setTimeout(this.doResize,0);
         }
      }
      
      private function doResize() : void
      {
         this.baseContainer.x = 10;
         this.baseContainer.y = this.display.stage.stageHeight - PANEL_OFFSET_Y - 40;
         this.clearResizeTimer();
      }
      
      public function destroy() : void
      {
         this.display.removeChild(this.baseContainer);
         this.display.stage.removeEventListener(Event.RESIZE,this.onResize);
         this.display.stage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         this.percentLabel = null;
         this.baseContainer = null;
         this.lockIcon = null;
         this.clearFlashTimer();
         this.clearResizeTimer();
      }
      
      public function activate() : void
      {
         this.keyLabel.visible = false;
      }
      
      private function finishEffectAndCooldown() : void
      {
         this.inventoryIcon.state = InventoryIcons.COOLDOWN_STATE;
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:int = getTimer();
         this.splashController.update(_loc2_);
      }
      
      private function clearFlashTimer() : void
      {
         if(this.flashTimer != 0)
         {
            clearInterval(this.flashTimer);
            this.flashTimer = 0;
         }
      }
      
      private function clearResizeTimer() : void
      {
         if(this.resizeTimer != 0)
         {
            clearTimeout(this.resizeTimer);
            this.resizeTimer = 0;
         }
      }
      
      public function effectActivatedOrMerged(param1:int) : void
      {
      }
      
      public function effectDeactivated() : void
      {
      }
   }
}

