package alternativa.tanks.models.battle.gui.inventory
{
   import alternativa.tanks.models.battle.gui.inventory.cooldown.CooldownIndicator;
   import alternativa.tanks.models.battle.gui.inventory.cooldown.InventoryCooldownItem;
   import alternativa.tanks.models.battle.gui.inventory.readytouse.LightPillarEffect;
   import alternativa.tanks.models.battle.gui.inventory.splash.SplashColor;
   import alternativa.tanks.models.battle.gui.inventory.splash.SplashController;
   import alternativa.tanks.models.inventory.InventoryItemType;
   import alternativa.tanks.models.inventory.InventoryLock;
   import controls.Label;
   import flash.display.Bitmap;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.geom.ColorTransform;
   import flash.text.TextFieldAutoSize;
   import forms.ColorConstants;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class InventoryPanelSlot
   {
      
      [Inject]
      public static var inventorySoundService:InventorySoundService;
      
      private static const dufusut:int = 10;
      
      private static const hoho:int = 1;
      
      private static const bylip:int = 2;
      
      private static const cilyluz:int = 3;
      
      private static const FONT_SIZE:int = 10;
      
      public static const QUANTITY_COLOR_WHITE:uint = ColorConstants.WHITE;
      
      public static const QUANTITY_COLOR_GRAY:uint = 11711154;
      
      public static const GLOW_FILTER:GlowFilter = new GlowFilter(0,0.8,4,4,3);
      
      private var lightPillarEffect:LightPillarEffect;
      
      private var _slotNumber:int;
      
      private var _slotNumberLabel:Label;
      
      private var _lockIcon:Bitmap;
      
      private var item:InventoryItem;
      
      private var canvas:DisplayObjectContainer;
      
      private var _quantityLabel:Label;
      
      private var rehicos:int;
      
      private var _inventoryIcon:InventoryIcons;
      
      private var tyhedi:int = 3;
      
      private var colorTransform:ColorTransform;
      
      private var _cooldownItem:InventoryCooldownItem;
      
      private var _splashController:SplashController;
      
      private var refywoh:int;
      
      private var sakuf:Number = 1;
      
      public function InventoryPanelSlot(_arg_1:int)
      {
         var _local_1:Sprite = null;
         this.colorTransform = new ColorTransform();
         super();
         this.lightPillarEffect = new LightPillarEffect();
         this._slotNumber = _arg_1;
         this.canvas = new Sprite();
         this.canvas.addChild(this.lightPillarEffect);
         _local_1 = new Sprite();
         this.canvas.addChild(_local_1);
         this._inventoryIcon = new InventoryIcons(this._slotNumber);
         if(GPUCapabilities.gpuEnabled)
         {
            _local_1.blendMode = BlendMode.ADD;
         }
         this._slotNumberLabel = new Label();
         this._slotNumberLabel.size = dufusut;
         this._slotNumberLabel.text = _arg_1.toString();
         this._slotNumberLabel.x = this._inventoryIcon.width - this._slotNumberLabel.width - 2;
         this._slotNumberLabel.y = this._inventoryIcon.height - this._slotNumberLabel.height;
         var _local_2:Bitmap = new Bitmap(HudInventoryIcon.getIcon(HudInventoryIcon.BORDER));
         var _local_3:Bitmap = new Bitmap(HudInventoryIcon.getIcon(HudInventoryIcon.BGD));
         var _local_4:CooldownIndicator = new CooldownIndicator(HudInventoryIcon.getIcon(HudInventoryIcon.COOLDOWN_OVERLAY));
         var _local_5:CooldownIndicator = new CooldownIndicator(HudInventoryIcon.getBgdIcon(this._slotNumber));
         this._lockIcon = new Bitmap(HudInventoryIcon.getIcon(HudInventoryIcon.LOCK_OVERLAY));
         this._quantityLabel = new Label();
         this._quantityLabel.width = this._inventoryIcon.width;
         this._quantityLabel.autoSize = TextFieldAutoSize.CENTER;
         this._quantityLabel.filters = [GLOW_FILTER];
         _local_1.addChild(_local_3);
         _local_1.addChild(_local_2);
         _local_1.addChild(_local_4);
         _local_1.addChild(_local_5);
         _local_1.addChild(this._inventoryIcon);
         _local_1.addChild(this._slotNumberLabel);
         _local_1.addChild(this._quantityLabel);
         _local_1.addChild(this._lockIcon);
         this._splashController = new SplashController(_local_1);
         this._cooldownItem = new InventoryCooldownItem(this._slotNumber,_local_5,_local_4,this._splashController,this._inventoryIcon,this.finishEffectAndCooldown,this.onStartCooldown);
         this.weq(InventoryLock.PLAYER_INACTIVE,true);
      }
      
      private function finishShowStateSplash() : void
      {
         this.updateVisibleSlotNumberAndQuantityLabels();
      }
      
      public function weq(_arg_1:int, _arg_2:Boolean) : void
      {
         if(_arg_2)
         {
            this.rehicos |= _arg_1;
         }
         else
         {
            this.tryIndicateActivationWithSplash(_arg_1);
            this.rehicos &= ~_arg_1;
         }
         if(_arg_1 == InventoryLock.PLAYER_INACTIVE)
         {
            if(_arg_2)
            {
               this._inventoryIcon.state = InventoryIcons.NEUTRAL_STATE;
               this._splashController.stopFlash();
               this._cooldownItem.destroy();
            }
            else
            {
               this.startFlash(this.finishShowStateSplash);
            }
         }
         if(_arg_2)
         {
            this._splashController.stopFlash();
         }
         this.updateVisibleSlotNumberAndQuantityLabels();
         this.updateVisibleLockIcon();
      }
      
      private function tryIndicateActivationWithSplash(_arg_1:int) : void
      {
         if(this._slotNumber == InventoryItemType.FIRST_AID || this._slotNumber == InventoryItemType.MINE || this._slotNumber == InventoryItemType.GOLD)
         {
            if(this.isLocked() && !this._cooldownItem.isActive() && this.getInventoryCount() > 0 && _arg_1 == InventoryLock.FORCED)
            {
               this._splashController.startFlash(SplashColor.getColor(this._slotNumber));
               this.startLightPillarEffect();
            }
         }
      }
      
      private function updateVisibleSlotNumberAndQuantityLabels() : void
      {
         this.updateVisibleSlotNumberLabel();
         this.updateVisibleQuantityLabel();
      }
      
      private function updateVisibleLockIcon() : void
      {
         if(this.isLocked())
         {
            this._splashController.stopFlash();
            this._lockIcon.visible = true;
         }
         else
         {
            this._lockIcon.visible = this.needLock();
            if(!this._cooldownItem.isActive())
            {
               this._inventoryIcon.state = InventoryIcons.NEUTRAL_STATE;
            }
         }
      }
      
      private function updateVisibleSlotNumberLabel() : void
      {
         if(this.item == null)
         {
            this._slotNumberLabel.visible = false;
         }
         if(this.isLocked())
         {
            this._slotNumberLabel.visible = false;
         }
         else if(this._cooldownItem.isActive())
         {
            this._slotNumberLabel.visible = false;
         }
         else
         {
            this._slotNumberLabel.visible = this.getInventoryCount() > 0;
         }
      }
      
      public function getInventoryCount() : int
      {
         if(this.item != null)
         {
            return this.item.count;
         }
         return 0;
      }
      
      private function updateVisibleQuantityLabel() : void
      {
         if(this._cooldownItem.isActive())
         {
            if(!this._cooldownItem.isEffectActive() && this._cooldownItem.isCooldownActive())
            {
               this._quantityLabel.color = QUANTITY_COLOR_GRAY;
            }
         }
         else if(this.isLocked() || this.needLock())
         {
            this._quantityLabel.color = QUANTITY_COLOR_GRAY;
         }
         else
         {
            this._quantityLabel.color = QUANTITY_COLOR_WHITE;
         }
         this._quantityLabel.visible = !this.needLock();
      }
      
      private function needLock() : Boolean
      {
         return this.getInventoryCount() <= 0;
      }
      
      public function isLocked() : Boolean
      {
         return this.rehicos != 0;
      }
      
      public function sudywa() : DisplayObject
      {
         return this.canvas;
      }
      
      public function setItem(_arg_1:InventoryItem) : void
      {
         if(this.item == _arg_1)
         {
            return;
         }
         if(this.item != null)
         {
            this.hawi();
         }
         this.item = _arg_1;
         this.sohetu();
      }
      
      private function finishEffectAndCooldown() : void
      {
         if(this._cooldownItem.isCooldownActive())
         {
            this._inventoryIcon.state = InventoryIcons.COOLDOWN_STATE;
         }
         else
         {
            this._inventoryIcon.state = InventoryIcons.NEUTRAL_STATE;
            this.startFlash(this.finishShowStateSplash);
            this._quantityLabel.color = QUANTITY_COLOR_WHITE;
         }
      }
      
      private function startFlash(param1:Function = null) : void
      {
         this._splashController.startFlash(SplashColor.getColor(this._slotNumber),param1);
      }
      
      private function onStartCooldown() : void
      {
         this._quantityLabel.visible = true;
         this._quantityLabel.color = QUANTITY_COLOR_GRAY;
         this._inventoryIcon.state = InventoryIcons.COOLDOWN_STATE;
      }
      
      public function changeEffectTime(_arg_1:int, _arg_2:Boolean) : void
      {
         this._cooldownItem.changeEffectTime(_arg_1,_arg_2);
         this.updateVisibleSlotNumberAndQuantityLabels();
         this.updateVisibleLockIcon();
      }
      
      private function hawi() : void
      {
         var _local_1:InventoryIcons = this.item.getIcon();
         if(this.canvas.contains(_local_1))
         {
            this.canvas.removeChild(_local_1);
         }
      }
      
      private function safogydu() : void
      {
         if(this._quantityLabel == null)
         {
            this._quantityLabel = new Label();
            this._quantityLabel.size = dufusut;
            this.canvas.addChild(this._quantityLabel);
         }
      }
      
      private function wuwagoh() : void
      {
         if(!this.canvas.contains(this._inventoryIcon))
         {
            if(this.item != null)
            {
               this.hawi();
            }
            this.canvas.addChildAt(this._inventoryIcon,0);
         }
         if(this._quantityLabel != null)
         {
            this._quantityLabel.visible = false;
         }
      }
      
      public function activateCooldown(param1:int) : void
      {
         this._cooldownItem.activateCooldown(param1);
         this.updateVisibleSlotNumberAndQuantityLabels();
         this.updateVisibleLockIcon();
      }
      
      public function activateDependedCooldown(param1:int) : void
      {
         if(this.getInventoryCount() > 0)
         {
            this._cooldownItem.activateDependedCooldown(param1);
            this.updateVisibleSlotNumberAndQuantityLabels();
            this.updateVisibleLockIcon();
         }
      }
      
      public function getSlotNumber() : int
      {
         return this._slotNumber;
      }
      
      public function getItem() : InventoryItem
      {
         return this.item;
      }
      
      public function update(_arg_1:int) : void
      {
         var _local_2:Number = NaN;
         this._splashController.update(_arg_1);
         this._cooldownItem.update(_arg_1);
         this.lightPillarEffect.update(_arg_1);
         if(this.item != null)
         {
            if(this.isLocked() || this.item.count == 0)
            {
               this.sakuf = 1;
            }
            else
            {
               _local_2 = this.item.myzehal(_arg_1);
               if(_local_2 == 1)
               {
                  if(this.sakuf < 1)
                  {
                     this.felonubi(_arg_1);
                  }
                  this.gajowa(_arg_1);
               }
               else
               {
                  this.qubucok();
               }
               this.sakuf = _local_2;
            }
         }
      }
      
      public function sohetu() : void
      {
         if(this.item != null)
         {
            if(this.item.count > 0)
            {
               this._quantityLabel.text = this.item.count.toString();
               this._quantityLabel.x = this.item.getIcon().width / 2 - this._quantityLabel.width / 2;
               this._quantityLabel.y = -this._quantityLabel.height;
               this._quantityLabel.visible = true;
            }
            else
            {
               this.wuwagoh();
            }
         }
      }
      
      public function gajowa(_arg_1:int) : void
      {
         var _local_2:uint = 255;
         var _local_3:uint = 100;
         var _local_4:uint = 300;
         switch(this.tyhedi)
         {
            case hoho:
               if(_arg_1 < this.refywoh + _local_3)
               {
                  this.tulovosu(_local_2 * (_arg_1 - this.refywoh) / _local_3);
               }
               else
               {
                  this.tulovosu(_local_2);
                  this.refywoh += _local_3 + _local_4;
                  this.tyhedi = bylip;
               }
               return;
            case bylip:
               if(_arg_1 < this.refywoh)
               {
                  this.tulovosu(_local_2 * (this.refywoh - _arg_1) / _local_4);
                  break;
               }
               this.qubucok();
         }
      }
      
      private function tulovosu(_arg_1:uint) : void
      {
         this.colorTransform.redOffset = _arg_1;
         this.colorTransform.greenOffset = _arg_1;
         this.colorTransform.blueOffset = _arg_1;
         this.colorTransform.alphaOffset = _arg_1;
         this.canvas.transform.colorTransform = this.colorTransform;
      }
      
      public function felonubi(_arg_1:int) : void
      {
         this.tyhedi = hoho;
         this.refywoh = _arg_1;
      }
      
      public function startInfiniteEffect(param1:Boolean) : void
      {
         this._cooldownItem.activateInfinite();
      }
      
      public function cooldownIsActivated() : Boolean
      {
         return this._cooldownItem.isActive();
      }
      
      private function qubucok() : void
      {
         if(this.tyhedi != cilyluz)
         {
            this.tyhedi = cilyluz;
            this.tulovosu(0);
            this.startLightPillarEffect();
         }
      }
      
      private function startLightPillarEffect() : void
      {
         this.lightPillarEffect.init(HudInventoryIcon.getIndicatorColor(this._slotNumber));
         this.lightPillarEffect.y = -this.lightPillarEffect.height + this._inventoryIcon.width - 2;
         this.lightPillarEffect.start();
      }
      
      public function setCooldownDuration(_arg_1:int) : void
      {
         this._cooldownItem.setCooldownDuration(_arg_1);
      }
   }
}

