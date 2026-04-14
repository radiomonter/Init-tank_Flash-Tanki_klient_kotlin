package alternativa.tanks.gui
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.bonus.showing.detach.BonusDetach;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import controls.TankWindow;
   import controls.TankWindowHeader;
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
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class CongratulationsWindowConfiscate extends Sprite implements IDestroyWindow
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var dialogsService:IDialogsService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private const windowMargin:int = 12;
      
      private const margin:int = 9;
      
      private const buttonSize:Point;
      
      private const space:int = 8;
      
      private const minWidth:int = 300;
      
      private var _gameObject:IGameObject;
      
      private var closeButton:DefaultButtonBase;
      
      public function CongratulationsWindowConfiscate(_arg_1:IGameObject, _arg_2:BitmapData, _arg_3:BitmapData, _arg_4:String = "", _arg_5:String = "", _arg_6:int = 0)
      {
         var _local_9:Bitmap = null;
         var _local_10:Bitmap = null;
         var _local_11:int = 0;
         var _local_12:TankWindow = null;
         var _local_13:TankWindowInner = null;
         var _local_7:LabelBase = null;
         var _local_8:LabelBase = null;
         this.buttonSize = new Point(104,33);
         super();
         this._gameObject = _arg_1;
         _local_9 = new Bitmap(_arg_2);
         _local_10 = new Bitmap(_arg_3);
         _local_11 = Math.max(_local_10.width + this.windowMargin * 2 + this.margin * 2,_local_9.width + this.windowMargin * 2 + this.margin * 2,this.minWidth);
         _local_12 = new TankWindow(_local_11,_local_9.height);
         addChild(_local_12);
         _local_12.headerLang = localeService.getText(TanksLocale.TEXT_GUI_LANG);
         _local_12.header = TankWindowHeader.ATTANTION;
         _local_13 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         addChild(_local_13);
         _local_13.x = this.windowMargin;
         _local_13.y = this.windowMargin;
         _local_10.x = _local_11 - _local_10.width >> 1;
         _local_10.y = this.windowMargin * 2 - 7;
         addChild(_local_10);
         if(_arg_4 != null && _arg_4 != "")
         {
            _local_7 = new LabelBase();
            _local_7.align = TextFormatAlign.CENTER;
            _local_7.wordWrap = true;
            _local_7.multiline = true;
            _local_7.size = 13;
            _local_7.htmlText = _arg_4;
            _local_7.color = 5898034;
            _local_7.x = this.windowMargin * 2;
            _local_7.y = _local_10.y + _local_10.height + this.margin - 28;
            _local_7.width = _local_11 - this.windowMargin * 4;
            addChild(_local_7);
         }
         _local_9.x = _local_11 - _local_9.width >> 1;
         _local_9.y = _local_7.y + _local_7.height + this.margin - 5;
         addChild(_local_9);
         if(_arg_5 != null && _arg_5 != "")
         {
            _local_8 = new LabelBase();
            _local_8.align = TextFormatAlign.CENTER;
            _local_8.wordWrap = true;
            _local_8.multiline = true;
            _local_8.size = 12;
            _local_8.color = 5898034;
            _local_8.htmlText = String(_arg_5.split("\n")[0]);
            _local_8.x = this.windowMargin * 2;
            _local_8.y = _local_9.y + _local_9.height + this.margin - 17;
            _local_8.width = _local_11 - this.windowMargin * 4;
            addChild(_local_8);
         }
         this.closeButton = new DefaultButtonBase();
         addChild(this.closeButton);
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         var _local_14:int = _local_10.height + _local_9.height + this.closeButton.height + this.margin * 3 + this.windowMargin * 3;
         if(_local_7 != null)
         {
            _local_14 += _local_7.height + this.margin;
         }
         if(_local_8 != null)
         {
            _local_14 += _local_8.height + this.margin;
         }
         _local_12.height = _local_14 - 5 - 28 - 7 - 17;
         this.closeButton.y = _local_12.height - this.margin - 35;
         this.closeButton.x = _local_12.width - this.closeButton.width >> 1;
         _local_13.width = _local_12.width - this.windowMargin * 2;
         _local_13.height = _local_12.height - this.windowMargin - this.margin * 2 - this.buttonSize.y + 2;
         this.closeButton.addEventListener(MouseEvent.CLICK,this.closeBonusWindow);
         this.alignBonusWindow();
         display.stage.addEventListener(Event.RESIZE,this.alignBonusWindow);
         dialogsService.dizeza(this);
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
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.closeBonusWindow);
         display.stage.removeEventListener(Event.RESIZE,this.alignBonusWindow);
         dialogsService.removeDialog(this);
         if(this._gameObject != null)
         {
            _local_1 = new BonusDetach(this._gameObject);
            _local_1.detach();
            this._gameObject = null;
         }
      }
   }
}

