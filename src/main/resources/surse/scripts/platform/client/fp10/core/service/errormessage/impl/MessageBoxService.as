package platform.client.fp10.core.service.errormessage.impl
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import platform.client.fp10.core.service.errormessage.IErrorMessageService;
   import platform.client.fp10.core.service.errormessage.IMessageBox;
   import platform.client.fp10.core.service.errormessage.errors.ErrorType;
   
   public class MessageBoxService implements IErrorMessageService
   {
      
      private var osgi:OSGi;
      
      private var window:IMessageBox;
      
      public function MessageBoxService(_arg_1:OSGi)
      {
         super();
         this.osgi = _arg_1;
         this.window = new DefaultMessageWindow();
      }
      
      public function showMessage(_arg_1:ErrorType) : void
      {
         var _local_2:IDisplay = IDisplay(this.osgi.getService(IDisplay));
         _local_2.stage.addChild(this.window.getDisplayObject(_arg_1));
      }
      
      public function hideMessage() : void
      {
         this.window.hide();
      }
      
      public function setMessageBox(_arg_1:IMessageBox) : void
      {
         this.window = _arg_1;
      }
   }
}

