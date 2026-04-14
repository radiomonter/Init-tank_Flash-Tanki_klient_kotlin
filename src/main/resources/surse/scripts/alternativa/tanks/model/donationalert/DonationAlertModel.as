package alternativa.tanks.model.donationalert
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.ThanksForPurchaseWindow;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.types.Long;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   
   public class DonationAlertModel
   {
      
      [Inject]
      public static var dialogsService:IDialogsService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      private static const GA_CATEGORY:String = "payment";
      
      private var donation:int = 0;
      
      private var premium:int = 0;
      
      private var lootbox:int = 0;
      
      private var gold:int = 0;
      
      private var clan:int = 0;
      
      private var supplies:int = 0;
      
      private var item:int = 0;
      
      private var newkit:int = 0;
      
      private var newkitty:int = 0;
      
      private var bonusCrystals:int = 0;
      
      private var packageBonusCrystals:int = 0;
      
      private var window:ThanksForPurchaseWindow = null;
      
      private var time:Long = null;
      
      private var confirmTime:Long;
      
      private var remFrames:int;
      
      private var image:BitmapData;
      
      public function DonationAlertModel()
      {
         super();
      }
      
      public function showDonationAlert(_arg_1:Long, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:BitmapData, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:int, _arg_10:int, _arg_11:int, _arg_12:int) : void
      {
         if(this.window == null)
         {
            this.image = _arg_5;
            this.window = new ThanksForPurchaseWindow(_arg_5,_arg_2,_arg_3,_arg_4,_arg_6,_arg_7,_arg_8,_arg_9,_arg_10,_arg_11,_arg_12);
            this.confirmTime = _arg_1;
            this.show();
         }
         else
         {
            this.donation += _arg_2;
            this.lootbox += _arg_4;
            this.lootbox = this.premium + _arg_6;
            this.packageBonusCrystals += _arg_3;
            if(this.time == null || this.compareTime(this.time,_arg_1) < 0)
            {
               this.time = _arg_1;
            }
         }
      }
      
      private function onResize(_arg_1:Event) : void
      {
         this.window.x = Math.round((display.stage.stageWidth - this.window.width) * 0.5);
         this.window.y = Math.round((display.stage.stageHeight - this.window.height) * 0.5);
      }
      
      private function onClose(_arg_1:Event) : void
      {
         trackerService.trackEvent(GA_CATEGORY,"thanksForPurchaseClosed",this.window.donationCrystals.toString());
         dialogsService.removeDialog(this.window);
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
         this.window = null;
         if(this.donation > 0)
         {
            this.window = new ThanksForPurchaseWindow(this.image,this.lootbox,this.donation,this.bonusCrystals,this.premium,this.gold,this.clan,this.supplies,this.item,this.newkit,this.newkitty);
            this.lootbox = 0;
            this.donation = 0;
            this.premium = 0;
            this.gold = 0;
            this.clan = 0;
            this.supplies = 0;
            this.item = 0;
            this.newkit = 0;
            this.newkitty = 0;
            this.bonusCrystals = 0;
            this.packageBonusCrystals = 0;
            this.confirmTime = this.time;
            this.time = null;
            this.remFrames = 10;
            display.stage.addEventListener(Event.ENTER_FRAME,this.showAfter);
         }
      }
      
      private function show() : void
      {
         this.onResize(null);
         display.stage.addEventListener(Event.RESIZE,this.onResize);
         this.window.closeButton.addEventListener(MouseEvent.CLICK,this.onClose);
         dialogsService.addDialog(this.window);
      }
      
      private function showAfter(_arg_1:Event) : void
      {
         --this.remFrames;
         if(this.remFrames == 0)
         {
            this.show();
            display.stage.removeEventListener(Event.ENTER_FRAME,this.showAfter);
         }
      }
      
      private function compareTime(_arg_1:Long, _arg_2:Long) : int
      {
         if(_arg_1.high != _arg_2.high)
         {
            return _arg_1.high < _arg_2.high ? int(-1) : int(1);
         }
         if(_arg_1.low == _arg_2.low)
         {
            return 0;
         }
         return _arg_1.low < _arg_2.low ? int(-1) : int(1);
      }
   }
}

