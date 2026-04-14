package alternativa.tanks.gui.premiumaccount
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import forms.ColorConstants;
   import forms.alert.AlertDialogWindow;
   import titanomachina.headers.Headers;
   
   public class PremiumAccountWelcomeAlert extends AlertDialogWindow
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var _welcomeText:String;
      
      public function PremiumAccountWelcomeAlert(_arg_1:String)
      {
         this._welcomeText = _arg_1;
         super(Headers.getHeaderById("PREMIUM_ACCOUNT"),localeService.getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT));
      }
      
      override protected function init() : void
      {
         var _local_1:Bitmap = null;
         var _local_2:LabelBase = null;
         _local_1 = null;
         super.init();
         _local_1 = new Bitmap(PremiumAccountIcons.premiumIconForWelcomeAlert);
         _contentPlace.addChild(_local_1);
         _local_2 = this.createLabel();
         _local_2.width = _local_1.width;
         _contentPlace.addChild(_local_2);
         _local_2.y = _local_1.height + GAP_11;
         var _local_3:int = Math.max(_local_1.width,_local_2.width + 2 * GAP_11);
         _local_1.x = _local_3 - _local_1.width >> 1;
         _local_2.x = _local_3 - _local_2.width >> 1;
         var _local_4:int = _local_1.height + GAP_11 + _local_2.height + GAP_11;
         setContentPlaceSize(_local_3,_local_4);
      }
      
      private function createLabel() : LabelBase
      {
         var _local_1:LabelBase = new LabelBase();
         _local_1.autoSize = TextFieldAutoSize.CENTER;
         _local_1.align = TextFormatAlign.CENTER;
         _local_1.multiline = true;
         _local_1.text = this._welcomeText;
         _local_1.size = 18;
         _local_1.color = ColorConstants.GREEN_TEXT;
         return _local_1;
      }
   }
}

