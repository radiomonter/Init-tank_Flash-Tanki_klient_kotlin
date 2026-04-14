package alternativa.tanks.view.forms
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.controller.events.AccountLoginPressed;
   import alternativa.tanks.controller.events.LoginButtonPressed;
   import alternativa.tanks.controller.events.NavigationEvent;
   import alternativa.tanks.controller.events.socialnetwork.StartExternalEntranceEvent;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.view.bubbles.Bubble;
   import alternativa.tanks.view.bubbles.EntranceBubbleFactory;
   import alternativa.tanks.view.events.RefreshCaptchaClickedEvent;
   import alternativa.tanks.view.forms.commons.RegistrationCommonElementsSection;
   import alternativa.tanks.view.forms.primitives.Alert;
   import alternativa.tanks.view.forms.primitives.ValidationIcon;
   import alternativa.tanks.view.registration.CaptchaSection;
   import alternativa.tanks.view.registration.ExternalEntranceForm;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.PasswordInput;
   import controls.base.TankCheckBoxBase;
   import controls.base.TankInputBase;
   import controls.dropdownlist.AccountsList;
   import flash.display.Bitmap;
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.net.SharedObject;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import forms.TankWindowWithHeader;
   import forms.events.LoginFormEvent;
   import org.robotlegs.core.IInjector;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.flash.commons.services.validate.ValidateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import titanomachina.headers.Headers;
   
   public class LoginForm extends Sprite
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var validateService:IValidateService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public var localeService:ILocaleService;
      
      [Inject]
      public var injector:IInjector;
      
      public var _callSignOrEmail:TankInputBase;
      
      public var restoreLink:LabelBase;
      
      private var _password:PasswordInput;
      
      public var checkRemember:TankCheckBoxBase;
      
      public var playButton:DefaultButtonBase;
      
      public var registerButton:LabelBase;
      
      private var checkRememberLabel:LabelBase;
      
      private var accountsList:AccountsList;
      
      private var bg:TankWindowWithHeader;
      
      private var accountSelected:Boolean = false;
      
      private var snPanel:ExternalEntranceForm;
      
      public var captchaSection:CaptchaSection;
      
      private var _margin:int = 25;
      
      private var _windowWidth:int = 372;
      
      private var _windowHeight:int = 193;
      
      private var _inputsLeftMargin:int = 72;
      
      private var _symbolIsNotAllowedBubble:Bubble;
      
      private var _callSignCheckIcon:ValidationIcon;
      
      private var _notAllowedShowDelayTimerTimer:Timer;
      
      private var _isAddLoginButtonPressedEventListeners:Boolean;
      
      public function LoginForm()
      {
         super();
      }
      
      [PostConstruct]
      public function postConstruct() : void
      {
         var buttonWidth:int;
         this.bg = new TankWindowWithHeader(Headers.getHeaderById("LOGIN"));
         this.bg.width = this._windowWidth;
         this.bg.height = this._windowHeight;
         this.restoreLink = new LabelBase();
         this.restoreLink.htmlText = this.localeService.getText(TextConst.CHECK_PASSWORD_FORM_RESTORE_LINK_TEXT);
         this.restoreLink.x = this._windowWidth - this.restoreLink.width - this._margin;
         this.restoreLink.y = this._margin;
         this.bg.addChild(this.restoreLink);
         buttonWidth = 115;
         this._callSignOrEmail = new TankInputBase();
         this._callSignOrEmail.label = this.localeService.getText(TextConst.CHECK_PASSWORD_FORM_CALLSIGN);
         this._callSignOrEmail.maxChars = RegistrationCommonElementsSection.MAX_CHARS_EMAIL;
         this._password = new PasswordInput();
         this._password.label = this.localeService.getText(TextConst.CHECK_PASSWORD_FORM_PASSWORD);
         this._inputsLeftMargin = this._margin - 3 + (Math.abs(this._callSignOrEmail._label.x) > Math.abs(this._password._label.x) ? Math.abs(this._callSignOrEmail._label.x) : Math.abs(this._password._label.x));
         this.registerButton = new LabelBase();
         this.registerButton.htmlText = "<a href=\'event:\'><font color=\'#59ff32\'><u>" + this.localeService.getText(TextConst.STRING_CHECK_PASSWORD_FORM_BUTTON_NEW_PLAYER_TEXT) + "</u></font></a>";
         this.registerButton.width = Math.max(this.registerButton.width,buttonWidth);
         this.registerButton.x = this._inputsLeftMargin;
         this.registerButton.y = this._margin;
         this.registerButton.visible = false;
         this.bg.addChild(this.registerButton);
         this._callSignOrEmail.width = this._windowWidth - this._inputsLeftMargin - this._margin;
         this._callSignOrEmail.x = this._inputsLeftMargin;
         this._callSignOrEmail.y = this._margin + this.restoreLink.height + this._margin / 3;
         this._callSignOrEmail.tabIndex = 0;
         this._callSignOrEmail.restrict = "@А-Яа-я.0-9a-zA-z_\\-";
         this._callSignOrEmail.addEventListener(LoginFormEvent.TEXT_CHANGED,this.onCallsignChanged);
         this.accountsList = new AccountsList(this._callSignOrEmail);
         this.accountsList.tabChildren = false;
         this.accountsList.x = this._callSignOrEmail.x;
         this.accountsList.y = this._callSignOrEmail.y + 3;
         this.accountsList.addEventListener(Event.CHANGE,this.onAccountChange);
         this.accountsList.width = this._windowWidth - this._inputsLeftMargin - this._margin;
         this.accountsList.initialize();
         this._password.width = this._windowWidth - this._inputsLeftMargin - this._margin;
         this._password.x = this._inputsLeftMargin;
         this._password.y = this._callSignOrEmail.y + this._callSignOrEmail.height + this._margin / 3;
         this._password.hidden = true;
         this._password.tabIndex = 1;
         this.bg.addChild(this._password);
         this._callSignCheckIcon = new ValidationIcon();
         this._callSignCheckIcon.x = this._windowWidth - this._margin - this._callSignCheckIcon.width - 10;
         this._callSignCheckIcon.y = this._callSignOrEmail.y + 7;
         this.bg.addChild(this._callSignCheckIcon);
         this.checkRemember = new TankCheckBoxBase();
         this.checkRemember.x = this._inputsLeftMargin;
         this.checkRemember.y = this._windowHeight - this.checkRemember.height - this._margin - 2;
         this.bg.addChild(this.checkRemember);
         this.checkRememberLabel = new LabelBase();
         this.checkRememberLabel.x = this.checkRemember.x + this.checkRemember.width;
         this.checkRememberLabel.y = this.checkRemember.y + 5;
         this.checkRememberLabel.text = this.localeService.getText(TextConst.CHECK_PASSWORD_FORM_REMEMBER);
         this.bg.addChild(this.checkRememberLabel);
         this.playButton = new DefaultButtonBase();
         this.playButton.label = this.localeService.getText(TextConst.CHECK_PASSWORD_FORM_PLAY_BUTTON);
         this.playButton.width = this.registerButton.width = Math.max(this.playButton.width,this.registerButton.width);
         this.playButton.x = this._windowWidth - this._margin - this.playButton.width;
         this.playButton.y = this._windowHeight - this.playButton.height - this._margin;
         this.bg.addChild(this.playButton);
         this.captchaSection = this.injector.instantiate(CaptchaSection);
         this.snPanel = new ExternalEntranceForm(this._windowWidth - 40,85,this.localeService.getText(TextConst.STRING_CHECK_PASSWORK_FORM_LOGIN_VIA));
         addChild(this.snPanel);
         this.snPanel.y = this.bg.y + this.bg.height - 15;
         this.snPanel.x = this.bg.x + (this._windowWidth - this.snPanel.width) / 2;
         this.snPanel.vkButton.addEventListener(MouseEvent.CLICK,this.onVkButtonClick);
         this.bg.addChild(this._callSignOrEmail);
         this.bg.addChild(this.accountsList);
         addChild(this.bg);
         this.registerButton.visible = true;
         this.registerButton.addEventListener(MouseEvent.CLICK,this.onRegistrationClicked);
         this.restoreLink.addEventListener(MouseEvent.CLICK,this.showRestoreForm);
         this.captchaSection.refreshButton.addEventListener(MouseEvent.CLICK,function(_arg_1:MouseEvent):void
         {
            dispatchEvent(new RefreshCaptchaClickedEvent());
         });
         this._symbolIsNotAllowedBubble = EntranceBubbleFactory.symbolIsNotAllowedBubble();
         this._notAllowedShowDelayTimerTimer = new Timer(1000,1);
         this._notAllowedShowDelayTimerTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onCallsignCheckTimerComplete);
         this.addLoginButtonPressedEventListeners();
         display.stage.addEventListener(Event.RESIZE,this.alignYourself);
         this.alignYourself();
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      private function onRemoveFromStage(_arg_1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         display.stage.removeEventListener(Event.RESIZE,this.alignYourself);
         this.registerButton.removeEventListener(MouseEvent.CLICK,this.onRegistrationClicked);
         this.restoreLink.removeEventListener(MouseEvent.CLICK,this.showRestoreForm);
         this._callSignOrEmail.removeEventListener(LoginFormEvent.TEXT_CHANGED,this.onCallsignChanged);
         this.removeLoginButtonPressedEvenListeners();
         this._notAllowedShowDelayTimerTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onCallsignCheckTimerComplete);
         this._notAllowedShowDelayTimerTimer.stop();
         this.snPanel.vkButton.removeEventListener(MouseEvent.CLICK,this.onVkButtonClick);
      }
      
      private function onAccountChange(_arg_1:Event) : void
      {
         if(!this.accountsList.selectedItem)
         {
            this.accountSelected = false;
            if(this.accountsList.length == 0)
            {
               this.callsign = "";
               this.password = "";
               this._password.enable = true;
               this.accountsList.visible = false;
               this.accountsList.removeEventListener(Event.CHANGE,this.onAccountChange);
               this._callSignCheckIcon.x += 31;
            }
            else
            {
               this.accountsList.selectItemAt(0);
            }
            return;
         }
         this.callsign = this.accountsList.selectedItem.data.userName;
         this._password.enable = false;
         this.password = "12345678";
         this.accountSelected = true;
      }
      
      private function onVkButtonClick(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new StartExternalEntranceEvent(StartExternalEntranceEvent.START_LOGIN,"vkontakte",this.rememberMe));
      }
      
      private function onFbButtonClick(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new StartExternalEntranceEvent(StartExternalEntranceEvent.START_LOGIN,"facebook",this.rememberMe));
      }
      
      private function onCallsignCheckTimerComplete(_arg_1:TimerEvent) : void
      {
         this.hideBubbles();
      }
      
      private function onCallsignChanged(_arg_1:LoginFormEvent) : void
      {
         if(this.accountSelected)
         {
            this._password.enable = true;
            this.password = "";
            this.accountSelected = false;
         }
         this.hideBubbles();
         this._notAllowedShowDelayTimerTimer.reset();
         this._notAllowedShowDelayTimerTimer.start();
         if(!validateService.isValidIdentificationStringForLogin(this._callSignOrEmail.value))
         {
            this._callSignOrEmail.value = this._callSignOrEmail.value.replace(ValidateService.NOT_ALLOWED_PATTERN_FOR_LOGIN,"");
            this._callSignOrEmail.validValue = false;
            this._callSignCheckIcon.markAsInvalid();
            this._callSignCheckIcon.addChild(this._symbolIsNotAllowedBubble);
         }
      }
      
      private function hideBubbles() : void
      {
         this._callSignOrEmail.validValue = true;
         this._symbolIsNotAllowedBubble.hide();
         this._callSignCheckIcon.turnOff();
      }
      
      private function addLoginButtonPressedEventListeners() : void
      {
         if(!this._isAddLoginButtonPressedEventListeners)
         {
            this._isAddLoginButtonPressedEventListeners = true;
            this.playButton.enable = true;
            this.playButton.addEventListener(MouseEvent.CLICK,this.onPlayClicked);
            this._password.addEventListener(KeyboardEvent.KEY_DOWN,this.onPlayClickedKey);
            this.captchaSection.captchaAnswer.addEventListener(KeyboardEvent.KEY_DOWN,this.onPlayClickedKey);
         }
      }
      
      private function removeLoginButtonPressedEvenListeners() : void
      {
         if(this._isAddLoginButtonPressedEventListeners)
         {
            this._isAddLoginButtonPressedEventListeners = false;
            this.playButton.enable = false;
            this.playButton.removeEventListener(MouseEvent.CLICK,this.onPlayClicked);
            this._password.removeEventListener(KeyboardEvent.KEY_DOWN,this.onPlayClickedKey);
            this.captchaSection.captchaAnswer.removeEventListener(KeyboardEvent.KEY_DOWN,this.onPlayClickedKey);
         }
      }
      
      private function onPlayClicked(_arg_1:MouseEvent) : void
      {
         this.removeLoginButtonPressedEvenListeners();
         if(this.accountSelected)
         {
            this.saveAccount();
            dispatchEvent(new AccountLoginPressed());
         }
         else
         {
            dispatchEvent(new LoginButtonPressed());
         }
      }
      
      private function saveAccount() : void
      {
         var _local_1:SharedObject = storageService.getStorage();
         var _local_2:Object = this.accountsList.selectedItem.data;
         _local_1.data.userName = _local_2.userName;
         _local_1.data.userHash = _local_2.userHash;
         if(!this.rememberMe)
         {
            _local_1.data.userHash = null;
         }
         _local_1.flush();
      }
      
      private function onPlayClickedKey(_arg_1:KeyboardEvent) : void
      {
         if(_arg_1.keyCode == Keyboard.ENTER && this.playButton.enable)
         {
            this.removeLoginButtonPressedEvenListeners();
            if(this.accountSelected)
            {
               this.removeLoginButtonPressedEvenListeners();
               this.saveAccount();
               dispatchEvent(new AccountLoginPressed());
            }
            else
            {
               dispatchEvent(new LoginButtonPressed());
            }
         }
      }
      
      private function onRegistrationClicked(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new NavigationEvent(NavigationEvent.GO_TO_REGISTRATION_FORM));
      }
      
      public function get captchaAnswer() : String
      {
         if(Boolean(this.captchaSection))
         {
            return this.captchaSection.captchaAnswer.value;
         }
         return "";
      }
      
      public function get mainPassword() : String
      {
         return this._password.value;
      }
      
      public function set password(_arg_1:String) : void
      {
         this._password.value = _arg_1;
      }
      
      public function get callsign() : String
      {
         return this._callSignOrEmail.value;
      }
      
      public function set callsign(_arg_1:String) : void
      {
         if(_arg_1 != null)
         {
            this._callSignOrEmail.value = _arg_1;
            display.stage.focus = this._callSignOrEmail.textField.length == 0 ? this._callSignOrEmail.textField : this._password.textField;
         }
      }
      
      public function get password() : String
      {
         return this._password.value;
      }
      
      public function get hash() : String
      {
         return this.accountsList.selectedItem.data.userHash;
      }
      
      public function set enableRegistration(_arg_1:Boolean) : void
      {
         this.registerButton.visible = _arg_1;
         if(_arg_1)
         {
            this.registerButton.addEventListener(MouseEvent.CLICK,this.onRegistrationClicked);
         }
         else
         {
            this.registerButton.removeEventListener(MouseEvent.CLICK,this.onRegistrationClicked);
         }
      }
      
      private function showRestoreForm(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new NavigationEvent(NavigationEvent.GO_TO_RESTORE_PASSWORD_FORM));
      }
      
      public function alertAboutWrongPassword() : void
      {
         this.showErrorWindow(Alert.ERROR_PASSWORD_INCORRECT);
         this._password.clear();
         this.accountSelected = false;
         this.addLoginButtonPressedEventListeners();
         if(this.bg.contains(this.captchaSection))
         {
            this.captchaSection.captchaAnswer.clear();
            dispatchEvent(new RefreshCaptchaClickedEvent());
         }
      }
      
      private function showErrorWindow(_arg_1:int) : void
      {
         var _local_2:Alert = new Alert(_arg_1);
         this.injector.injectInto(_local_2);
         parent.addChild(_local_2);
      }
      
      private function alignYourself(_arg_1:Event = null) : void
      {
         this.x = int((display.stage.stageWidth - this.windowWidth) / 2);
         this.y = int((display.stage.stageHeight - this.windowHeight) / 2);
      }
      
      public function get rememberMe() : Boolean
      {
         return this.checkRemember.checked;
      }
      
      public function set remember(_arg_1:Boolean) : void
      {
         this.checkRemember.checked = _arg_1;
      }
      
      public function get windowWidth() : int
      {
         return this._windowWidth;
      }
      
      public function get windowHeight() : int
      {
         return this._windowHeight;
      }
      
      public function set captchaImage(_arg_1:Bitmap) : void
      {
         if(Boolean(this.captchaSection))
         {
            this.captchaSection.captcha = _arg_1;
         }
      }
      
      public function captchaFailed() : void
      {
         this.addLoginButtonPressedEventListeners();
      }
      
      public function showCaptchaSection() : void
      {
         if(!this.bg.contains(this.captchaSection))
         {
            this.bg.addChild(this.captchaSection);
            this.addLoginButtonPressedEventListeners();
            this.captchaSection.y = this._password.y + this._password.height + this._margin - 5;
            this.captchaSection.x = this._inputsLeftMargin;
            this.captchaSection.width = this._windowWidth - this._inputsLeftMargin - this._margin;
            this.captchaSection.visible = true;
            this.playButton.y = this.captchaSection.y + this.captchaSection.height + this._margin - 5;
            this.checkRemember.y = this.playButton.y + 2;
            this.checkRememberLabel.y = this.checkRemember.y + 5;
            this._windowHeight = this._windowHeight + this.captchaSection.height + this._margin - 5;
            this.bg.height = this._windowHeight;
            if(this.snPanel != null)
            {
               this.snPanel.y = this.bg.y + this.bg.height - 15;
               this.snPanel.x = this.bg.x + 20;
            }
            this.alignYourself();
            dispatchEvent(new RefreshCaptchaClickedEvent());
         }
      }
   }
}

