package alternativa.tanks.gui.upgrade
{
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.base.DefaultButtonBase;
   import flash.events.MouseEvent;
   import forms.base.BaseForm;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class UpgradeWindowBase extends BaseForm
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const VERTICAL_MARGIN:int = 8;
      
      private static const HORIZONTAL_MARGIN:int = 12;
      
      protected var cancelButton:DefaultButtonBase;
      
      public function UpgradeWindowBase(_arg_1:int, _arg_2:int)
      {
         super(_arg_1,_arg_2);
         bg.setHeaderId("UPGRADE");
         this.cancelButton = new DefaultButtonBase();
         this.cancelButton.width = 95;
         this.cancelButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_CLOSE_TEXT);
         this.cancelButton.y = _arg_2 - 5 - this.cancelButton.height - VERTICAL_MARGIN;
         this.cancelButton.x = _arg_1 - this.cancelButton.width - HORIZONTAL_MARGIN;
         this.cancelButton.addEventListener(MouseEvent.CLICK,this.onMouseClick);
         bg.addChild(this.cancelButton);
      }
      
      private function onMouseClick(_arg_1:MouseEvent) : void
      {
         this.onClose();
      }
      
      protected function onClose() : void
      {
      }
      
      protected function removeEvents() : void
      {
         this.cancelButton.removeEventListener(MouseEvent.CLICK,this.onClose);
      }
   }
}

