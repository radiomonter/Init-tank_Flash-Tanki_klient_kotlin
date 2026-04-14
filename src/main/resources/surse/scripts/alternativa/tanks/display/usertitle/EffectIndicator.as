package alternativa.tanks.display.usertitle
{
   import alternativa.tanks.display.EffectBlinkerUtil;
   import alternativa.tanks.models.inventory.InventoryItemType;
   import alternativa.tanks.sfx.Blinker;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import obfuscation.modo.Johad;
   
   public class EffectIndicator
   {
      
      private static var icons:Dictionary;
      
      private static var iconRect:Rectangle;
      
      private static const STATE_HIDDEN:int = 1;
      
      private static const STATE_PREPARED:int = 2;
      
      private static const STATE_VISIBLE:int = 4;
      
      private static const STATE_HIDING:int = 8;
      
      private static const UNKILLABLE_EFFECT_LEVEL:int = 2;
      
      private static const iconHealthCls:Class = EffectIndicator_iconHealthCls;
      
      private static const iconArmorCls:Class = EffectIndicator_iconArmorCls;
      
      private static const iconPowerCls:Class = EffectIndicator_iconPowerCls;
      
      private static const iconNitroCls:Class = EffectIndicator_iconNitroCls;
      
      private static const ultimateCls:Class = EffectIndicator_ultimateCls;
      
      private static const gisofosep:Class = Zahef;
      
      private static const vozybymab:BitmapData = Bitmap(new gisofosep()).bitmapData;
      
      private static var matrix:Matrix = new Matrix();
      
      private var _effectId:int;
      
      private var icon:BitmapData;
      
      private var blinkingPeriod:int;
      
      private var colorTransform:ColorTransform = new ColorTransform();
      
      private var blinkingStartTime:int;
      
      private var finishTime:int;
      
      private var blinker:Blinker;
      
      private var alpha:Number = 1;
      
      private var needRedraw:Boolean;
      
      private var x:int;
      
      private var y:int;
      
      private var userTitle:UserTitle;
      
      private var state:int;
      
      private var blinking:Boolean;
      
      public var activeAfterDeath:Boolean;
      
      public var effectLevel:int;
      
      public function EffectIndicator(_arg_1:int, _arg_2:UserTitle)
      {
         super();
         if(icons == null)
         {
            initIcons();
         }
         this._effectId = _arg_1;
         this.icon = icons[_arg_1];
         this.userTitle = _arg_2;
         this.blinkingPeriod = EffectBlinkerUtil.getBlinkingPeriod(_arg_1);
         this.blinker = EffectBlinkerUtil.createBlinker(_arg_1);
         this.state = STATE_HIDDEN;
      }
      
      private static function initIcons() : void
      {
         icons = new Dictionary();
         icons[Johad.hocypo] = Bitmap(new iconHealthCls()).bitmapData;
         icons[Johad.ARMOR] = Bitmap(new iconArmorCls()).bitmapData;
         icons[Johad.ryjozywih] = Bitmap(new iconPowerCls()).bitmapData;
         icons[Johad.husyb] = Bitmap(new iconNitroCls()).bitmapData;
         icons[InventoryItemType.ULTIMATE] = Bitmap(new ultimateCls()).bitmapData;
         iconRect = BitmapData(icons[Johad.hocypo]).rect;
      }
      
      public function get effectId() : int
      {
         return this._effectId;
      }
      
      public function isVisible() : Boolean
      {
         return (this.state & STATE_VISIBLE) != 0;
      }
      
      public function isHidden() : Boolean
      {
         return this.state == STATE_HIDDEN;
      }
      
      public function show(_arg_1:int, _arg_2:Boolean, _arg_3:int) : void
      {
         this.activeAfterDeath = _arg_2;
         this.state &= ~STATE_HIDING;
         if(this.state != STATE_VISIBLE || this.alpha != 1 || this.effectLevel != _arg_3)
         {
            this.needRedraw = true;
         }
         this.effectLevel = _arg_3;
         this.finishTime = getTimer() + _arg_1;
         this.blinkingStartTime = this.finishTime - this.blinkingPeriod;
         this.blinking = false;
         this.alpha = 1;
         if(this.state == STATE_HIDDEN)
         {
            this.state = STATE_PREPARED;
         }
      }
      
      public function hide() : void
      {
         if(this.activeAfterDeath)
         {
            return;
         }
         if(this.state == STATE_PREPARED || this._effectId == InventoryItemType.ULTIMATE && this.state != STATE_HIDDEN)
         {
            this.userTitle.doHideIndicator(this);
            this.state = STATE_HIDDEN;
            return;
         }
         if((this.state & (STATE_HIDDEN | STATE_HIDING)) != 0)
         {
            return;
         }
         this.state |= STATE_HIDING;
         this.blinker.robop(0);
         if(!this.blinking)
         {
            this.blinkingStartTime = 0;
            this.blinker.init(getTimer());
            this.blinking = true;
         }
      }
      
      public function clear(_arg_1:BitmapData) : void
      {
         if(this.state == STATE_HIDDEN || this.state == STATE_PREPARED)
         {
            return;
         }
         iconRect.x = this.x;
         iconRect.y = this.y;
         _arg_1.fillRect(iconRect,0);
      }
      
      public function setPosition(_arg_1:int, _arg_2:int) : void
      {
         this.x = _arg_1;
         this.y = _arg_2;
         this.needRedraw = true;
      }
      
      public function forceRedraw() : void
      {
         this.needRedraw = true;
      }
      
      public function update(_arg_1:int, _arg_2:int, _arg_3:BitmapData) : void
      {
         if(this.state == STATE_HIDDEN)
         {
            return;
         }
         if(this.needRedraw)
         {
            this.draw(_arg_3);
            this.needRedraw = false;
         }
         if(this._effectId != InventoryItemType.ULTIMATE && _arg_1 > this.blinkingStartTime)
         {
            this.updateBlinking(_arg_1,_arg_2,_arg_3);
         }
         if(this.effectId == Johad.hocypo && _arg_1 > this.finishTime)
         {
            this.hide();
         }
         if(this.state == STATE_PREPARED)
         {
            this.state = STATE_VISIBLE;
         }
      }
      
      private function updateBlinking(_arg_1:int, _arg_2:int, _arg_3:BitmapData) : void
      {
         var _local_4:Number = NaN;
         if(this.blinking)
         {
            _local_4 = this.blinker.cusyrun(_arg_1,_arg_2);
            if(_local_4 != this.alpha)
            {
               this.alpha = _local_4;
               this.draw(_arg_3);
            }
            if((this.state & STATE_HIDING) != 0 && this.alpha == 0)
            {
               this.userTitle.doHideIndicator(this);
               this.state = STATE_HIDDEN;
            }
         }
         else
         {
            this.blinker.robop(EffectBlinkerUtil.MIN_VALUE);
            this.blinker.init(_arg_1);
            this.blinking = true;
         }
      }
      
      private function draw(_arg_1:BitmapData) : void
      {
         this.clear(_arg_1);
         matrix.tx = this.x;
         matrix.ty = this.y;
         this.colorTransform.alphaMultiplier = this.alpha;
         _arg_1.draw(this.getIndicatorIcon(),matrix,this.colorTransform,null,null,true);
      }
      
      private function getIndicatorIcon() : BitmapData
      {
         return this._effectId == Johad.ARMOR && this.effectLevel == UNKILLABLE_EFFECT_LEVEL ? vozybymab : this.icon;
      }
   }
}

