package alternativa.tanks.gui.upgrade
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.ItemInfoPanelBitmaps;
   import alternativa.tanks.gui.timer.CountDownTimerWithIcon;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import alternativa.tanks.service.itempropertyparams.Bekipudi;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import base.DiscreteSprite;
   import controls.TankWindowInner;
   import controls.labels.MouseDisabledLabel;
   import controls.timer.CountDownTimer;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class UpgradeInfoForm extends DiscreteSprite
   {
      
      [Inject]
      public static var propertyService:ItemPropertyParamsService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const leftProgressResource:Class = UpgradeInfoForm_leftProgressResource;
      
      private static const centerProgressResource:Class = UpgradeInfoForm_centerProgressResource;
      
      public static const HORIZONTAL_MARGIN:int = 10;
      
      protected var bg:TankWindowInner;
      
      protected var propertyNameLabel:MouseDisabledLabel = new MouseDisabledLabel();
      
      protected var propertyValueLabel:MouseDisabledLabel = new MouseDisabledLabel();
      
      protected var propertyDeltaLabel:MouseDisabledLabel = new MouseDisabledLabel();
      
      private var upgradeProgressValue:MouseDisabledLabel = new MouseDisabledLabel();
      
      private var timerLabel:CountDownTimerWithIcon = new CountDownTimerWithIcon();
      
      private var propertyParams:Bekipudi;
      
      protected var propertyValue:UpgradableItemPropertyValue;
      
      private var icon:Bitmap;
      
      private var progressBar:Bitmap = new Bitmap();
      
      private var textLayer:Sprite = new Sprite();
      
      private var leftProgressPart:Bitmap;
      
      private var centerProgressPart:Bitmap;
      
      private var rightProgressPart:Bitmap;
      
      private var isUpgrading:Boolean = false;
      
      public function UpgradeInfoForm(_arg_1:int, _arg_2:int, _arg_3:UpgradableItemPropertyValue)
      {
         super();
         this.bg = new TankWindowInner(_arg_1,_arg_2,TankWindowInner.GREEN);
         addChild(this.bg);
         this.progressBar.x = 1;
         this.progressBar.y = 1;
         this.progressBar.blendMode = BlendMode.OVERLAY;
         this.bg.addChild(this.progressBar);
         this.bg.addChild(this.textLayer);
         this.propertyParams = propertyService.getParams(_arg_3.getProperty());
         this.icon = this.propertyParams.qafyboqy();
         var _local_4:Bitmap = new Bitmap(ItemInfoPanelBitmaps.backIcon);
         _local_4.x = HORIZONTAL_MARGIN;
         _local_4.y = 1;
         this.putOnLine(_local_4,25);
         this.textLayer.addChild(_local_4);
         this.icon.x = _local_4.x + 1;
         this.icon.y = _local_4.y + 1;
         addChild(this.icon);
         this.textLayer.addChild(this.propertyNameLabel);
         this.textLayer.addChild(this.propertyValueLabel);
         this.textLayer.addChild(this.propertyDeltaLabel);
         this.timerLabel.setRightX(_arg_1 - HORIZONTAL_MARGIN);
         this.textLayer.addChild(this.timerLabel);
         this.timerLabel.visible = false;
         this.propertyValueLabel.textColor = UpgradeColors.GREEN;
         this.textLayer.addChild(this.upgradeProgressValue);
         this.propertyNameLabel.text = this.propertyParams.name + ":";
         this.leftProgressPart = new Bitmap(new leftProgressResource().bitmapData);
         this.centerProgressPart = new Bitmap(new centerProgressResource().bitmapData);
         this.rightProgressPart = new Bitmap(new leftProgressResource().bitmapData);
         this.setProperty(_arg_3);
         this.putOnLine(this.propertyValueLabel,25);
         this.putOnLine(this.propertyNameLabel,25);
         this.putOnLine(this.upgradeProgressValue,25);
         this.putOnLine(this.propertyDeltaLabel,25);
         this.putOnLine(this.timerLabel,25);
         this.align();
      }
      
      public function propertyUpgraded() : void
      {
         this.isUpgrading = false;
         this.setProperty(this.propertyValue);
      }
      
      private function updateColor() : void
      {
         var _local_1:int = UpgradeColors.getColorForValue(this.propertyValue);
         this.upgradeProgressValue.textColor = _local_1;
         if(this.propertyValue.isFullUpgraded())
         {
            this.propertyValueLabel.textColor = _local_1;
         }
      }
      
      public function showTime() : void
      {
         this.timerLabel.visible = true;
      }
      
      public function hideTime() : void
      {
         if(!this.isUpgrading)
         {
            this.timerLabel.visible = false;
         }
      }
      
      private function updateProgressBar() : void
      {
         var _local_1:Shape = null;
         var _local_2:Graphics = null;
         var _local_3:Matrix = null;
         var _local_4:int = this.bg.width - 2;
         var _local_5:int = int(Math.round(_local_4 * this.propertyValue.getLevel() / this.propertyValue.getMaxLevel()));
         if(_local_5 == 0)
         {
            this.progressBar.visible = false;
            return;
         }
         this.progressBar.visible = true;
         this.progressBar.bitmapData = new BitmapData(_local_5,this.leftProgressPart.height,true,0);
         if(_local_5 > 0)
         {
            this.progressBar.bitmapData.draw(this.leftProgressPart);
         }
         if(_local_5 > this.leftProgressPart.width)
         {
            this.centerProgressPart.width = Math.min(_local_5 - this.leftProgressPart.width,_local_4 - this.leftProgressPart.width * 2);
            _local_1 = new Shape();
            _local_2 = _local_1.graphics;
            _local_2.beginBitmapFill(this.centerProgressPart.bitmapData);
            _local_2.drawRect(this.leftProgressPart.width,0,this.centerProgressPart.width,this.centerProgressPart.height);
            _local_2.endFill();
            this.progressBar.bitmapData.draw(_local_1);
         }
         if(_local_5 == _local_4)
         {
            _local_3 = new Matrix(-1,0,0,1,_local_4,0);
            this.progressBar.bitmapData.draw(this.leftProgressPart,_local_3);
         }
      }
      
      private function setProperty(_arg_1:UpgradableItemPropertyValue) : void
      {
         this.propertyValue = _arg_1;
         this.propertyValueLabel.text = _arg_1.getValue();
         this.upgradeProgressValue.text = _arg_1.getLevel() + " / " + _arg_1.getMaxLevel();
         if(_arg_1.getLevel() == _arg_1.getMaxLevel())
         {
            this.textLayer.removeChild(this.propertyDeltaLabel);
         }
         else
         {
            this.propertyDeltaLabel.text = _arg_1.getDelta();
            this.timerLabel.setTime(_arg_1.getTimeInSeconds());
         }
         this.updateProgressBar();
         this.updateColor();
         this.align();
      }
      
      override public function set width(_arg_1:Number) : void
      {
         super.width = _arg_1;
         this.align();
      }
      
      private function align() : void
      {
         this.upgradeProgressValue.x = this.icon.x + 75 - this.upgradeProgressValue.width;
         this.propertyNameLabel.x = this.icon.x + 75 + HORIZONTAL_MARGIN;
         this.propertyValueLabel.x = this.propertyNameLabel.x + this.propertyNameLabel.width;
         this.propertyDeltaLabel.x = this.propertyValueLabel.x + this.propertyValueLabel.width;
      }
      
      protected function putOnLine(_arg_1:DisplayObject, _arg_2:int) : void
      {
         _arg_1.y = int(_arg_2 - _arg_1.height * 0.5);
      }
      
      public function setTimer(_arg_1:CountDownTimer) : void
      {
         this.timerLabel.start(_arg_1);
         this.isUpgrading = true;
         this.showTime();
      }
   }
}

