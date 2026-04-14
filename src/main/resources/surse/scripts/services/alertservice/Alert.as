package services.alertservice
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.ColorButton;
   import controls.TankWindow;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.buttons.ButtonBase;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import forms.events.AlertEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.AlertUtils;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.KeyUpListenerPriority;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.removeDisplayObject;
   
   public class Alert extends Sprite
   {
      
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
      
      public static const funer:int = 21;
      
      public static const jiqecuce:int = 22;
      
      private const alerts:Array = [];
      
      protected var bgWindow:TankWindow = new TankWindow();
      
      private var output:LabelBase;
      
      private var message:String;
      
      private var labels:Vector.<String>;
      
      protected var alertWindow:Sprite = new Sprite();
      
      public var closeButton:MainPanelCloseButton = new MainPanelCloseButton();
      
      private var closable:Boolean = false;
      
      private var id:int;
      
      private var localeService:ILocaleService;
      
      private var sucowypo:Vector.<Sprite>;
      
      public function Alert(_arg_1:int = -1, _arg_2:Boolean = false)
      {
         super();
         this.closable = _arg_2;
         this.id = _arg_1;
         this.init();
      }
      
      public static function fillButtonLabels(_arg_1:ILocaleService) : void
      {
         AlertAnswer.YES = _arg_1.getText(TanksLocale.TEXT_ALERT_ANSWER_YES);
         AlertAnswer.NO = _arg_1.getText(TanksLocale.TEXT_ALERT_ANSWER_NO);
         AlertAnswer.OK = _arg_1.getText(TanksLocale.TEXT_ALERT_ANSWER_OK);
         AlertAnswer.CANCEL = _arg_1.getText(TanksLocale.TEXT_ALERT_ANSWER_CANCEL);
         AlertAnswer.SEND = _arg_1.getText(TanksLocale.TEXT_ALERT_ANSWER_SEND_BUG_REPORT);
         AlertAnswer.daqajylep = _arg_1.getText(TanksLocale.TEXT_ALERT_ANSWER_RETURN_TO_BATTLE);
         AlertAnswer.GARAGE = _arg_1.getText(TanksLocale.TEXT_ALERT_ANSWER_GO_TO_GARAGE);
         AlertAnswer.meg = _arg_1.getText(TanksLocale.TEXT_ALERT_ANSWER_PROCEED);
         AlertAnswer.bafycil = "Закрыть доступ";
         AlertAnswer.ENTER = _arg_1.getText(TanksLocale.TEXT_BATTLEINFO_PANEL_PAID_BATTLES_ALERT_ANSWER_ENTER);
         AlertAnswer.syj = _arg_1.getText(TanksLocale.TEXT_BATTLEINFO_PANEL_PAID_BATTLES_ALERT_ANSWER_DONT_ENTER);
      }
      
      private function init() : void
      {
         this.localeService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         this.bgWindow.headerLang = this.localeService.getText(TanksLocale.TEXT_GUI_LANG);
         if(AlertAnswer.YES == null)
         {
            fillButtonLabels(this.localeService);
         }
         this.initStandardAlerts(this.localeService);
         if(this.id > -1)
         {
            this.showAlert(this.alerts[this.id][0],this.alerts[this.id][1]);
         }
         this.createOutput();
      }
      
      private function initStandardAlerts(_arg_1:ILocaleService) : void
      {
         this.alerts[ALERT_QUIT] = [_arg_1.getText(TanksLocale.TEXT_ALERT_QUIT_TEXT),Vector.<String>([AlertAnswer.YES,AlertAnswer.NO])];
         this.alerts[ALERT_CONFIRM_EMAIL] = [_arg_1.getText(TanksLocale.TEXT_ALERT_EMAIL_CONFIRMED),Vector.<String>([AlertAnswer.YES])];
         this.alerts[ERROR_FATAL] = [_arg_1.getText(TanksLocale.TEXT_ERROR_FATAL),Vector.<String>([AlertAnswer.daqajylep])];
         this.alerts[ERROR_FATAL_DEBUG] = [_arg_1.getText(TanksLocale.TEXT_ERROR_FATAL_DEBUG),Vector.<String>([AlertAnswer.SEND])];
         this.alerts[ERROR_CALLSIGN_FIRST_SYMBOL] = [_arg_1.getText(TanksLocale.TEXT_ERROR_CALLSIGN_WRONG_FIRST_SYMBOL),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_CALLSIGN_DEVIDE] = [_arg_1.getText(TanksLocale.TEXT_ERROR_CALLSIGN_NOT_SINGLE_DEVIDERS),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_CALLSIGN_LAST_SYMBOL] = [_arg_1.getText(TanksLocale.TEXT_ERROR_CALLSIGN_WRONG_LAST_SYMBOL),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_CALLSIGN_LENGTH] = [_arg_1.getText(TanksLocale.TEXT_ERROR_CALLSIGN_LENGTH),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_CALLSIGN_UNIQUE] = [_arg_1.getText(TanksLocale.TEXT_ERROR_CALLSIGN_NOT_UNIQUE),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_EMAIL_UNIQUE] = [_arg_1.getText(TanksLocale.TEXT_ERROR_EMAIL_NOT_UNIQUE),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_EMAIL_INVALID] = [_arg_1.getText(TanksLocale.TEXT_ERROR_EMAIL_INVALID),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_EMAIL_NOTFOUND] = [_arg_1.getText(TanksLocale.TEXT_ERROR_EMAIL_NOT_FOUND),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_EMAIL_NOTSENDED] = [_arg_1.getText(TanksLocale.TEXT_ERROR_EMAIL_NOT_SENDED),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_PASSWORD_INCORRECT] = [_arg_1.getText(TanksLocale.TEXT_ERROR_PASSWORD_INCORRECT),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_PASSWORD_LENGTH] = [_arg_1.getText(TanksLocale.TEXT_ERROR_PASSWORD_LENGTH),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_PASSWORD_CHANGE] = [_arg_1.getText(TanksLocale.TEXT_ERROR_PASSWORD_CHANGE),Vector.<String>([AlertAnswer.OK])];
         this.alerts[GARAGE_AVAILABLE] = [_arg_1.getText(TanksLocale.TEXT_ALERT_GARAGE_AVAILABLE),Vector.<String>([AlertAnswer.GARAGE,AlertAnswer.CANCEL])];
         this.alerts[ALERT_RECOVERY_LINK_SENDED] = [_arg_1.getText(TanksLocale.TEXT_SETTINGS_CHANGE_PASSWORD_CONFIRMATION_SENT_TEXT),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ALERT_CHAT_PROCEED] = [_arg_1.getText(TanksLocale.TEXT_ALERT_CHAT_PROCEED_EXTERNAL_LINK),Vector.<String>([AlertAnswer.CANCEL])];
         this.alerts[CAPTCHA_INCORRECT] = [_arg_1.getText(TanksLocale.TEXT_CAPTCHA_INCORRECT),Vector.<String>([AlertAnswer.OK])];
         this.alerts[ERROR_CONFIRM_EMAIL] = [_arg_1.getText(TanksLocale.TEXT_ALERT_EMAIL_CONFIRMED_WRONG_LINK),Vector.<String>([AlertAnswer.OK])];
         this.alerts[funer] = ["Внимание!\nПрежде чем вы сможете закрыть доступ для сервиса ВКонтакте, вам\nнеобходимо установить пароль для аккаунта \"Танков Онлайн\" в настройках.",[AlertAnswer.OK]];
         this.alerts[jiqecuce] = [_arg_1.getText(TanksLocale.TEXT_PARTNER_USERNAME_ALREDY_USED_ERROR),Vector.<String>([AlertAnswer.OK])];
      }
      
      private function createOutput() : void
      {
         this.output = new LabelBase();
         this.output.autoSize = TextFieldAutoSize.CENTER;
         this.output.align = TextFormatAlign.CENTER;
         this.output.size = 14;
         this.output.width = 10;
         this.output.height = 10;
         this.output.x = -5;
         this.output.y = 30;
         this.output.multiline = true;
      }
      
      public function showAlert(_arg_1:String, _arg_2:Vector.<String>) : void
      {
         this.message = _arg_1;
         this.sucowypo = null;
         this.labels = _arg_2;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      public function hiby(_arg_1:String, _arg_2:Vector.<String>, _arg_3:Vector.<Sprite>) : void
      {
         this.message = _arg_1;
         this.labels = _arg_2;
         this.sucowypo = _arg_3;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function onAddedToStage(_arg_1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.doLayout(_arg_1);
      }
      
      private function tedejys() : Boolean
      {
         return this.labels.length != 0;
      }
      
      private function pypirohic() : Boolean
      {
         return this.sucowypo != null;
      }
      
      protected function doLayout(_arg_1:Event) : void
      {
         var _local_2:Sprite = null;
         var _local_3:int = 0;
         var _local_4:DefaultButtonBase = null;
         var _local_5:int = this.calculateButtonsWidth();
         var _local_6:int = int(_local_5 * this.labels.length / 2);
         addChild(this.alertWindow);
         this.alertWindow.addChild(this.bgWindow);
         this.alertWindow.addChild(this.output);
         this.output.htmlText = this.message;
         if(this.tedejys())
         {
            _local_3 = 0;
            while(_local_3 < this.labels.length)
            {
               if(this.pypirohic())
               {
                  _local_2 = this.sucowypo[_local_3];
               }
               else
               {
                  _local_4 = new DefaultButtonBase();
                  _local_2 = _local_4;
                  _local_4.label = this.labels[_local_3];
               }
               _local_2.x = _local_5 * _local_3 - _local_6;
               _local_2.y = this.output.y + this.output.height + 15;
               _local_2.width = _local_5 - 6;
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
         this.bgWindow.width = Math.max(int(this.output.width + 50),_local_6 * 2 + 50);
         this.bgWindow.x = -int(this.bgWindow.width / 2) - 3;
         stage.addEventListener(Event.RESIZE,this.onStageResize);
         stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp,false,KeyUpListenerPriority.ALERT);
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
      
      private function onKeyUp(_arg_1:KeyboardEvent) : void
      {
         var _local_2:String = null;
         switch(this.labels.length)
         {
            case 1:
               if(AlertUtils.isConfirmationKey(_arg_1.keyCode) || AlertUtils.isCancelKey(_arg_1.keyCode))
               {
                  _local_2 = this.labels[0];
               }
               break;
            case 2:
               if(AlertUtils.isConfirmationKey(_arg_1.keyCode))
               {
                  _local_2 = this.getFirstExistingLabel(this.tev());
               }
               else if(AlertUtils.isCancelKey(_arg_1.keyCode))
               {
                  _local_2 = this.getFirstExistingLabel(this.vuk());
               }
               break;
            case 3:
               if(AlertUtils.isConfirmationKey(_arg_1.keyCode))
               {
                  _local_2 = this.getFirstExistingLabel(this.tev());
               }
               else if(AlertUtils.isCancelKey(_arg_1.keyCode))
               {
                  _local_2 = this.getFirstExistingLabel(Vector.<String>([AlertAnswer.CANCEL]));
               }
         }
         if(_local_2 != null)
         {
            _arg_1.stopImmediatePropagation();
            this.dispatchClickEventForButtonWithLabel(_local_2);
         }
      }
      
      private function vuk() : Vector.<String>
      {
         return Vector.<String>([AlertAnswer.NO,AlertAnswer.CANCEL,AlertAnswer.daqajylep,AlertAnswer.syj]);
      }
      
      private function tev() : Vector.<String>
      {
         return Vector.<String>([AlertAnswer.OK,AlertAnswer.YES,AlertAnswer.GARAGE,AlertAnswer.meg,AlertAnswer.SEND,AlertAnswer.ENTER,this.localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR_BUTTON_ENTER)]);
      }
      
      private function getFirstExistingLabel(_arg_1:Vector.<String>) : String
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
      
      private function mojogo(_arg_1:Object) : Boolean
      {
         return _arg_1 is ButtonBase || _arg_1 is ColorButton;
      }
      
      private function muhocutaco(_arg_1:Object) : String
      {
         if(_arg_1 is ButtonBase)
         {
            return ButtonBase(_arg_1).label;
         }
         if(_arg_1 is ColorButton)
         {
            return ColorButton(_arg_1).label;
         }
         return null;
      }
      
      private function dispatchClickEventForButtonWithLabel(_arg_1:String) : void
      {
         var _local_2:DisplayObject = null;
         var _local_3:int = 0;
         while(_local_3 < this.alertWindow.numChildren)
         {
            _local_2 = this.alertWindow.getChildAt(_local_3);
            if(this.mojogo(_local_2) && this.muhocutaco(_local_2) == _arg_1)
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
      }
      
      private function close(_arg_1:MouseEvent) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onStageResize);
         stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         this.removeMouseListenerFromButtons();
         while(this.alertWindow.numChildren > 0)
         {
            this.alertWindow.removeChildAt(0);
         }
         if(this.mojogo(_arg_1.currentTarget))
         {
            dispatchEvent(new AlertEvent(this.muhocutaco(_arg_1.currentTarget)));
         }
         removeDisplayObject(this);
      }
      
      private function removeMouseListenerFromButtons() : void
      {
         var _local_1:DisplayObject = null;
         var _local_2:int = 0;
         while(_local_2 < this.alertWindow.numChildren)
         {
            _local_1 = this.alertWindow.getChildAt(_local_2);
            if(_local_1 == this.closeButton)
            {
               _local_1.removeEventListener(MouseEvent.CLICK,this.close);
            }
            _local_2++;
         }
      }
      
      public function bah() : void
      {
         var _local_1:String = null;
         if(this.labels.length == 2)
         {
            _local_1 = this.getFirstExistingLabel(this.vuk());
         }
         else if(this.labels.length == 1)
         {
            _local_1 = this.labels[0];
         }
         if(_local_1 != null)
         {
            this.dispatchClickEventForButtonWithLabel(_local_1);
         }
      }
   }
}

