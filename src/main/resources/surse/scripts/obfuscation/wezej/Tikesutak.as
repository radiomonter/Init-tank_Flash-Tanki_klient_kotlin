package obfuscation.wezej
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.money.Kyfa;
   import assets.Diamond;
   import controls.Money;
   import controls.base.ThreeLineBigButton;
   import controls.labels.MouseDisabledLabel;
   import flash.display.Sprite;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Tikesutak extends ThreeLineBigButton implements Kyfa
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      private static const rid:int = 16731648;
      
      private static const qagaq:int = 16777215;
      
      private var priceLabel:MouseDisabledLabel;
      
      private var crystals:int;
      
      public function Tikesutak()
      {
         super();
         this.priceLabel = new MouseDisabledLabel();
         this.priceLabel.size = 11;
         super.setText(localeService.getText(TanksLocale.TEXT_DAILY_QUEST_CHANGE));
         moneyService.addListener(this);
      }
      
      public function showButtonWithCrystals(_arg_1:int) : void
      {
         this.crystals = _arg_1;
         var _local_2:Diamond = new Diamond();
         _local_2.y = 3;
         var _local_3:Sprite = new Sprite();
         _local_3.addChild(this.priceLabel);
         _local_3.addChild(_local_2);
         addChild(_local_3);
         this.priceLabel.text = Money.numToString(_arg_1,false);
         this.priceLabel.x = int(_width / 2 - (this.priceLabel.width + _local_2.width) / 2);
         _local_2.x = this.priceLabel.x + this.priceLabel.textWidth + 7;
         this.finifubu();
         super.showInTwoRows(captionLabel,_local_3);
      }
      
      public function jyjesam() : void
      {
         super.showInOneRow(captionLabel);
      }
      
      public function crystalsChanged(_arg_1:int) : void
      {
         this.finifubu();
      }
      
      private function finifubu() : void
      {
         this.priceLabel.textColor = moneyService.crystal < this.crystals ? uint(rid) : uint(qagaq);
      }
      
      public function removeListeners() : void
      {
         moneyService.removeListener(this);
      }
   }
}

