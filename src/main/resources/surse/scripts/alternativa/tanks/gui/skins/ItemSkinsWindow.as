package alternativa.tanks.gui.skins
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.item.skins.AvailableSkins;
   import controls.base.DefaultButtonBase;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.ColorConstants;
   import forms.base.BaseFormWithInner;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import utils.ScrollStyleUtils;
   
   public class ItemSkinsWindow extends DialogWindow
   {
      
      [Inject]
      public static var localeService:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
      
      [Inject]
      public static var dialogService:IDialogsService = IDialogsService(OSGi.getInstance().getService(IDialogsService));
      
      private static const WINDOW_WIDTH:int = 509;
      
      private static const WINDOW_HEIGHT:int = 450;
      
      private static const VERTICAL_MARGIN:int = 8;
      
      private static const HORIZONTAL_MARGIN:int = 12;
      
      private static const MIN_DEVICE_PANEL_HEIGHT:int = 110;
      
      private var baseForm:BaseFormWithInner = new BaseFormWithInner(WINDOW_WIDTH,WINDOW_HEIGHT,24);
      
      private var scrollContainer:Sprite = new Sprite();
      
      private var scrollPane:ScrollPane = new ScrollPane();
      
      private var closeButton:DefaultButtonBase = new DefaultButtonBase();
      
      private var descriptions:Vector.<SkinDescription> = new Vector.<SkinDescription>();
      
      private var scrollPaneBottomPadding:Sprite = new Sprite();
      
      private var item:IGameObject;
      
      private var onCloseCallback:Function;
      
      public function ItemSkinsWindow(_arg_1:IGameObject, _arg_2:Function)
      {
         super();
         this.item = _arg_1;
         this.onCloseCallback = _arg_2;
         this.addWindow();
         this.addScrollPane();
         this.addCloseButton();
         this.addSkinsPanel();
         this.scrollPane.update();
         dialogService.addDialog(this);
         this.updateAll(null);
      }
      
      private function addWindow() : void
      {
         this.baseForm.inner.showBlink = false;
         this.baseForm.window.setHeaderId("SYSTEM_MESSAGE");
         this.baseForm.setHeight(WINDOW_HEIGHT);
         addChild(this.baseForm);
      }
      
      private function addScrollPane() : void
      {
         this.scrollPane.y = 10;
         ScrollStyleUtils.setGreenStyle(this.scrollPane);
         this.scrollPane.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.scrollPane.verticalScrollPolicy = ScrollPolicy.AUTO;
         this.scrollPane.source = this.scrollContainer;
         this.scrollPane.focusEnabled = false;
         this.scrollPane.setSize(WINDOW_WIDTH,WINDOW_HEIGHT - 20);
         this.baseForm.inner.addChild(this.scrollPane);
      }
      
      private function addCloseButton() : void
      {
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_CLOSE_TEXT);
         this.closeButton.addEventListener(MouseEvent.CLICK,this.onMouseClick);
         this.baseForm.window.addChild(this.closeButton);
      }
      
      private function addSkinsPanel() : void
      {
         var _local_4:Number = NaN;
         var _local_3:int = 0;
         var _local_1:Vector.<Object> = AvailableSkins(this.item.adapt(AvailableSkins)).getSkins();
         var _local_2:int = 6;
         _local_2 += Math.max(this.createSkinDescription(this.item,_local_2).height,MIN_DEVICE_PANEL_HEIGHT) + 12;
         while(_local_3 < _local_1.length)
         {
            _local_4 = this.createSkinDescription(_local_1[_local_3],_local_2).height;
            _local_2 += Math.max(_local_4,MIN_DEVICE_PANEL_HEIGHT);
            _local_2 += 12;
            _local_3++;
         }
         this.fitToContent(_local_2);
      }
      
      private function fitToContent(_arg_1:int) : void
      {
         this.baseForm.setHeight(Math.min(_arg_1 + 12,WINDOW_HEIGHT));
         this.fixScrollPaneBottomPadding(_arg_1);
         this.alignCloseButton();
         dialogService.centerDialog(this);
      }
      
      private function fixScrollPaneBottomPadding(_arg_1:int) : void
      {
         this.scrollPaneBottomPadding = new Sprite();
         this.scrollContainer.addChild(this.scrollPaneBottomPadding);
         this.scrollPaneBottomPadding.graphics.lineStyle(1,ColorConstants.WHITE,0);
         this.scrollPaneBottomPadding.graphics.beginFill(ColorConstants.WHITE,0);
         this.scrollPaneBottomPadding.graphics.drawRect(0,0,1,15);
         this.scrollPaneBottomPadding.graphics.endFill();
         this.scrollPaneBottomPadding.x = 0;
         this.scrollPaneBottomPadding.y = _arg_1;
      }
      
      private function createSkinDescription(_arg_1:Object, _arg_2:int) : SkinDescription
      {
         var _local_3:SkinDescription = new SkinDescription(this.item,_arg_1);
         _local_3.y = _arg_2;
         this.scrollContainer.addChild(_local_3);
         this.descriptions.push(_local_3);
         _local_3.addEventListener(Event.CHANGE,this.updateAll);
         return _local_3;
      }
      
      private function updateAll(_arg_1:Event) : void
      {
         var _local_2:SkinDescription = null;
         for each(_local_2 in this.descriptions)
         {
            _local_2.update();
         }
         if(_arg_1 != null)
         {
            dispatchEvent(_arg_1);
         }
      }
      
      private function alignCloseButton() : void
      {
         this.closeButton.y = this.baseForm.window.height - 5 - this.closeButton.height - VERTICAL_MARGIN;
         this.closeButton.x = this.baseForm.window.width - this.closeButton.width - HORIZONTAL_MARGIN;
      }
      
      private function onMouseClick(_arg_1:MouseEvent) : void
      {
         this.close();
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.close();
      }
      
      public function close() : void
      {
         var _local_1:SkinDescription = null;
         this.removeEvents();
         for each(_local_1 in this.descriptions)
         {
            _local_1.destroy();
         }
         dialogService.removeDialog(this);
         this.onCloseCallback();
      }
      
      protected function removeEvents() : void
      {
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.onMouseClick);
      }
      
      override public function get width() : Number
      {
         return this.baseForm.window.width;
      }
      
      override public function get height() : Number
      {
         return this.baseForm.window.height;
      }
   }
}

