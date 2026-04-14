package alternativa.tanks.gui
{
   import alternativa.model.description.IDescription;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.item.kit.GarageKit;
   import alternativa.tanks.model.item.temporary.ITemporaryItem;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.utils.PieceWordDeclensionUtil;
   import controls.TankWindow;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.TextFormatAlign;
   import fominskiy.utils.timeunit.TimeUnitService;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.garage.models.item.kit.KitGiftItem;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class GiftWindow extends DialogWindow
   {
      
      [Inject]
      public static var localeService:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
      
      [Inject]
      public static var itemService:ItemService = ItemService(OSGi.getInstance().getService(ItemService));
      
      private const windowWidth:int = 350;
      
      private const windowHeight:int = 275;
      
      private const bottomWindowMargin:int = 50;
      
      private const windowMargin:int = 11;
      
      private const h:int = 17;
      
      private const topWindowGiftItemsMargin:int = 210;
      
      private const rowSpace:int = 20;
      
      private const giftItemColor:uint = 5898034;
      
      private var window:TankWindow;
      
      private var giftImage:Bitmap;
      
      private var innerWindow:TankWindowInner;
      
      private var okButton:DefaultButtonBase;
      
      public function GiftWindow(_arg_1:IGameObject)
      {
         var _local_9:KitGiftItem = null;
         var _local_7:int = 0;
         var _local_8:int = 0;
         super();
         this.window = new TankWindow(this.windowWidth,0);
         addChild(this.window);
         this.innerWindow = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.innerWindow.x = this.windowMargin;
         this.innerWindow.y = this.windowMargin;
         this.innerWindow.width = this.windowWidth - this.windowMargin * 2;
         addChild(this.innerWindow);
         this.giftImage = new Bitmap(localeService.getImage(TanksLocale.IMAGE_GIFT_WINDOW));
         this.giftImage.x = this.windowMargin + 13;
         this.giftImage.y = this.windowMargin + 3;
         addChild(this.giftImage);
         var _local_2:Vector.<KitGiftItem> = GarageKit(_arg_1.adapt(GarageKit)).getGiftItems();
         var _local_3:int = this.getMaxTextWidthOfGiftItemName(_local_2);
         var _local_4:int = this.getMaxTextWidthOfGiftItemNumberField(_local_2);
         var _local_5:int = int((this.windowWidth - (_local_3 + _local_4 + this.rowSpace)) / 2);
         var _local_6:Vector.<KitGiftItem> = this.sortKitGiftItemsByCategory(_local_2);
         while(_local_8 < _local_6.length)
         {
            _local_9 = _local_6[_local_8];
            if(this.canAddGiftItem(_local_9))
            {
               this.addGiftItemRow(_local_9,_local_7,_local_5);
               _local_7++;
            }
            _local_8++;
         }
         this.window.height = this.windowHeight + this.h * _local_7;
         this.innerWindow.height = this.window.height - this.bottomWindowMargin - this.windowMargin;
         this.okButton = new DefaultButtonBase();
         addChild(this.okButton);
         this.okButton.label = localeService.getText(TanksLocale.TEXT_ALERT_ANSWER_OK);
         this.okButton.x = int(this.windowWidth / 2 - this.okButton.width / 2);
         this.okButton.y = int(this.window.height - this.bottomWindowMargin / 2 - this.okButton.height / 2 - 2);
         this.okButton.addEventListener(MouseEvent.CLICK,this.onOkButtonClick);
         dialogService.addDialog(this);
      }
      
      private function canAddGiftItem(_arg_1:KitGiftItem) : Boolean
      {
         return !itemService.jihosis(_arg_1.item) || itemService.isCountable(_arg_1.item) || _arg_1.item.hasModel(ITemporaryItem);
      }
      
      private function getMaxTextWidthOfGiftItemName(_arg_1:Vector.<KitGiftItem>) : int
      {
         return this.getMaxTextWidthOfSomeFieldInKitGiftItems(_arg_1,this.getGiftItemName);
      }
      
      private function getMaxTextWidthOfGiftItemNumberField(_arg_1:Vector.<KitGiftItem>) : int
      {
         return this.getMaxTextWidthOfSomeFieldInKitGiftItems(_arg_1,this.getGiftItemNumberField);
      }
      
      private function getMaxTextWidthOfSomeFieldInKitGiftItems(_arg_1:Vector.<KitGiftItem>, _arg_2:Function) : int
      {
         var _local_5:KitGiftItem = null;
         var _local_6:int = 0;
         var _local_3:int = 0;
         var _local_4:LabelBase = new LabelBase();
         for each(_local_5 in _arg_1)
         {
            _local_4.text = _arg_2(_local_5);
            _local_6 = _local_4.textWidth;
            if(_local_6 >= _local_3)
            {
               _local_3 = _local_6;
            }
         }
         return _local_3;
      }
      
      private function sortKitGiftItemsByCategory(kitGiftItems:Vector.<KitGiftItem>) : Vector.<KitGiftItem>
      {
         var sortedKitGiftItems:Vector.<KitGiftItem>;
         var armorIndex:int;
         var colorIndex:int;
         var inventoryIndex:int;
         var pluginIndex:int;
         var i:int = 0;
         var kitGiftItem:KitGiftItem = null;
         var armorCount:int = 0;
         var weaponCount:int = 0;
         var inventoryCount:int = 0;
         var colorCount:int = 0;
         var weaponIndex:int = 0;
         var _local_3:* = undefined;
         var _local_4:* = undefined;
         var _local_5:* = undefined;
         var _local_6:* = undefined;
         var _local_7:* = undefined;
         var compareFunc:Function = function(_arg_1:KitGiftItem, _arg_2:KitGiftItem):Number
         {
            var _local_3:String = itemService.getName(_arg_1.item);
            var _local_4:String = itemService.getName(_arg_2.item);
            if(_local_3 < _local_4)
            {
               return -1;
            }
            if(_local_3 > _local_4)
            {
               return 1;
            }
            return 0;
         };
         var tempVector:Vector.<KitGiftItem> = kitGiftItems.concat();
         tempVector.sort(compareFunc);
         sortedKitGiftItems = new Vector.<KitGiftItem>(tempVector.length);
         i = 0;
         while(i < tempVector.length)
         {
            kitGiftItem = tempVector[i];
            switch(itemService.getCategory(kitGiftItem.item))
            {
               case ItemCategoryEnum.ARMOR:
                  armorCount += 1;
                  break;
               case ItemCategoryEnum.WEAPON:
                  weaponCount += 1;
                  break;
               case ItemCategoryEnum.INVENTORY:
                  inventoryCount += 1;
                  break;
               case ItemCategoryEnum.COLOR:
                  colorCount += 1;
            }
            i += 1;
         }
         armorIndex = weaponCount;
         colorIndex = armorIndex + armorCount;
         inventoryIndex = colorIndex + colorCount;
         pluginIndex = inventoryIndex + inventoryCount;
         i = 0;
         while(i < tempVector.length)
         {
            kitGiftItem = tempVector[i];
            switch(itemService.getCategory(kitGiftItem.item))
            {
               case ItemCategoryEnum.ARMOR:
                  _local_3 = armorIndex++;
                  sortedKitGiftItems[_local_3] = kitGiftItem;
                  break;
               case ItemCategoryEnum.WEAPON:
                  _local_4 = weaponIndex++;
                  sortedKitGiftItems[_local_4] = kitGiftItem;
                  break;
               case ItemCategoryEnum.INVENTORY:
                  _local_5 = inventoryIndex++;
                  sortedKitGiftItems[_local_5] = kitGiftItem;
                  break;
               case ItemCategoryEnum.PLUGIN:
                  _local_6 = pluginIndex++;
                  sortedKitGiftItems[_local_6] = kitGiftItem;
                  break;
               case ItemCategoryEnum.COLOR:
                  _local_7 = colorIndex++;
                  sortedKitGiftItems[_local_7] = kitGiftItem;
            }
            i += 1;
         }
         return sortedKitGiftItems;
      }
      
      private function addGiftItemRow(_arg_1:KitGiftItem, _arg_2:int, _arg_3:int) : void
      {
         var _local_6:LabelBase = null;
         var _local_4:LabelBase = new LabelBase();
         _local_4.color = this.giftItemColor;
         _local_4.align = TextFormatAlign.LEFT;
         _local_4.text = this.getGiftItemName(_arg_1);
         _local_4.x = _arg_3;
         _local_4.y = this.topWindowGiftItemsMargin + this.h * _arg_2;
         addChild(_local_4);
         if(itemService.cacum(_arg_1.item))
         {
            _local_4.text += (localeService.language == "cn" ? "" : " ") + "M" + String(itemService.getModificationIndex(_arg_1.item));
         }
         var _local_5:ItemCategoryEnum = itemService.getCategory(_arg_1.item);
         if(_local_5 == ItemCategoryEnum.INVENTORY || _local_5 == ItemCategoryEnum.PLUGIN)
         {
            _local_6 = new LabelBase();
            _local_6.color = 5898034;
            _local_6.align = TextFormatAlign.RIGHT;
            _local_6.text = this.getGiftItemNumberField(_arg_1);
            _local_6.x = this.windowWidth - _arg_3 - _local_6.width;
            _local_6.y = _local_4.y;
            addChild(_local_6);
         }
      }
      
      private function getGiftItemName(_arg_1:KitGiftItem) : String
      {
         return IDescription(_arg_1.item.adapt(IDescription)).getName();
      }
      
      private function getGiftItemNumberField(_arg_1:KitGiftItem) : String
      {
         var _local_3:int = 0;
         var _local_2:int = 86400;
         var _local_4:String = "";
         if(_arg_1.item.hasModel(ITemporaryItem) && ITemporaryItem(_arg_1.item.adapt(ITemporaryItem)).getTimeRemainingInMSec() > 0)
         {
            _local_3 = int(ITemporaryItem(_arg_1.item.adapt(ITemporaryItem)).getTimeRemainingInMSec() / _local_2 * _arg_1.count);
            _local_4 = TimeUnitService.getLocalizedTimeString(0,0,_local_3);
         }
         else
         {
            _local_4 = PieceWordDeclensionUtil.getLocalizedDeclension(_arg_1.count);
         }
         return _local_4;
      }
      
      private function onOkButtonClick(_arg_1:MouseEvent = null) : void
      {
         this.okButton.removeEventListener(MouseEvent.CLICK,this.onOkButtonClick);
         dialogService.removeDialog(this);
         dispatchEvent(new GiftWindowEvent(GiftWindowEvent.GIFT_RECEIVED));
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.onOkButtonClick();
      }
      
      override protected function confirmationKeyPressed() : void
      {
         this.onOkButtonClick();
      }
   }
}

