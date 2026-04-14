package alternativa.tanks.model.shop.items.lootboxitem
{
   import alternativa.tanks.model.shop.items.base.ShopItemBase;
   import alternativa.tanks.model.shop.items.base.ShopItemSkins;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.text.TextFieldAutoSize;
   import fominskiy.utils.timeunit.TimeUnitServiceLootBox;
   
   public class LootBoxPackageItem extends ShopItemBase
   {
      
      private static const LEFT_PADDING:int = 18;
      
      private static const MONEY_TEXT_LABEL_COLOR:uint = 4144959;
      
      private const PREMIUM_TEXT_LABEL_COLOR:uint = 3432728;
      
      private var lootboxLabel:LabelBase;
      
      private var priceLabel:LabelBase;
      
      private var icon:Bitmap;
      
      private var additionalData:Object;
      
      public function LootBoxPackageItem(_arg_1:String, _arg_2:Object)
      {
         this.additionalData = _arg_2;
         super(_arg_1,ShopItemSkins.GREY);
      }
      
      override protected function init() : void
      {
         super.init();
         this.initCrystalsAndPrice();
         this.initLootBoxIcon();
         this.render();
      }
      
      private function initCrystalsAndPrice() : void
      {
         this.lootboxLabel = new LabelBase();
         this.lootboxLabel.text = TimeUnitServiceLootBox.getLocalizedDaysString(this.additionalData.lootbox_count);
         this.lootboxLabel.color = this.PREMIUM_TEXT_LABEL_COLOR;
         this.lootboxLabel.autoSize = TextFieldAutoSize.LEFT;
         this.lootboxLabel.size = 26;
         this.lootboxLabel.bold = true;
         this.lootboxLabel.mouseEnabled = false;
         addChild(this.lootboxLabel);
         this.priceLabel = new LabelBase();
         fixChineseCurrencyLabelRendering(this.priceLabel);
         this.priceLabel.text = this.additionalData.price + " " + this.additionalData.currency;
         this.priceLabel.color = MONEY_TEXT_LABEL_COLOR;
         this.priceLabel.autoSize = TextFieldAutoSize.LEFT;
         this.priceLabel.size = 22;
         this.priceLabel.bold = true;
         this.priceLabel.mouseEnabled = false;
         addChild(this.priceLabel);
      }
      
      private function initLootBoxIcon() : void
      {
         this.icon = new Bitmap(LootBoxPackageItemIcons.lootboxIcon);
         addChild(this.icon);
      }
      
      private function render() : void
      {
         this.icon.x = LEFT_PADDING - 19;
         this.lootboxLabel.x = this.icon.x + this.icon.width - 15;
         this.priceLabel.x = this.lootboxLabel.x;
         this.icon.y = HEIGHT - this.icon.height >> 1;
         this.lootboxLabel.y = this.icon.y + 15;
         this.priceLabel.y = this.lootboxLabel.y + this.lootboxLabel.height - 2;
      }
   }
}

