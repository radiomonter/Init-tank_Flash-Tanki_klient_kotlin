package projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.loader.Genejawy;
   import alternativa.tanks.loader.ILoaderWindowService;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import platform.client.fp10.core.network.connection.ConnectionCloseStatus;
   import platform.client.fp10.core.network.handler.OnConnectionClosedServiceListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.DialogWindowsDispatcherServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   
   public class DialogsService implements IDialogsService, OnConnectionClosedServiceListener
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var loaderWindowService:ILoaderWindowService;
      
      private var dialogs:Vector.<DialogWindow> = new Vector.<DialogWindow>();
      
      private var queue:Vector.<DialogWindow> = new Vector.<DialogWindow>();
      
      public function DialogsService()
      {
         super();
      }
      
      private static function center(_arg_1:DisplayObject) : void
      {
         _arg_1.x = display.stage.stageWidth - _arg_1.width >> 1;
         _arg_1.y = display.stage.stageHeight - _arg_1.height >> 1;
      }
      
      public function addDialog(_arg_1:DialogWindow) : void
      {
         if(this.dialogs.indexOf(_arg_1) > -1)
         {
            return;
         }
         this.dialogs.unshift(_arg_1);
         if(this.dialogs.length > 1)
         {
            this.hideDialog(this.dialogs[1],false);
         }
         this.showDialog(_arg_1,this.dialogs.length == 1);
         if(this.dialogs.length == 1)
         {
            display.stage.addEventListener(Event.RESIZE,this.onResize,false,-1);
         }
      }
      
      public function centerDialog(_arg_1:DialogWindow) : void
      {
         center(_arg_1);
      }
      
      public function enqueueDialog(_arg_1:DialogWindow) : void
      {
         if(loaderWindowService.zare())
         {
            this.queue.unshift(_arg_1);
            loaderWindowService.addEventListener(Genejawy.tifu,this.cyce);
            return;
         }
         if(this.dialogs.length == 0)
         {
            this.addDialog(_arg_1);
         }
         else
         {
            this.queue.unshift(_arg_1);
         }
      }
      
      private function cyce(_arg_1:Genejawy) : void
      {
         if(this.queue.length > 0)
         {
            this.addDialog(this.queue.pop());
            loaderWindowService.removeEventListener(Genejawy.tifu,this.cyce);
         }
      }
      
      public function removeDialog(_arg_1:DialogWindow) : void
      {
         var _local_2:int = this.dialogs.indexOf(_arg_1);
         if(_local_2 < 0)
         {
            return;
         }
         this.dialogs.splice(this.dialogs.indexOf(_arg_1),1);
         if(this.dialogs.length == 0 && this.queue.length > 0)
         {
            this.dialogs.push(this.queue.pop());
         }
         this.hideDialog(_arg_1,this.dialogs.length == 0);
         if(this.dialogs.length > 0)
         {
            this.showDialog(this.dialogs[0],false);
         }
         else
         {
            display.stage.removeEventListener(Event.RESIZE,this.onResize);
         }
      }
      
      private function showDialog(_arg_1:DialogWindow, _arg_2:Boolean) : void
      {
         if(_arg_2)
         {
            blurService.blurGameContent();
         }
         center(_arg_1);
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.FORCIBLY_CLOSE,this.onForciblyCloseDialogs);
         dialogWindowsDispatcherService.open();
         this.dialogsLayer.addChild(_arg_1);
         _arg_1.setEventListeners();
      }
      
      private function hideDialog(_arg_1:DialogWindow, _arg_2:Boolean) : void
      {
         if(this.dialogsLayer.contains(_arg_1))
         {
            _arg_1.removeEventListeners();
            this.dialogsLayer.removeChild(_arg_1);
            dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.FORCIBLY_CLOSE,this.onForciblyCloseDialogs);
            dialogWindowsDispatcherService.close();
         }
         if(_arg_2)
         {
            blurService.unblurGameContent();
         }
      }
      
      private function onResize(_arg_1:Event) : void
      {
         if(this.dialogs.length > 0)
         {
            center(this.dialogs[0]);
         }
      }
      
      private function onForciblyCloseDialogs(_arg_1:DialogWindowsDispatcherServiceEvent) : void
      {
         var _local_2:DialogWindow = null;
         for each(_local_2 in this.dialogs.concat())
         {
            _local_2.forciblyClose();
         }
      }
      
      private function get dialogsLayer() : DisplayObjectContainer
      {
         return display.dialogsLayer;
      }
      
      public function onConnectionClosed(_arg_1:ConnectionCloseStatus) : void
      {
         if(this.dialogs.length > 0)
         {
            this.hideDialog(this.dialogs[0],true);
            display.stage.removeEventListener(Event.RESIZE,this.onResize);
         }
         this.dialogs.length = 0;
         this.queue.length = 0;
      }
   }
}

