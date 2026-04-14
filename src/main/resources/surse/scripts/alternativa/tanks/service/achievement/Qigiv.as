package alternativa.tanks.service.achievement
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.CongratulationsWindowPresent;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.help.achievements.BattleFightButtonHelper;
   import alternativa.tanks.help.achievements.BattleStartButtonHelper;
   import alternativa.tanks.help.achievements.DonateButtonHelper;
   import alternativa.tanks.help.achievements.FirstBattleCreateHelper;
   import alternativa.tanks.help.achievements.FirstBattleFightHelper;
   import alternativa.tanks.help.achievements.FirstDonateHelper;
   import alternativa.tanks.help.achievements.FirstPurchaseHelper;
   import alternativa.tanks.help.achievements.InviteFriendHelper;
   import alternativa.tanks.help.achievements.PurchaseButtonHelper;
   import alternativa.tanks.help.achievements.SetEmailHelper;
   import alternativa.tanks.service.settings.ISettingsService;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import projects.tanks.client.achievements.model.achievements.Jypofa;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Qigiv implements IAchievementService
   {
      
      [Inject]
      public static var helpService:IHelpService;
      
      [Inject]
      public static var clientLog:IClientLog;
      
      [Inject]
      public static var modelRegister:ModelRegistry;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var partnersService:IPartnerService;
      
      private static const venir:Class = Qemit;
      
      private static const present:BitmapData = (new venir() as Bitmap).bitmapData;
      
      private const HELPER_GROUP_KEY:String = "GarageModel";
      
      private var battle:FirstBattleCreateHelper;
      
      private var lociruc:BattleStartButtonHelper;
      
      private var cuduracir:FirstBattleFightHelper;
      
      private var hazepitub:BattleFightButtonHelper;
      
      private var pylifucug:FirstDonateHelper;
      
      private var cuwy:DonateButtonHelper;
      
      private var gidyc:FirstPurchaseHelper;
      
      private var saruj:PurchaseButtonHelper;
      
      private var friend:InviteFriendHelper;
      
      private var email:SetEmailHelper;
      
      private var vafeva:Vector.<Jypofa>;
      
      private var digofuler:int = 0;
      
      private var inBattle:Boolean;
      
      private var wohabu:Boolean = false;
      
      private var kodo:Boolean = true;
      
      public function Qigiv()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.battle = new FirstBattleCreateHelper();
         this.lociruc = new BattleStartButtonHelper();
         this.cuduracir = new FirstBattleFightHelper();
         this.hazepitub = new BattleFightButtonHelper();
         this.pylifucug = new FirstDonateHelper();
         this.cuwy = new DonateButtonHelper();
         this.gidyc = new FirstPurchaseHelper();
         this.saruj = new PurchaseButtonHelper();
         this.friend = new InviteFriendHelper();
         this.email = new SetEmailHelper();
         var _local_1:IHelpService = IHelpService(OSGi.getInstance().getService(IHelpService));
         _local_1.registerHelper(this.HELPER_GROUP_KEY,800,this.battle,false);
         _local_1.registerHelper(this.HELPER_GROUP_KEY,802,this.cuduracir,false);
         _local_1.registerHelper(this.HELPER_GROUP_KEY,803,this.hazepitub,false);
         _local_1.registerHelper(this.HELPER_GROUP_KEY,804,this.pylifucug,false);
         _local_1.registerHelper(this.HELPER_GROUP_KEY,805,this.cuwy,false);
         _local_1.registerHelper(this.HELPER_GROUP_KEY,806,this.gidyc,false);
         _local_1.registerHelper(this.HELPER_GROUP_KEY,807,this.saruj,false);
         _local_1.registerHelper(this.HELPER_GROUP_KEY,808,this.friend,false);
         _local_1.registerHelper(this.HELPER_GROUP_KEY,809,this.email,false);
         _local_1.registerHelper(this.HELPER_GROUP_KEY,811,this.lociruc,false);
         this.vafeva = new Vector.<Jypofa>();
      }
      
      public function refafuk(_arg_1:Vector.<Jypofa>) : void
      {
         var _local_3:int = 0;
         this.vafeva = new Vector.<Jypofa>();
         var _local_2:int = int(_arg_1.length);
         while(_local_3 < _local_2)
         {
            if(_arg_1[_local_3] != Jypofa.FIRST_REFERRAL)
            {
               this.vafeva.push(_arg_1[_local_3]);
            }
            _local_3++;
         }
         if(this.vafeva.length != 0)
         {
            this.rijala();
            this.alignHelpers();
            display.stage.addEventListener(Event.RESIZE,this.alignHelpers);
         }
      }
      
      public function setPanelPartition(_arg_1:int) : void
      {
         this.digofuler = _arg_1;
         this.inBattle = false;
         this.rijala();
         this.alignHelpers();
      }
      
      public function setGarageBuyButtonTargetPoint(_arg_1:Point) : void
      {
         this.saruj.targetPoint = _arg_1;
         this.rijala();
         this.alignHelpers();
      }
      
      public function setBattleStartButtonTargetPoint(_arg_1:Point) : void
      {
         this.hazepitub.targetPoint = _arg_1;
         this.rijala();
         this.alignHelpers();
      }
      
      public function setPaymentResumeButtonTargetPoint(_arg_1:Point) : void
      {
         this.cuwy.targetPoint = _arg_1;
         this.rijala();
         this.alignHelpers();
      }
      
      public function hideAllBubbles(_arg_1:Boolean) : void
      {
         var _local_2:* = 800;
         while(_local_2 < 812)
         {
            helpService.hideHelper(this.HELPER_GROUP_KEY,_local_2);
            _local_2++;
         }
         helpService.hideHelp();
         this.inBattle = _arg_1;
      }
      
      public function showStartButtonHelper() : void
      {
         this.wohabu = true;
         this.rijala();
      }
      
      public function hideStartButtonHelper() : void
      {
         this.wohabu = false;
         this.rijala();
      }
      
      public function privateAchievementBubbleIsNotNeededAnymore() : void
      {
         this.kodo = false;
      }
      
      public function completeAchievement(_arg_1:Jypofa, _arg_2:String, _arg_3:int) : void
      {
         if(this.vafeva.indexOf(_arg_1) != -1)
         {
            this.vafeva.splice(this.vafeva.indexOf(_arg_1),1);
         }
         this.hideAllBubbles(this.inBattle);
         var _local_4:CongratulationsWindowPresent = new CongratulationsWindowPresent(present,null,_arg_2);
      }
      
      public function activateAchievement(_arg_1:Jypofa) : void
      {
         if(!(_arg_1 == Jypofa.FIRST_REFERRAL && partnersService.isRunningInsidePartnerEnvironment()))
         {
            this.vafeva.push(_arg_1);
         }
         this.rijala();
         this.alignHelpers();
      }
      
      private function rijala() : void
      {
         var _local_1:Jypofa = null;
         var _local_3:int = 0;
         if(this.inBattle)
         {
            return;
         }
         var _local_2:* = 800;
         while(_local_2 < 812)
         {
            helpService.hideHelper(this.HELPER_GROUP_KEY,_local_2);
            _local_2++;
         }
         while(_local_3 < this.vafeva.length)
         {
            _local_1 = this.vafeva[_local_3];
            switch(_local_1)
            {
               case Jypofa.FIRST_PURCHASE:
                  if(this.digofuler == 1 && this.saruj.targetPoint.x != 0)
                  {
                     helpService.showHelper(this.HELPER_GROUP_KEY,807,true);
                  }
                  break;
               case Jypofa.FIGHT_FIRST_BATTLE:
                  if(this.digofuler != 0)
                  {
                     helpService.showHelperIfAble(this.HELPER_GROUP_KEY,802,true);
                  }
                  break;
               case Jypofa.FIRST_DONATE:
                  if(lobbyLayoutService.getCurrentState() == LayoutState.PAYMENT && this.cuwy.targetPoint.x > 0)
                  {
                     helpService.showHelper(this.HELPER_GROUP_KEY,805,true);
                  }
                  else if(lobbyLayoutService.getCurrentState() == LayoutState.GARAGE)
                  {
                     helpService.showHelperIfAble(this.HELPER_GROUP_KEY,804,true);
                  }
                  break;
               case Jypofa.FIRST_REFERRAL:
                  helpService.showHelper(this.HELPER_GROUP_KEY,808,true);
                  break;
               case Jypofa.SET_EMAIL:
                  helpService.showHelper(this.HELPER_GROUP_KEY,809,true);
            }
            _local_3++;
         }
      }
      
      private function alignHelpers(_arg_1:Event = null) : void
      {
         var _local_2:int = int(Math.max(970,display.stage.stageWidth));
         var _local_3:int = int(Math.max(580,display.stage.stageHeight));
         this.battle.targetPoint = new Point(_local_2 - 295,30);
         this.lociruc.targetPoint = new Point(_local_2 - 35,_local_3 - 30);
         this.cuduracir.targetPoint = new Point(_local_2 - 292,30);
         this.pylifucug.targetPoint = new Point(_local_2 - 400,30);
         this.gidyc.targetPoint = new Point(_local_2 - 320 + 90,30);
         this.friend.targetPoint = new Point(_local_2 - 130,30);
         this.email.targetPoint = new Point(_local_2 - 110,30);
      }
      
      public function wevuqisit() : void
      {
         this.cuwy.visible = true;
      }
      
      public function jovo() : void
      {
         this.cuwy.visible = false;
      }
   }
}

