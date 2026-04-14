package fominskiy.gui
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.ChangePasswordAndEmailEvent;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.base.DefaultButtonBase;
   import controls.base.TankInputBase;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import forms.TankWindowWithHeader;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import titanomachina.headers.Headers;
   
   public class RecoveryWindow extends DialogWindow
   {
      
      private var window:TankWindowWithHeader = new TankWindowWithHeader(Headers.getHeaderById("CHANGE_PASSWORD"));
      
      private var passInput:TankInputBase = new TankInputBase();
      
      private var pass2Input:TankInputBase = new TankInputBase();
      
      private var emailInput:TankInputBase = new TankInputBase();
      
      private var saveBtn:DefaultButtonBase = new DefaultButtonBase();
      
      private var cancelBtn:DefaultButtonBase = new DefaultButtonBase();
      
      private var bg:Sprite = new Sprite();
      
      private var bmp:Bitmap = new Bitmap();
      
      private var callback:Function;
      
      private var email:String;
      
      private var localeService:ILocaleService;
      
      public function RecoveryWindow(_arg_1:Function, _arg_2:String)
      {
         super();
         this.callback = _arg_1;
         this.email = _arg_2;
         this.localeService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
         this.draw();
      }
      
      private function draw() : void
      {
         addChild(this.window);
         this.window.width = 435;
         this.window.height = 169 - 11;
         this.window.addChild(this.passInput);
         this.passInput.x = 35 + 77;
         this.passInput.y = 20;
         this.passInput.width = 120;
         this.passInput.hidden = true;
         this.passInput.label = this.localeService.getText(TextConst.ACCOUNT_RECOVERY_FORM_NEW_PASSWORD);
         this.window.addChild(this.pass2Input);
         this.pass2Input.x = this.passInput.x + this.passInput.width - 30;
         this.pass2Input.y = 20;
         this.pass2Input.width = 120;
         this.pass2Input.hidden = true;
         this.pass2Input.label = this.localeService.getText(TextConst.REGISTER_FORM_REPEAT_PASSWORD_INPUT_LABEL_TEXT);
         this.window.addChild(this.emailInput);
         this.emailInput.x = 63;
         this.emailInput.y = this.pass2Input.y + this.emailInput.height + 11;
         this.emailInput.width = 352;
         this.emailInput.label = this.localeService.getText(TextConst.REGISTER_FORM_EMAIL_LABEL_TEXT);
         this.emailInput.value = this.email;
         this.window.addChild(this.saveBtn);
         this.saveBtn.x = this.window.width - this.saveBtn.width - 20;
         this.saveBtn.y = this.window.height - this.saveBtn.height - 24;
         this.saveBtn.label = this.localeService.getText(TextConst.ACCOUNT_RECOVERY_FORM_SAVE);
         this.window.addChild(this.cancelBtn);
         this.cancelBtn.x = this.window.width - this.cancelBtn.width * 2 - 34;
         this.cancelBtn.y = this.window.height - this.cancelBtn.height - 24;
         this.cancelBtn.label = this.localeService.getText(TextConst.ACCOUNT_RECOVERY_FORM_CANCEL);
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.close);
         this.saveBtn.addEventListener(MouseEvent.CLICK,this.onSave);
         this.pass2Input.addEventListener(FocusEvent.FOCUS_IN,this.checkPass);
         this.pass2Input.addEventListener(Event.CHANGE,this.checkPass);
         IDialogsService(OSGi.getInstance().getService(IDialogsService)).addDialog(this);
      }
      
      private function onSave(_arg_1:Event) : void
      {
         dispatchEvent(new ChangePasswordAndEmailEvent(ChangePasswordAndEmailEvent.CHANGE_PRESSED));
         if(Boolean(this.callback))
         {
            this.callback.call(null,this.pass2Input.value,this.emailInput.value);
         }
         this.close(null);
      }
      
      private function checkPass(_arg_1:Event) : void
      {
         if(this.pass2Input.value == null || this.pass2Input.value == "")
         {
            return;
         }
         if(this.pass2Input.value != this.passInput.value)
         {
            this.pass2Input.validValue = false;
            this.saveBtn.enable = false;
         }
         else
         {
            this.pass2Input.validValue = true;
            this.saveBtn.enable = true;
         }
      }
      
      public function close(_arg_1:Event = null) : void
      {
         dispatchEvent(new ChangePasswordAndEmailEvent(ChangePasswordAndEmailEvent.CANCEL_PRESSED));
         this.cancelBtn.removeEventListener(MouseEvent.CLICK,this.close);
         this.pass2Input.removeEventListener(FocusEvent.FOCUS_IN,this.checkPass);
         IDialogsService(OSGi.getInstance().getService(IDialogsService)).removeDialog(this);
      }
      
      public function pyqegyny() : String
      {
         return this.passInput.value;
      }
      
      public function getEmail() : String
      {
         return this.emailInput.value;
      }
   }
}

