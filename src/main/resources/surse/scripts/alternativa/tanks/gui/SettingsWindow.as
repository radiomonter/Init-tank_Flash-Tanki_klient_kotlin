package alternativa.tanks.gui
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.service.socialnetwork.ISocialNetworkPanelService;
   import alternativa.tanks.service.socialnetwork.SocialNetworkServiceEvent;
   import assets.icons.InputCheckIcon;
   import controls.DefaultIconButton;
   import controls.FBButton;
   import controls.Slider;
   import controls.TankCheckBox;
   import controls.TankWindowInner;
   import controls.VKButton;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankCheckBoxBase;
   import controls.base.TankInputBase;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.AntiAliasType;
   import forms.TankWindowWithHeader;
   import forms.events.SliderEvent;
   import forms.registration.CallsignIconStates;
   import forms.registration.bubbles.EmailInvalidBubble;
   import forms.registration.bubbles.PasswordIsTooEasyBubble;
   import forms.registration.bubbles.PasswordsDoNotMatchBubble;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import titanomachina.headers.Headers;
   
   public class SettingsWindow extends Sprite
   {
      
      public static var localeService:ILocaleService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
      
      public static var helperService:IHelpService = OSGi.getInstance().getService(IHelpService) as IHelpService;
      
      public static var socialNetworkService:ISocialNetworkPanelService = OSGi.getInstance().getService(ISocialNetworkPanelService) as ISocialNetworkPanelService;
      
      public static var validateService:IValidateService = OSGi.getInstance().getService(IValidateService) as IValidateService;
      
      public static const forbiddenPasswords:Array = ["1234567890","123456789","12345678","1234567","123456","12345","1234","0123","01234","012345","0123456","01234567","012345678","0123456789","9876","98765","987654","9876543","98765432","987654321","9876543210","8765","87654","876543","8765432","87654321","876543210","7654","76543","765432","7654321","76543210","6543","65432","654321","6543210","5432","54321","543210","4321","43210","3210","1111","2222","3333","4444","5555","6666","7777","8888","9999","0000","11111","22222","33333","44444","55555","66666","77777","88888","99999","00000","111111","222222","333333","444444","555555","666666","777777","888888","999999","000000","1111111","2222222","3333333","4444444","5555555","6666666","7777777","8888888","9999999","0000000","11111111","22222222","33333333","44444444","55555555","66666666","77777777","88888888","99999999","00000000","111111111","222222222","333333333","444444444","555555555","666666666","777777777","888888888","999999999","000000000"
      ,"abcd","Jack","1234","snoopy","suzy","spike","1012","1234","pepper ","shelby","12345 ","54321 ","pass ","wolf","john","qqqq","aaaa","ZZZz","asdf","zxcv","asdf","zxcv","asdfgh","zxcvbn","1111","!!!!","4321","$#@!","1234","!@#$","12345","!@#$%","123456","!@#$%^","abcd","ABCD","qwerty1","QWERTY!","1q2w3e4r","1q2w3e","q1w2e3","q1w2e3r4","qweasd","QWEASD","asdzxc","ASDZXC","qweqwe","QWEQWE","asdasd","ASDASD","zxczxc","qwaszx","elite","ELITE","1qwerty","!QWERTY","black","blue","green","grey","yellow","orange","brown","support","Support","Topgun","topgun","help","Lame","hack","hunter","ranger","lamer","Lamer","hacker","Hacker","hack","summer","spring","autumn","winter","sunday","monday","tuesday","wednesda","thursday","friday","saturday","january","february","march","april","june","july","august","september","october","november","december","cool","lucky","korn ","fuck","Honda","mustang","pentium","mouse","stan","soccer","password","diablo","zoom","joker","nofear","unix","home","apache","holly"
      ,"q3rulez","pass123","magnum","mother","father","lisa","janet","helen","chocolate","Matrix","Gold","dollar","pussy","eminem","personal","zippo","jennifer","pepsi","clock","time","good","super","friend","angel","qwer","qwert","qwerty","homer","angle","johan","love","test","1q2w3e4r5t6y","31337","loll","gggg"];
      
      private static const buttonSize:Point = new Point(104,33);
      
      private static const FIRST_COLUMN_X:int = 21;
      
      private static const SECOND_COLUMN_X:int = 109;
      
      private static const THIRD_COLUMN_X:int = 381;
      
      private static const WINDOW_WIDTH:int = 750;
      
      private static const PERFORMANCE_GRID_COLUMN_WIDTH:int = 180;
      
      private static const INPUT_WIDTH:int = 200;
      
      private static const windowMargin:int = 12;
      
      private static const margin:int = 8;
      
      private static const HELPER_GROUP_KEY:String = "ChangeHelpers";
      
      private static const VKONTAKTE:String = "vkontakte";
      
      private static const FACEBOOK:String = "facebook";
      
      private const PASSWORD_IS_TOO_EASY:int = 3;
      
      private const PASSWORDS_DO_NOT_MATCH:int = 4;
      
      private const ERROR_EMAIL_INVALID:int = 5;
      
      private var pass1:TankInputBase;
      
      private var pass2:TankInputBase;
      
      public var emailInput:TankInputBase;
      
      private var realNameInput:TankInputBase;
      
      private var idNumberInput:TankInputBase;
      
      private var volumeLevel:Slider;
      
      private var pass1CheckIcon:InputCheckIcon;
      
      private var pass2CheckIcon:InputCheckIcon;
      
      private var emailCheckIcon:InputCheckIcon;
      
      private var passwordIsTooEasyBubble:PasswordIsTooEasyBubble;
      
      private var passwordsDoNotMatchBubble:PasswordsDoNotMatchBubble;
      
      private var errorEmailInvalodBubble:EmailInvalidBubble;
      
      private var _bgSound:TankCheckBoxBase;
      
      private var cbShowFPS:TankCheckBoxBase;
      
      private var cbShowSkyBox:TankCheckBoxBase;
      
      private var cbAdaptiveFPS:TankCheckBoxBase;
      
      private var cbShowChat:TankCheckBoxBase;
      
      private var _inverseBackDriving:TankCheckBoxBase;
      
      private var cbFog:TankCheckBoxBase;
      
      private var cbTankShadow:TankCheckBoxBase;
      
      private var cbDynamicShadows:TankCheckBoxBase;
      
      private var cbSoftParticles:TankCheckBoxBase;
      
      private var cbDust:TankCheckBoxBase;
      
      private var cbSSAO:TankCheckBoxBase;
      
      private var cbAntialiasing:TankCheckBoxBase;
      
      private var cbDynamicLighting:TankCheckBoxBase;
      
      private var cbMipMapping:TankCheckBoxBase;
      
      private var cbAlternateCamera:TankCheckBoxBase;
      
      private var cbGraphicsAutoQuality:TankCheckBoxBase;
      
      private var cbMouseControl:TankCheckBoxBase;
      
      private var _receiveBattleInvite:TankCheckBoxBase;
      
      private var soundInner:TankWindowInner;
      
      private var performanceInner:TankWindowInner;
      
      private var accountInner:TankWindowInner;
      
      private var controlInner:TankWindowInner;
      
      private var windowSize:Point;
      
      private var okButton:DefaultButtonBase;
      
      private var changePasswordButton:DefaultButtonBase;
      
      private var snButton:DefaultIconButton;
      
      private var snHasLinkLabel:LabelBase;
      
      public var isPasswordChangeDisabled:Boolean = false;
      
      public var initialRealName:String;
      
      public var initialIDNumber:String;
      
      private var currentSN:String;
      
      public function SettingsWindow(_arg_1:String, _arg_2:Boolean, _arg_3:Boolean, _arg_4:String, _arg_5:String)
      {
         var _local_6:TankWindowWithHeader = null;
         super();
         this.initialRealName = _arg_4;
         this.initialIDNumber = _arg_5;
         this.isPasswordChangeDisabled = _arg_2;
         this.windowSize = new Point(WINDOW_WIDTH,0);
         _local_6 = new TankWindowWithHeader(Headers.getHeaderById("SETTINGS"));
         _local_6.width = this.windowSize.x;
         _local_6.height = this.windowSize.y;
         addChild(_local_6);
         this.soundInner = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         addChild(this.soundInner);
         this.soundInner.x = windowMargin;
         this.soundInner.y = windowMargin;
         this.soundInner.width = this.windowSize.x - windowMargin * 2;
         this.performanceInner = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         addChild(this.performanceInner);
         this.performanceInner.x = windowMargin;
         this.performanceInner.width = this.windowSize.x - windowMargin * 2;
         this.accountInner = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         addChild(this.accountInner);
         this.accountInner.x = windowMargin;
         this.accountInner.width = this.windowSize.x - windowMargin * 2;
         this.controlInner = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         addChild(this.controlInner);
         this.controlInner.x = windowMargin;
         this.controlInner.width = this.windowSize.x - windowMargin * 2;
         this.createSoundPanel(localeService);
         this.createPerformancePanel(localeService);
         var _local_7:Boolean = this.createAccountPanel(localeService,_arg_1,_arg_3,_arg_5,_arg_4);
         this.createControlPanel(localeService);
         this.okButton = new DefaultButtonBase();
         addChild(this.okButton);
         this.okButton.label = localeService.getText(TextConst.SETTINGS_BUTTON_SAVE_TEXT);
         this.okButton.x = this.windowSize.x - buttonSize.x * 2 - 1 - margin;
         this.okButton.y = this.windowSize.y + margin;
         this.windowSize.y = this.okButton.y + this.okButton.height;
         this.okButton.addEventListener(MouseEvent.CLICK,this.onOkClick);
         var _local_8:DefaultButtonBase = new DefaultButtonBase();
         addChild(_local_8);
         _local_8.label = localeService.getText(TextConst.SETTINGS_BUTTON_CANCEL_TEXT);
         _local_8.x = this.windowSize.x - buttonSize.x - margin + 5;
         _local_8.y = this.okButton.y;
         _local_8.addEventListener(MouseEvent.CLICK,this.onCancelClick);
         this._receiveBattleInvite = this.createCheckBox(localeService.getText(TextConst.SHOW_NOTIFICATIONS_LABEL),THIRD_COLUMN_X,this._inverseBackDriving.y);
         this.windowSize.y += windowMargin;
         _local_6.height = this.windowSize.y;
         if(this.emailInput != null)
         {
            this.updatePasswordBlock(null);
         }
      }
      
      private static function setCheckBoxState(_arg_1:TankCheckBoxBase, _arg_2:Boolean) : void
      {
         if(_arg_1 != null)
         {
            _arg_1.checked = _arg_2;
         }
      }
      
      private static function getCheckBoxState(_arg_1:TankCheckBoxBase) : Boolean
      {
         return _arg_1 != null && _arg_1.checked;
      }
      
      private static function restoreInput(_arg_1:FocusEvent) : void
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
      
      private function createSoundPanel(_arg_1:ILocaleService) : void
      {
         this._bgSound = this.createCheckBox(_arg_1.getText(TextConst.SETTINGS_BACKGROUND_SOUND_CHECKBOX_LABEL_TEXT),0,this.soundInner.y + margin);
         this._bgSound.x = this.windowSize.x - windowMargin - this._bgSound.width - margin;
         var _local_2:LabelBase = new LabelBase();
         addChild(_local_2);
         _local_2.text = _arg_1.getText(TextConst.SETTINGS_SOUND_VOLUME_LABEL_TEXT);
         _local_2.x = SECOND_COLUMN_X - margin - _local_2.textWidth;
         this.volumeLevel = new Slider();
         addChild(this.volumeLevel);
         this.volumeLevel.maxValue = 100;
         this.volumeLevel.minValue = 0;
         this.volumeLevel.tickInterval = 5;
         this.volumeLevel.x = SECOND_COLUMN_X;
         this.volumeLevel.y = this.soundInner.y + margin;
         this.volumeLevel.width = this.windowSize.x - windowMargin - margin - SECOND_COLUMN_X - this._bgSound.width - margin;
         this.volumeLevel.addEventListener(SliderEvent.CHANGE_VALUE,this.onChangeVolume);
         this.soundInner.height = margin * 2 + this.volumeLevel.height;
         this.windowSize.y = this.soundInner.y + this.soundInner.height;
         _local_2.y = this.soundInner.y + Math.round((this.soundInner.height - _local_2.textHeight) * 0.5) - 2;
      }
      
      private function createPerformancePanel(_arg_1:ILocaleService) : void
      {
         var _local_2:int = 0;
         var _local_3:LabelBase = this.createPanelLabel(_arg_1.getText(TextConst.SETTINGS_PERFORMANCE_HEADER_LABEL_TEXT),windowMargin,this.windowSize.y + windowMargin);
         this.windowSize.y = _local_3.y + _local_3.textHeight;
         this.performanceInner.y = this.windowSize.y + 5;
         this.cbShowFPS = this.createCheckBox(_arg_1.getText(TextConst.SETTINGS_SHOW_FPS_CHECKBOX_LABEL_TEXT));
         this.cbAdaptiveFPS = this.createCheckBox(_arg_1.getText(TextConst.SETTINGS_ENABLE_ADAPTIVE_FPS_CHECKBOX_LABEL_TEXT));
         this.cbShowSkyBox = this.createCheckBox(_arg_1.getText(TextConst.SETTINGS_SHOW_SKYBOX_CHECKBOX_LABEL_TEXT));
         this.cbShowChat = this.createCheckBox(_arg_1.getText(TextConst.STRING_SETTINGS_SHOW_CHAT_CHECKBOX_LABEL_TEXT));
         this.cbMipMapping = this.createCheckBox(_arg_1.getText(TextConst.SETTINGS_MIPMAPPING_LABEL_TEXT));
         var _local_4:GridLayout = new GridLayout(FIRST_COLUMN_X,this.performanceInner.y + margin + 1,PERFORMANCE_GRID_COLUMN_WIDTH,this.cbShowFPS.height + margin);
         if(GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained)
         {
            this.cbFog = this.createCheckBox(_arg_1.getText(TextConst.STRING_SETTINGS_FOG_LABEL_TEXT));
            this.cbTankShadow = this.createCheckBox(_arg_1.getText(TextConst.STRING_SETTINGS_SHADOWS_LABEL_TEXT));
            this.cbDynamicShadows = this.createCheckBox(_arg_1.getText(TextConst.STRING_SETTINGS_DYNAMIC_SHADOWS_LABEL_TEXT));
            this.cbSoftParticles = this.createCheckBox(_arg_1.getText(TextConst.STRING_SETTINGS_SOFT_PARTICLES_LABEL_TEXT));
            this.cbDust = this.createCheckBox(_arg_1.getText(TextConst.STRING_SETTINGS_DUST_LABEL_TEXT));
            this.cbSSAO = this.createCheckBox(_arg_1.getText(TextConst.STRING_SETTINGS_SSAO));
            this.cbAntialiasing = this.createCheckBox(_arg_1.getText(TextConst.STRING_SETTINGS_ANTIALIASING));
            this.cbDynamicLighting = this.createCheckBox(_arg_1.getText(TextConst.STRING_SETTINGS_DYNAMIC_LIGHTING));
            this.cbSoftParticles.addEventListener(MouseEvent.CLICK,this.onSoftParticlesClick);
            this.createGraphicsAutoQualityCheckBox(_arg_1);
            _local_2 = this.layoutPerformanceFull(_local_4);
         }
         else
         {
            _local_2 = this.layoutPerformanceConstrained(_local_4);
         }
         this.performanceInner.height = _local_2 - this.performanceInner.y + margin + 1;
         this.windowSize.y = this.performanceInner.y + this.performanceInner.height;
      }
      
      private function onSoftParticlesClick(_arg_1:MouseEvent) : void
      {
         this.checkDustAvailable();
      }
      
      private function checkDustAvailable() : void
      {
         this.cbDust.visible = Boolean(this.cbSoftParticles) && !this.cbGraphicsAutoQuality.checked && this.cbSoftParticles.checked;
      }
      
      private function createGraphicsAutoQualityCheckBox(_arg_1:ILocaleService) : void
      {
         this.cbGraphicsAutoQuality = this.createCheckBox(_arg_1.getText(TextConst.STRING_SETTINGS_GRAPHICS_AUTO_QUALITY));
         this.cbGraphicsAutoQuality.addEventListener(MouseEvent.CLICK,this.onGraphicsAutQualityClick);
      }
      
      private function onGraphicsAutQualityClick(_arg_1:MouseEvent) : void
      {
         var _local_2:* = !this.cbGraphicsAutoQuality.checked;
         this.cbFog.visible = _local_2;
         this.cbTankShadow.visible = _local_2;
         this.cbDynamicShadows.visible = _local_2;
         this.cbSoftParticles.visible = _local_2;
         this.cbSSAO.visible = _local_2;
         this.cbDynamicLighting.visible = _local_2;
         this.cbAntialiasing.visible = _local_2;
         this.checkDustAvailable();
      }
      
      private function layoutPerformanceFull(_arg_1:GridLayout) : int
      {
         return _arg_1.layout([[this.cbShowFPS,this.cbAdaptiveFPS,this.cbShowSkyBox,this.cbShowChat],[this.cbMipMapping],[this.cbGraphicsAutoQuality],[this.cbDynamicShadows,this.cbFog,this.cbSoftParticles,this.cbAntialiasing],[this.cbSSAO,this.cbTankShadow,this.cbDust,this.cbDynamicLighting]]);
      }
      
      private function layoutPerformanceConstrained(_arg_1:GridLayout) : int
      {
         return _arg_1.layout([[this.cbShowFPS,this.cbAdaptiveFPS,this.cbShowSkyBox,this.cbShowChat],[this.cbMipMapping]]);
      }
      
      private function createPanelLabel(_arg_1:String, _arg_2:int, _arg_3:int) : LabelBase
      {
         var _local_4:LabelBase = new LabelBase();
         _local_4.antiAliasType = AntiAliasType.ADVANCED;
         _local_4.sharpness = -100;
         _local_4.thickness = 50;
         _local_4.text = _arg_1;
         _local_4.textColor = 16777215;
         _local_4.x = _arg_2;
         _local_4.y = _arg_3;
         addChild(_local_4);
         return _local_4;
      }
      
      private function createAccountPanel(_arg_1:ILocaleService, _arg_2:String, _arg_3:Boolean, _arg_4:String, _arg_5:String) : Boolean
      {
         var _local_6:TankWindowInner = null;
         var _local_7:LabelBase = null;
         var _local_8:LabelBase = null;
         var _local_9:LabelBase = null;
         var _local_10:Boolean = false;
         var _local_11:* = !_local_10;
         var _local_12:LabelBase = this.createPanelLabel(_arg_1.getText(TextConst.SETTINGS_ACCOUNT_HEADER_LABEL_TEXT),windowMargin,this.windowSize.y + windowMargin);
         _local_12.visible = _local_11;
         if(Boolean(_local_11))
         {
            this.windowSize.y = _local_12.y + _local_12.textHeight;
         }
         this.accountInner.y = this.windowSize.y + 5;
         this.accountInner.visible = _local_11;
         if(!this.isPasswordChangeDisabled)
         {
            this.pass1 = new TankInputBase();
            this.pass1.hidden = true;
            addChild(this.pass1);
            this.pass1.width = INPUT_WIDTH;
            this.pass1.label = _arg_1.getText(TextConst.SETTINGS_NEW_PASSWORD_LABEL_TEXT);
            this.pass1.x = SECOND_COLUMN_X;
            this.pass1.y = this.accountInner.y + margin;
            this.pass1.maxChars = 32;
            this.pass1.validValue = true;
            this.pass1.visible = _local_11;
            this.pass2 = new TankInputBase();
            addChild(this.pass2);
            this.pass2.hidden = true;
            this.pass2.width = INPUT_WIDTH;
            this.pass2.x = this.windowSize.x - margin - this.pass2.width - 2;
            this.pass2.label = _arg_1.getText(TextConst.SETTINGS_REENTER_PASSWORD_LABEL_TEXT);
            this.pass2.y = this.pass1.y;
            this.pass2.maxChars = 32;
            this.pass2.validValue = true;
            this.pass2.visible = _local_11;
            this.emailInput = new TankInputBase();
            addChild(this.emailInput);
            this.emailInput.value = _arg_2;
            this.emailInput.label = _arg_1.getText(TextConst.SETTINGS_EMAIL_LABEL_TEXT);
            this.emailInput.x = SECOND_COLUMN_X;
            this.emailInput.y = this.pass2.y + this.pass2.height + windowMargin;
            this.emailInput.validValue = true;
            this.emailInput.visible = _local_11;
            this.emailInput.width = this.windowSize.x - windowMargin - margin - this.emailInput.x;
            this.pass1CheckIcon = new InputCheckIcon();
            this.pass2CheckIcon = new InputCheckIcon();
            this.emailCheckIcon = new InputCheckIcon();
            this.pass1CheckIcon.x = SECOND_COLUMN_X + INPUT_WIDTH + this.pass1CheckIcon.width - 50;
            this.pass1CheckIcon.y = this.pass1.y + 7;
            this.pass1CheckIcon.visible = _local_11;
            this.pass1State = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
            this.pass2CheckIcon.x = this.windowSize.x - margin - this.pass2CheckIcon.width - 20;
            this.pass2CheckIcon.y = this.pass2.y + 7;
            this.pass2CheckIcon.visible = _local_11;
            this.pass2State = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
            this.emailCheckIcon.x = this.windowSize.x - margin - this.emailCheckIcon.width - 20;
            this.emailCheckIcon.y = this.emailInput.y + 7;
            this.emailCheckIcon.visible = _local_11;
            this.emailState = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
            addChild(this.pass1CheckIcon);
            addChild(this.pass2CheckIcon);
            addChild(this.emailCheckIcon);
            this.initEvents();
            this.creatteBubbles();
            this.emailInput.visible = _local_11;
            this.accountInner.height = margin * 2 + this.pass1.height + buttonSize.y + windowMargin - 1;
         }
         else
         {
            this.changePasswordButton = new DefaultButtonBase();
            this.changePasswordButton.width = 210;
            this.accountInner.height = buttonSize.y * 2;
            addChild(this.changePasswordButton);
            this.changePasswordButton.label = _arg_1.getText(TextConst.SETTINGS_BUTTON_CHANGE_PASSWORD_TEXT);
            this.changePasswordButton.x = (this.windowSize.x - this.changePasswordButton.width) / 2;
            this.changePasswordButton.y = this.accountInner.y + (this.accountInner.height - this.changePasswordButton.height) / 2;
            this.changePasswordButton.addEventListener(MouseEvent.CLICK,this.onChangePasswordClick);
            this.changePasswordButton.visible = _local_11;
         }
         this.createSNPanel();
         this.windowSize.y = this.accountInner.y + this.accountInner.height;
         if(_arg_3)
         {
            _local_6 = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
            addChild(_local_6);
            _local_6.x = windowMargin;
            _local_6.width = this.windowSize.x - windowMargin * 2;
            _local_7 = new LabelBase();
            _local_7.antiAliasType = AntiAliasType.ADVANCED;
            _local_7.sharpness = -100;
            _local_7.thickness = 100;
            _local_7.text = "防沉迷验证登记";
            _local_7.textColor = 0;
            addChild(_local_7);
            _local_7.x = windowMargin;
            _local_7.y = this.windowSize.y + windowMargin;
            this.windowSize.y = _local_7.y + _local_7.textHeight;
            _local_6.y = this.windowSize.y + 5;
            _local_8 = new LabelBase();
            addChild(_local_8);
            _local_8.text = "您的真实姓名:";
            _local_8.x = SECOND_COLUMN_X - margin - _local_8.textWidth;
            this.realNameInput = new TankInputBase();
            addChild(this.realNameInput);
            this.realNameInput.width = _local_6.width - margin * 4 - _local_8.width;
            this.realNameInput.x = SECOND_COLUMN_X;
            this.realNameInput.y = _local_6.y + margin;
            _local_8.y = this.realNameInput.y + Math.round((this.realNameInput.height - _local_8.textHeight) * 0.5) - 2;
            _local_9 = new LabelBase();
            addChild(_local_9);
            _local_9.text = "身份证号码:";
            _local_9.x = SECOND_COLUMN_X - _local_9.width - 5;
            _local_9.y = this.realNameInput.y + this.realNameInput.height + windowMargin + 6;
            this.idNumberInput = new TankInputBase();
            addChild(this.idNumberInput);
            this.idNumberInput.textField.text = _arg_2;
            this.idNumberInput.x = this.realNameInput.x;
            this.idNumberInput.y = this.realNameInput.y + this.realNameInput.height + windowMargin;
            this.idNumberInput.width = _local_6.width - margin * 4 - _local_8.width;
            _local_6.height = margin * 4 + 2 * this.realNameInput.height;
            this.windowSize.y = _local_6.y + _local_6.height;
            this.idNumberInput.textField.text = _arg_4 != null && _arg_4 != "null" ? _arg_4 : "";
            this.realNameInput.textField.text = _arg_5 != null && _arg_5 != "null" ? _arg_5 : "";
            this.idNumberInput.addEventListener(FocusEvent.FOCUS_OUT,this.validateAddictionID);
            this.idNumberInput.addEventListener(FocusEvent.FOCUS_IN,restoreInput);
            this.realNameInput.addEventListener(FocusEvent.FOCUS_OUT,this.validateRealName);
            this.realNameInput.addEventListener(FocusEvent.FOCUS_IN,restoreInput);
         }
         return _local_11;
      }
      
      private function createSNPanel() : void
      {
         this.currentSN = VKONTAKTE;
         var _local_1:Boolean = socialNetworkService.byc(this.currentSN);
         var _local_2:Sprite = new Sprite();
         this.snHasLinkLabel = new LabelBase();
         this.snHasLinkLabel.text = !_local_1 ? localeService.getText(TextConst.STRING_SETTINGS_LINK_ACCOUNT) : localeService.getText(TextConst.STRING_SETTINGS_UNLINK_ACCOUNT);
         _local_2.addChild(this.snHasLinkLabel);
         this.snButton = this.currentSN == VKONTAKTE ? new VKButton() : new FBButton();
         this.snButton.width = 102;
         this.snButton.x = this.snHasLinkLabel.x + this.snHasLinkLabel.width + 5;
         this.snHasLinkLabel.y = this.snButton.y + 7;
         _local_2.addChild(this.snButton);
         addChild(_local_2);
         _local_2.x = (this.windowSize.x - _local_2.width) / 2;
         this.accountInner.height = this.accountInner.height + margin + this.snButton.height;
         _local_2.y = this.accountInner.y + this.accountInner.height - _local_2.height - margin;
         socialNetworkService.addEventListener(SocialNetworkServiceEvent.UNLINK_SUCCESS,this.onUnlinkSuccess);
         socialNetworkService.addEventListener(SocialNetworkServiceEvent.LINK_SUCCESS,this.onLinkSuccess);
         this.snButton.addEventListener(MouseEvent.CLICK,!_local_1 ? this.onSNCreateLinkClick : this.onSNUnLinkClick);
      }
      
      private function onLinkSuccess(_arg_1:SocialNetworkServiceEvent) : void
      {
         this.snHasLinkLabel.text = localeService.getText(TextConst.STRING_SETTINGS_UNLINK_ACCOUNT);
         this.snButton.x = this.snHasLinkLabel.x + this.snHasLinkLabel.width + 5;
         this.snButton.removeEventListener(MouseEvent.CLICK,this.onSNCreateLinkClick);
         this.snButton.addEventListener(MouseEvent.CLICK,this.onSNUnLinkClick);
      }
      
      private function onUnlinkSuccess(_arg_1:SocialNetworkServiceEvent) : void
      {
         this.snHasLinkLabel.text = localeService.getText(TextConst.STRING_SETTINGS_LINK_ACCOUNT);
         this.snButton.x = this.snHasLinkLabel.x + this.snHasLinkLabel.width + 5;
         this.snButton.removeEventListener(MouseEvent.CLICK,this.onSNUnLinkClick);
         this.snButton.addEventListener(MouseEvent.CLICK,this.onSNCreateLinkClick);
      }
      
      private function onSNUnLinkClick(_arg_1:MouseEvent) : void
      {
         socialNetworkService.takeh(this.currentSN);
      }
      
      private function onSNCreateLinkClick(_arg_1:MouseEvent) : void
      {
         socialNetworkService.sejyciq(this.currentSN);
      }
      
      private function createControlPanel(_arg_1:ILocaleService) : void
      {
         var _local_2:LabelBase = this.createPanelLabel(_arg_1.getText(TextConst.SETTINGS_CONTROL_HEADER_LABEL_TEXT),windowMargin,this.windowSize.y + windowMargin);
         _local_2.visible = false;
         this.windowSize.y = _local_2.y + _local_2.textHeight;
         this.controlInner.y = this.windowSize.y + 5;
         this._inverseBackDriving = this.createCheckBox(_arg_1.getText(TextConst.SETTINGS_INVERSE_TURN_CONTROL_CHECKBOX_LABEL_TEXT),FIRST_COLUMN_X,this.controlInner.y + margin + 1);
         this.cbAlternateCamera = this.createCheckBox(_arg_1.getText(TextConst.SETTINGS_ALTERNATE_CAMERA_LABEL_TEXT),FIRST_COLUMN_X,this._inverseBackDriving.y + this._inverseBackDriving.height + margin);
         this.cbMouseControl = this.createCheckBox(_arg_1.getText(TextConst.STRING_SETTINGS_MOUSE_CONTROL_CHECKBOX),THIRD_COLUMN_X,this.cbAlternateCamera.y);
         this.controlInner.height = margin * 3 + 2 * this.cbShowFPS.height + 1;
         this.windowSize.y = this.controlInner.y + this.controlInner.height;
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
         this.emailInput.addEventListener(FocusEvent.FOCUS_IN,this.updatePasswordBlock);
         this.emailInput.addEventListener(Event.CHANGE,this.updatePasswordBlock);
      }
      
      private function updatePasswordBlock(_arg_1:Event) : void
      {
         var _local_2:Boolean = false;
         if(_local_2 || this.isPasswordChangeDisabled)
         {
            return;
         }
         this.pass1.validValue = isPasswordValid(this.pass1.value);
         this.pass1State = CallsignIconStates.CALLSIGN_ICON_STATE_INVALID;
         var _local_3:Boolean = true;
         this.pass2.validValue = this.pass2.value == "" || this.pass1.value == this.pass2.value;
         this.pass2State = CallsignIconStates.CALLSIGN_ICON_STATE_INVALID;
         if(this.pass1.value == "")
         {
            this.pass1State = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
            _local_3 = false;
         }
         else if(this.pass1.validValue)
         {
            this.pass1State = CallsignIconStates.CALLSIGN_ICON_STATE_VALID;
            _local_3 = false;
         }
         if(this.pass2.value == "")
         {
            this.pass2State = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
         }
         else if(this.pass2.validValue)
         {
            this.pass2State = CallsignIconStates.CALLSIGN_ICON_STATE_VALID;
         }
         var _local_4:* = !(_local_3 || this.pass2.validValue);
         if(_local_3)
         {
            helperService.showHelper(HELPER_GROUP_KEY,this.PASSWORD_IS_TOO_EASY,true);
         }
         else
         {
            helperService.hideHelper(HELPER_GROUP_KEY,this.PASSWORD_IS_TOO_EASY);
         }
         if(Boolean(_local_4))
         {
            helperService.showHelper(HELPER_GROUP_KEY,this.PASSWORDS_DO_NOT_MATCH,true);
         }
         else
         {
            helperService.hideHelper(HELPER_GROUP_KEY,this.PASSWORDS_DO_NOT_MATCH);
         }
         var _local_5:Boolean = true;
         if(this.emailInput.value.length > 0)
         {
            _local_5 = validateService.isEmailValid(this.emailInput.value);
         }
         var _local_6:Boolean = !(_local_3 || _local_4) && !_local_5;
         if(_local_6)
         {
            helperService.showHelper(HELPER_GROUP_KEY,this.ERROR_EMAIL_INVALID,true);
         }
         else
         {
            helperService.hideHelper(HELPER_GROUP_KEY,this.ERROR_EMAIL_INVALID);
         }
         if(_local_5)
         {
            this.emailInput.validValue = true;
            this.emailState = this.emailInput.value == "" ? int(CallsignIconStates.CALLSIGN_ICON_STATE_OFF) : int(CallsignIconStates.CALLSIGN_ICON_STATE_VALID);
         }
         else
         {
            this.emailInput.validValue = false;
            this.emailState = CallsignIconStates.CALLSIGN_ICON_STATE_INVALID;
         }
         this.okButton.enable = this.pass1.value == this.pass2.value && this.pass1.validValue && this.pass2.validValue && _local_5;
      }
      
      public function get bgSound() : Boolean
      {
         return this._bgSound.checked;
      }
      
      public function set bgSound(_arg_1:Boolean) : void
      {
         this._bgSound.checked = _arg_1;
      }
      
      public function get showFPS() : Boolean
      {
         return this.cbShowFPS.checked;
      }
      
      public function set showFPS(_arg_1:Boolean) : void
      {
         this.cbShowFPS.checked = _arg_1;
      }
      
      public function get receiveBattleInvite() : Boolean
      {
         return this._receiveBattleInvite.checked;
      }
      
      public function set receiveBattleInvite(_arg_1:Boolean) : void
      {
         this._receiveBattleInvite.checked = _arg_1;
      }
      
      public function get showSkyBox() : Boolean
      {
         return this.cbShowSkyBox.checked;
      }
      
      public function set showSkyBox(_arg_1:Boolean) : void
      {
         this.cbShowSkyBox.checked = _arg_1;
      }
      
      public function get showChat() : Boolean
      {
         return this.cbShowChat.checked;
      }
      
      public function set showChat(_arg_1:Boolean) : void
      {
         this.cbShowChat.checked = _arg_1;
      }
      
      public function get inverseBackDriving() : Boolean
      {
         return this._inverseBackDriving.checked;
      }
      
      public function set inverseBackDriving(_arg_1:Boolean) : void
      {
         this._inverseBackDriving.checked = _arg_1;
      }
      
      public function get enableMipMapping() : Boolean
      {
         return getCheckBoxState(this.cbMipMapping);
      }
      
      public function set enableMipMapping(_arg_1:Boolean) : void
      {
         setCheckBoxState(this.cbMipMapping,_arg_1);
      }
      
      public function get alternateCamera() : Boolean
      {
         return this.cbAlternateCamera.checked;
      }
      
      public function set alternateCamera(_arg_1:Boolean) : void
      {
         this.cbAlternateCamera.checked = _arg_1;
      }
      
      public function get shadowsEnabled() : Boolean
      {
         return getCheckBoxState(this.cbTankShadow);
      }
      
      public function set shadowsEnabled(_arg_1:Boolean) : void
      {
         setCheckBoxState(this.cbTankShadow,_arg_1);
      }
      
      public function get softParticlesEnabled() : Boolean
      {
         return getCheckBoxState(this.cbSoftParticles);
      }
      
      public function set softParticlesEnabled(_arg_1:Boolean) : void
      {
         setCheckBoxState(this.cbSoftParticles,_arg_1);
      }
      
      public function get dustEnabled() : Boolean
      {
         return getCheckBoxState(this.cbDust);
      }
      
      public function set dustEnabled(_arg_1:Boolean) : void
      {
         setCheckBoxState(this.cbDust,_arg_1);
         if(Boolean(this.cbDust))
         {
            this.checkDustAvailable();
         }
      }
      
      public function get ssaoEnabled() : Boolean
      {
         return getCheckBoxState(this.cbSSAO);
      }
      
      public function set ssaoEnabled(_arg_1:Boolean) : void
      {
         setCheckBoxState(this.cbSSAO,_arg_1);
      }
      
      public function get fogEnabled() : Boolean
      {
         return getCheckBoxState(this.cbFog);
      }
      
      public function set fogEnabled(_arg_1:Boolean) : void
      {
         setCheckBoxState(this.cbFog,_arg_1);
      }
      
      public function get dynamicShadowsEnabled() : Boolean
      {
         return getCheckBoxState(this.cbDynamicShadows);
      }
      
      public function set dynamicShadowsEnabled(_arg_1:Boolean) : void
      {
         setCheckBoxState(this.cbDynamicShadows,_arg_1);
      }
      
      public function get graphicsAutoQuality() : Boolean
      {
         return getCheckBoxState(this.cbGraphicsAutoQuality);
      }
      
      public function get antialiasingEnabled() : Boolean
      {
         return getCheckBoxState(this.cbAntialiasing);
      }
      
      public function set antialiasingEnabled(_arg_1:Boolean) : void
      {
         setCheckBoxState(this.cbAntialiasing,_arg_1);
      }
      
      public function get dynamicLightingEnabled() : Boolean
      {
         return getCheckBoxState(this.cbDynamicLighting);
      }
      
      public function set dynamicLightingEnabled(_arg_1:Boolean) : void
      {
         setCheckBoxState(this.cbDynamicLighting,_arg_1);
      }
      
      private function validateRealName(_arg_1:FocusEvent) : void
      {
         var _local_2:RegExp = null;
         if(this.realNameInput != null)
         {
            _local_2 = /^[一-龥]+$/;
            this.realNameInput.validValue = Boolean(this.realNameInput.textField.text.match(_local_2)) || trimString(this.realNameInput.textField.text).length == 0;
         }
      }
      
      private function validateAddictionID(_arg_1:FocusEvent) : void
      {
         var _local_2:RegExp = null;
         if(this.idNumberInput != null)
         {
            _local_2 = /^\d{17}[0-9xX]$/;
            this.idNumberInput.validValue = Boolean(this.idNumberInput.textField.text.match(_local_2)) || trimString(this.idNumberInput.textField.text).length == 0;
         }
      }
      
      private function onChangePasswordClick(_arg_1:MouseEvent) : void
      {
         this.changePasswordButton.enable = false;
         dispatchEvent(new SettingsWindowEvent(SettingsWindowEvent.CHANGE_PASSWORD));
      }
      
      private function onChangeVolume(_arg_1:SliderEvent) : void
      {
         dispatchEvent(new SettingsWindowEvent(SettingsWindowEvent.CHANGE_VOLUME));
      }
      
      private function onCancelClick(_arg_1:MouseEvent) : void
      {
         helperService.hideAllHelpers();
         dispatchEvent(new SettingsWindowEvent(SettingsWindowEvent.CANCEL_SETTINGS));
      }
      
      private function onOkClick(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new SettingsWindowEvent(SettingsWindowEvent.ACCEPT_SETTINGS));
      }
      
      public function get password() : String
      {
         var _local_1:* = "";
         if(!this.isPasswordChangeDisabled)
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
         if(this.isPasswordChangeDisabled)
         {
            return "";
         }
         return this.emailInput.textField.text;
      }
      
      public function get emailNoticeValue() : Boolean
      {
         return false;
      }
      
      public function get volume() : Number
      {
         return this.volumeLevel.value / 100;
      }
      
      public function set volume(_arg_1:Number) : void
      {
         this.volumeLevel.value = _arg_1 * 100;
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
      
      private function createCheckBox(_arg_1:String, _arg_2:int = 0, _arg_3:int = 0) : TankCheckBoxBase
      {
         var _local_4:TankCheckBoxBase = new TankCheckBoxBase();
         _local_4.x = _arg_2;
         _local_4.y = _arg_3;
         _local_4.type = TankCheckBox.CHECK_SIGN;
         _local_4.label = _arg_1;
         addChild(_local_4);
         return _local_4;
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
      
      private function creatteBubbles() : void
      {
         this.passwordIsTooEasyBubble = new PasswordIsTooEasyBubble();
         this.passwordsDoNotMatchBubble = new PasswordsDoNotMatchBubble();
         this.errorEmailInvalodBubble = new EmailInvalidBubble();
         this.alignHelpers();
         helperService.registerHelper(HELPER_GROUP_KEY,this.PASSWORD_IS_TOO_EASY,this.passwordIsTooEasyBubble,false);
         helperService.registerHelper(HELPER_GROUP_KEY,this.PASSWORDS_DO_NOT_MATCH,this.passwordsDoNotMatchBubble,false);
         helperService.registerHelper(HELPER_GROUP_KEY,this.ERROR_EMAIL_INVALID,this.errorEmailInvalodBubble,false);
      }
      
      public function alignHelpers() : void
      {
         if(this.passwordIsTooEasyBubble != null)
         {
            this.passwordIsTooEasyBubble.targetPoint = new Point(this.pass1CheckIcon.x + this.pass1CheckIcon.width / 2 + x,this.pass1CheckIcon.y + this.pass1CheckIcon.height / 2 + y);
            this.passwordsDoNotMatchBubble.targetPoint = new Point(this.pass2CheckIcon.x + this.pass2CheckIcon.width / 2 + x,this.pass2CheckIcon.y + this.pass2CheckIcon.height / 2 + y);
            this.errorEmailInvalodBubble.targetPoint = new Point(this.emailCheckIcon.x + this.emailCheckIcon.width / 2 + x,this.emailCheckIcon.y + this.emailCheckIcon.height / 2 + y);
         }
      }
      
      public function dispose() : void
      {
         helperService.unregisterHelper(HELPER_GROUP_KEY,this.PASSWORD_IS_TOO_EASY);
         helperService.unregisterHelper(HELPER_GROUP_KEY,this.PASSWORDS_DO_NOT_MATCH);
         helperService.unregisterHelper(HELPER_GROUP_KEY,this.ERROR_EMAIL_INVALID);
      }
      
      public function get adaptiveFPS() : Boolean
      {
         return this.cbAdaptiveFPS.checked;
      }
      
      public function set adaptiveFPS(_arg_1:Boolean) : void
      {
         this.cbAdaptiveFPS.checked = _arg_1;
      }
      
      public function set graphicsAutoQuality(_arg_1:Boolean) : void
      {
         setCheckBoxState(this.cbGraphicsAutoQuality,_arg_1);
         if(this.cbGraphicsAutoQuality != null)
         {
            this.onGraphicsAutQualityClick(null);
         }
      }
      
      public function set mouseControl(_arg_1:Boolean) : void
      {
         this.cbMouseControl.checked = _arg_1;
      }
      
      public function get mouseControl() : Boolean
      {
         return this.cbMouseControl.checked;
      }
      
      public function set showMouseControl(_arg_1:Boolean) : void
      {
         this.cbMouseControl.visible = _arg_1;
      }
      
      public function get showMouseControl() : Boolean
      {
         return this.cbMouseControl.visible;
      }
   }
}

import flash.display.DisplayObject;

class GridLayout
{
   
   internal var topX:int;
   
   internal var topY:int;
   
   internal var columnWidth:int;
   
   internal var rowHeight:int;
   
   public function GridLayout(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int)
   {
      super();
      this.topX = _arg_1;
      this.topY = _arg_2;
      this.columnWidth = _arg_3;
      this.rowHeight = _arg_4;
   }
   
   public function layout(_arg_1:Array) : int
   {
      var _local_2:int = 0;
      var _local_3:Array = null;
      var _local_4:int = 0;
      var _local_5:DisplayObject = null;
      var _local_6:int = 0;
      while(_local_6 < _arg_1.length)
      {
         _local_3 = _arg_1[_local_6];
         _local_4 = 0;
         while(_local_4 < _local_3.length)
         {
            if(_local_3[_local_4] != null)
            {
               _local_5 = _local_3[_local_4];
               _local_5.x = this.topX + _local_4 * this.columnWidth;
               _local_5.y = this.topY + _local_6 * this.rowHeight;
               _local_2 = _local_5.y + _local_5.height;
            }
            _local_4++;
         }
         _local_6++;
      }
      return _local_2;
   }
}
