package alternativa.tanks.model.lootboxes
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.panel.PanelModel;
   import controls.buttons.h50px.GreyBigButton;
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class LootBoxPanel implements AutoClosable
   {
      
      [Inject]
      public static var localeService:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
      
      private var buyButton:GreyBigButton = new GreyBigButton();
      
      public var openButton:GreyBigButton = new GreyBigButton();
      
      public function LootBoxPanel()
      {
         super();
         this.buyButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_INFO_PANEL_BUTTON_BUY_TEXT);
         this.openButton.label = localeService.getText(TanksLocale.TEXT_LOOT_OPEN_BUTTON);
         this.buyButton.addEventListener(MouseEvent.CLICK,onBuyClick);
      }
      
      private static function onBuyClick(_arg_1:MouseEvent) : void
      {
         PanelModel.switchPayment();
      }
      
      public function setOpenButtonEnabled(_arg_1:Boolean) : void
      {
         this.openButton.enabled = _arg_1;
      }
      
      public function close() : void
      {
         this.buyButton.removeEventListener(MouseEvent.CLICK,onBuyClick);
         this.openButton.removeEventListener(MouseEvent.CLICK,onBuyClick);
         this.buyButton = null;
         this.openButton = null;
      }
      
      public function updateActionElements(_arg_1:DisplayObjectContainer) : void
      {
         _arg_1.addChild(this.buyButton);
         _arg_1.addChild(this.openButton);
         this.buyButton.x = 11;
         if(this.buyButton.visible)
         {
            this.openButton.x = this.buyButton.x + (this.buyButton.width + 15) * 2;
         }
         else
         {
            this.openButton.x = 11;
         }
      }
   }
}

