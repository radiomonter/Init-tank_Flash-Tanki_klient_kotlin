package alternativa.tanks.view.forms.primitives
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.TankWindow;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   import forms.events.AlertEvent;
   import services.alertservice.AlertAnswer;
   
   public class Alert extends Sprite
   {
      
      public static var localeService:ILocaleService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
      
      public static const ALERT_QUIT:int = 0;
      
      public static const ALERT_CONFIRM_EMAIL:int = 1;
      
      public static const ERROR_CALLSIGN_FIRST_SYMBOL:int = 2;
      
      public static const ERROR_CALLSIGN_DEVIDE:int = 3;
      
      public static const ERROR_CALLSIGN_LAST_SYMBOL:int = 4;
      
      public static const ERROR_CALLSIGN_LENGTH:int = 5;
      
      public static const ERROR_CALLSIGN_UNIQUE:int = 6;
      
      public static const ERROR_PASSWORD_LENGTH:int = 7;
      
      public static const ERROR_PASSWORD_INCORRECT:int = 8;
      
      public static const ERROR_PASSWORD_CHANGE:int = 9;
      
      public static const ERROR_EMAIL_UNIQUE:int = 10;
      
      public static const ERROR_EMAIL_INVALID:int = 11;
      
      public static const ERROR_EMAIL_NOTFOUND:int = 12;
      
      public static const ERROR_EMAIL_NOTSENDED:int = 13;
      
      public static const ERROR_FATAL:int = 14;
      
      public static const ERROR_FATAL_DEBUG:int = 15;
      
      public static const GARAGE_AVAILABLE:int = 16;
      
      public static const ALERT_RECOVERY_LINK_SENDED:int = 17;
      
      public static const ALERT_CHAT_PROCEED:int = 18;
      
      public static const CAPTCHA_INCORRECT:int = 19;
      
      public static const ERROR_CONFIRM_EMAIL:int = 20;
      
      private const alerts:Array = new Array();
      
      protected var bgWindow:TankWindow = new TankWindow();
      
      private var output:LabelBase;
      
      private var message:String;
      
      private var labels:Vector.<String>;
      
      protected var alertWindow:Sprite = new Sprite();
      
      public var closeButton:MainPanelCloseButton = new MainPanelCloseButton();
      
      private var closable:Boolean = false;
      
      private var id:int;
      
      public function Alert(_arg_1:int = -1, _arg_2:Boolean = false)
      {
         super();
         this.closable = _arg_2;
         this.id = _arg_1;
         this.init();
      }
      
      private static function isConfirmationKey(_arg_1:KeyboardEvent) : Boolean
      {
         return [Keyboard.SPACE,Keyboard.ENTER].indexOf(_arg_1.keyCode) >= 0;
      }
      
      private static function isCancelKey(_arg_1:KeyboardEvent) : Boolean
      {
         return [Keyboard.ESCAPE,Keyboard.BACKSPACE].indexOf(_arg_1.keyCode) >= 0;
      }
      
      public function init() : void
      {
         this.bgWindow.headerLang = localeService.getText(TextConst.GUI_LANG);
         if(AlertAnswer.YES == null)
         {
            this.fillButtonLabels();
         }
         this.initStandardAlerts(localeService);
         if(this.id > -1)
         {
            this.showAlert(this.alerts[this.id][0],this.alerts[this.id][1]);
         }
         this.createOutput();
      }
      
      private function initStandardAlerts(_arg_1:ILocaleService) : void
      {
         this.alerts[ALERT_QUIT] = [_arg_1.getText(TextConst.ALERT_QUIT_TEXT),Vector.<String>([AlertAnswer.YES,AlertAnswer.NO])];
         this.alerts[ALERT_CONFIRM_EMAIL] = [_arg_1.getText(TextConst.ALERT_EMAIL_CONFIRMED),Vector.<String>([AlertAnswer.YES])];
         this.alerts[ERROR_FATAL] = [_arg_1.getText(TextConst.ERROR_FATAL),Vector.<String>([AlertAnswer.daqajylep])];
         this.alerts[ERROR_FATAL_DEBUG] = [_arg_1.getText(TextConst.ERROR_FATAL_DEBUG),Vector.<String>([AlertAnswer.SEND])];
         this.alerts[ERROR_CALLSIGN_FIRST_SYMBOL] = [_arg_1.getText(TextConst.ERROR_CALLSIGN_WRONG_FIRST_SYMBOL),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_CALLSIGN_DEVIDE] = [_arg_1.getText(TextConst.ERROR_CALLSIGN_NOT_SINGLE_DEVIDERS),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_CALLSIGN_LAST_SYMBOL] = [_arg_1.getText(TextConst.ERROR_CALLSIGN_WRONG_LAST_SYMBOL),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_CALLSIGN_LENGTH] = [_arg_1.getText(TextConst.ERROR_CALLSIGN_LENGTH),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_CALLSIGN_UNIQUE] = [_arg_1.getText(TextConst.ERROR_CALLSIGN_NOT_UNIQUE),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_EMAIL_UNIQUE] = [_arg_1.getText(TextConst.ERROR_EMAIL_NOT_UNIQUE),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_EMAIL_INVALID] = [_arg_1.getText(TextConst.ERROR_EMAIL_INVALID),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_EMAIL_NOTFOUND] = [_arg_1.getText(TextConst.ERROR_EMAIL_NOT_FOUND),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_EMAIL_NOTSENDED] = [_arg_1.getText(TextConst.ERROR_EMAIL_NOT_SENDED),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_PASSWORD_INCORRECT] = [_arg_1.getText(TextConst.ERROR_PASSWORD_INCORRECT),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_PASSWORD_LENGTH] = [_arg_1.getText(TextConst.ERROR_PASSWORD_LENGTH),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_PASSWORD_CHANGE] = [_arg_1.getText(TextConst.ERROR_PASSWORD_CHANGE),Vector.<String>([AlertAnswer.OK])];
         this.alerts[GARAGE_AVAILABLE] = [_arg_1.getText(TextConst.ALERT_GARAGE_AVAILABLE),Vector.<String>([AlertAnswer.GARAGE,AlertAnswer.CANCEL])];
         this.alerts[ALERT_RECOVERY_LINK_SENDED] = [_arg_1.getText(TextConst.SETTINGS_CHANGE_PASSWORD_CONFIRMATION_SENT_TEXT),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ALERT_CHAT_PROCEED] = [_arg_1.getText(TextConst.ALERT_CHAT_PROCEED_EXTERNAL_LINK),Vector.<String>([AlertAnswer.CANCEL])];
         this.alerts[CAPTCHA_INCORRECT] = [_arg_1.getText(TextConst.CAPTCHA_INCORRECT),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_CONFIRM_EMAIL] = [_arg_1.getText(TextConst.ALERT_EMAIL_CONFIRMED_WRONG_LINK),Vector.<String>([AlertAnswer.OK])];
      }
      
      private function fillButtonLabels() : void
      {
         AlertAnswer.YES = localeService.getText(TextConst.ALERT_ANSWER_YES);
         AlertAnswer.NO = localeService.getText(TextConst.ALERT_ANSWER_NO);
         AlertAnswer.OK = localeService.getText(TextConst.ALERT_ANSWER_OK);
         AlertAnswer.CANCEL = localeService.getText(TextConst.ALERT_ANSWER_CANCEL);
         AlertAnswer.SEND = localeService.getText(TextConst.ALERT_ANSWER_SEND_BUG_REPORT);
         AlertAnswer.daqajylep = localeService.getText(TextConst.ALERT_ANSWER_RETURN_TO_BATTLE);
         AlertAnswer.GARAGE = localeService.getText(TextConst.ALERT_ANSWER_GO_TO_GARAGE);
         AlertAnswer.meg = localeService.getText(TextConst.ALERT_ANSWER_PROCEED);
      }
      
      private function createOutput() : void
      {
         this.output = new LabelBase();
         this.output.autoSize = TextFieldAutoSize.CENTER;
         this.output.align = TextFormatAlign.CENTER;
         this.output.size = 13;
         this.output.width = 10;
         this.output.height = 10;
         this.output.x = -5;
         this.output.y = 30;
         this.output.multiline = true;
      }
      
      public function showAlert(_arg_1:String, _arg_2:Vector.<String>) : void
      {
         this.message = _arg_1;
         this.labels = _arg_2;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function onAddedToStage(_arg_1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.drawBackground();
         this.doLayout(_arg_1);
      }
      
      protected function doLayout(_arg_1:Event) : void
      {
         var _local_2:DefaultButtonBase = null;
         var _local_3:int = 0;
         var _local_4:int = this.calculateButtonsWidth();
         var _local_5:int = int(_local_4 * this.labels.length / 2);
         addChild(this.alertWindow);
         this.alertWindow.addChild(this.bgWindow);
         this.alertWindow.addChild(this.output);
         this.output.htmlText = this.message;
         if(this.labels.length != 0)
         {
            _local_3 = 0;
            while(_local_3 < this.labels.length)
            {
               _local_2 = new DefaultButtonBase();
               _local_2.label = this.labels[_local_3];
               _local_2.x = _local_4 * _local_3 - _local_5;
               _local_2.y = this.output.y + this.output.height + 15;
               _local_2.width = _local_4 - 6;
               _local_2.addEventListener(MouseEvent.CLICK,this.close);
               this.alertWindow.addChild(_local_2);
               _local_3++;
            }
            this.bgWindow.height = _local_2.y + 60;
         }
         else
         {
            this.bgWindow.height = this.output.y + this.output.height + 30;
         }
         this.bgWindow.width = Math.max(int(this.output.width + 50),_local_5 * 2 + 50);
         this.bgWindow.x = -int(this.bgWindow.width / 2) - 3;
         stage.addEventListener(Event.RESIZE,this.onStageResize);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         stage.focus = this;
         if(this.closable)
         {
            this.alertWindow.addChild(this.closeButton);
            this.closeButton.x = this.bgWindow.x + this.bgWindow.width - this.closeButton.width - 10;
            this.closeButton.y = 10;
            this.closeButton.addEventListener(MouseEvent.CLICK,this.close);
         }
         this.onStageResize(null);
      }
      
      private function onKeyDown(_arg_1:KeyboardEvent) : void
      {
         var _local_2:String = null;
         if(this.labels.length == 2)
         {
            if(isConfirmationKey(_arg_1))
            {
               _local_2 = this.getFirstExistingLabel([AlertAnswer.OK,AlertAnswer.YES,AlertAnswer.GARAGE,AlertAnswer.meg,AlertAnswer.SEND]);
            }
            else if(isCancelKey(_arg_1))
            {
               _local_2 = this.getFirstExistingLabel([AlertAnswer.NO,AlertAnswer.CANCEL,AlertAnswer.daqajylep]);
            }
         }
         else
         {
            _local_2 = this.getFirstExistingLabel([AlertAnswer.YES,AlertAnswer.SEND,AlertAnswer.daqajylep,AlertAnswer.OK,AlertAnswer.CANCEL]);
         }
         this.dispatchClickEventForButtonWithLabel(_local_2);
      }
      
      private function getFirstExistingLabel(_arg_1:Array) : String
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         while(_local_3 < this.labels.length)
         {
            _local_2 = _arg_1.indexOf(this.labels[_local_3]);
            if(_local_2 > -1)
            {
               return _arg_1[_local_2];
            }
            _local_3++;
         }
         return "";
      }
      
      private function dispatchClickEventForButtonWithLabel(_arg_1:String) : void
      {
         var _local_2:DisplayObject = null;
         var _local_3:int = 0;
         while(_local_3 < this.alertWindow.numChildren)
         {
            _local_2 = this.alertWindow.getChildAt(_local_3);
            if(_local_2 is DefaultButtonBase && DefaultButtonBase(_local_2).label == _arg_1)
            {
               _local_2.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
               return;
            }
            _local_3++;
         }
      }
      
      private function calculateButtonsWidth() : int
      {
         var _local_3:int = 0;
         var _local_1:int = 80;
         var _local_2:LabelBase = new LabelBase();
         while(_local_3 < this.labels.length)
         {
            _local_2.text = this.labels[_local_3];
            if(_local_2.width > _local_1)
            {
               _local_1 = _local_2.width;
            }
            _local_3++;
         }
         return _local_1 + 18;
      }
      
      private function onStageResize(_arg_1:Event) : void
      {
         this.alertWindow.x = int(stage.stageWidth / 2);
         this.alertWindow.y = int(stage.stageHeight / 2 - this.alertWindow.height / 2);
         this.drawBackground();
      }
      
      private function drawBackground() : void
      {
         graphics.clear();
         graphics.beginFill(0,0.5);
         graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight);
         graphics.endFill();
      }
      
      private function close(_arg_1:MouseEvent) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onStageResize);
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         this.removeMouseListenerFromButtons();
         var _local_2:DefaultButtonBase = _arg_1.currentTarget as DefaultButtonBase;
         if(_local_2 != null)
         {
            dispatchEvent(new AlertEvent(_local_2.label));
         }
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function removeMouseListenerFromButtons() : void
      {
         var _local_1:DisplayObject = null;
         var _local_2:int = 0;
         while(_local_2 < this.alertWindow.numChildren)
         {
            _local_1 = this.alertWindow.getChildAt(_local_2);
            if(_local_1 is DefaultButtonBase || _local_1 == this.closeButton)
            {
               _local_1.removeEventListener(MouseEvent.CLICK,this.close);
            }
            _local_2++;
         }
      }
   }
}

