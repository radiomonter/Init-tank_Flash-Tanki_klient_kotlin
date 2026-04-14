package alternativa.tanks.gui.buycrystals
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.panel.PanelModel;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.labels.MouseDisabledLabel;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import forms.base.BaseFormWithInner;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class BuyCrystalsAlert extends DialogWindow
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const bitmapClass:Class = BuyCrystalsAlert_bitmapClass;
      
      public static const image:Bitmap = new Bitmap(new bitmapClass().bitmapData);
      
      private static const plusBitmapClass:Class = BuyCrystalsAlert_plusBitmapClass;
      
      public static const plus:Bitmap = new Bitmap(new plusBitmapClass().bitmapData);
      
      private static const VERTICAL_MARGIN:int = 8;
      
      private var baseFormWithInner:BaseFormWithInner;
      
      private var buyButton:DefaultButtonBase;
      
      private var closeButton:DefaultButtonBase;
      
      private var buyCaption:Sprite;
      
      private var label:LabelBase;
      
      private var crystals:int;
      
      public function BuyCrystalsAlert(_arg_1:int)
      {
         var _local_2:Bitmap = null;
         super();
         this.baseFormWithInner = new BaseFormWithInner(416,270,30);
         addChild(this.baseFormWithInner);
         this.crystals = _arg_1;
         this.baseFormWithInner.window.setHeaderId("ATTENTION");
         this.buyButton = new DefaultButtonBase();
         this.buyButton.width = 150;
         this.buyCaption = new Sprite();
         this.label = new MouseDisabledLabel();
         this.label.text = localeService.getText(TanksLocale.TEXT_GARAGE_BUY_TEXT);
         this.label.y = 5;
         plus.y = (this.buyButton.height - plus.height) * 0.5;
         this.label.x = plus.width;
         this.buyCaption.addChild(plus);
         this.buyCaption.addChild(this.label);
         this.buyButton.x = this.baseFormWithInner.inner.x;
         this.buyButton.y = this.baseFormWithInner.inner.y + this.baseFormWithInner.inner.height + VERTICAL_MARGIN;
         this.buyCaption.x = int(this.buyButton.x + (this.buyButton.width - this.buyCaption.width) * 0.5);
         this.buyCaption.y = this.buyButton.y;
         this.baseFormWithInner.window.addChild(this.buyButton);
         this.buyCaption.mouseEnabled = false;
         this.buyCaption.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
         this.baseFormWithInner.window.addChild(this.buyCaption);
         this.closeButton = new DefaultButtonBase();
         this.closeButton.width = 95;
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_CLOSE_TEXT);
         this.closeButton.y = this.buyButton.y;
         this.closeButton.x = this.baseFormWithInner.inner.x + this.baseFormWithInner.inner.width - this.closeButton.width;
         _local_2 = new Bitmap(localeService.getImage(TanksLocale.IMAGE_GARAGE_ADD_MORE_CRYSTALS));
         _local_2.x = int((this.baseFormWithInner.inner.width - _local_2.width) / 2);
         _local_2.y = 14;
         this.baseFormWithInner.inner.addChild(_local_2);
         image.x = (this.baseFormWithInner.inner.width - image.width) * 0.5 + 3;
         image.y = _local_2.y + _local_2.height + 3;
         this.baseFormWithInner.inner.addChild(image);
         this.baseFormWithInner.window.addChild(this.closeButton);
         this.buyButton.addEventListener(MouseEvent.CLICK,this.onBuy);
         this.closeButton.addEventListener(MouseEvent.CLICK,this.onCancel);
         dialogService.addDialog(this);
      }
      
      public function onBuy(_arg_1:Event = null) : void
      {
         dispatchEvent(new BuyCrystalsEvent(this.crystals));
         this.hide();
         PanelModel.switchPayment();
      }
      
      public function onCancel(_arg_1:Event = null) : void
      {
         this.hide();
      }
      
      private function hide() : void
      {
         this.buyButton.removeEventListener(MouseEvent.CLICK,this.onBuy);
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.onCancel);
         dialogService.removeDialog(this);
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.onCancel();
      }
      
      override protected function confirmationKeyPressed() : void
      {
         this.onBuy();
      }
   }
}

