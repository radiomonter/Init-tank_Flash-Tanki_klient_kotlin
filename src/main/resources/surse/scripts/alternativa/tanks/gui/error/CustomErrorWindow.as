package alternativa.tanks.gui.error
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import flash.display.DisplayObject;
   import platform.client.fp10.core.service.errormessage.IMessageBox;
   import platform.client.fp10.core.service.errormessage.errors.ConnectionClosedError;
   import platform.client.fp10.core.service.errormessage.errors.ErrorType;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class CustomErrorWindow implements IMessageBox
   {
      
      private static var localeService:ILocaleService;
      
      private var errorForm:ErrorForm;
      
      public function CustomErrorWindow(_arg_1:OSGi)
      {
         super();
         localeService = ILocaleService(_arg_1.getService(ILocaleService));
         this.errorForm = new ErrorForm(localeService);
         this.errorForm.setSupportUrl(localeService.getText(TanksLocale.TEXT_CONNECTION_CLOSED_WIKI_LINK));
      }
      
      public function getDisplayObject(_arg_1:ErrorType) : DisplayObject
      {
         var _local_2:String = this.getErrorText(_arg_1);
         this.errorForm.setErrorText(_local_2);
         return this.errorForm;
      }
      
      private function getErrorText(_arg_1:ErrorType) : String
      {
         var ErrorText:String = null;
         if(_arg_1 is ConnectionClosedError)
         {
            return localeService.language == "ru" ? "Соединение с сервером закрыто" : "Server connection closed";
         }
         return _arg_1.getMessage();
      }
      
      public function hide() : void
      {
         if(this.errorForm.parent != null)
         {
            this.errorForm.parent.removeChild(this.errorForm);
         }
      }
   }
}

