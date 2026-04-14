package alternativa.tanks.gui.presents
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.base.DefaultButtonBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import forms.alert.AlertDialogWindow;
   import titanomachina.headers.Headers;
   
   public class NewPresentsAlert extends AlertDialogWindow
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static var bitmapDataClass:Class = NewPresentsAlert_bitmapDataClass;
      
      private static var bitmapData:BitmapData = Bitmap(new bitmapDataClass()).bitmapData;
      
      private var acceptButton:DefaultButtonBase;
      
      public function NewPresentsAlert()
      {
         var _local_2:int = 0;
         super(Headers.getHeaderById("SYSTEM_MESSAGE"),localeService.getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT));
         var _local_1:Bitmap = new Bitmap(bitmapData);
         setContentPlaceSize(400,240);
         _contentPlace.addChild(_local_1);
         _local_1.x = (_contentPlace.width - _local_1.width) / 2;
         _local_1.y = (_contentPlace.height - _local_1.height) / 2;
         this.acceptButton = new DefaultButtonBase();
         this.acceptButton.label = localeService.getText(TextConst.TEXT_NEW_PRESENTS_ALERT_ACCEPT_BUTTON);
         _local_2 = Math.max(this.acceptButton.width,_cancelButton.width);
         this.acceptButton.x = (_buttonPlace.width - _local_2) / 2;
         this.acceptButton.width = _local_2;
         _cancelButton.x = _buttonPlace.width - _local_2;
         _cancelButton.width = _local_2;
         _buttonPlace.addChild(this.acceptButton);
         _cancelButton.addEventListener(MouseEvent.CLICK,this.cancel);
         this.acceptButton.addEventListener(MouseEvent.CLICK,this.accept);
         enqueueDialog();
      }
      
      private function accept(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new NewPresentsAlertEvent(NewPresentsAlertEvent.ACCEPT));
         this.destroyAlert();
      }
      
      private function cancel(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new NewPresentsAlertEvent(NewPresentsAlertEvent.CANCEL));
         this.destroyAlert();
      }
      
      private function destroyAlert() : void
      {
         _cancelButton.removeEventListener(MouseEvent.CLICK,this.cancel);
         this.acceptButton.removeEventListener(MouseEvent.CLICK,this.accept);
         destroy();
      }
   }
}

