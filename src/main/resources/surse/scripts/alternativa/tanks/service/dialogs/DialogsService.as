package alternativa.tanks.service.dialogs
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.blur.IBlurService;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   
   public class DialogsService implements IDialogsService
   {
      
      [Inject]
      public static var display:IDisplay = IDisplay(OSGi.getInstance().getService(IDisplay));
      
      [Inject]
      public static var blurService:IBlurService = IBlurService(OSGi.getInstance().getService(IBlurService));
      
      private var dialogs:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      private var queue:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      private var dialogsLayer:DisplayObjectContainer;
      
      public function DialogsService()
      {
         super();
         this.dialogsLayer = display.dialogsLayer;
      }
      
      public function addDialog(_arg_1:DisplayObject) : void
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
            display.stage.addEventListener(Event.RESIZE,this.onResize);
         }
      }
      
      public function dizeza(_arg_1:DisplayObject) : void
      {
         if(this.dialogs.length == 0)
         {
            this.addDialog(_arg_1);
         }
         else
         {
            this.queue.unshift(_arg_1);
         }
      }
      
      public function removeDialog(_arg_1:DisplayObject) : void
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
      
      private function showDialog(_arg_1:DisplayObject, _arg_2:Boolean) : void
      {
         if(_arg_2)
         {
            blurService.blur();
         }
         this.center(_arg_1);
         IDialogWindowsDispatcherService(OSGi.getInstance().getService(IDialogWindowsDispatcherService)).open();
         this.dialogsLayer.addChild(_arg_1);
      }
      
      private function hideDialog(_arg_1:DisplayObject, _arg_2:Boolean) : void
      {
         if(this.dialogsLayer.contains(_arg_1))
         {
            IDialogWindowsDispatcherService(OSGi.getInstance().getService(IDialogWindowsDispatcherService)).close();
            this.dialogsLayer.removeChild(_arg_1);
         }
         if(_arg_2)
         {
            blurService.unblur();
         }
      }
      
      private function onResize(_arg_1:Event) : void
      {
         if(this.dialogs.length > 0)
         {
            this.center(this.dialogs[0]);
         }
      }
      
      private function center(_arg_1:DisplayObject) : void
      {
         _arg_1.x = int((display.stage.stageWidth - _arg_1.width) * 0.5);
         _arg_1.y = int((display.stage.stageHeight - _arg_1.height) * 0.5);
      }
   }
}

