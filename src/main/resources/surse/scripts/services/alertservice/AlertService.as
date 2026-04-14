package services.alertservice
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import flash.display.Sprite;
   import flash.events.EventDispatcher;
   import forms.events.AlertEvent;
   import platform.client.fp10.core.network.connection.ConnectionCloseStatus;
   import platform.client.fp10.core.network.handler.OnConnectionClosedServiceListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.DialogWindowsDispatcherServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.removeDisplayObject;
   
   public class AlertService extends EventDispatcher implements IAlertService, OnConnectionClosedServiceListener
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      private var _alert:Alert;
      
      private var _queue:Vector.<Alert>;
      
      public function AlertService()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this._alert = new Alert();
         this._alert = null;
         this._queue = new Vector.<Alert>();
      }
      
      public function showAlert(_arg_1:String, _arg_2:Vector.<String>) : void
      {
         var _local_3:Alert = null;
         if(this.isClose())
         {
            this._alert = new Alert();
            this._alert.showAlert(_arg_1,_arg_2);
            this.addAlert();
         }
         else
         {
            _local_3 = new Alert();
            _local_3.showAlert(_arg_1,_arg_2);
            this._queue.push(_local_3);
         }
      }
      
      public function hiby(_arg_1:String, _arg_2:Vector.<String>, _arg_3:Vector.<Sprite>) : void
      {
         var _local_4:Alert = null;
         if(this.isClose())
         {
            this._alert = new Alert();
            this._alert.hiby(_arg_1,_arg_2,_arg_3);
            this.addAlert();
         }
         else
         {
            _local_4 = new Alert();
            _local_4.hiby(_arg_1,_arg_2,_arg_3);
            this._queue.push(_local_4);
         }
      }
      
      public function showOkAlert(_arg_1:String) : void
      {
         this.showAlert(_arg_1,Vector.<String>([localeService.getText(AlertAnswer.OK)]));
      }
      
      private function addAlert() : void
      {
         dialogWindowsDispatcherService.open();
         blurService.blurDialogContent();
         display.noticesLayer.addChild(this._alert);
         this._alert.addEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.onAlertButtonPressed);
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.FORCIBLY_CLOSE,this.onForciblyCloseDialogs);
      }
      
      public function showAlertById(_arg_1:int) : void
      {
         if(this.isClose())
         {
            this._alert = new Alert(_arg_1);
            this.addAlert();
         }
         else
         {
            this._queue.push(new Alert(_arg_1));
         }
      }
      
      private function onAlertButtonPressed(_arg_1:AlertEvent) : void
      {
         this.removeAlert();
         dispatchEvent(new AlertServiceEvent(AlertServiceEvent.ALERT_BUTTON_PRESSED,_arg_1.typeButton));
      }
      
      private function removeAlert() : void
      {
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.FORCIBLY_CLOSE,this.onForciblyCloseDialogs);
         this._alert.removeEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.onAlertButtonPressed);
         this._alert = null;
         if(this._queue.length > 0)
         {
            this._alert = this._queue.shift();
            this.addAlert();
         }
         else
         {
            dialogWindowsDispatcherService.close();
            blurService.unblurDialogContent();
         }
      }
      
      private function onForciblyCloseDialogs(_arg_1:DialogWindowsDispatcherServiceEvent) : void
      {
         this._alert.bah();
      }
      
      public function onConnectionClosed(_arg_1:ConnectionCloseStatus) : void
      {
         this._queue.length = 0;
         if(Boolean(this._alert))
         {
            removeDisplayObject(this._alert);
            this.removeAlert();
         }
      }
      
      private function isClose() : Boolean
      {
         return this._alert == null;
      }
   }
}

