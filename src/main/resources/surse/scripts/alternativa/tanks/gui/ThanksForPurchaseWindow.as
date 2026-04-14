package alternativa.tanks.gui
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.payment.controls.OrderingLine;
   import alternativa.tanks.gui.payment.controls.OrderingLineString;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.TankWindow;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import fominskiy.utils.timeunit.TimeUnitService;
   import fominskiy.utils.timeunit.TimeUnitServiceLootBox;
   
   public class ThanksForPurchaseWindow extends Sprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private const windowMargin:int = 12;
      
      private const margin:int = 9;
      
      public var closeButton:DefaultButtonBase;
      
      public var donationCrystals:int;
      
      public var donationLootBox:int;
      
      public var donationPremium:int;
      
      public var donationGold:int;
      
      public var donationClan:int;
      
      public var donationSupplies:int;
      
      public var donationItem:int;
      
      public var donationNewKit:int;
      
      public var donationNewKitty:int;
      
      private var inner:Sprite;
      
      public function ThanksForPurchaseWindow(_arg_1:BitmapData, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:int, _arg_10:int, _arg_11:int)
      {
         var _local_10:OrderingLine = null;
         var donationLootBoxLine:OrderingLineString = null;
         var donationPremiumLine:OrderingLineString = null;
         var donationGoldLine:OrderingLineString = null;
         var donationClanLine:OrderingLine = null;
         var donationSuppliesLine:OrderingLine = null;
         var donationItemLine:OrderingLine = null;
         var donationNewKitLine:OrderingLine = null;
         var donationNewKittyLine:OrderingLine = null;
         var _local_11:Shape = null;
         var _local_12:int = 0;
         super();
         this.donationCrystals = _arg_3;
         this.donationLootBox = _arg_4;
         this.donationPremium = _arg_5;
         this.donationGold = _arg_6;
         this.donationClan = _arg_7;
         this.donationSupplies = _arg_8;
         this.donationItem = _arg_9;
         this.donationNewKit = _arg_10;
         this.donationNewKitty = _arg_11;
         var _local_5:int = this.windowMargin * 2 + this.margin * 2 + _arg_1.width;
         var _local_6:TankWindow = new TankWindow();
         addChild(_local_6);
         var _local_7:TankWindowInner = new TankWindowInner(_local_5 - this.windowMargin * 2,0,TankWindowInner.GREEN);
         this.inner = _local_7;
         _local_6.addChild(_local_7);
         _local_7.x = this.windowMargin;
         _local_7.y = this.windowMargin;
         var _local_8:Bitmap = new Bitmap(_arg_1);
         _local_8.x = (_local_7.width - _local_8.width) / 2;
         this.addLine(_local_8,this.windowMargin);
         var _local_9:int = _local_7.width * 0.8;
         if(_arg_2 > 0)
         {
            _local_10 = new OrderingLine(localeService.getText(TextConst.STRING_DONATION_ALERT_DONATED_CRYSTALS_TEXT),_arg_2);
            _local_10.width = _local_9;
            this.centerAlign(_local_10,_local_7.width);
            this.addLine(_local_10,0);
         }
         if(_arg_3 > 0)
         {
            _local_10 = new OrderingLine(localeService.getText(TextConst.STRING_DONATION_ALERT_PACKAGE_BONUS_CRYSTALS_TEXT),_arg_3);
            _local_10.width = _local_9;
            this.centerAlign(_local_10,_local_7.width);
            this.addLine(_local_10,-7);
         }
         if(_arg_4 > 0)
         {
            donationLootBoxLine = new OrderingLineString(localeService.getText(TextConst.STRING_DONATION_ALERT_LOOTBOX_TEXT),TimeUnitServiceLootBox.getLocalizedDaysString(_arg_4),false);
            donationLootBoxLine.width = _local_7.width * 0.8;
            this.centerAlign(donationLootBoxLine,_local_7.width);
            this.addLine(donationLootBoxLine,0);
         }
         if(_arg_5 > 0)
         {
            donationPremiumLine = new OrderingLineString(localeService.getText(TextConst.STRING_DONATION_ALERT_PREMIUM_TEXT),TimeUnitService.getLocalizedDaysString(_arg_5),false);
            donationPremiumLine.width = _local_7.width * 0.8;
            this.centerAlign(donationPremiumLine,_local_7.width);
            this.addLine(donationPremiumLine,0);
         }
         if(_arg_6 > 0)
         {
            donationGoldLine = new OrderingLineString(localeService.getText(TextConst.STRING_DONATION_ALERT_GOLD_TEXT),TimeUnitServiceLootBox.getLocalizedDaysString(_arg_6),false);
            donationGoldLine.width = _local_7.width * 0.8;
            this.centerAlign(donationGoldLine,_local_7.width);
            this.addLine(donationGoldLine,0);
         }
         if(_arg_7 > 0)
         {
            donationClanLine = new OrderingLine(localeService.getText(TextConst.STRING_DONATION_ALERT_CLAN_TEXT),_arg_7,false);
            donationClanLine.width = _local_7.width * 0.8;
            this.centerAlign(donationClanLine,_local_7.width);
            this.addLine(donationClanLine,0);
         }
         if(_arg_8 > 0)
         {
            donationSuppliesLine = new OrderingLine(localeService.getText(TextConst.STRING_DONATION_ALERT_SUPPLIES_TEXT),_arg_7,false);
            donationSuppliesLine.width = _local_7.width * 0.8;
            this.centerAlign(donationSuppliesLine,_local_7.width);
            this.addLine(donationSuppliesLine,0);
         }
         if(_arg_9 > 0)
         {
            donationItemLine = new OrderingLine(localeService.getText(TextConst.STRING_DONATION_ALERT_ITEM_TEXT),_arg_7,false);
            donationItemLine.width = _local_7.width * 0.8;
            this.centerAlign(donationItemLine,_local_7.width);
            this.addLine(donationItemLine,0);
         }
         if(_arg_10 > 0)
         {
            donationNewKitLine = new OrderingLine(localeService.getText(TextConst.STRING_DONATION_ALERT_NEWKIT_TEXT),_arg_7,false);
            donationNewKitLine.width = _local_7.width * 0.8;
            this.centerAlign(donationNewKitLine,_local_7.width);
            this.addLine(donationNewKitLine,0);
         }
         if(_arg_11 > 0)
         {
            donationNewKittyLine = new OrderingLine(localeService.getText(TextConst.STRING_DONATION_ALERT_NEWKITTY_TEXT),_arg_7,false);
            donationNewKittyLine.width = _local_7.width * 0.8;
            this.centerAlign(donationNewKittyLine,_local_7.width);
            this.addLine(donationNewKittyLine,0);
         }
         if(_arg_2 > 0 || _arg_3 > 0)
         {
            _local_11 = new Shape();
            _local_11.graphics.beginFill(5898034);
            while(_local_12 < _local_9 - 5)
            {
               _local_11.graphics.drawRect(_local_12,0,1,1);
               _local_12 += 3;
            }
            this.centerAlign(_local_11,_local_7.width);
            this.addLine(_local_11,4);
         }
         if(_arg_2 > 0 || _arg_3 > 0)
         {
            _local_10 = new OrderingLine(localeService.getText(TextConst.STRING_DONATION_ALERT_RECEIVED_CRYSTALS_TEXT),_arg_3 + _arg_2);
            _local_10.width = _local_9;
            this.centerAlign(_local_10,_local_7.width);
            this.addLine(_local_10,1);
         }
         _local_7.height += this.windowMargin;
         this.closeButton = new DefaultButtonBase();
         if(localeService != null)
         {
            this.closeButton.label = localeService.getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         }
         this.closeButton.y = _local_7.x + _local_7.height + this.windowMargin;
         this.centerAlign(this.closeButton,_local_5);
         _local_6.addChild(this.closeButton);
         _local_6.height = this.closeButton.y + this.closeButton.height + this.windowMargin;
         _local_6.width = _local_5;
         addChild(_local_6);
      }
      
      private function centerAlign(_arg_1:DisplayObject, _arg_2:Number) : void
      {
         _arg_1.x = (_arg_2 - _arg_1.width) / 2;
      }
      
      private function addLine(_arg_1:DisplayObject, _arg_2:int) : void
      {
         _arg_1.y = this.inner.height + _arg_2;
         this.inner.addChild(_arg_1);
      }
   }
}

