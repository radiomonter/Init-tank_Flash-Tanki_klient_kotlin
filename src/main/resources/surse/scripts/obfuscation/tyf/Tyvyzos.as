package obfuscation.tyf
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.utils.removeDisplayObject;
   import controls.base.LabelBase;
   import controls.statassets.BlackRoundRect;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.text.TextFieldAutoSize;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Tyvyzos extends BlackRoundRect
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var tykih:BattleGUIService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const bilitohez:Class = Nabik;
      
      private static const gyvoro:String = "{time}";
      
      private var mevyqav:LabelBase;
      
      private var fedyma:String;
      
      private var _seconds:int;
      
      private var _isShow:Boolean;
      
      public function Tyvyzos()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         var _local_6:Bitmap = null;
         var _local_1:int = 0;
         this.fedyma = localeService.getText(TanksLocale.TEXT_REARM_SELFDISTRUCTION);
         var _local_2:int = 33;
         var _local_3:int = 33;
         var _local_4:int = 5;
         var _local_5:int = 16;
         _local_6 = new Bitmap(new bilitohez().bitmapData);
         addChild(_local_6);
         _local_6.y = _local_2 - 5;
         _local_1 = _local_6.y + _local_6.height + 2 * _local_4;
         this.mevyqav = new LabelBase();
         this.mevyqav.size = _local_5;
         this.mevyqav.autoSize = TextFieldAutoSize.LEFT;
         this.mevyqav.text = this.fedyma.replace(gyvoro," 99:99");
         this.mevyqav.y = _local_1;
         addChild(this.mevyqav);
         if(width < this.mevyqav.textWidth)
         {
            width = this.mevyqav.textWidth;
         }
         width += 2 * _local_3;
         _local_6.x = width - _local_6.width >> 1;
         height = _local_1 + this.mevyqav.height + _local_2 - 5;
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
         this.mevyqav.text = this.fedyma.replace(gyvoro,_local_2 + ":" + _local_3);
         this.mevyqav.x = width - this.mevyqav.width >> 1;
      }
      
      public function show(_arg_1:int) : void
      {
         if(this._isShow)
         {
            return;
         }
         this._isShow = true;
         this.seconds = _arg_1;
         tykih.qocuwo().addChild(this);
         this.onResize();
         display.stage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onResize(_arg_1:Event = null) : void
      {
         this.x = display.stage.stageWidth - this.width >> 1;
         this.y = display.stage.stageHeight - this.height >> 1;
      }
      
      public function hide() : void
      {
         if(!this._isShow)
         {
            return;
         }
         this._isShow = false;
         removeDisplayObject(this);
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      public function destroy() : void
      {
         this.hide();
         this.mevyqav = null;
      }
   }
}

