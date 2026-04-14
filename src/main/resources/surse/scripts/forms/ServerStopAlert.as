package forms
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.base.LabelBase;
   import controls.statassets.BlackRoundRect;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.text.TextFormatAlign;
   import flash.utils.Timer;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class ServerStopAlert extends Sprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var display:IDisplay;
      
      protected const PADDING:int = 15;
      
      protected var bg:BlackRoundRect = new BlackRoundRect();
      
      protected var timeLimitLabel:LabelBase = new LabelBase();
      
      protected var countDown:int = 0;
      
      protected var countDownTimer:Timer;
      
      protected var str:String;
      
      public function ServerStopAlert(_arg_1:int)
      {
         super();
         this.countDown = _arg_1;
         this.init();
      }
      
      protected function init() : void
      {
         this.timeLimitLabel.align = TextFormatAlign.CENTER;
         this.str = localeService.getText(TanksLocale.TEXT_SERVER_STOP_ALERT_TEXT);
         this.timeLimitLabel.text = this.getText(this.str,"88");
         addChild(this.bg);
         addChild(this.timeLimitLabel);
         this.timeLimitLabel.x = this.PADDING;
         this.timeLimitLabel.y = this.PADDING;
         this.bg.width = this.timeLimitLabel.width + this.PADDING * 2;
         this.bg.height = this.timeLimitLabel.height + this.PADDING * 2;
         display.dialogsLayer.addChild(this);
         display.stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize();
         this.showCountDown();
      }
      
      private function onResize(_arg_1:Event = null) : void
      {
         this.x = Math.round((display.stage.stageWidth - this.width) * 0.5);
         this.y = Math.round((display.stage.stageHeight - this.height) * 0.5);
      }
      
      protected function showCountDown() : void
      {
         this.countDownTimer = new Timer(1000);
         this.countDownTimer.addEventListener(TimerEvent.TIMER,this.showCountDownTick);
         this.countDownTimer.start();
         this.showCountDownTick();
      }
      
      protected function showCountDownTick(_arg_1:TimerEvent = null) : void
      {
         var _local_2:String = this.countDown > 9 ? String(this.countDown) : "0" + String(this.countDown);
         this.timeLimitLabel.text = this.timeLimitLabel.text = this.getText(this.str,_local_2);
         --this.countDown;
         if(this.countDown < 0)
         {
            this.countDownTimer.removeEventListener(TimerEvent.TIMER,this.showCountDownTick);
            this.countDownTimer.stop();
         }
      }
      
      protected function getText(_arg_1:String, ... _args) : String
      {
         var _local_4:int = 0;
         var _local_3:String = _arg_1;
         while(_local_4 < _args.length)
         {
            _local_3 = _local_3.replace("%" + (_local_4 + 1),_args[_local_4]);
            _local_4++;
         }
         return _local_3;
      }
   }
}

