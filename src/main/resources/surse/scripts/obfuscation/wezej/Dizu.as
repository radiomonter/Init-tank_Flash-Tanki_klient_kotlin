package obfuscation.wezej
{
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.base.ThreeLineBigButton;
   import controls.labels.MouseDisabledLabel;
   import obfuscation.deb.Bezes;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Dizu extends ThreeLineBigButton
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var priceLabel:MouseDisabledLabel;
      
      public function Dizu()
      {
         super();
         this.priceLabel = new MouseDisabledLabel();
         this.priceLabel.size = 11;
         setSkin(Bezes.velodej);
         super.setText(localeService.getText(TanksLocale.TEXT_DAILY_QUEST_GET_PRIZE));
         super.showInOneRow(captionLabel);
      }
   }
}

