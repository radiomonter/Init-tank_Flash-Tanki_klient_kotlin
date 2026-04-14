package obfuscation.jykyliv
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.TankWindow;
   import controls.TextArea;
   import controls.ValidationIcon;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck.UidCheckService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.AlertUtils;
   
   public class Puhoka extends DialogWindow
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var zitafafa:UidCheckService;
      
      private static const faceg:int = 350;
      
      private static const tynywesud:int = 600;
      
      private static const tigi:int = 11;
      
      private static const fota:int = 5;
      
      private var window:TankWindow = new TankWindow(440,200);
      
      private var rologi:TextArea;
      
      private var jahih:TankInputBase;
      
      private var teni:LabelBase;
      
      private var sendButton:DefaultButtonBase;
      
      private var isUidValid:Boolean;
      
      private var uid:String;
      
      private var qosyfovim:ValidationIcon;
      
      private var wibiqec:uint;
      
      public function Puhoka()
      {
         super();
         addChild(this.window);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.meh);
         var _local_1:int = tigi;
         this.pycuvajap(_local_1);
         _local_1 += this.rologi.height + fota;
         this.tigacace(_local_1);
         _local_1 += this.jahih.height + fota;
         this.woqikaqi(_local_1);
         dialogService.addDialog(this);
      }
      
      private function woqikaqi(_arg_1:int) : void
      {
         var _local_2:DefaultButtonBase = null;
         var _local_3:int = 0;
         this.sendButton = new DefaultButtonBase();
         this.sendButton.label = localeService.getText(TextConst.TEXT_SEND_PRESENT_BUTTON);
         this.sendButton.x = tigi;
         this.sendButton.y = _arg_1;
         this.sendButton.addEventListener(MouseEvent.CLICK,this.tyvofykuc);
         this.sendButton.enable = false;
         this.window.addChild(this.sendButton);
         _local_2 = new DefaultButtonBase();
         _local_2.label = localeService.getText(TextConst.ALERT_ANSWER_CANCEL);
         _local_2.x = tigi;
         _local_2.y = _arg_1;
         _local_2.addEventListener(MouseEvent.CLICK,this.onCancelClick);
         this.window.addChild(_local_2);
         _local_3 = Math.max(this.sendButton.width,_local_2.width);
         this.sendButton.width = _local_3;
         _local_2.width = _local_3;
         var _local_4:int = this.sendButton.height + 2 * fota;
         var _local_5:int = int((width - 2 * _local_3 - _local_4) / 2);
         this.sendButton.x = _local_5;
         _local_2.x = width - _local_3 - _local_5;
      }
      
      private function tigacace(_arg_1:int) : void
      {
         this.jahih = new TankInputBase();
         this.jahih.maxChars = 20;
         this.jahih.x = tigi;
         this.jahih.y = _arg_1;
         this.jahih.width = this.window.width - 2 * tigi;
         this.jahih.addEventListener(FocusEvent.FOCUS_OUT,this.lamifo);
         this.jahih.textField.addEventListener(Event.CHANGE,this.pawykojew);
         this.jahih.addEventListener(KeyboardEvent.KEY_UP,this.vyso);
         this.window.addChild(this.jahih);
         this.teni = new Jikipus(this.jahih.textField);
         this.teni.text = localeService.getText(TextConst.TEXT_PRESENT_RECIPIENT_NAME);
         this.teni.x = this.jahih.x + fota;
         this.teni.y = this.jahih.y + fota;
         this.window.addChild(this.teni);
         this.qosyfovim = new ValidationIcon();
         this.window.addChild(this.qosyfovim);
         this.qosyfovim.x = this.jahih.x + this.jahih.width - this.qosyfovim.width - 15;
         this.qosyfovim.y = _arg_1 + fota;
      }
      
      private function pycuvajap(_arg_1:int) : void
      {
         this.rologi = new TextArea();
         this.rologi.maxChars = faceg;
         this.rologi.height = 106;
         this.rologi.width = this.window.width - 2 * tigi;
         this.rologi.x = tigi;
         this.rologi.y = _arg_1;
         this.rologi.tf.addEventListener(Event.CHANGE,this.goliqirym);
         this.window.addChild(this.rologi);
         var _local_2:LabelBase = new Jikipus(this.rologi.tf);
         _local_2.text = localeService.getText(TextConst.TEXT_TYPE_MESSAGE_WITH_PRESENT);
         _local_2.x = this.rologi.x + fota;
         _local_2.y = this.rologi.y + fota;
         this.window.addChild(_local_2);
      }
      
      private function vyso(_arg_1:KeyboardEvent) : void
      {
         if(AlertUtils.isConfirmationKey(_arg_1.keyCode))
         {
            _arg_1.stopImmediatePropagation();
            this.til();
         }
      }
      
      private function meh(_arg_1:KeyboardEvent) : void
      {
         if(AlertUtils.isCancelKey(_arg_1.keyCode))
         {
            _arg_1.stopImmediatePropagation();
            this.zucolebeh();
         }
      }
      
      private function pawykojew(_arg_1:Event) : void
      {
         this.isUidValid = false;
         this.sendButton.enable = false;
         this.qosyfovim.startProgress();
         if(this.jahih.value.length > 0)
         {
            this.teni.visible = false;
         }
         clearTimeout(this.wibiqec);
         this.cewonipib();
         this.wibiqec = setTimeout(this.checkUid,tynywesud);
      }
      
      private function goliqirym(_arg_1:Event) : void
      {
         this.cewonipib();
      }
      
      private function tyvofykuc(_arg_1:MouseEvent) : void
      {
         this.til();
      }
      
      private function til() : void
      {
         if(this.qefedat())
         {
            this.destroy();
            dispatchEvent(new SendPresentEvent(SendPresentEvent.SEND_PRESENT,this.uid,this.rologi.text));
         }
      }
      
      private function onCancelClick(_arg_1:MouseEvent) : void
      {
         this.zucolebeh();
      }
      
      private function zucolebeh() : void
      {
         dispatchEvent(new Event(Event.CANCEL));
         this.destroy();
      }
      
      private function destroy() : void
      {
         this.sendButton.removeEventListener(MouseEvent.CLICK,this.tyvofykuc);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.meh);
         this.jahih.removeEventListener(KeyboardEvent.KEY_UP,this.vyso);
         dialogService.removeDialog(this);
      }
      
      private function checkUid() : void
      {
         if(this.jahih.value.length == 0)
         {
            this.qosyfovim.turnOff();
            this.jahih.validValue = true;
         }
         else
         {
            this.uid = this.jahih.value;
            zitafafa.exist(this.uid,this.duvyzo);
         }
      }
      
      private function duvyzo(_arg_1:Boolean) : void
      {
         this.jahih.validValue = _arg_1;
         this.isUidValid = _arg_1;
         if(_arg_1)
         {
            this.qosyfovim.markAsValid();
            this.cewonipib();
         }
         else
         {
            this.qosyfovim.markAsInvalid();
         }
      }
      
      private function cewonipib() : void
      {
         this.sendButton.enable = this.qefedat();
      }
      
      private function qefedat() : Boolean
      {
         return this.isUidValid && this.nolan();
      }
      
      private function nolan() : Boolean
      {
         return this.rologi.text.length > 0;
      }
      
      private function lamifo(_arg_1:Event) : void
      {
         if(this.jahih.value.length == 0)
         {
            this.teni.visible = true;
            this.qosyfovim.turnOff();
            this.jahih.validValue = true;
            this.cewonipib();
         }
      }
   }
}

