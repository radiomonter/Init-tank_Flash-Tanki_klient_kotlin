package alternativa.tanks.gui
{
   import alternativa.tanks.gui.upgrade.UpgradeColors;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import assets.Diamond;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import forms.ranks.SmallRankIcon;
   
   public class ModInfoRow extends Sprite
   {
      
      private static const RANK_WIDTH:int = 13;
      
      public const h:int = 17;
      
      public const hSpace:int = 10;
      
      private var isSelected:Boolean = false;
      
      public var labels:Vector.<LabelBase>;
      
      public var costLabel:LabelBase;
      
      public var crystalIcon:Diamond;
      
      public var rankIcon:SmallRankIcon;
      
      public var upgradeIndicator:UpgradeIndicator;
      
      public var costWidth:int;
      
      private var numberProperties:int = 0;
      
      private var _width:int;
      
      public function ModInfoRow(_arg_1:int, _arg_2:int)
      {
         var _local_3:LabelBase = null;
         var _local_4:int = 0;
         super();
         this._width = _arg_2;
         this.labels = new Vector.<LabelBase>(8);
         while(_local_4 < 8)
         {
            _local_3 = new LabelBase();
            _local_3.color = 16777215;
            _local_3.align = TextFormatAlign.CENTER;
            _local_3.text = "ABC123";
            addChild(_local_3);
            this.labels[_local_4] = _local_3;
            _local_3.y = this.h - _local_3.height >> 1;
            _local_4++;
         }
         this.costLabel = new LabelBase();
         this.costLabel.color = 16777215;
         this.costLabel.align = TextFormatAlign.RIGHT;
         this.costLabel.text = "ABC123";
         addChild(this.costLabel);
         this.costLabel.y = this.h - this.costLabel.height >> 1;
         this.crystalIcon = new Diamond();
         addChild(this.crystalIcon);
         this.crystalIcon.y = this.h - this.crystalIcon.height >> 1;
         this.rankIcon = new SmallRankIcon();
         addChild(this.rankIcon);
         this.rankIcon.y = (this.h - this.rankIcon.height >> 1) + 1;
         this.upgradeIndicator = new UpgradeIndicator(_arg_1);
         addChild(this.upgradeIndicator);
         this.upgradeIndicator.y = (this.h - this.upgradeIndicator.height >> 1) + 1;
      }
      
      public function select() : void
      {
         var _local_1:LabelBase = null;
         var _local_2:int = 0;
         while(_local_2 < 8)
         {
            _local_1 = this.labels[_local_2] as LabelBase;
            _local_1.color = 16777215;
            _local_1.sharpness = -100;
            _local_1.thickness = 100;
            _local_2++;
         }
         this.costLabel.sharpness = -100;
         this.costLabel.thickness = 100;
         this.isSelected = true;
      }
      
      public function unselect() : void
      {
         var _local_1:LabelBase = null;
         var _local_2:int = 0;
         while(_local_2 < 8)
         {
            _local_1 = this.labels[_local_2] as LabelBase;
            _local_1.color = 16777215;
            _local_1.sharpness = 50;
            _local_1.thickness = -50;
            _local_2++;
         }
         this.costLabel.color = 16777215;
         this.costLabel.sharpness = 50;
         this.costLabel.thickness = -50;
         this.isSelected = false;
      }
      
      public function setLabelsNum(_arg_1:int) : void
      {
         var _local_2:int = 0;
         this.numberProperties = _arg_1;
         while(_local_2 < this.labels.length)
         {
            if(_local_2 < _arg_1)
            {
               (this.labels[_local_2] as LabelBase).visible = true;
            }
            else
            {
               (this.labels[_local_2] as LabelBase).visible = false;
            }
            _local_2++;
         }
      }
      
      public function setLabelsText(_arg_1:Vector.<UpgradableItemPropertyValue>) : void
      {
         var _local_2:UpgradableItemPropertyValue = null;
         var _local_3:int = 0;
         var _local_4:LabelBase = null;
         var _local_5:int = 0;
         while(_local_5 < _arg_1.length)
         {
            _local_2 = _arg_1[_local_5];
            _local_3 = UpgradeColors.getColorForValue(_local_2);
            _local_4 = this.labels[_local_5];
            _local_4.text = _local_2.getValue();
            _local_4.color = _local_3;
            _local_5++;
         }
      }
      
      public function updatePositions() : void
      {
         var _local_1:LabelBase = null;
         var _local_5:int = 0;
         var _local_2:int = this._width;
         this.crystalIcon.x = _local_2 - this.crystalIcon.width - this.hSpace;
         this.costLabel.x = this.crystalIcon.x - 3 - this.costLabel.width;
         var _local_3:Number = this.crystalIcon.x - 3 - this.costWidth;
         this.rankIcon.x = _local_3 - this.hSpace - RANK_WIDTH;
         this.upgradeIndicator.x = this.rankIcon.x - this.upgradeIndicator.width - this.hSpace;
         var _local_4:Number = (this.upgradeIndicator.x - 2 * this.hSpace) / this.numberProperties;
         while(_local_5 < this.numberProperties)
         {
            _local_1 = this.labels[_local_5];
            _local_1.x = Math.round(this.hSpace + _local_4 * _local_5 + (_local_4 - _local_1.width) / 2);
            _local_5++;
         }
      }
      
      public function getPositions() : Vector.<Number>
      {
         var _local_1:LabelBase = null;
         var _local_3:int = 0;
         var _local_2:Vector.<Number> = new Vector.<Number>(this.numberProperties,true);
         while(_local_3 < this.numberProperties)
         {
            _local_1 = this.labels[_local_3];
            _local_2[_local_3] = _local_1.x + _local_1.width * 0.5;
            _local_3++;
         }
         return _local_2;
      }
   }
}

