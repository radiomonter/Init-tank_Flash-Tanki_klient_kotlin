package alternativa.tanks.models.battle.gui.indicators
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.utils.removeDisplayObject;
   import controls.Label;
   import controls.statassets.BlackRoundRect;
   import flash.display.Bitmap;
   import flash.events.Event;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class TurnOverIndicator extends BlackRoundRect
   {
      
      [Inject]
      public static var display:IDisplay = IDisplay(OSGi.getInstance().getService(IDisplay));
      
      [Inject]
      public static var battleGUIService:BattleGUIService = BattleGUIService(OSGi.getInstance().getService(BattleGUIService));
      
      [Inject]
      public static var localeService:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
      
      private static const turnOverIconClass:Class = TurnOverIndicator_turnOverIconClass;
      
      private var _show:Boolean;
      
      public function TurnOverIndicator()
      {
         var _local_8:int = 0;
         var _local_10:Label = null;
         var _local_5:int = 0;
         var _local_6:int = 0;
         var _local_7:Bitmap = null;
         super();
         var _local_1:String = localeService.getText(TanksLocale.TEXT_TURNOVER_HINT_1);
         var _local_2:String = localeService.getText(TanksLocale.TEXT_TURNOVER_HINT_2);
         var _local_3:int = 30;
         var _local_4:int = 30;
         _local_5 = 5;
         _local_6 = 16;
         _local_7 = new Bitmap(new turnOverIconClass().bitmapData);
         addChild(_local_7);
         _local_7.y = _local_3;
         _local_8 = _local_7.y + _local_7.height + 2 * _local_5;
         var _local_9:Label = new Label();
         _local_9.size = _local_6;
         _local_9.text = _local_1;
         _local_9.y = _local_8;
         addChild(_local_9);
         width = _local_9.textWidth;
         _local_8 += _local_9.height + _local_5;
         _local_10 = new Label();
         _local_10.size = _local_6;
         _local_10.text = _local_2;
         _local_10.y = _local_8;
         addChild(_local_10);
         if(width < _local_10.textWidth)
         {
            width = _local_10.textWidth;
         }
         _local_8 += _local_10.height + 2 * _local_5;
         width += 2 * _local_4;
         _local_7.x = width - _local_7.width >> 1;
         _local_9.x = width - _local_9.width >> 1;
         _local_10.x = width - _local_10.width >> 1;
         height = _local_8 + _local_3;
         this._show = false;
      }
      
      public function show() : void
      {
         if(this._show)
         {
            return;
         }
         this._show = true;
         battleGUIService.fez().addChild(this);
         this.onResize();
         display.stage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      public function hide() : void
      {
         if(!this._show)
         {
            return;
         }
         this._show = false;
         removeDisplayObject(this);
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onResize(_arg_1:Event = null) : void
      {
         this.x = display.stage.stageWidth - this.width >> 1;
         this.y = display.stage.stageHeight - this.height >> 1;
      }
      
      public function destroy() : void
      {
         this.hide();
      }
   }
}

