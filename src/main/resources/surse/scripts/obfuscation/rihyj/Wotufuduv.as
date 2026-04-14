package obfuscation.rihyj
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.utils.removeDisplayObject;
   import controls.TankWindow;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.AlertUtils;
   import services.alertservice.AlertAnswer;
   
   public class Wotufuduv extends DialogWindow
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const gyvoro:String = "{time}";
      
      private static const minufe:int = 25;
      
      private static const kakebomes:int = 6;
      
      private static const gaji:int = 15;
      
      private var tucuky:TankWindow;
      
      private var gewydup:DefaultButtonBase;
      
      private var nuti:DefaultButtonBase;
      
      private var zob:LabelBase;
      
      private var lodebapor:LabelBase;
      
      private var _seconds:int;
      
      private var bacukave:String;
      
      public function Wotufuduv()
      {
         super();
         this.bacukave = localeService.getText(TanksLocale.TEXT_REARM_PAUSE_ALERT);
         this.tucuky = new TankWindow();
         addChild(this.tucuky);
         this.zob = this.createLabel();
         this.lodebapor = this.createLabel();
         this.gewydup = new DefaultButtonBase();
         this.gewydup.label = AlertAnswer.YES;
         addChild(this.gewydup);
         this.nuti = new DefaultButtonBase();
         this.nuti.label = AlertAnswer.NO;
         addChild(this.nuti);
         this.resize();
      }
      
      private function createLabel() : LabelBase
      {
         var _local_1:LabelBase = null;
         _local_1 = new LabelBase();
         _local_1.y = minufe;
         _local_1.autoSize = TextFieldAutoSize.LEFT;
         _local_1.size = 14;
         _local_1.width = 10;
         _local_1.height = 10;
         _local_1.multiline = true;
         addChild(_local_1);
         return _local_1;
      }
      
      public function set seconds(_arg_1:int) : void
      {
         if(this._seconds == _arg_1)
         {
            return;
         }
         this._seconds = _arg_1;
         var _local_2:int = int(this._seconds / 60);
         this._seconds -= _local_2 * 60;
         var _local_3:String = this._seconds < 10 ? "0" + this._seconds : this._seconds.toString();
         var _local_4:Array = this.bacukave.replace(gyvoro,_local_2 + ":" + _local_3).split("\n");
         this.zob.text = _local_4[0];
         this.lodebapor.text = _local_4[1];
      }
      
      public function show() : void
      {
         blurService.blurAllContent();
         this.resize();
         display.stage.addChild(this);
         display.stage.focus = this;
         this.setEvents();
      }
      
      private function resize() : void
      {
         var _local_1:int = Math.max(this.zob.width + 2 * minufe,this.lodebapor.width + 2 * minufe);
         this.tucuky.width = Math.max(_local_1,this.nuti.width + this.gewydup.width + kakebomes + 2 * minufe);
         this.tucuky.x = -int(this.tucuky.width / 2);
         this.zob.x = -int(this.zob.width / 2);
         this.lodebapor.x = -int(this.lodebapor.width / 2);
         this.lodebapor.y = this.zob.y + this.zob.height;
         this.gewydup.y = this.lodebapor.y + this.lodebapor.height + gaji;
         this.nuti.y = this.lodebapor.y + this.lodebapor.height + gaji;
         this.gewydup.x = -this.gewydup.width - kakebomes / 2;
         this.nuti.x = kakebomes / 2;
         this.tucuky.height = this.nuti.y + this.nuti.height + minufe;
         this.x = display.stage.stageWidth >> 1;
         this.y = display.stage.stageHeight - this.height >> 1;
      }
      
      private function setEvents() : void
      {
         this.gewydup.addEventListener(MouseEvent.CLICK,this.zykorekih);
         this.nuti.addEventListener(MouseEvent.CLICK,this.bujo);
         display.stage.addEventListener(Event.RESIZE,this.onStageResize);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.nur);
      }
      
      private function bujo(_arg_1:MouseEvent = null) : void
      {
         dispatchEvent(new NotificationEndsPausedAlertEvent(NotificationEndsPausedAlertEvent.CLOSE_ALERT));
      }
      
      private function zykorekih(_arg_1:MouseEvent = null) : void
      {
         dispatchEvent(new NotificationEndsPausedAlertEvent(NotificationEndsPausedAlertEvent.RETURN_TO_BATTLE));
      }
      
      private function onStageResize(_arg_1:Event) : void
      {
         this.resize();
      }
      
      private function nur(_arg_1:KeyboardEvent) : void
      {
         if(AlertUtils.isCancelKey(_arg_1.keyCode))
         {
            _arg_1.stopImmediatePropagation();
            this.bujo();
         }
         if(AlertUtils.isConfirmationKey(_arg_1.keyCode))
         {
            _arg_1.stopImmediatePropagation();
            this.zykorekih();
         }
      }
      
      public function destroy() : void
      {
         this.removeEvents();
         blurService.unblurAllContent();
         removeDisplayObject(this);
         this.tucuky = null;
         this.gewydup = null;
         this.nuti = null;
         this.zob = null;
         this.lodebapor = null;
      }
      
      private function removeEvents() : void
      {
         this.gewydup.removeEventListener(MouseEvent.CLICK,this.zykorekih);
         this.nuti.removeEventListener(MouseEvent.CLICK,this.bujo);
         display.stage.removeEventListener(Event.RESIZE,this.onStageResize);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.nur);
      }
   }
}

