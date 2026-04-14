package alternativa.tanks.view.forms
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.controller.events.NavigationEvent;
   import alternativa.tanks.view.events.RefreshCaptchaClickedEvent;
   import alternativa.tanks.view.events.SendRestoreEmailMessageEvent;
   import alternativa.tanks.view.registration.CaptchaSection;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   import forms.TankWindowWithHeader;
   import forms.events.AlertEvent;
   import org.robotlegs.core.IInjector;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import services.alertservice.Alert;
   import titanomachina.headers.Headers;
   
   public class PasswordRestoreForm extends Sprite
   {
      
      [Inject]
      public static var validateService:IValidateService;
      
      private static const MARGIN:int = 20;
      
      private static const wikoku:int = 10;
      
      [Inject]
      public var localeService:ILocaleService;
      
      [Inject]
      public var injector:IInjector;
      
      public var captchaSection:CaptchaSection;
      
      public var cancelButton:DefaultButtonBase;
      
      public var recoverButton:DefaultButtonBase;
      
      private var _windowWidth:int = 0;
      
      private var _windowHeight:int = 0;
      
      private var _margin:int = 20;
      
      public var email:TankInputBase;
      
      public function PasswordRestoreForm()
      {
         super();
      }
      
      [PostConstruct]
      public function postConstruct() : void
      {
         var infoLinkContent:String;
         var window:TankWindowWithHeader = null;
         var label:LabelBase = null;
         var nextElementY:int = 0;
         var infoLink:LabelBase = null;
         window = new TankWindowWithHeader(Headers.getHeaderById("CHANGE_PASSWORD"));
         window.width = this._windowWidth;
         window.height = this._windowHeight;
         label = new LabelBase();
         addChild(window);
         addChild(label);
         label.multiline = true;
         label.align = TextFormatAlign.CENTER;
         label.text = this.localeService.getText(TanksLocale.TEXT_ACCOUNT_RECOVERY_FORM_HELP_LABEL_TEXT);
         label.x = MARGIN + 5;
         label.y = MARGIN;
         nextElementY = label.y + label.height - 6;
         if(this._windowWidth < label.width)
         {
            this._windowWidth = label.width + 2 * MARGIN + 5;
         }
         this.email = new TankInputBase();
         this.email.width = this._windowWidth - 2 * MARGIN - 5;
         this.email.x = MARGIN + 5;
         this.email.y = nextElementY + MARGIN;
         nextElementY += this.email.height + MARGIN;
         infoLinkContent = "";
         if(infoLinkContent != "")
         {
            infoLink = new LabelBase();
            infoLink.htmlText = infoLinkContent;
            infoLink.x = int(this._windowWidth / 2 - infoLink.width / 2);
            infoLink.y = nextElementY + wikoku;
            nextElementY = infoLink.y + infoLink.height + wikoku;
            addChild(infoLink);
         }
         else
         {
            nextElementY += MARGIN;
         }
         this.captchaSection = this.injector.instantiate(CaptchaSection);
         this.captchaSection.refreshButton.addEventListener(MouseEvent.CLICK,function(_arg_1:MouseEvent):void
         {
            dispatchEvent(new RefreshCaptchaClickedEvent());
         });
         window.addChild(this.captchaSection);
         this.captchaSection.y = nextElementY;
         this.captchaSection.x = MARGIN + 5;
         this.captchaSection.width = this._windowWidth - 2 * MARGIN - 5;
         this.captchaSection.visible = true;
         nextElementY += this.captchaSection.height + MARGIN;
         this.cancelButton = new DefaultButtonBase();
         this.recoverButton = new DefaultButtonBase();
         addChild(this.cancelButton);
         addChild(this.recoverButton);
         addChild(this.email);
         this.cancelButton.x = this._windowWidth - MARGIN - this.cancelButton.width;
         this.cancelButton.y = nextElementY + MARGIN;
         this.recoverButton.x = MARGIN + 5;
         this.recoverButton.y = nextElementY + MARGIN;
         nextElementY += MARGIN + this.cancelButton.height;
         this._windowHeight = nextElementY + MARGIN;
         window.height = this._windowHeight + 5;
         window.width = this._windowWidth + 5;
         this.cancelButton.label = this.localeService.getText(TanksLocale.TEXT_ACCOUNT_RECOVERY_FORM_BUTTON_CANCEL_TEXT);
         this.recoverButton.label = this.localeService.getText(TanksLocale.TEXT_ACCOUNT_RECOVERY_FORM_BUTTON_RECOVER_TEXT);
         this.cancelButton.addEventListener(MouseEvent.CLICK,this.onClickCancelButton);
         this.recoverButton.addEventListener(MouseEvent.CLICK,this.onClickRecoverButton);
         this.email.addEventListener(KeyboardEvent.KEY_DOWN,this.onPlayClickedKey);
         this.recoverButton.enable = false;
         this.email.addEventListener(FocusEvent.FOCUS_IN,this.restoreInput);
         this.email.addEventListener(KeyboardEvent.KEY_UP,this.enableButton);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function onAddedToStage(_arg_1:Event) : void
      {
         stage.focus = this.email;
         stage.addEventListener(Event.RESIZE,this.alignYourself);
         this.email.validValue = true;
         this.alignYourself(null);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onRemovedFromStage(_arg_1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.alignYourself);
      }
      
      private function onPlayClickedKey(_arg_1:KeyboardEvent) : void
      {
         if(_arg_1.keyCode == Keyboard.ENTER && this.recoverButton.enable)
         {
            dispatchEvent(new SendRestoreEmailMessageEvent(this.captchaAnswer,this.email.value));
         }
      }
      
      private function enableButton(_arg_1:KeyboardEvent) : void
      {
         this.recoverButton.enable = validateService.isEmailValid(this.email.value);
      }
      
      private function alignYourself(_arg_1:Event) : void
      {
         this.x = int((stage.stageWidth - this._windowWidth) / 2);
         this.y = int((stage.stageHeight - this._windowHeight) / 2);
      }
      
      public function statusOkRestoreEmail() : void
      {
         this.showAlertWindow(Alert.ALERT_RECOVERY_LINK_SENDED);
      }
      
      public function statusMailNotFoundRestoreEmail() : void
      {
         this.showAlertWindow(Alert.ERROR_EMAIL_NOTFOUND);
      }
      
      public function statusMAILNOTSENDRestoreEmail() : void
      {
         this.showAlertWindow(Alert.ERROR_EMAIL_NOTSENDED);
      }
      
      private function onClickRecoverButton(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new SendRestoreEmailMessageEvent(this.captchaAnswer,this.email.value));
      }
      
      private function onClickCancelButton(_arg_1:MouseEvent) : void
      {
         this.goToLoginForm();
      }
      
      private function restoreInput(_arg_1:Event) : void
      {
         this.email.validValue = true;
      }
      
      private function showAlertWindow(param1:int) : void
      {
         var alertType:int = param1;
         var errorWindow:Alert = new Alert(alertType);
         this.injector.injectInto(errorWindow);
         parent.addChild(errorWindow);
         stage.focus = errorWindow.closeButton;
         if(alertType == Alert.ALERT_RECOVERY_LINK_SENDED)
         {
            errorWindow.addEventListener(AlertEvent.ALERT_BUTTON_PRESSED,function(_arg_1:AlertEvent):void
            {
               goToLoginForm();
            });
         }
      }
      
      private function goToLoginForm() : void
      {
         dispatchEvent(new NavigationEvent(NavigationEvent.GO_TO_LOGIN_FORM));
      }
      
      public function get captchaAnswer() : String
      {
         return this.captchaSection.captchaAnswer.value;
      }
      
      public function set captchaImage(_arg_1:Bitmap) : void
      {
         this.captchaSection.captcha = _arg_1;
      }
      
      public function captchaFailed() : void
      {
         dispatchEvent(new RefreshCaptchaClickedEvent());
      }
   }
}

