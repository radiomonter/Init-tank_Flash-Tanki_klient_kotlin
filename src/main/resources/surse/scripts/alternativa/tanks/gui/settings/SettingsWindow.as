package alternativa.tanks.gui.settings
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.IHelpService;
   import controls.base.DefaultButtonBase;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import forms.TankWindowWithHeader;
   import obfuscation.gomavik.Kyke;
   import obfuscation.jaso.Biretihap;
   import obfuscation.lumygaw.Myzu;
   import obfuscation.qimi.Jin;
   import obfuscation.qimi.Kovul;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import titanomachina.headers.Headers;
   
   public class SettingsWindow extends DialogWindow
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var helperService:IHelpService;
      
      [Inject]
      public static var partnersService:IPartnerService;
      
      public static const fahohaq:int = WINDOW_HEIGHT - 2 * WINDOW_MARGIN - 2 * wocobok - MARGIN;
      
      public static const daqowuso:int = WINDOW_WIDTH - 2 * WINDOW_MARGIN;
      
      public static const WINDOW_MARGIN:int = 12;
      
      public static const wocobok:int = 33;
      
      public static const BUTTON_WIDTH:int = 104;
      
      private static const WINDOW_WIDTH:int = 775;
      
      private static const WINDOW_HEIGHT:int = 560;
      
      private static const MARGIN:int = 8;
      
      private var closeButton:DefaultButtonBase;
      
      private var temuk:Pibu;
      
      private var bud:Dictionary;
      
      private var pisij:Jin = null;
      
      public function SettingsWindow(_arg_1:String, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean, _arg_5:String, _arg_6:String)
      {
         var _local_9:Myzu = null;
         var _local_7:TankWindowWithHeader = null;
         var _local_8:Boolean = false;
         var _local_12:Biretihap = null;
         this.bud = new Dictionary();
         _local_9 = null;
         super();
         _local_7 = new TankWindowWithHeader(Headers.getHeaderById("SETTINGS"));
         _local_7.width = WINDOW_WIDTH;
         _local_7.height = WINDOW_HEIGHT;
         addChild(_local_7);
         this.temuk = new Pibu();
         this.temuk.toke(Juteqisyt.GAME);
         this.temuk.toke(Juteqisyt.GRAPHIC);
         _local_8 = !partnersService.isRunningInsidePartnerEnvironment() || _arg_4;
         if(_local_8)
         {
            this.temuk.toke(Juteqisyt.ACCOUNT);
         }
         this.temuk.toke(Juteqisyt.CONTROL);
         this.temuk.fiqohebuq(Juteqisyt.GAME);
         this.temuk.x = this.temuk.y = WINDOW_MARGIN;
         this.temuk.addEventListener(SelectTabEvent.dajivak,this.netapuvut);
         addChild(this.temuk);
         var _local_10:Kovul = new Kovul();
         _local_10.y = this.temuk.y + this.temuk.height + MARGIN;
         _local_10.x = WINDOW_MARGIN;
         this.bud[Juteqisyt.GRAPHIC] = _local_10;
         var _local_11:Kyke = new Kyke(_arg_3);
         _local_11.y = this.temuk.y + this.temuk.height + MARGIN;
         _local_11.x = WINDOW_MARGIN;
         this.bud[Juteqisyt.GAME] = _local_11;
         if(_local_8)
         {
            _local_9 = new Myzu(_arg_1,_arg_2,_arg_4,_arg_5,_arg_6);
            _local_9.y = this.temuk.y + this.temuk.height + MARGIN;
            _local_9.x = WINDOW_MARGIN;
            this.bud[Juteqisyt.ACCOUNT] = _local_9;
         }
         _local_12 = new Biretihap();
         _local_12.y = this.temuk.y + this.temuk.height + MARGIN;
         _local_12.x = WINDOW_MARGIN;
         this.bud[Juteqisyt.CONTROL] = _local_12;
         this.temuk.fiqohebuq(Juteqisyt.GAME);
         this.closeButton = new DefaultButtonBase();
         addChild(this.closeButton);
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_CLOSE_LABEL);
         this.closeButton.x = WINDOW_WIDTH - this.closeButton.width - WINDOW_MARGIN;
         this.closeButton.y = WINDOW_HEIGHT - this.closeButton.height - WINDOW_MARGIN;
         this.closeButton.addEventListener(MouseEvent.CLICK,this.sata);
         _local_7.height = WINDOW_HEIGHT;
      }
      
      private function netapuvut(_arg_1:SelectTabEvent) : void
      {
         if(this.pisij != null && contains(this.pisij))
         {
            this.pisij.hide();
            removeChild(this.pisij);
         }
         var _local_2:Jin = this.bud[_arg_1.getSelectedCategory()];
         if(_local_2 != null)
         {
            this.pisij = _local_2;
            addChild(this.pisij);
            this.pisij.show();
         }
      }
      
      public function show() : void
      {
         dialogService.addDialog(this);
      }
      
      private function sata(_arg_1:MouseEvent = null) : void
      {
         this.gebuvuju();
      }
      
      private function gebuvuju() : void
      {
         helperService.hideAllHelpers();
         dispatchEvent(new SettingsWindowEvent(SettingsWindowEvent.jike));
      }
      
      public function sipywu() : Myzu
      {
         return this.bud[Juteqisyt.ACCOUNT];
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.gebuvuju();
      }
      
      public function destroy() : void
      {
         var _local_1:Jin = null;
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.sata);
         this.temuk.removeEventListener(SelectTabEvent.dajivak,this.netapuvut);
         this.temuk.destroy();
         for each(_local_1 in this.bud)
         {
            _local_1.destroy();
         }
         dialogService.removeDialog(this);
         display.stage.focus = null;
      }
   }
}

