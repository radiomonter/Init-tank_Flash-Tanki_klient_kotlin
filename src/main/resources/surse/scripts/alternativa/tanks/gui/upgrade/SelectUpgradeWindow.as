package alternativa.tanks.gui.upgrade
{
   import alternativa.tanks.gui.buttons.CrystalButton;
   import alternativa.tanks.gui.buttons.color.GoldBigButtonSkin;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import alternativa.tanks.service.money.IMoneyService;
   import controls.BigButton1;
   import controls.base.BigButtonBase;
   import controls.buttons.h50px.GreyBigButtonSkin;
   import controls.labels.MouseDisabledLabel;
   import controls.timer.CountDownTimer;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class SelectUpgradeWindow extends UpgradeWindowBase
   {
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      [Inject]
      public static var dialogService:IDialogsService;
      
      [Inject]
      public static var propertyService:ItemPropertyParamsService;
      
      private static const INFO_FORM_WIDTH:int = 430;
      
      private static const BUTTON_WIDTH:int = 136;
      
      private static const VERTICAL_MARGIN:int = 7;
      
      private static const HORIZONTAL_MARGIN:int = 7;
      
      private static const UPGRADE_TIMEOUT_MS:int = 750;
      
      private var properties:Vector.<UpgradableItemPropertyValue>;
      
      private var infos:Vector.<UpgradeInfoForm>;
      
      private var okButtons:Vector.<CrystalButton>;
      
      private var isUpgrading:Boolean = false;
      
      private var discountLabel:MouseDisabledLabel;
      
      private var nextModificationIndex:int;
      
      private var hasNextModification:Boolean;
      
      public function SelectUpgradeWindow(_arg_1:Vector.<UpgradableItemPropertyValue>, _arg_2:int = 0, _arg_3:Boolean = false)
      {
         var _local_6:UpgradableItemPropertyValue = null;
         var _local_4:int = 0;
         var _local_5:UpgradeInfoForm = null;
         var _local_7:CrystalButton = null;
         var _local_9:int = 0;
         this.discountLabel = new MouseDisabledLabel();
         _local_6 = null;
         this.hasNextModification = _arg_3;
         this.properties = this.getUpgradableProperties(_arg_1);
         this.nextModificationIndex = _arg_2 + 1;
         super(INFO_FORM_WIDTH + HORIZONTAL_MARGIN * 3 + BUTTON_WIDTH + 10,(50 + VERTICAL_MARGIN) * this.properties.length + 2 * VERTICAL_MARGIN + 30 + 12);
         this.okButtons = new Vector.<CrystalButton>(this.properties.length);
         this.infos = new Vector.<UpgradeInfoForm>(this.properties.length);
         var _local_8:int = HORIZONTAL_MARGIN + 5;
         this.discountLabel.x = _local_8;
         if(this.isFullUpgraded())
         {
            _local_4 = INFO_FORM_WIDTH + VERTICAL_MARGIN + BUTTON_WIDTH;
         }
         else
         {
            _local_4 = INFO_FORM_WIDTH;
         }
         while(_local_9 < this.properties.length)
         {
            _local_5 = new UpgradeInfoForm(_local_4,50,this.properties[_local_9]);
            this.infos[_local_9] = _local_5;
            _local_5.y = (VERTICAL_MARGIN + 50) * _local_9 + VERTICAL_MARGIN + 6;
            _local_5.x = _local_8;
            addChild(_local_5);
            _local_6 = this.properties[_local_9];
            if(_local_6.isFullUpgraded())
            {
               this.okButtons[_local_9] = null;
            }
            else
            {
               _local_7 = new CrystalButton();
               this.okButtons[_local_9] = _local_7;
               _local_7.setText(localeService.getText(TanksLocale.TEXT_GARAGE_UPGRADE_TEXT));
               _local_7.setSkin(GreyBigButtonSkin.GREY_SKIN);
               _local_7.width = BUTTON_WIDTH;
               _local_7.addEventListener(MouseEvent.CLICK,this.onClick);
               _local_7.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
               _local_7.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
               _local_7.x = _local_5.x + INFO_FORM_WIDTH + HORIZONTAL_MARGIN;
               _local_7.y = _local_5.y;
               _local_7.setCost(_local_6.getCost());
               addChild(_local_7);
            }
            _local_9++;
         }
         if(_arg_3)
         {
            addChild(this.discountLabel);
            this.updateDiscountLabel();
         }
      }
      
      private function updateDiscountLabel() : void
      {
         var _local_1:UpgradableItemPropertyValue = null;
         var _local_2:String = null;
         if(!this.hasNextModification)
         {
            return;
         }
         var _local_3:Number = 0;
         for each(_local_1 in this.properties)
         {
            _local_3 += _local_1.getDiscount();
         }
         _local_3 *= 100;
         if(_local_3 > 0)
         {
            _local_2 = "test";
            this.discountLabel.text = _local_2.replace("{discount}",int(_local_3)).replace("{grade}",this.nextModificationIndex);
         }
         else
         {
            _local_2 = "";
            this.discountLabel.text = _local_2.replace("{grade}",this.nextModificationIndex);
         }
         var _local_4:Number = cancelButton.y + cancelButton.height * 0.5;
         this.discountLabel.y = _local_4 - this.discountLabel.height * 0.5;
      }
      
      private function onMouseOut(_arg_1:MouseEvent) : void
      {
         var _local_2:int = this.okButtons.indexOf(_arg_1.target);
         this.infos[_local_2].hideTime();
      }
      
      private function onMouseOver(_arg_1:MouseEvent) : void
      {
         var _local_2:int = this.okButtons.indexOf(_arg_1.target);
         this.infos[_local_2].showTime();
      }
      
      private function onClick(_arg_1:MouseEvent) : void
      {
         var _local_2:int = this.okButtons.indexOf(_arg_1.target);
         if(this.isUpgrading)
         {
            this.speedUp(_local_2);
         }
         else
         {
            this.startUpgrade(_local_2);
         }
      }
      
      private function speedUp(_arg_1:int) : void
      {
         var _local_2:UpgradableItemPropertyValue = this.properties[_arg_1];
         if(moneyService.dic(_local_2.getSpeedUpCost()))
         {
            this.okButtons[_arg_1].enabled = false;
            dispatchEvent(new ItemPropertyUpgradeEvent(ItemPropertyUpgradeEvent.SPEED_UP,_local_2));
         }
         else
         {
            dispatchEvent(new ItemPropertyUpgradeEvent(ItemPropertyUpgradeEvent.FLUSH_UPGRADES));
         }
      }
      
      override protected function onClose() : void
      {
         this.removeEvents();
         dispatchEvent(new ItemPropertyUpgradeEvent(ItemPropertyUpgradeEvent.FLUSH_UPGRADES));
         dispatchEvent(new ItemPropertyUpgradeEvent(ItemPropertyUpgradeEvent.SELECT_WINDOW_CLOSED));
      }
      
      override protected function removeEvents() : void
      {
         var _local_1:BigButtonBase = null;
         super.removeEvents();
         for each(_local_1 in this.okButtons)
         {
            if(_local_1 != null)
            {
               _local_1.removeEventListener(MouseEvent.CLICK,this.onClick);
            }
         }
      }
      
      private function startUpgrade(_arg_1:int) : void
      {
         var _local_2:UpgradeInfoForm = null;
         var _local_3:CountDownTimer = null;
         var _local_4:int = 0;
         var _local_5:CrystalButton = null;
         var _local_6:BigButton1 = null;
         var _local_7:UpgradableItemPropertyValue = this.properties[_arg_1];
         if(moneyService.dic(_local_7.getCost()))
         {
            _local_2 = this.infos[_arg_1];
            _local_3 = new CountDownTimer();
            _local_3.start(_local_7.getTimeInSeconds() * 1000 + getTimer());
            _local_2.setTimer(_local_3);
            _local_4 = 0;
            while(_local_4 < this.properties.length)
            {
               _local_6 = this.okButtons[_local_4];
               if(_local_6 != null && _local_4 != _arg_1)
               {
                  _local_6.enabled = false;
               }
               _local_4++;
            }
            _local_5 = this.okButtons[_arg_1];
            _local_5.setCost(_local_7.getSpeedUpCost());
            _local_5.setText(localeService.getText(TanksLocale.TEXT_GARAGE_SPEED_UP_TEXT));
            _local_5.setSkin(GoldBigButtonSkin.GOLD_SKIN);
            _local_5.enabled = false;
            setTimeout(this.enableSpeedUpButton,UPGRADE_TIMEOUT_MS,_local_5);
            this.isUpgrading = true;
            dispatchEvent(new ItemPropertyUpgradeEvent(ItemPropertyUpgradeEvent.UPGRADE_STARTED,_local_7,_local_3));
         }
         else
         {
            dispatchEvent(new ItemPropertyUpgradeEvent(ItemPropertyUpgradeEvent.FLUSH_UPGRADES));
         }
      }
      
      private function enableSpeedUpButton() : void
      {
         CrystalButton(arguments[0]).enabled = true;
      }
      
      public function propertyUpgraded(_arg_1:UpgradableItemPropertyValue) : void
      {
         var _local_2:BigButton1 = null;
         var _local_3:DisplayObject = null;
         this.isUpgrading = false;
         var _local_4:int = this.properties.indexOf(_arg_1);
         this.infos[_local_4].propertyUpgraded();
         var _local_5:CrystalButton = this.okButtons[_local_4];
         if(_arg_1.isFullUpgraded())
         {
            removeChild(_local_5);
            _local_5.removeEventListener(MouseEvent.CLICK,this.onClick);
            _local_5.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
            _local_5.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
            this.updateDiscountLabel();
            this.infos[_local_4].hideTime();
            this.okButtons[_local_4] = null;
            if(this.isFullUpgraded())
            {
               this.setLongInfos();
            }
         }
         else
         {
            _local_5.setText(localeService.getText(TanksLocale.TEXT_GARAGE_UPGRADE_TEXT));
            _local_5.setSkin(GreyBigButtonSkin.GREY_SKIN);
            _local_5.setCost(_arg_1.getCost());
            _local_3 = this.okButtons[_local_4];
            if(_local_3.mouseX >= 0 && _local_3.mouseY >= 0 && _local_3.mouseX <= _local_3.width && _local_3.mouseY < _local_3.height)
            {
               this.infos[_local_4].showTime();
            }
            else
            {
               this.infos[_local_4].hideTime();
            }
         }
         var _local_6:Boolean = true;
         for each(_local_2 in this.okButtons)
         {
            if(_local_2 != null)
            {
               _local_6 = false;
            }
         }
         setTimeout(this.enableButtons,UPGRADE_TIMEOUT_MS);
      }
      
      public function enableButtons() : void
      {
         var _local_1:BigButton1 = null;
         for each(_local_1 in this.okButtons)
         {
            if(_local_1 != null)
            {
               _local_1.enabled = true;
            }
         }
      }
      
      private function isFullUpgraded() : Boolean
      {
         var _local_1:int = 0;
         while(_local_1 < this.properties.length)
         {
            if(!this.properties[_local_1].isFullUpgraded())
            {
               return false;
            }
            _local_1++;
         }
         return true;
      }
      
      private function setLongInfos() : void
      {
         var _local_1:int = 0;
         while(_local_1 < this.infos.length)
         {
            removeChild(this.infos[_local_1]);
            this.infos[_local_1] = new UpgradeInfoForm(INFO_FORM_WIDTH + VERTICAL_MARGIN + BUTTON_WIDTH,50,this.properties[_local_1]);
            addChild(this.infos[_local_1]);
            this.infos[_local_1].y = (VERTICAL_MARGIN + 50) * _local_1 + VERTICAL_MARGIN + 6;
            this.infos[_local_1].x = HORIZONTAL_MARGIN + 5;
            _local_1++;
         }
      }
      
      private function getUpgradableProperties(_arg_1:Vector.<UpgradableItemPropertyValue>) : Vector.<UpgradableItemPropertyValue>
      {
         var _local_2:UpgradableItemPropertyValue = null;
         var _local_3:Vector.<UpgradableItemPropertyValue> = new Vector.<UpgradableItemPropertyValue>();
         for each(_local_2 in _arg_1)
         {
            if(_local_2.getMaxLevel() > 0)
            {
               _local_3.push(_local_2);
            }
         }
         return _local_3;
      }
   }
}

