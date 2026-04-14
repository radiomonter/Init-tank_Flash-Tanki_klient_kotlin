package alternativa.tanks.model.shop
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.shop.event.ShopItemChosen;
   import alternativa.tanks.service.panel.IPanelView;
   import flash.events.Event;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   
   public class ShopModel
   {
      
      private var localeService:ILocaleService;
      
      private var dialogsService:IDialogsService;
      
      private var panelView:IPanelView;
      
      private var window:ShopWindow;
      
      private var form:ShopPromoCodeModel;
      
      public function ShopModel()
      {
         super();
      }
      
      public function init(_arg_1:Object) : void
      {
         var _local_5:Object = null;
         var _local_6:Array = null;
         var _local_7:Object = null;
         this.localeService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
         this.dialogsService = OSGi.getInstance().getService(IDialogsService) as IDialogsService;
         this.panelView = IPanelView(OSGi.getInstance().getService(IPanelView));
         this.form = new ShopPromoCodeModel();
         ShopWindow.haveDoubleCrystalls = _arg_1.have_double_crystals;
         this.window = new ShopWindow();
         var _local_2:Object = JSON.parse(_arg_1.data);
         var _local_3:String = this.defuv(this.localeService.language);
         var _local_4:Array = _local_2.categories;
         for each(_local_5 in _local_4)
         {
            this.window.addCategory(_local_5.header_text[_local_3],_local_5.description[_local_3],_local_5.category_id);
         }
         _local_6 = _local_2.items;
         for each(_local_7 in _local_6)
         {
            this.window.addItem(_local_7.category_id,_local_7.item_id,_local_7.additional_data);
         }
         this.window.addEventListener(ShopItemChosen.EVENT_TYPE,this.onSelectItem);
         this.window.addEventListener(Event.CLOSE,this.onClose);
      }
      
      private function defuv(_arg_1:String) : String
      {
         switch(_arg_1)
         {
            case "ru":
            case "en":
               return _arg_1.toUpperCase();
            case "pt_BR":
               return _arg_1;
            default:
               return _arg_1.toUpperCase();
         }
      }
      
      private function onClose(_arg_1:Event) : void
      {
         this.dialogsService.removeDialog(this.window);
         this.window = null;
         this.form.objectUnloaded();
      }
      
      private function onSelectItem(_arg_1:ShopItemChosen) : void
      {
         var _local_2:String = _arg_1.itemId;
         if(_local_2.indexOf("promocode") > -1)
         {
            this.window.switchToPaymentState(this.form.getForm());
         }
         else
         {
            Network(OSGi.getInstance().getService(INetworker)).send("lobby;shop_try_buy_item;" + _arg_1.itemId + ";" + this.window.header.chooseCountryComboBox.selectedItem.code);
         }
      }
   }
}

