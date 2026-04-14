package obfuscation.coh
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.dailyquest.DailyQuestNotifierService;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.types.Long;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.timer.CountDownTimer;
   import controls.timer.CountDownTimerOnCompleteAfter;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   import forms.TankWindowWithHeader;
   import obfuscation.pejug.Magyp;
   import obfuscation.qenomy.Gipafili;
   import obfuscation.rabygi.Jabehi;
   import obfuscation.rabygi.Wegy;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class Raqohybe extends DialogWindow implements CountDownTimerOnCompleteAfter
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      [Inject]
      public static var ziwifeve:DailyQuestNotifierService;
      
      public static const wavugy:int = 280;
      
      public static const hezo:int = 310;
      
      public static const WINDOW_MARGIN:int = 11;
      
      private const vybite:int = 13;
      
      private const goreli:int = 1000;
      
      private var window:TankWindowWithHeader;
      
      private var closeButton:DefaultButtonBase;
      
      private var rozubul:Vector.<Virelasa> = new Vector.<Virelasa>();
      
      private var infoLink:LabelBase;
      
      private var caz:Betugom;
      
      private var jufowuvin:CountDownTimer;
      
      private var pajibig:Boolean;
      
      private var qokugiwuf:Boolean;
      
      public function Raqohybe()
      {
         super();
         this.veli();
         this.rynytafes();
         this.cogoqumy();
         this.temetur();
      }
      
      private function rynytafes() : void
      {
         this.caz = new Betugom();
         this.caz.x = WINDOW_MARGIN;
         this.caz.y = WINDOW_MARGIN;
         addChild(this.caz);
      }
      
      private function veli() : void
      {
         this.window = TankWindowWithHeader.createWindow("MISSIONS",wavugy + WINDOW_MARGIN * 2,0);
         addChild(this.window);
      }
      
      private function cogoqumy() : void
      {
         this.closeButton = new DefaultButtonBase();
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_CLOSE_LABEL);
         this.closeButton.addEventListener(MouseEvent.CLICK,this.onCloseButtonClick);
         this.window.addChild(this.closeButton);
      }
      
      private function temetur() : void
      {
         this.infoLink = new LabelBase();
         this.infoLink.htmlText = localeService.getText(TanksLocale.TEXT_DAILY_QUEST_INFORMATION);
         this.window.addChild(this.infoLink);
      }
      
      public function init(_arg_1:Vector.<Magyp>) : void
      {
         var _local_2:int = 0;
         ziwifeve.hideNotification();
         while(_local_2 < _arg_1.length)
         {
            this.qyk(_arg_1[_local_2],_local_2);
            _local_2++;
         }
         this.lylo();
      }
      
      private function qyk(_arg_1:Magyp, _arg_2:int) : void
      {
         var _local_3:Virelasa = new Virelasa(_arg_1);
         _local_3.addEventListener(Jabehi.DAILY_QUEST_CHANGE,this.gamikut);
         _local_3.x = wavugy * _arg_2 + WINDOW_MARGIN + int(WINDOW_MARGIN / 2) * _arg_2;
         _local_3.y = WINDOW_MARGIN + Betugom.HEIGHT + WINDOW_MARGIN;
         this.rozubul.push(_local_3);
         this.window.addChild(_local_3);
      }
      
      private function gamikut(_arg_1:Jabehi) : void
      {
         if(_arg_1.puw.canSkipForFree || moneyService.dic(_arg_1.puw.skipCost))
         {
            this.pajibig = false;
            this.kevav();
         }
         else
         {
            this.onCloseButtonClick();
         }
      }
      
      private function kevav() : void
      {
         this.pav();
         this.hukizodof();
      }
      
      private function hukizodof() : void
      {
         this.jufowuvin = new CountDownTimer();
         this.jufowuvin.addListener(CountDownTimerOnCompleteAfter,this);
         this.jufowuvin.start(getTimer() + this.goreli);
         this.qokugiwuf = true;
      }
      
      private function pav() : void
      {
         var _local_1:Virelasa = null;
         for each(_local_1 in this.rozubul)
         {
            if(_local_1.pamytulec())
            {
               _local_1.roso();
            }
         }
      }
      
      public function qyloset(_arg_1:Long, _arg_2:Magyp) : void
      {
         var _local_3:Virelasa = null;
         for each(_local_3 in this.rozubul)
         {
            if(_local_3.qedo() == _arg_1)
            {
               _local_3.zof(_arg_2);
            }
            if(_local_3.pamytulec())
            {
               _local_3.wuqut(_arg_2.skipCost);
            }
         }
         this.lylo();
         this.pajibig = true;
         if(!this.qokugiwuf)
         {
            this.kanoru();
         }
      }
      
      private function lylo() : void
      {
         var _local_1:int = this.zepycana();
         this.nijaf(_local_1);
         this.cylyz();
         this.wujepyb(_local_1);
      }
      
      private function cylyz() : void
      {
         var _local_1:uint = this.rozubul.length;
         this.window.width = _local_1 * wavugy + WINDOW_MARGIN * 2 + int(WINDOW_MARGIN / 2) * (_local_1 - 1);
         this.cetywud();
      }
      
      private function cetywud() : void
      {
         this.closeButton.x = int(this.window.width - this.closeButton.width - WINDOW_MARGIN);
         this.infoLink.x = WINDOW_MARGIN;
      }
      
      private function zepycana() : int
      {
         var _local_1:Virelasa = null;
         var _local_2:int = 0;
         for each(_local_1 in this.rozubul)
         {
            _local_2 = Math.max(_local_2,_local_1.boh());
         }
         return _local_2;
      }
      
      private function nijaf(_arg_1:int) : void
      {
         var _local_2:Virelasa = null;
         for each(_local_2 in this.rozubul)
         {
            _local_2.juraqaqe(_arg_1);
         }
      }
      
      public function vuw() : void
      {
         var _local_1:Tydoca = null;
         this.window.width = hezo + WINDOW_MARGIN * 2;
         this.cetywud();
         _local_1 = new Tydoca();
         _local_1.x = WINDOW_MARGIN;
         _local_1.y = WINDOW_MARGIN + Betugom.HEIGHT + WINDOW_MARGIN;
         this.window.addChild(_local_1);
         this.wujepyb(_local_1.boh());
         this.caz.redraw(this.window.width - 2 * WINDOW_MARGIN);
      }
      
      public function fugago(_arg_1:Gipafili) : void
      {
         this.caz.init(_arg_1);
         this.caz.redraw(this.window.width - 2 * WINDOW_MARGIN);
      }
      
      private function wujepyb(_arg_1:int) : void
      {
         this.window.height = this.vybite + this.closeButton.height + WINDOW_MARGIN + _arg_1 + WINDOW_MARGIN + Betugom.HEIGHT + WINDOW_MARGIN;
         this.closeButton.y = int(this.window.height - this.closeButton.height - WINDOW_MARGIN);
         this.infoLink.y = int(this.window.height - this.infoLink.height - WINDOW_MARGIN);
      }
      
      public function show() : void
      {
         dialogService.enqueueDialog(this);
      }
      
      public function takePrize(_arg_1:Long) : void
      {
         this.kusupybu(_arg_1);
         if(this.rozubul.length > 0)
         {
            this.mejoposor();
            this.lylo();
         }
         else
         {
            this.vuw();
         }
         this.caz.fosefopen(this.window.width - 2 * WINDOW_MARGIN);
         dialogService.centerDialog(this);
      }
      
      private function kusupybu(_arg_1:Long) : void
      {
         var _local_2:Virelasa = null;
         for each(_local_2 in this.rozubul)
         {
            if(_local_2.qedo() == _arg_1)
            {
               this.dofak(_local_2);
               this.window.removeChild(_local_2);
               this.rozubul.splice(this.rozubul.indexOf(_local_2),1);
               break;
            }
         }
      }
      
      private function mejoposor() : void
      {
         var _local_1:Virelasa = null;
         var _local_2:int = 0;
         while(_local_2 < this.rozubul.length)
         {
            _local_1 = this.rozubul[_local_2];
            _local_1.x = wavugy * _local_2 + WINDOW_MARGIN + int(WINDOW_MARGIN / 2) * _local_2;
            _local_2++;
         }
      }
      
      private function onCloseButtonClick(_arg_1:MouseEvent = null) : void
      {
         this.removeListeners();
         this.gozy();
         dispatchEvent(new Wegy(Wegy.vih));
         dialogService.removeDialog(this);
      }
      
      private function removeListeners() : void
      {
         var _local_1:Virelasa = null;
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.onCloseButtonClick);
         for each(_local_1 in this.rozubul)
         {
            this.dofak(_local_1);
         }
      }
      
      private function dofak(_arg_1:Virelasa) : void
      {
         _arg_1.removeEventListener(Jabehi.DAILY_QUEST_CHANGE,this.gamikut);
         if(_arg_1.pamytulec())
         {
            _arg_1.pugogydi();
         }
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.onCloseButtonClick();
      }
      
      override protected function confirmationKeyPressed() : void
      {
         this.onCloseButtonClick();
      }
      
      public function onCompleteAfter(_arg_1:CountDownTimer, _arg_2:Boolean) : void
      {
         this.gozy();
         if(this.pajibig)
         {
            this.kanoru();
         }
      }
      
      private function gozy() : void
      {
         if(this.jufowuvin != null)
         {
            this.jufowuvin.removeListener(CountDownTimerOnCompleteAfter,this);
            this.jufowuvin.destroy();
            this.qokugiwuf = false;
         }
      }
      
      private function kanoru() : void
      {
         var _local_1:Virelasa = null;
         for each(_local_1 in this.rozubul)
         {
            if(_local_1.pamytulec())
            {
               _local_1.zizahuw();
            }
         }
      }
      
      override public function get width() : Number
      {
         return this.window.width;
      }
   }
}

