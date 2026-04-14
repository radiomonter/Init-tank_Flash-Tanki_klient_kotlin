package obfuscation.lumygaw
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.icons.Hihidiqar;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.service.socialnetwork.ISocialNetworkPanelService;
   import alternativa.tanks.service.socialnetwork.SocialNetworkServiceEvent;
   import alternativa.tanks.view.events.RefreshCaptchaClickedEvent;
   import alternativa.tanks.view.registration.CaptchaSection;
   import assets.icons.InputCheckIcon;
   import controls.DefaultIconButton;
   import controls.FBButton;
   import controls.TankWindowInner;
   import controls.VKButton;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import controls.containers.HorizontalStackPanel;
   import controls.containers.VerticalStackPanel;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.system.Capabilities;
   import flash.text.AntiAliasType;
   import forms.events.LoginFormEvent;
   import forms.registration.CallsignIconStates;
   import forms.registration.bubbles.EmailInvalidBubble;
   import forms.registration.bubbles.PasswordIsTooEasyBubble;
   import forms.registration.bubbles.PasswordsDoNotMatchBubble;
   import obfuscation.qimi.Jin;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.LocaleServiceLangValues;
   
   public class Myzu extends Jin
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var partnersService:IPartnerService;
      
      [Inject]
      public static var socialNetworkService:ISocialNetworkPanelService;
      
      [Inject]
      public static var validateService:IValidateService;
      
      [Inject]
      public static var helperService:IHelpService;
      
      private static const HELPER_GROUP_KEY:String = "ChangeHelpers";
      
      private static const PASSWORD_IS_TOO_EASY:int = 3;
      
      private static const PASSWORDS_DO_NOT_MATCH:int = 4;
      
      private static const ERROR_EMAIL_INVALID:int = 5;
      
      private static const tadi:int = 7;
      
      private static const INPUT_HEIGHT:int = 30;
      
      private static const forbiddenPasswords:Array = ["1234567890","123456789","12345678","1234567","123456","12345","1234","0123","01234","012345","0123456","01234567","012345678","0123456789","9876","98765","987654","9876543","98765432","987654321","9876543210","8765","87654","876543","8765432","87654321","876543210","7654","76543","765432","7654321","76543210","6543","65432","654321","6543210","5432","54321","543210","4321","43210","3210","1111","2222","3333","4444","5555","6666","7777","8888","9999","0000","11111","22222","33333","44444","55555","66666","77777","88888","99999","00000","111111","222222","333333","444444","555555","666666","777777","888888","999999","000000","1111111","2222222","3333333","4444444","5555555","6666666","7777777","8888888","9999999","0000000","11111111","22222222","33333333","44444444","55555555","66666666","77777777","88888888","99999999","00000000","111111111","222222222","333333333","444444444","555555555","666666666","777777777","888888888","999999999","000000000"
      ,"abcd","Jack","1234","snoopy","suzy","spike","1012","1234","pepper ","shelby","12345 ","54321 ","pass ","wolf","john","qqqq","aaaa","ZZZz","asdf","zxcv","asdf","zxcv","asdfgh","zxcvbn","1111","!!!!","4321","$#@!","1234","!@#$","12345","!@#$%","123456","!@#$%^","abcd","ABCD","qwerty1","QWERTY!","1q2w3e4r","1q2w3e","q1w2e3","q1w2e3r4","qweasd","QWEASD","asdzxc","ASDZXC","qweqwe","QWEQWE","asdasd","ASDASD","zxczxc","qwaszx","elite","ELITE","1qwerty","!QWERTY","black","blue","green","grey","yellow","orange","brown","support","Support","Topgun","topgun","help","Lame","hack","hunter","ranger","lamer","Lamer","hacker","Hacker","hack","summer","spring","autumn","winter","sunday","monday","tuesday","wednesda","thursday","friday","saturday","january","february","march","april","june","july","august","september","october","november","december","cool","lucky","korn ","fuck","Honda","mustang","pentium","mouse","stan","soccer","password","diablo","zoom","joker","nofear","unix","home","apache","holly"
      ,"q3rulez","pass123","magnum","mother","father","lisa","janet","helen","chocolate","Matrix","Gold","dollar","pussy","eminem","personal","zippo","jennifer","pepsi","clock","time","good","super","friend","angel","qwer","qwert","qwerty","homer","angle","johan","love","test","1q2w3e4r5t6y","31337","loll","gggg"];
      
      private static const VKONTAKTE:String = "vkontakte";
      
      private static const FACEBOOK:String = "facebook";
      
      private var pass1:TankInputBase;
      
      private var pass2:TankInputBase;
      
      private var emailInput:TankInputBase;
      
      private var realNameInput:TankInputBase;
      
      private var idNumberInput:TankInputBase;
      
      private var bus:DefaultButtonBase;
      
      private var pass1CheckIcon:InputCheckIcon;
      
      private var pass2CheckIcon:InputCheckIcon;
      
      private var emailCheckIcon:InputCheckIcon;
      
      private var passwordIsTooEasyBubble:PasswordIsTooEasyBubble;
      
      private var passwordsDoNotMatchBubble:PasswordsDoNotMatchBubble;
      
      private var errorEmailInvalodBubble:EmailInvalidBubble;
      
      private var mefisa:DefaultButtonBase;
      
      private var tygapotu:Boolean;
      
      private var snButton:DefaultIconButton;
      
      private var snHasLinkLabel:LabelBase;
      
      private var kano:DefaultButtonBase;
      
      private var ginat:DefaultButtonBase;
      
      public var emailConfirmed:Boolean = false;
      
      public var initialRealName:String;
      
      public var initialIDNumber:String;
      
      private var qobujega:DefaultButtonBase;
      
      private var currentSN:String;
      
      private var tijuvugiq:TankInputBase;
      
      private var tovoqefen:LabelBase;
      
      private var nurij:InputCheckIcon;
      
      private var changePasswordButton:DefaultButtonBase;
      
      private var captchaSection:CaptchaSection;
      
      public function Myzu(_arg_1:String, _arg_2:Boolean, _arg_3:Boolean, _arg_4:String, _arg_5:String)
      {
         super();
         this.initialRealName = _arg_4;
         this.initialIDNumber = _arg_5;
         this.emailConfirmed = _arg_2;
         var _local_6:VerticalStackPanel = new VerticalStackPanel();
         _local_6.bujet(MARGIN);
         _local_6.y = 3 * MARGIN + INPUT_HEIGHT;
         if(!partnersService.isRunningInsidePartnerEnvironment())
         {
            if(_arg_2)
            {
               _local_6.addItem(this.biqokabez());
            }
            else
            {
               _local_6.addItem(this.vucidus(_arg_1));
               this.initEvents();
               this.createBubbles();
            }
         }
         if(socialNetworkService.sunusa(FACEBOOK) || socialNetworkService.sunusa(VKONTAKTE))
         {
            _local_6.addItem(this.createSNPanel());
         }
         if(_arg_3)
         {
            _local_6.addItem(this.cefoj(_arg_1,_arg_5,_arg_4));
         }
         addChildAt(_local_6,0);
      }
      
      private static function restoreInput(_arg_1:Event) : void
      {
         var _local_2:TankInputBase = _arg_1.currentTarget as TankInputBase;
         _local_2.validValue = true;
      }
      
      private static function isPasswordValid(_arg_1:String) : Boolean
      {
         return _arg_1 == "" || _arg_1.length >= 4 && forbiddenPasswords.indexOf(_arg_1.toLowerCase()) == -1;
      }
      
      private static function trimString(_arg_1:String) : String
      {
         if(Boolean(_arg_1))
         {
            return _arg_1.replace(/^\s+|\s+$/g,"");
         }
         return _arg_1;
      }
      
      private function cefoj(_arg_1:String, _arg_2:String, _arg_3:String) : DisplayObject
      {
         var _local_5:TankWindowInner = null;
         var _local_7:LabelBase = null;
         var _local_4:VerticalStackPanel = null;
         _local_4 = new VerticalStackPanel();
         _local_4.bujet(noz);
         _local_5 = new TankWindowInner(SettingsWindow.daqowuso,0,TankWindowInner.TRANSPARENT);
         var _local_6:LabelBase = new LabelBase();
         _local_6.antiAliasType = AntiAliasType.ADVANCED;
         _local_6.sharpness = -100;
         _local_6.thickness = 100;
         _local_6.text = "防沉迷验证登记";
         _local_5.addChild(_local_6);
         _local_4.addItem(_local_6);
         _local_7 = new LabelBase();
         _local_5.addChild(_local_7);
         _local_7.text = "您的真实姓名:";
         _local_7.x = MARGIN;
         this.realNameInput = new TankInputBase();
         _local_5.addChild(this.realNameInput);
         this.realNameInput.width = _local_5.width - MARGIN * 3 - _local_7.textWidth - 4;
         this.realNameInput.x = _local_7.x + _local_7.width + MARGIN;
         this.realNameInput.y = _local_5.y + MARGIN;
         _local_7.y = this.realNameInput.y + Math.round((this.realNameInput.height - _local_7.textHeight) * 0.5) - 2;
         var _local_8:LabelBase = new LabelBase();
         _local_5.addChild(_local_8);
         _local_8.text = "身份证号码:";
         _local_8.x = MARGIN;
         _local_8.y = this.realNameInput.y + this.realNameInput.height + MARGIN + 6;
         this.idNumberInput = new TankInputBase();
         _local_5.addChild(this.idNumberInput);
         this.idNumberInput.textField.text = _arg_1;
         this.idNumberInput.x = this.realNameInput.x;
         this.idNumberInput.y = this.realNameInput.y + this.realNameInput.height + MARGIN;
         this.idNumberInput.width = this.realNameInput.width;
         this.idNumberInput.textField.text = _arg_2 != null && _arg_2 != "null" ? _arg_2 : "";
         this.realNameInput.textField.text = _arg_3 != null && _arg_3 != "null" ? _arg_3 : "";
         this.idNumberInput.addEventListener(LoginFormEvent.TEXT_CHANGED,this.validateAddictionID);
         this.realNameInput.addEventListener(LoginFormEvent.TEXT_CHANGED,this.validateRealName);
         this.qobujega = new DefaultButtonBase();
         this.qobujega.label = localeService.getText(TanksLocale.TEXT_SETTINGS_BUTTON_SAVE_TEXT);
         this.qobujega.addEventListener(MouseEvent.CLICK,this.dumulabez);
         _local_5.height = MARGIN * 4 + 2 * this.realNameInput.height + this.qobujega.height;
         this.qobujega.x = SettingsWindow.daqowuso - MARGIN - this.qobujega.width;
         this.qobujega.y = 3 * MARGIN + 2 * this.realNameInput.height;
         _local_5.addChild(this.qobujega);
         _local_4.addItem(_local_5);
         return _local_4;
      }
      
      private function biqokabez() : TankWindowInner
      {
         var _local_1:TankWindowInner = new TankWindowInner(SettingsWindow.daqowuso,2 * MARGIN + INPUT_HEIGHT,TankWindowInner.TRANSPARENT);
         this.mefisa = new DefaultButtonBase();
         this.mefisa.width = 210;
         this.mefisa.label = localeService.getText(TanksLocale.TEXT_SETTINGS_BUTTON_CHANGE_PASSWORD_TEXT);
         this.mefisa.x = (SettingsWindow.daqowuso - this.mefisa.width) / 2;
         this.mefisa.y = MARGIN;
         this.mefisa.addEventListener(MouseEvent.CLICK,this.pekyqi);
         _local_1.addChild(this.mefisa);
         this.lata(_local_1);
         return _local_1;
      }
      
      private function vucidus(_arg_1:String) : TankWindowInner
      {
         var _local_2:TankWindowInner = new TankWindowInner(SettingsWindow.daqowuso,INPUT_HEIGHT * 3 + 4 * MARGIN,TankWindowInner.TRANSPARENT);
         var _local_3:HorizontalStackPanel = new HorizontalStackPanel();
         _local_3.bujet(MARGIN);
         _local_3.x = _local_3.y = MARGIN;
         this.tovoqefen = this.createLabel(localeService.getText(TanksLocale.TEXT_CURRENT_PASSWORD));
         var _local_4:LabelBase = this.createLabel(localeService.getText(TanksLocale.TEXT_SETTINGS_NEW_PASSWORD_LABEL_TEXT));
         var _local_5:LabelBase = this.createLabel(localeService.getText(TanksLocale.TEXT_SETTINGS_REENTER_PASSWORD_LABEL_TEXT));
         var _local_6:int = int((SettingsWindow.daqowuso - this.tovoqefen.width - _local_4.width - _local_5.width - 7 * MARGIN) / 3 + 1);
         this.tijuvugiq = new TankInputBase();
         this.tijuvugiq.hidden = true;
         this.tijuvugiq.width = _local_6;
         this.tijuvugiq.maxChars = 20;
         this.tijuvugiq.validValue = true;
         this.pass1 = new TankInputBase();
         this.pass1.hidden = true;
         this.pass1.width = _local_6;
         this.pass1.maxChars = 20;
         this.pass1.validValue = true;
         this.tijuvugiq.height = this.pass1.height;
         this.pass2 = new TankInputBase();
         this.pass2.hidden = true;
         this.pass2.width = _local_6;
         this.pass2.maxChars = 20;
         this.pass2.validValue = true;
         if(localeService.language == LocaleServiceLangValues.nuvi)
         {
            this.pass1.x = -8;
            this.pass2.x = -10;
            if(this.luraqi())
            {
               --this.tijuvugiq.x;
               this.pass1.x -= 6;
               this.pass2.x -= 10;
            }
         }
         _local_3.addItem(this.tovoqefen);
         _local_3.addItem(this.tijuvugiq);
         _local_3.addItem(_local_4);
         _local_3.addItem(this.pass1);
         _local_3.addItem(_local_5);
         _local_3.addItem(this.pass2);
         _local_3.height = INPUT_HEIGHT;
         _local_2.addChild(_local_3);
         this.changePasswordButton = new DefaultButtonBase();
         this.changePasswordButton.label = localeService.getText(TanksLocale.TEXT_SETTINGS_CHANGE_PASSWORD_BUTTON);
         this.changePasswordButton.addEventListener(MouseEvent.CLICK,this.pihur);
         this.changePasswordButton.x = SettingsWindow.daqowuso - MARGIN - this.changePasswordButton.width;
         this.changePasswordButton.y = 2 * MARGIN + INPUT_HEIGHT;
         _local_2.addChild(this.changePasswordButton);
         this.nurij = new InputCheckIcon();
         this.nurij.x = this.tijuvugiq.x + _local_6 - this.nurij.width / 2 - tadi;
         this.nurij.y = this.tijuvugiq.y + MARGIN + tadi;
         this.nurij.visible = false;
         this.nurij.gotoAndStop(CallsignIconStates.CALLSIGN_ICON_STATE_INVALID);
         this.pass1CheckIcon = new InputCheckIcon();
         this.pass2CheckIcon = new InputCheckIcon();
         this.pass1CheckIcon.x = this.pass1.x + _local_6 - this.pass1CheckIcon.width / 2 - tadi;
         this.pass1CheckIcon.y = this.pass1.y + MARGIN + tadi;
         this.pass1State = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
         this.pass2CheckIcon.x = this.pass2.x + _local_6 - this.pass2CheckIcon.width / 2 - tadi;
         this.pass2CheckIcon.y = this.pass2.y + MARGIN + tadi;
         this.pass2State = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
         _local_2.addChild(this.nurij);
         _local_2.addChild(this.pass1CheckIcon);
         _local_2.addChild(this.pass2CheckIcon);
         var _local_7:DisplayObject = this.naripuva(_arg_1);
         _local_7.height = INPUT_HEIGHT;
         _local_7.x = MARGIN;
         _local_7.y = _local_3.height + this.changePasswordButton.height + 3 * MARGIN;
         _local_2.addChild(_local_7);
         this.emailCheckIcon = new InputCheckIcon();
         this.emailCheckIcon.x = this.emailInput.x + this.emailInput.width - this.emailCheckIcon.width / 2 - tadi;
         this.emailCheckIcon.y = _local_7.y + tadi;
         this.emailState = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
         _local_2.addChild(this.emailCheckIcon);
         this.lata(_local_2);
         return _local_2;
      }
      
      private function lata(sydi:TankWindowInner) : void
      {
         var zewe:TankWindowInner = sydi;
         this.captchaSection = new CaptchaSection();
         this.captchaSection.cimi();
         this.captchaSection.refreshButton.addEventListener(MouseEvent.CLICK,function(_arg_1:MouseEvent):void
         {
            dispatchEvent(new RefreshCaptchaClickedEvent());
         });
         this.captchaSection.x = (zewe.width - this.captchaSection.width) / 2;
         this.captchaSection.y = MARGIN + zewe.height;
         this.captchaSection.visible = true;
         zewe.height += this.captchaSection.height + 2 * MARGIN;
         zewe.addChild(this.captchaSection);
         dispatchEvent(new RefreshCaptchaClickedEvent());
      }
      
      public function qosa(_arg_1:Bitmap) : void
      {
         if(Boolean(this.captchaSection))
         {
            this.captchaSection.captcha = _arg_1;
         }
      }
      
      public function jitet() : String
      {
         if(Boolean(this.captchaSection))
         {
            return this.captchaSection.captchaAnswer.value;
         }
         return "";
      }
      
      private function luraqi() : Boolean
      {
         var _local_1:String = Capabilities.os;
         return _local_1.indexOf("Windows") >= 0 || _local_1.indexOf("Mac") >= 0;
      }
      
      private function naripuva(_arg_1:String) : DisplayObject
      {
         var _local_2:HorizontalStackPanel = new HorizontalStackPanel();
         _local_2.bujet(MARGIN);
         var _local_3:LabelBase = this.createLabel(localeService.getText(TanksLocale.TEXT_SETTINGS_EMAIL_LABEL_TEXT));
         this.bus = new DefaultButtonBase();
         this.bus.label = localeService.getText(TanksLocale.TEXT_SETTINGS_LINK_EMAIL_BUTTON);
         this.bus.addEventListener(MouseEvent.CLICK,this.dilij);
         this.emailInput = new TankInputBase();
         this.emailInput.value = _arg_1;
         this.emailInput.validValue = true;
         this.emailInput.width = SettingsWindow.daqowuso - 4 * MARGIN - _local_3.width - this.bus.width;
         if(localeService.language == LocaleServiceLangValues.nuvi)
         {
            this.emailInput.width += 3;
            if(this.luraqi())
            {
               this.emailInput.width -= 4;
            }
         }
         _local_2.addItem(_local_3);
         _local_2.addItem(this.emailInput);
         _local_2.addItem(this.bus);
         return _local_2;
      }
      
      private function createLabel(_arg_1:String) : LabelBase
      {
         var _local_2:LabelBase = new LabelBase();
         _local_2.text = _arg_1;
         _local_2.y = Math.round((INPUT_HEIGHT - _local_2.textHeight) * 0.5) - 2;
         return _local_2;
      }
      
      private function dumulabez(_arg_1:MouseEvent) : void
      {
         if(this.realName != "" && this.idNumber != "")
         {
            dispatchEvent(new Pelijabo(Pelijabo.jihyf));
         }
      }
      
      private function dilij(_arg_1:MouseEvent) : void
      {
         if(!this.emailConfirmed && this.email != null)
         {
            dispatchEvent(new Pelijabo(Pelijabo.SET_EMAIL));
         }
      }
      
      private function pihur(_arg_1:MouseEvent = null) : void
      {
         if(this.emailConfirmed || !this.tijuvugiq.visible || this.mopamowu() == "" && this.password == "")
         {
            dispatchEvent(new Pelijabo(Pelijabo.CHANGE_PASSWORD));
         }
         else
         {
            dispatchEvent(new Pelijabo(Pelijabo.sovof));
         }
      }
      
      override public function show() : void
      {
         display.stage.addEventListener(Event.RESIZE,this.hel);
         this.hel();
         this.showHelpers();
      }
      
      override public function hide() : void
      {
         this.veraw();
         display.stage.removeEventListener(Event.RESIZE,this.hel);
      }
      
      private function veraw() : void
      {
         helperService.hideHelper(HELPER_GROUP_KEY,PASSWORD_IS_TOO_EASY);
         helperService.hideHelper(HELPER_GROUP_KEY,PASSWORDS_DO_NOT_MATCH);
         helperService.hideHelper(HELPER_GROUP_KEY,ERROR_EMAIL_INVALID);
      }
      
      private function showHelpers() : void
      {
         if(this.emailInput != null)
         {
            this.digozuje();
         }
         if(!this.emailConfirmed && this.pass1 != null)
         {
            this.updatePasswordBlock();
         }
      }
      
      private function digozuje(_arg_1:Event = null) : void
      {
         if(partnersService.isRunningInsidePartnerEnvironment() || this.emailConfirmed)
         {
            return;
         }
         var _local_2:Boolean = true;
         if(this.emailInput.value.length > 0)
         {
            _local_2 = validateService.isEmailValid(this.emailInput.value);
         }
         if(!_local_2)
         {
            helperService.showHelper(HELPER_GROUP_KEY,ERROR_EMAIL_INVALID,true);
         }
         else
         {
            helperService.hideHelper(HELPER_GROUP_KEY,ERROR_EMAIL_INVALID);
         }
         if(_local_2)
         {
            this.emailInput.validValue = true;
            this.emailState = this.emailInput.value == "" ? int(CallsignIconStates.CALLSIGN_ICON_STATE_OFF) : int(CallsignIconStates.CALLSIGN_ICON_STATE_VALID);
         }
         else
         {
            this.emailInput.validValue = false;
            this.emailState = CallsignIconStates.CALLSIGN_ICON_STATE_INVALID;
         }
         this.bus.enable = _local_2;
      }
      
      private function updatePasswordBlock(_arg_1:Event = null) : void
      {
         if(partnersService.isRunningInsidePartnerEnvironment() || this.emailConfirmed)
         {
            return;
         }
         this.pass1.validValue = isPasswordValid(this.pass1.value);
         this.pass1State = CallsignIconStates.CALLSIGN_ICON_STATE_INVALID;
         var _local_2:Boolean = true;
         this.pass2.validValue = this.pass2.value == "" || this.pass1.value == this.pass2.value;
         this.pass2State = CallsignIconStates.CALLSIGN_ICON_STATE_INVALID;
         if(this.pass1.value == "")
         {
            this.pass1State = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
            _local_2 = false;
         }
         else if(this.pass1.validValue)
         {
            this.pass1State = CallsignIconStates.CALLSIGN_ICON_STATE_VALID;
            _local_2 = false;
         }
         if(this.pass2.value == "")
         {
            this.pass2State = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
         }
         else if(this.pass2.validValue)
         {
            this.pass2State = CallsignIconStates.CALLSIGN_ICON_STATE_VALID;
         }
         var _local_3:* = !(_local_2 || this.pass2.validValue);
         if(_local_2)
         {
            helperService.showHelper(HELPER_GROUP_KEY,PASSWORD_IS_TOO_EASY,true);
         }
         else
         {
            helperService.hideHelper(HELPER_GROUP_KEY,PASSWORD_IS_TOO_EASY);
         }
         if(Boolean(_local_3))
         {
            helperService.showHelper(HELPER_GROUP_KEY,PASSWORDS_DO_NOT_MATCH,true);
         }
         else
         {
            helperService.hideHelper(HELPER_GROUP_KEY,PASSWORDS_DO_NOT_MATCH);
         }
         this.changePasswordButton.enable = this.pass1.value == this.pass2.value && this.pass1.validValue && this.pass2.validValue;
      }
      
      private function createSNPanel() : TankWindowInner
      {
         var _local_1:LabelBase = null;
         var _local_2:Bitmap = null;
         var _local_3:Bitmap = null;
         var _local_4:Boolean = false;
         var _local_5:TankWindowInner = null;
         _local_5 = new TankWindowInner(SettingsWindow.daqowuso,0,TankWindowInner.TRANSPARENT);
         this.tygapotu = socialNetworkService.sunusa(VKONTAKTE) && socialNetworkService.sunusa(FACEBOOK);
         var _local_6:Sprite = new Sprite();
         if(this.tygapotu)
         {
            _local_1 = new LabelBase();
            _local_1.text = localeService.getText(TanksLocale.TEXT_SETTINGS_ACCOUNT_ACCESS);
            _local_1.y = 5;
            _local_6.addChild(_local_1);
            _local_2 = Hihidiqar.sibepyraw();
            _local_3 = Hihidiqar.wyheqi();
            this.kano = new DefaultButtonBase();
            this.ginat = new DefaultButtonBase();
            _local_2.y = _local_1.y + _local_1.height + MARGIN;
            _local_6.addChild(_local_2);
            this.kano.label = !socialNetworkService.byc(VKONTAKTE) ? localeService.getText(TanksLocale.TEXT_SETTINGS_LINK) : localeService.getText(TanksLocale.TEXT_SETTINGS_UNLINK);
            this.kano.y = _local_1.y + _local_1.height + MARGIN;
            this.kano.x = _local_2.x + _local_2.width + MARGIN;
            _local_6.addChild(this.kano);
            _local_3.x = this.kano.x + this.kano.width + 5 * MARGIN;
            _local_3.y = _local_1.y + _local_1.height + MARGIN;
            _local_6.addChild(_local_3);
            this.ginat.label = !socialNetworkService.byc(FACEBOOK) ? localeService.getText(TanksLocale.TEXT_SETTINGS_LINK) : localeService.getText(TanksLocale.TEXT_SETTINGS_UNLINK);
            this.ginat.y = _local_1.y + _local_1.height + MARGIN;
            this.ginat.x = _local_3.x + _local_3.width + MARGIN;
            _local_6.addChild(this.ginat);
            _local_1.x = (_local_6.width - _local_1.width) / 2;
            this.kano.addEventListener(MouseEvent.CLICK,this.quwoh);
            this.ginat.addEventListener(MouseEvent.CLICK,this.gygehugez);
         }
         else
         {
            this.currentSN = !socialNetworkService.sunusa(VKONTAKTE) ? FACEBOOK : VKONTAKTE;
            _local_4 = socialNetworkService.byc(this.currentSN);
            this.snHasLinkLabel = new LabelBase();
            this.snHasLinkLabel.text = !_local_4 ? localeService.getText(TanksLocale.TEXT_SETTINGS_LINK_ACCOUNT) : localeService.getText(TanksLocale.TEXT_SETTINGS_UNLINK_ACCOUNT);
            _local_6.addChild(this.snHasLinkLabel);
            this.snButton = this.currentSN == VKONTAKTE ? new VKButton() : new FBButton();
            this.snButton.width = 102;
            this.snButton.x = this.snHasLinkLabel.x + this.snHasLinkLabel.width + 5;
            this.snHasLinkLabel.y = this.snButton.y + 7;
            _local_6.addChild(this.snButton);
            _local_6.y = MARGIN;
            this.snButton.addEventListener(MouseEvent.CLICK,this.hogig);
         }
         _local_6.x = (SettingsWindow.daqowuso - _local_6.width) / 2;
         _local_5.height = _local_6.height + 2 * MARGIN;
         _local_5.addChild(_local_6);
         socialNetworkService.addEventListener(SocialNetworkServiceEvent.UNLINK_SUCCESS,this.onUnlinkSuccess);
         socialNetworkService.addEventListener(SocialNetworkServiceEvent.LINK_SUCCESS,this.onLinkSuccess);
         return _local_5;
      }
      
      private function onLinkSuccess(_arg_1:SocialNetworkServiceEvent) : void
      {
         if(this.tygapotu)
         {
            this.qyfi(_arg_1.socialNetworkId,true);
         }
         else
         {
            this.snHasLinkLabel.text = localeService.getText(TanksLocale.TEXT_SETTINGS_UNLINK_ACCOUNT);
            this.snButton.x = this.snHasLinkLabel.x + this.snHasLinkLabel.width + 5;
         }
      }
      
      private function onUnlinkSuccess(_arg_1:SocialNetworkServiceEvent) : void
      {
         if(this.tygapotu)
         {
            this.qyfi(_arg_1.socialNetworkId,false);
         }
         else
         {
            this.snHasLinkLabel.text = localeService.getText(TanksLocale.TEXT_SETTINGS_LINK_ACCOUNT);
            this.snButton.x = this.snHasLinkLabel.x + this.snHasLinkLabel.width + 5;
         }
      }
      
      private function qyfi(_arg_1:String, _arg_2:Boolean) : void
      {
         if(_arg_1 == VKONTAKTE)
         {
            this.kano.label = localeService.getText(!_arg_2 ? TanksLocale.TEXT_SETTINGS_LINK : TanksLocale.TEXT_SETTINGS_UNLINK);
         }
         else
         {
            this.ginat.label = localeService.getText(!_arg_2 ? TanksLocale.TEXT_SETTINGS_LINK : TanksLocale.TEXT_SETTINGS_UNLINK);
         }
      }
      
      private function hogig(_arg_1:MouseEvent) : void
      {
         this.wawezyc(this.currentSN);
      }
      
      private function quwoh(_arg_1:MouseEvent) : void
      {
         this.wawezyc(VKONTAKTE);
      }
      
      private function gygehugez(_arg_1:MouseEvent) : void
      {
         this.wawezyc(FACEBOOK);
      }
      
      private function wawezyc(_arg_1:String) : void
      {
         if(socialNetworkService.byc(_arg_1))
         {
            socialNetworkService.takeh(_arg_1);
         }
         else
         {
            socialNetworkService.sejyciq(_arg_1);
         }
      }
      
      private function initEvents() : void
      {
         this.pass1.addEventListener(FocusEvent.FOCUS_IN,restoreInput);
         this.pass2.addEventListener(FocusEvent.FOCUS_IN,restoreInput);
         this.emailInput.addEventListener(FocusEvent.FOCUS_IN,restoreInput);
         this.pass1.addEventListener(Event.CHANGE,this.updatePasswordBlock);
         this.pass1.addEventListener(FocusEvent.FOCUS_IN,this.updatePasswordBlock);
         this.pass2.addEventListener(Event.CHANGE,this.updatePasswordBlock);
         this.pass2.addEventListener(FocusEvent.FOCUS_IN,this.updatePasswordBlock);
         this.emailInput.addEventListener(FocusEvent.FOCUS_IN,this.digozuje);
         this.emailInput.addEventListener(Event.CHANGE,this.digozuje);
         this.tijuvugiq.addEventListener(FocusEvent.FOCUS_IN,this.hylymakyc);
         this.tijuvugiq.addEventListener(Event.CHANGE,this.hylymakyc);
      }
      
      private function validateRealName(_arg_1:LoginFormEvent) : void
      {
         var _local_2:String = null;
         if(this.realNameInput != null)
         {
            _local_2 = trimString(this.realNameInput.textField.text);
            this.realNameInput.validValue = validateService.isChinaNameValid(_local_2) || _local_2.length == 0;
         }
      }
      
      private function validateAddictionID(_arg_1:LoginFormEvent) : void
      {
         var _local_2:String = null;
         if(this.idNumberInput != null)
         {
            _local_2 = this.idNumberInput.textField.text;
            this.idNumberInput.validValue = validateService.isChinaCardIdValid(_local_2) || _local_2.length == 0;
         }
      }
      
      private function pekyqi(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new Pelijabo(Pelijabo.luvijy));
      }
      
      public function fajan() : void
      {
         this.mefisa.enable = false;
         if(Boolean(this.captchaSection))
         {
            this.captchaSection.setEnabled(false);
         }
      }
      
      private function hylymakyc(_arg_1:Event) : void
      {
         this.nurij.visible = false;
         this.tijuvugiq.validValue = true;
      }
      
      public function vyguqibyn() : void
      {
         this.tijuvugiq.validValue = false;
         this.nurij.visible = true;
      }
      
      public function pyzysy() : void
      {
         if(this.tovoqefen != null)
         {
            this.tijuvugiq.visible = false;
            this.tovoqefen.visible = false;
         }
      }
      
      public function set pass1State(_arg_1:int) : void
      {
         if(_arg_1 == CallsignIconStates.CALLSIGN_ICON_STATE_OFF)
         {
            this.pass1CheckIcon.visible = false;
         }
         else
         {
            this.pass1CheckIcon.visible = true;
            this.pass1CheckIcon.gotoAndStop(_arg_1);
         }
      }
      
      public function set pass2State(_arg_1:int) : void
      {
         if(_arg_1 == CallsignIconStates.CALLSIGN_ICON_STATE_OFF)
         {
            this.pass2CheckIcon.visible = false;
         }
         else
         {
            this.pass2CheckIcon.visible = true;
            this.pass2CheckIcon.gotoAndStop(_arg_1);
         }
      }
      
      public function set emailState(_arg_1:int) : void
      {
         if(_arg_1 == CallsignIconStates.CALLSIGN_ICON_STATE_OFF)
         {
            this.emailCheckIcon.visible = false;
         }
         else
         {
            this.emailCheckIcon.visible = true;
            this.emailCheckIcon.gotoAndStop(_arg_1);
         }
      }
      
      private function createBubbles() : void
      {
         this.passwordIsTooEasyBubble = new PasswordIsTooEasyBubble();
         this.passwordsDoNotMatchBubble = new PasswordsDoNotMatchBubble();
         this.errorEmailInvalodBubble = new EmailInvalidBubble();
         helperService.registerHelper(HELPER_GROUP_KEY,PASSWORD_IS_TOO_EASY,this.passwordIsTooEasyBubble,false);
         helperService.registerHelper(HELPER_GROUP_KEY,PASSWORDS_DO_NOT_MATCH,this.passwordsDoNotMatchBubble,false);
         helperService.registerHelper(HELPER_GROUP_KEY,ERROR_EMAIL_INVALID,this.errorEmailInvalodBubble,false);
      }
      
      private function hel(_arg_1:Event = null) : void
      {
         var _local_2:int = 0;
         if(parent != null)
         {
            _local_2 = INPUT_HEIGHT + 3 * MARGIN;
            if(this.passwordIsTooEasyBubble != null)
            {
               this.passwordIsTooEasyBubble.targetPoint = new Point(this.pass1CheckIcon.x + this.pass1CheckIcon.width / 2 + this.x + parent.x,_local_2 + this.pass1CheckIcon.y + this.pass1CheckIcon.height / 2 + this.y + parent.y);
            }
            if(this.passwordsDoNotMatchBubble != null)
            {
               this.passwordsDoNotMatchBubble.targetPoint = new Point(this.pass2CheckIcon.x + this.pass2CheckIcon.width / 2 + this.x + parent.x,_local_2 + this.pass2CheckIcon.y + this.pass2CheckIcon.height / 2 + this.y + parent.y);
            }
            if(this.errorEmailInvalodBubble != null)
            {
               this.errorEmailInvalodBubble.targetPoint = new Point(this.emailCheckIcon.x + this.emailCheckIcon.width / 2 + this.x + parent.x,_local_2 + this.emailCheckIcon.y + this.emailCheckIcon.height / 2 + this.y + parent.y);
            }
         }
      }
      
      public function get password() : String
      {
         var _local_1:* = "";
         if(!this.emailConfirmed)
         {
            if(Boolean(this.pass1.textField.text))
            {
               if(this.pass1.textField.text == this.pass2.textField.text)
               {
                  _local_1 = this.pass1.textField.text;
               }
            }
         }
         return _local_1;
      }
      
      public function get email() : String
      {
         if(this.emailConfirmed)
         {
            return "";
         }
         if(this.emailInput.textField.text.indexOf("*") != -1)
         {
            return null;
         }
         return this.emailInput.textField.text;
      }
      
      public function get realName() : String
      {
         if(this.realNameInput != null && this.realNameInput.textField.text != null && trimString(this.realNameInput.textField.text).length > 0)
         {
            return this.realNameInput.textField.text;
         }
         return "";
      }
      
      public function get idNumber() : String
      {
         if(this.idNumberInput != null && this.idNumberInput.textField.text != null && trimString(this.idNumberInput.textField.text).length > 0)
         {
            return this.idNumberInput.textField.text;
         }
         return "";
      }
      
      public function mopamowu() : String
      {
         return this.tijuvugiq != null ? this.tijuvugiq.value : "";
      }
      
      override public function destroy() : void
      {
         if(!this.emailConfirmed)
         {
            this.changePasswordButton.removeEventListener(MouseEvent.CLICK,this.pihur);
            this.bus.removeEventListener(MouseEvent.CLICK,this.dilij);
            this.pass1.removeEventListener(FocusEvent.FOCUS_IN,restoreInput);
            this.pass2.removeEventListener(FocusEvent.FOCUS_IN,restoreInput);
            this.emailInput.removeEventListener(FocusEvent.FOCUS_IN,restoreInput);
            this.pass1.removeEventListener(Event.CHANGE,this.updatePasswordBlock);
            this.pass1.removeEventListener(FocusEvent.FOCUS_IN,this.updatePasswordBlock);
            this.pass2.removeEventListener(Event.CHANGE,this.updatePasswordBlock);
            this.pass2.removeEventListener(FocusEvent.FOCUS_IN,this.updatePasswordBlock);
            this.emailInput.removeEventListener(FocusEvent.FOCUS_IN,this.digozuje);
            this.emailInput.removeEventListener(Event.CHANGE,this.digozuje);
            this.tijuvugiq.removeEventListener(FocusEvent.FOCUS_IN,this.hylymakyc);
            this.tijuvugiq.removeEventListener(Event.CHANGE,this.hylymakyc);
         }
         if(Boolean(this.qobujega))
         {
            this.qobujega.removeEventListener(MouseEvent.CLICK,this.dumulabez);
         }
         helperService.unregisterHelper(HELPER_GROUP_KEY,PASSWORD_IS_TOO_EASY);
         helperService.unregisterHelper(HELPER_GROUP_KEY,PASSWORDS_DO_NOT_MATCH);
         helperService.unregisterHelper(HELPER_GROUP_KEY,ERROR_EMAIL_INVALID);
         if(!this.emailConfirmed)
         {
            this.tijuvugiq.removeEventListener(FocusEvent.FOCUS_IN,this.hylymakyc);
            this.tijuvugiq.removeEventListener(Event.CHANGE,this.hylymakyc);
         }
         super.destroy();
      }
   }
}

