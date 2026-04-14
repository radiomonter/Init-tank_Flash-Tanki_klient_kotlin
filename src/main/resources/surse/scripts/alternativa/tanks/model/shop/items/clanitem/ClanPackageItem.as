package alternativa.tanks.model.shop.items.clanitem
{
   import alternativa.tanks.model.shop.items.base.ShopItemBase;
   import alternativa.tanks.model.shop.items.base.ShopItemSkins;
   import alternativa.tanks.model.shop.items.utils.FormatUtils;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.text.TextFieldAutoSize;
   
   public class ClanPackageItem extends ShopItemBase
   {
      
      private static const LEFT_PADDING:int = 18;
      
      private static const MONEY_TEXT_LABEL_COLOR:uint = 4144959;
      
      private const PREMIUM_TEXT_LABEL_COLOR:uint = 3432728;
      
      private var clanLabel:LabelBase;
      
      private var priceLabel:LabelBase;
      
      private var icon:Bitmap;
      
      private var additionalData:Object;
      
      public function ClanPackageItem(_arg_1:String, _arg_2:Object)
      {
         this.additionalData = _arg_2;
         super(_arg_1,ShopItemSkins.GREY);
      }
      
      override protected function init() : void
      {
         super.init();
         this.initCrystalsAndPrice();
         this.initClanIcon();
         this.render();
      }
      
      private function initCrystalsAndPrice() : void
      {
         this.clanLabel = new LabelBase();
         this.clanLabel.text = FormatUtils.valueToString(this.additionalData.clan_count,0,false);
         this.clanLabel.color = this.PREMIUM_TEXT_LABEL_COLOR;
         this.clanLabel.autoSize = TextFieldAutoSize.LEFT;
         this.clanLabel.size = 26;
         this.clanLabel.bold = true;
         this.clanLabel.mouseEnabled = false;
         addChild(this.clanLabel);
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
      
      private function initClanIcon() : void
      {
         this.icon = new Bitmap(ClanPackageItemIcons.clanIcon);
         addChild(this.icon);
      }
      
      private function render() : void
      {
         this.icon.x = LEFT_PADDING - 19;
         this.clanLabel.x = this.icon.x + this.icon.width - 15;
         this.priceLabel.x = this.clanLabel.x;
         this.icon.y = HEIGHT - this.icon.height >> 1;
         this.clanLabel.y = this.icon.y + 15;
         this.priceLabel.y = this.clanLabel.y + this.clanLabel.height - 2;
      }
   }
}

