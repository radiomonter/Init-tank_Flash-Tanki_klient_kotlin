package alternativa.tanks.model.shop
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import controls.dropdownlist.DropDownList;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class ShopWindowHeader extends Sprite
   {
      
      public static var localeService:ILocaleService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
      
      private static var crystalsImageClass:Class = ShopWindowHeader_crystalsImageClass;
      
      private static const crystalsImage:BitmapData = new crystalsImageClass().bitmapData;
      
      public static const WINDOW_MARGIN:int = 11;
      
      private var headerIcon:Bitmap;
      
      private var header:LabelBase;
      
      private var headerInner:TankWindowInner;
      
      public var chooseCountryComboBox:DropDownList;
      
      private var chooseCountryText:LabelBase;
      
      private var doubleCrystallsHeader:LabelBase = new LabelBase();
      
      public function ShopWindowHeader()
      {
         super();
         this.headerInner = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         addChild(this.headerInner);
         this.headerIcon = new Bitmap(crystalsImage);
         addChild(this.headerIcon);
         this.headerIcon.x = WINDOW_MARGIN;
         this.headerIcon.y = 5;
         this.header = new LabelBase();
         addChild(this.header);
         this.header.multiline = true;
         this.header.wordWrap = true;
         this.header.x = this.headerIcon.x + this.headerIcon.width + WINDOW_MARGIN;
         this.header.htmlText = localeService.getText(TanksLocale.TEXT_SHOP_WINDOW_HEADER_DESCRIPTION);
         if(ShopWindow.haveDoubleCrystalls)
         {
            this.doubleCrystallsHeader.multiline = true;
            this.doubleCrystallsHeader.wordWrap = true;
            this.doubleCrystallsHeader.x = this.headerIcon.x + this.headerIcon.width + WINDOW_MARGIN;
            this.doubleCrystallsHeader.htmlText = localeService.getText(TanksLocale.TEXT_SHOP_CATEGORY_DOUBLE_CRYSTALS);
            this.doubleCrystallsHeader.bold = true;
            this.doubleCrystallsHeader.color = 16760355;
            addChild(this.doubleCrystallsHeader);
         }
         this.chooseCountryComboBox = new DropDownList();
         this.chooseCountryComboBox.width = 160;
         this.initCountries();
         addChild(this.chooseCountryComboBox);
         this.chooseCountryText = new LabelBase();
         this.chooseCountryText.text = localeService.getText(TanksLocale.TEXT_SHOP_PAYMENT_METHOD);
         addChild(this.chooseCountryText);
      }
      
      private function initCountries() : void
      {
         this.chooseCountryComboBox.addItem({
            "rang":0,
            "index":0,
            "id":0,
            "gameName":"Freekassa",
            "code":"freekassa"
         });
         this.chooseCountryComboBox.addItem({
            "rang":0,
            "index":1,
            "id":1,
            "gameName":"Interkassa",
            "code":"interkassa"
         });
         this.chooseCountryComboBox.addItem({
            "rang":0,
            "index":2,
            "id":2,
            "gameName":"PayPal",
            "code":"paypal"
         });
      }
      
      public function resize(_arg_1:int) : void
      {
         this.headerInner.width = _arg_1;
         this.headerInner.height = this.headerIcon.height + (ShopWindow.haveDoubleCrystalls ? 55 : 35);
         this.header.width = _arg_1 - this.header.x - WINDOW_MARGIN;
         this.header.y = this.headerIcon.y + (this.headerIcon.height - this.header.textHeight >> 1);
         this.doubleCrystallsHeader.width = _arg_1 - this.header.x - WINDOW_MARGIN;
         this.doubleCrystallsHeader.y = this.header.y + this.header.height;
         this.chooseCountryComboBox.y = this.headerInner.height - 35;
         this.chooseCountryComboBox.x = this.headerInner.width - this.chooseCountryComboBox.width + 5;
         this.chooseCountryText.y = this.chooseCountryComboBox.y + 6;
         this.chooseCountryText.x = this.chooseCountryComboBox.x - this.chooseCountryText.width - 5;
      }
      
      override public function get height() : Number
      {
         return this.headerInner.height;
      }
   }
}

