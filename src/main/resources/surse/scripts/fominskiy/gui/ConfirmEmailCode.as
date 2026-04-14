package fominskiy.gui
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.blur.IBlurService;
   import controls.DefaultButton;
   import controls.TankWindow;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class ConfirmEmailCode extends DialogWindow
   {
      
      private var text:String;
      
      private var callback:Function;
      
      private var window:TankWindow = new TankWindow();
      
      private var textLabel:LabelBase = new LabelBase();
      
      private var codeInput:TankInputBase = new TankInputBase();
      
      private var confirmButton:DefaultButton = new DefaultButton();
      
      private var bg:Sprite = new Sprite();
      
      private var bmp:Bitmap = new Bitmap();
      
      public function ConfirmEmailCode(_arg_1:String, _arg_2:Function)
      {
         super();
         this.text = _arg_1;
         this.callback = _arg_2;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function draw() : void
      {
         addChild(this.window);
         this.window.width = 400;
         this.window.height = 115;
         this.window.addChild(this.textLabel);
         this.textLabel.text = this.text;
         this.textLabel.x = 15;
         this.textLabel.y = 15;
         this.window.addChild(this.codeInput);
         this.codeInput.maxChars = 32;
         this.codeInput.x = 15;
         this.codeInput.y = 35;
         this.codeInput.width = this.window.width - 30;
         this.window.addChild(this.confirmButton);
         this.confirmButton.label = "OK";
         this.confirmButton.x = this.window.width - this.confirmButton.width - 15;
         this.confirmButton.y = 35 * 2;
         this.confirmButton.addEventListener(MouseEvent.CLICK,this.onClickButton);
         IDialogsService(OSGi.getInstance().getService(IDialogsService)).addDialog(this);
      }
      
      private function onClickButton(_arg_1:Event) : void
      {
         var _local_2:String = null;
         _local_2 = this.codeInput.value;
         if(_local_2 == null || _local_2.length != 32 || _local_2.length > 32)
         {
            this.codeInput.validValue = false;
            return;
         }
         this.codeInput.validValue = true;
         this.callback.call(null,_local_2);
         IBlurService(OSGi.getInstance().getService(IBlurService)).unblur();
         this.confirmButton.removeEventListener(MouseEvent.CLICK,this.onClickButton);
         IDialogsService(OSGi.getInstance().getService(IDialogsService)).removeDialog(this);
      }
      
      private function onAddedToStage(_arg_1:Event) : void
      {
         this.draw();
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
   }
}

