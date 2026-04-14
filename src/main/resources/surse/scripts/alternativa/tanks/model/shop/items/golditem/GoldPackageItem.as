package alternativa.tanks.model.shop.items.golditem
{
   import alternativa.tanks.model.shop.items.base.ShopItemBase;
   import alternativa.tanks.model.shop.items.base.ShopItemSkins;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.text.TextFieldAutoSize;
   import fominskiy.utils.timeunit.TimeUnitServiceLootBox;
   
   public class GoldPackageItem extends ShopItemBase
   {
      
      private static const LEFT_PADDING:int = 18;
      
      private static const MONEY_TEXT_LABEL_COLOR:uint = 4144959;
      
      private const PREMIUM_TEXT_LABEL_COLOR:uint = 3432728;
      
      private var goldLabel:LabelBase;
      
      private var priceLabel:LabelBase;
      
      private var icon:Bitmap;
      
      private var additionalData:Object;
      
      public function GoldPackageItem(_arg_1:String, _arg_2:Object)
      {
         this.additionalData = _arg_2;
         super(_arg_1,ShopItemSkins.GREY);
      }
      
      override protected function init() : void
      {
         super.init();
         this.initCrystalsAndPrice();
         this.render();
      }
      
      private function initCrystalsAndPrice() : void
      {
         this.goldLabel = new LabelBase();
         this.goldLabel.text = TimeUnitServiceLootBox.getLocalizedDaysString(this.additionalData.gold_count);
         this.goldLabel.color = this.PREMIUM_TEXT_LABEL_COLOR;
         this.goldLabel.autoSize = TextFieldAutoSize.LEFT;
         this.goldLabel.size = 26;
         this.goldLabel.bold = true;
         this.goldLabel.mouseEnabled = false;
         addChild(this.goldLabel);
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
      
      private function initGoldIcon() : void
      {
      }
      
      private function render() : void
      {
         if(Boolean(this.icon))
         {
            this.icon.x = LEFT_PADDING - 5;
            this.goldLabel.x = this.icon.x + this.icon.width - 15;
            this.icon.y = HEIGHT - this.icon.height >> 1;
            this.goldLabel.y = this.icon.y + 15;
         }
         else
         {
            this.goldLabel.x = LEFT_PADDING;
            this.goldLabel.y = HEIGHT + 15;
         }
         this.priceLabel.x = this.goldLabel.x;
         this.priceLabel.y = this.goldLabel.y + this.goldLabel.height - 2;
      }
      
      override public function set gridPosition(_arg_1:int) : void
      {
         super.gridPosition = _arg_1;
         var _local_2:BitmapData = GoldPackageItemIcons.goldPackages[gridPosition];
         if(!_local_2 && _arg_1 != 0)
         {
            _local_2 = GoldPackageItemIcons.goldPackages[GoldPackageItemIcons.goldPackages.length - 1];
         }
         if(Boolean(_local_2))
         {
            this.icon = new Bitmap(_local_2);
            addChildAt(this.icon,2);
         }
         this.render();
      }
   }
}

