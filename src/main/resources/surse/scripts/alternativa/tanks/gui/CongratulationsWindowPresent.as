package alternativa.tanks.gui
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.bonus.showing.detach.BonusDetach;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import alternativa.types.Long;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFormatAlign;
   import forms.TankWindowWithHeader;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import titanomachina.headers.Headers;
   import utils.preview.IImageResource;
   import utils.preview.ImageResourceLoadingWrapper;
   
   public class CongratulationsWindowPresent extends Sprite implements IDestroyWindow, IImageResource
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var dialogsService:IDialogsService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private const windowMargin:int = 12;
      
      private const margin:int = 9;
      
      private const buttonSize:Point = new Point(104,33);
      
      private const space:int = 8;
      
      private const minWidth:int = 300;
      
      private var _loadingImageResourceId:Long;
      
      private var _isInit:Boolean;
      
      private var window:TankWindowWithHeader;
      
      private var inner:TankWindowInner;
      
      private var messageTopLabel:LabelBase;
      
      private var messageBottomLabel:LabelBase;
      
      private var presentBitmap:Bitmap;
      
      private var closeButton:DefaultButtonBase;
      
      private var windowWidth:int = 450;
      
      private var _gameObject:IGameObject;
      
      private var _imageResource:ImageResource;
      
      private var _messageTop:String;
      
      private var _messageBottom:String;
      
      public function CongratulationsWindowPresent(_arg_1:BitmapData, _arg_2:ImageResource, _arg_3:String = "", _arg_4:String = "", _arg_5:IGameObject = null)
      {
         super();
         this._imageResource = _arg_2;
         this._messageTop = _arg_3;
         this._messageBottom = _arg_4;
         this._gameObject = _arg_5;
         if(_arg_1 != null)
         {
            this.init(_arg_1);
         }
         else if(_arg_2.isLazy && !_arg_2.isLoaded)
         {
            this._loadingImageResourceId = _arg_2.id;
            _arg_2.loadLazyResource(new ImageResourceLoadingWrapper(this));
         }
         else
         {
            this.init(_arg_2.data);
         }
      }
      
      private function init(_arg_1:BitmapData) : void
      {
         this._isInit = true;
         this.presentBitmap = new Bitmap(_arg_1);
         this.windowWidth = Math.max(this.presentBitmap.width + this.windowMargin * 2 + this.margin * 2,this.minWidth);
         this.window = new TankWindowWithHeader(Headers.getHeaderById("CONGRATULATIONS"));
         this.window.width = this.windowWidth;
         this.window.height = this.presentBitmap.height;
         addChild(this.window);
         this.inner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         addChild(this.inner);
         this.inner.x = this.windowMargin;
         this.inner.y = this.windowMargin;
         if(this._messageTop != null && this._messageTop != "")
         {
            this.messageTopLabel = new LabelBase();
            this.messageTopLabel.align = TextFormatAlign.CENTER;
            this.messageTopLabel.wordWrap = true;
            this.messageTopLabel.multiline = true;
            this.messageTopLabel.size = 12;
            this.messageTopLabel.htmlText = this._messageTop;
            this.messageTopLabel.color = 5898034;
            this.messageTopLabel.x = this.windowMargin * 2;
            this.messageTopLabel.y = this.windowMargin * 2;
            this.messageTopLabel.width = this.windowWidth - this.windowMargin * 4;
            addChild(this.messageTopLabel);
            if(this.messageTopLabel.numLines > 2)
            {
               this.messageTopLabel.align = TextFormatAlign.LEFT;
               this.messageTopLabel.htmlText = this._messageTop;
               this.messageTopLabel.width = this.windowWidth - this.windowMargin * 4;
            }
         }
         this.presentBitmap.x = this.windowWidth - this.presentBitmap.width >> 1;
         this.presentBitmap.y = this.messageTopLabel != null ? Number(this.messageTopLabel.y + this.messageTopLabel.height + this.margin) : Number(this.windowMargin * 2);
         addChild(this.presentBitmap);
         if(this._messageBottom != null && this._messageBottom != "")
         {
            this.messageBottomLabel = new LabelBase();
            this.messageBottomLabel.align = TextFormatAlign.CENTER;
            this.messageBottomLabel.wordWrap = true;
            this.messageBottomLabel.multiline = true;
            this.messageBottomLabel.size = 12;
            this.messageBottomLabel.color = 5898034;
            this.messageBottomLabel.htmlText = this._messageBottom;
            this.messageBottomLabel.x = this.windowMargin * 2;
            this.messageBottomLabel.y = this.presentBitmap.y + this.presentBitmap.height + this.margin;
            this.messageBottomLabel.width = this.windowWidth - this.windowMargin * 4;
            addChild(this.messageBottomLabel);
            if(this.messageBottomLabel.numLines > 2)
            {
               this.messageTopLabel.align = TextFormatAlign.LEFT;
               this.messageBottomLabel.htmlText = this._messageBottom;
               this.messageBottomLabel.width = this.windowWidth - this.windowMargin * 4;
            }
         }
         this.closeButton = new DefaultButtonBase();
         addChild(this.closeButton);
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         var _local_2:int = this.presentBitmap.height + this.closeButton.height + this.margin * 2 + this.windowMargin * 3;
         if(this.messageTopLabel != null)
         {
            _local_2 += this.messageTopLabel.height + this.margin;
         }
         if(this.messageBottomLabel != null)
         {
            _local_2 += this.messageBottomLabel.height + this.margin;
         }
         this.window.height = _local_2;
         this.closeButton.y = this.window.height - this.margin - 35;
         this.closeButton.x = this.window.width - this.closeButton.width >> 1;
         this.inner.width = this.window.width - this.windowMargin * 2;
         this.inner.height = this.window.height - this.windowMargin - this.margin * 2 - this.buttonSize.y + 2;
         this.closeButton.addEventListener(MouseEvent.CLICK,this.closeBonusWindow);
         this.alignBonusWindow();
         display.stage.addEventListener(Event.RESIZE,this.alignBonusWindow);
         dialogsService.dizeza(this);
      }
      
      public function setPreviewResource(_arg_1:ImageResource) : void
      {
         if(this._loadingImageResourceId == _arg_1.id)
         {
            this.init(_arg_1.data);
         }
      }
      
      private function alignBonusWindow(_arg_1:Event = null) : void
      {
         this.x = Math.round((display.stage.stageWidth - this.width) * 0.5);
         this.y = Math.round((display.stage.stageHeight - this.height) * 0.5);
      }
      
      private function closeBonusWindow(_arg_1:MouseEvent = null) : void
      {
         this.destroy();
      }
      
      public function destroy() : void
      {
         var _local_1:BonusDetach = null;
         if(this._isInit)
         {
            this._isInit = false;
            this.closeButton.removeEventListener(MouseEvent.CLICK,this.closeBonusWindow);
            display.stage.removeEventListener(Event.RESIZE,this.alignBonusWindow);
            dialogsService.removeDialog(this);
            if(this._gameObject != null)
            {
               _local_1 = new BonusDetach(this._gameObject);
               _local_1.detach();
               this._gameObject = null;
            }
            this._loadingImageResourceId = null;
         }
      }
   }
}

