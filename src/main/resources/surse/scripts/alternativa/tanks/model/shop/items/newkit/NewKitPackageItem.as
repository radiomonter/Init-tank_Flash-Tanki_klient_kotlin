package alternativa.tanks.model.shop.items.newkit
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.shop.items.base.ShopItemBase;
   import alternativa.tanks.model.shop.items.base.ShopItemSkins;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class NewKitPackageItem extends ShopItemBase
   {
      
      private static const LEFT_PADDING:int = 18;
      
      private static const MONEY_TEXT_LABEL_COLOR:uint = 4144959;
      
      private const WHITE_TEXT_LABEL_COLOR:uint = 16777215;
      
      private var newkitLabel:LabelBase;
      
      private var priceLabel:LabelBase;
      
      private var icon:Bitmap;
      
      private var additionalData:Object;
      
      private var localeService:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
      
      public function NewKitPackageItem(_arg_1:String, _arg_2:Object)
      {
         this.additionalData = _arg_2;
         super(_arg_1,ShopItemSkins.YELLOW);
      }
      
      override protected function init() : void
      {
         super.init();
         this.initContainerIcon();
         this.initCrystalsAndPrice();
         this.render();
         this.addMouseEvents();
      }
      
      private function initCrystalsAndPrice() : void
      {
         this.priceLabel = new LabelBase();
         fixChineseCurrencyLabelRendering(this.priceLabel);
         this.priceLabel.text = this.additionalData.price + " " + this.additionalData.currency;
         this.priceLabel.color = MONEY_TEXT_LABEL_COLOR;
         this.priceLabel.autoSize = TextFieldAutoSize.LEFT;
         this.priceLabel.size = 35;
         this.priceLabel.bold = true;
         this.priceLabel.mouseEnabled = false;
         this.newkitLabel = new LabelBase();
         this.newkitLabel.text = this.localeService.language == "ru" ? "+6 дней" : "+6 days";
         this.newkitLabel.color = this.WHITE_TEXT_LABEL_COLOR;
         this.newkitLabel.autoSize = TextFieldAutoSize.LEFT;
         this.newkitLabel.size = 26;
         this.newkitLabel.bold = true;
         this.newkitLabel.mouseEnabled = false;
         addChild(this.newkitLabel);
         addChild(this.priceLabel);
      }
      
      private function initContainerIcon() : void
      {
         this.icon = new Bitmap(NewKitPackageDefItemIcons.NewKitDefIcon);
         addChild(this.icon);
      }
      
      private function addMouseEvents() : void
      {
         this.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      private function onMouseOver(event:MouseEvent) : void
      {
         removeChild(this.icon);
         this.icon = new Bitmap(NewKitPackageLigItemIcons.NewKitLigIcon);
         addChild(this.icon);
         addChild(this.newkitLabel);
         addChild(this.priceLabel);
         this.render();
      }
      
      private function onMouseOut(event:MouseEvent) : void
      {
         removeChild(this.icon);
         this.icon = new Bitmap(NewKitPackageDefItemIcons.NewKitDefIcon);
         addChild(this.icon);
         addChild(this.newkitLabel);
         addChild(this.priceLabel);
         this.render();
      }
      
      private function render() : void
      {
         this.icon.x = LEFT_PADDING - 19;
         this.icon.y = HEIGHT - this.icon.height >> 1;
         this.newkitLabel.x = LEFT_PADDING + 375;
         this.newkitLabel.y = this.icon.y + this.icon.height - this.priceLabel.height - 17;
         this.priceLabel.x = LEFT_PADDING - 2;
         this.priceLabel.y = this.icon.y + this.icon.height - this.priceLabel.height - 10;
      }
   }
}

