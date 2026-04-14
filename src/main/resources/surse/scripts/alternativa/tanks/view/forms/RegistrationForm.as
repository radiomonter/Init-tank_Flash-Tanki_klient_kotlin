package alternativa.tanks.view.forms
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.controller.events.FightWithoutRegistrationEvent;
   import alternativa.tanks.controller.events.NavigationEvent;
   import alternativa.tanks.controller.events.socialnetwork.StartExternalEntranceEvent;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.view.forms.commons.RegistrationCommonElementsSection;
   import alternativa.tanks.view.registration.ExternalEntranceForm;
   import controls.base.BigButtonBase;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.TankWindowWithHeader;
   import org.robotlegs.core.IInjector;
   import titanomachina.headers.Headers;
   
   public class RegistrationForm extends Sprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      [Inject]
      public var injector:IInjector;
      
      private var _externalForm:ExternalEntranceForm;
      
      private var _window:TankWindowWithHeader;
      
      private var _registrationCommonElementsSection:RegistrationCommonElementsSection;
      
      private var _margin:int = 20;
      
      private var _smallMargin:int = 12;
      
      private var _border:int = 25;
      
      private var _windowWidth:int = 380;
      
      private var _goToLoginPage:LabelBase = new LabelBase();
      
      private var _backgroundContainer:Sprite;
      
      private var _backgroundImage:Bitmap;
      
      private var _antiAddictionEnabled:Boolean;
      
      private var _registrationCaptchaEnabled:Boolean;
      
      private var _registrationThroughEmail:Boolean;
      
      private var _skipRegistrationEnabled:Boolean;
      
      private var _goToLoginPageEnabled:Boolean;
      
      private var _skipRegistrationButton:BigButtonBase;
      
      private var _callsign:String = "";
      
      private var _password:String = "";
      
      private var _verificationPassword:String = "";
      
      private var _emailText:String;
      
      public function RegistrationForm(_arg_1:Boolean, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Bitmap, _arg_5:Boolean = true, _arg_6:Boolean = true, _arg_7:String = "", _arg_8:String = "", _arg_9:String = "", _arg_10:String = "")
      {
         super();
         this._registrationThroughEmail = _arg_1;
         this._registrationCaptchaEnabled = _arg_2;
         this._antiAddictionEnabled = _arg_3;
         this._backgroundImage = _arg_4;
         this._skipRegistrationEnabled = _arg_5;
         this._goToLoginPageEnabled = _arg_6;
         this._callsign = _arg_7;
         this._password = _arg_8;
         this._verificationPassword = _arg_9;
         this._emailText = _arg_10;
      }
      
      [PostConstruct]
      public function postConstruct() : void
      {
         var windowHeight:int = 0;
         var titleSkipRegistration:LabelBase = null;
         var _this:RegistrationForm = null;
         windowHeight = this._border;
         if(this._skipRegistrationEnabled)
         {
            this._skipRegistrationButton = new BigButtonBase();
            this._skipRegistrationButton.label = localeService.getText(TextConst.STRING_REGISTER_FORM_SKIP_REGISTRATION_TEXT);
            this._skipRegistrationButton.width = 330;
            this._skipRegistrationButton.height = 50;
            this._skipRegistrationButton.x = this._border;
            this._skipRegistrationButton.y = windowHeight;
            this._skipRegistrationButton.addEventListener(MouseEvent.CLICK,function(_arg_1:MouseEvent):void
            {
               dispatchEvent(new FightWithoutRegistrationEvent());
            });
            windowHeight += this._skipRegistrationButton.height;
            windowHeight += this._smallMargin - 8;
            titleSkipRegistration = new LabelBase();
            titleSkipRegistration.x = this._border;
            titleSkipRegistration.multiline = true;
            titleSkipRegistration.wordWrap = true;
            titleSkipRegistration.htmlText = localeService.getText(TextConst.STRING_REGISTER_FORM_TITLE_SKIP_REGISTRATION_TEXT);
            titleSkipRegistration.width = 330;
            titleSkipRegistration.y = windowHeight;
            windowHeight += titleSkipRegistration.height;
            windowHeight += this._margin - 10;
         }
         if(this._goToLoginPageEnabled)
         {
            this._goToLoginPage = new LabelBase();
            this._goToLoginPage.x = this._border;
            this._goToLoginPage.multiline = true;
            this._goToLoginPage.wordWrap = true;
            this._goToLoginPage.htmlText = localeService.getText(TextConst.STRING_REGISTER_FORM_TO_LOGIN_PAGE_TEXT);
            this._goToLoginPage.width = 330;
            this._goToLoginPage.y = windowHeight;
            _this = this;
            this._goToLoginPage.addEventListener(MouseEvent.CLICK,function(_arg_1:MouseEvent):void
            {
               dispatchEvent(new NavigationEvent(NavigationEvent.GO_TO_LOGIN_FORM));
            });
            windowHeight += this._goToLoginPage.height - 3;
            windowHeight += this._border;
         }
         this._backgroundContainer = new Sprite();
         addChild(this._backgroundContainer);
         this._window = new TankWindowWithHeader(Headers.getHeaderById("REGISTRATION"));
         this._window.width = this._windowWidth;
         this._window.height = windowHeight;
         if(this._skipRegistrationEnabled)
         {
            this._window.addChild(this._skipRegistrationButton);
            this._window.addChild(titleSkipRegistration);
         }
         if(Boolean(this._goToLoginPage))
         {
            this._window.addChild(this._goToLoginPage);
         }
         this._registrationCommonElementsSection = this.injector.instantiate(RegistrationCommonElementsSection);
         this._registrationCommonElementsSection.callsign = this._callsign;
         this._registrationCommonElementsSection.password = this._password;
         this._registrationCommonElementsSection.verificationPassword = this._verificationPassword;
         this._registrationCommonElementsSection.emailText = this._emailText;
         this._window.addChild(this._registrationCommonElementsSection);
         this._registrationCommonElementsSection.showCommonElements(this._registrationCaptchaEnabled,this._antiAddictionEnabled,this._registrationThroughEmail);
         if(this._goToLoginPageEnabled)
         {
            this._registrationCommonElementsSection.y = this._goToLoginPage.y + this._goToLoginPage.height - 3;
         }
         this._window.height = this._registrationCommonElementsSection.y + this._registrationCommonElementsSection.height + this._border;
         this._externalForm = new ExternalEntranceForm(this._windowWidth - 20,85,localeService.getText(TextConst.STRING_REGISTER_FORM_REGISTER_VIA));
         addChild(this._externalForm);
         this._externalForm.y = this._window.y + this._window.height - 15;
         this._externalForm.x = this._window.x + (this._windowWidth - this._externalForm.width) / 2;
         this._externalForm.vkButton.addEventListener(MouseEvent.CLICK,this.onClickVkButton);
         addChild(this._window);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function onClickVkButton(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new StartExternalEntranceEvent(StartExternalEntranceEvent.START_REGISTRATION,"vkontakte",this.rememberMe));
      }
      
      private function onClickFbButton(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new StartExternalEntranceEvent(StartExternalEntranceEvent.START_REGISTRATION,"facebook",this.rememberMe));
      }
      
      private function onAddedToStage(_arg_1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         stage.addEventListener(Event.RESIZE,this.alignYourself);
         this.alignYourself(null);
         if(Boolean(this._backgroundImage))
         {
            this.setBackground(this._backgroundImage);
         }
      }
      
      private function onRemovedFromStage(_arg_1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.alignYourself);
         if(this._externalForm != null)
         {
            this._externalForm.vkButton.removeEventListener(MouseEvent.CLICK,this.onClickVkButton);
         }
      }
      
      public function get captchaAnswer() : String
      {
         return this._registrationCommonElementsSection.captchaAnswer;
      }
      
      private function alignYourself(_arg_1:Event) : void
      {
         this.x = int((stage.stageWidth - this._windowWidth) / 2);
         this.y = int((stage.stageHeight - this._window.height) / 2);
         if(Boolean(this._backgroundImage))
         {
            graphics.clear();
            graphics.beginFill(0);
            graphics.drawRect(-this.x,-this.y,stage.stageWidth,stage.stageHeight);
            graphics.endFill();
            this._backgroundImage.x = int(this._windowWidth - this._backgroundImage.width >> 1);
            this._backgroundImage.y = -int(stage.stageHeight - this._window.height >> 1);
         }
      }
      
      public function get callsign() : String
      {
         return this._registrationCommonElementsSection != null ? this._registrationCommonElementsSection.callsign : "";
      }
      
      public function get password() : String
      {
         return this._registrationCommonElementsSection != null ? this._registrationCommonElementsSection.password : "";
      }
      
      public function get verificationPassword() : String
      {
         return this._registrationCommonElementsSection != null ? this._registrationCommonElementsSection.verificationPassword : "";
      }
      
      public function get emailText() : String
      {
         return this._registrationCommonElementsSection != null ? this._registrationCommonElementsSection.emailText : "";
      }
      
      public function get rememberMe() : Boolean
      {
         return this._registrationCommonElementsSection.rememberMe;
      }
      
      public function get idNumber() : String
      {
         return this._registrationCommonElementsSection.idNumber;
      }
      
      public function get realName() : String
      {
         return this._registrationCommonElementsSection.realName;
      }
      
      public function setBackground(_arg_1:Bitmap) : void
      {
         if(this._backgroundContainer.numChildren == 0)
         {
            this._backgroundImage = _arg_1;
            this._backgroundContainer.addChild(_arg_1);
            this.alignYourself(null);
         }
      }
      
      public function get goToFirstBattleButton() : DisplayObject
      {
         return this._skipRegistrationButton;
      }
      
      public function set realName(_arg_1:String) : void
      {
         this._registrationCommonElementsSection.realName = _arg_1;
      }
      
      public function set idNumber(_arg_1:String) : void
      {
         this._registrationCommonElementsSection.idNumber = _arg_1;
      }
      
      public function get skipRegistrationEnabled() : Boolean
      {
         return this._skipRegistrationEnabled;
      }
   }
}

