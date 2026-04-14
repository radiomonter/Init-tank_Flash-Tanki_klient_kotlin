package alternativa.tanks.model.shop
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.shop.bugreport.PaymentBugReportBlock;
   import alternativa.tanks.model.shop.components.paymentview.PaymentView;
   import alternativa.tanks.model.shop.items.clanitem.ClanPackageItem;
   import alternativa.tanks.model.shop.items.crystallitem.CrystalPackageItem;
   import alternativa.tanks.model.shop.items.golditem.GoldPackageItem;
   import alternativa.tanks.model.shop.items.lootboxitem.LootBoxPackageItem;
   import alternativa.tanks.model.shop.items.newkit.NewKitPackageItem;
   import alternativa.tanks.model.shop.items.newkitty.NewKittyPackageItem;
   import alternativa.tanks.model.shop.items.premuimitem.PremiumPackageItem;
   import alternativa.tanks.model.shop.items.promo.PromoPackageItem;
   import controls.base.DefaultButtonBase;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.TankWindowWithHeader;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import titanomachina.headers.Headers;
   
   public class ShopWindow extends DialogWindow
   {
      
      public static var localeService:ILocaleService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
      
      public static const WINDOW_PADDING:int = 11;
      
      public static const WINDOW_WIDTH:int = 915;
      
      public static const SPACE_MODULE:int = 7;
      
      private static const WINDOW_MAX_HEIGHT:int = 691;
      
      private static const WINDOW_MIN_HEIGHT:int = 580;
      
      public static var haveDoubleCrystalls:Boolean = false;
      
      private var headerLayerIndex:int;
      
      private var tankWindow:TankWindowWithHeader = new TankWindowWithHeader(Headers.getHeaderById("PAYMENT"));
      
      private var paymentView:PaymentView;
      
      private var categories:ShopCategorysView = new ShopCategorysView();
      
      private var bugReportBlock:PaymentBugReportBlock;
      
      public var header:ShopWindowHeader = new ShopWindowHeader();
      
      private var closeButton:DefaultButtonBase;
      
      public function ShopWindow()
      {
         super();
         addChild(this.tankWindow);
         this.tankWindow.width = WINDOW_WIDTH;
         this.tankWindow.height = Math.round(Math.max(WINDOW_MIN_HEIGHT,Math.min(display.stage.stageHeight - 60,WINDOW_MAX_HEIGHT)));
         this.header.x = WINDOW_PADDING;
         this.header.y = WINDOW_PADDING;
         this.header.resize(WINDOW_WIDTH - WINDOW_PADDING * 2);
         this.closeButton = new DefaultButtonBase();
         this.closeButton.tabEnabled = false;
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         this.closeButton.x = this.tankWindow.width - this.closeButton.width - 2 * WINDOW_PADDING;
         this.closeButton.y = this.tankWindow.height - this.closeButton.height - WINDOW_PADDING;
         this.closeButton.addEventListener(MouseEvent.CLICK,this.onClickClose);
         addChild(this.closeButton);
         this.bugReportBlock = new PaymentBugReportBlock();
         this.bugReportBlock.x = WINDOW_PADDING;
         this.bugReportBlock.y = this.closeButton.y - WINDOW_PADDING - this.bugReportBlock.height;
         this.bugReportBlock.width = this.tankWindow.width - WINDOW_PADDING - this.bugReportBlock.x;
         addChild(this.bugReportBlock);
         this.headerLayerIndex = numChildren;
         this.tankWindow.addChild(this.categories);
         this.tankWindow.addChild(this.header);
         this.categories.x = WINDOW_PADDING;
         this.categories.y = this.header.y + this.header.height + SPACE_MODULE - 2;
         display.stage.addEventListener(Event.RESIZE,this.render);
         this.render();
         dialogService.addDialog(this);
      }
      
      public function render(_arg_1:Event = null) : void
      {
         if(Boolean(this.paymentView))
         {
            this.paymentView.x = WINDOW_PADDING;
            this.paymentView.y = this.header.y + this.header.height;
            this.paymentView.render(this.tankWindow.width - 11 * 2,this.bugReportBlock.y - this.paymentView.y - 3);
         }
         this.categories.render(WINDOW_WIDTH - WINDOW_PADDING * 2,this.bugReportBlock.y - this.categories.y - WINDOW_PADDING);
      }
      
      private function onClickClose(_arg_1:MouseEvent = null) : void
      {
         dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function addCategory(_arg_1:String, _arg_2:String, _arg_3:String) : void
      {
         this.categories.addCategory(new ShopCategoryView(_arg_1,_arg_2,_arg_3));
         this.categories.render(this.tankWindow.width - WINDOW_PADDING * 2,this.bugReportBlock.y - this.categories.y - WINDOW_PADDING);
      }
      
      public function switchToPaymentState(_arg_1:PaymentView) : void
      {
         if(Boolean(this.paymentView) && contains(this.paymentView))
         {
            removeChild(this.paymentView);
            this.paymentView.destroy();
         }
         this.paymentView = _arg_1;
         this.paymentView.window = this;
         addChildAt(this.paymentView,this.headerLayerIndex - 1);
         this.categories.visible = false;
         this.render();
         this.paymentView.postRender();
      }
      
      public function addItem(_arg_1:String, _arg_2:String, _arg_3:Object) : void
      {
         if(_arg_2.indexOf("crystal") >= 0)
         {
            this.categories.addItem(_arg_1,new CrystalPackageItem(_arg_2,_arg_3));
         }
         else if(_arg_2.indexOf("promocode") >= 0)
         {
            this.categories.addItem(_arg_1,new PromoPackageItem(_arg_2,_arg_3));
         }
         else if(_arg_2.indexOf("lootbox") >= 0)
         {
            this.categories.addItem(_arg_1,new LootBoxPackageItem(_arg_2,_arg_3));
         }
         else if(_arg_2.indexOf("gold") >= 0)
         {
            this.categories.addItem(_arg_1,new GoldPackageItem(_arg_2,_arg_3));
         }
         else if(_arg_2.indexOf("clan_license") >= 0)
         {
            this.categories.addItem(_arg_1,new ClanPackageItem(_arg_2,_arg_3));
         }
         else if(_arg_2.indexOf("newkit") >= 0)
         {
            this.categories.addItem(_arg_1,new NewKitPackageItem(_arg_2,_arg_3));
         }
         else if(_arg_2.indexOf("new-kit") >= 0)
         {
            this.categories.addItem(_arg_1,new NewKitPackageItem(_arg_2,_arg_3));
         }
         else if(_arg_2.indexOf("NewKitty") >= 0)
         {
            this.categories.addItem(_arg_1,new NewKittyPackageItem(_arg_2,_arg_3));
         }
         else
         {
            this.categories.addItem(_arg_1,new PremiumPackageItem(_arg_2,_arg_3));
         }
         this.categories.render(this.tankWindow.width - WINDOW_PADDING * 2,this.bugReportBlock.y - this.categories.y - WINDOW_PADDING);
      }
   }
}

