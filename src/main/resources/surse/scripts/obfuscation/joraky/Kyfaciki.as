package obfuscation.joraky
{
   import alternativa.model.IObjectLoadListener;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.models.battle.battlefield.BattleType;
   import alternativa.tanks.models.battle.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battle.gui.Tupebeput;
   import alternativa.tanks.models.battle.gui.chat.Wejej;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Femegikad;
   import alternativa.tanks.models.battlefield.Bonup;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.utils.removeDisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import forms.FocusWarningWindow;
   import obfuscation.bude.BattleTeam;
   import obfuscation.falohif.Diwifavof;
   import obfuscation.falohif.Kanebepuk;
   import obfuscation.falohif.Susapinef;
   import obfuscation.fymimywi.Codywo;
   import obfuscation.gybivyveq.Tiz;
   import obfuscation.joni.Gegyjerur;
   import obfuscation.joni.ShortUserInfo;
   import obfuscation.kolut.Tuzeqoj;
   import obfuscation.lokofobiv.Feh;
   import obfuscation.lokofobiv.Wetopeh;
   import obfuscation.mujusaqim.Hylyv;
   import obfuscation.mujusaqim.Linizujim;
   import obfuscation.mujusaqim.MessageColor;
   import obfuscation.qedajyt.Juva;
   import obfuscation.qir.Beg;
   import obfuscation.rihyj.Haqaje;
   import obfuscation.tihah.Hyn;
   import obfuscation.zupozikuh.Tah;
   import projects.tanks.client.battlefield.types.DamageType;
   import projects.tanks.client.battleservice.model.statistics.Jomyceju;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   
   public class Kyfaciki extends Diwifavof implements Kanebepuk, Rululeqy, IObjectLoadListener, Tupebeput, LogicUnit
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var helpService:IHelpService;
      
      [Inject]
      public static var tykih:BattleGUIService;
      
      [Inject]
      public static var doqa:BattleFormatUtil;
      
      [Inject]
      public static var display:IDisplay;
      
      private var rojaby:IModelService;
      
      private var pobyketoz:Boolean;
      
      private var reveso:Tuzeqoj;
      
      private var myloraka:Codywo;
      
      private var sematile:Tah;
      
      private var genetyti:Beg;
      
      private var wejuqate:Vector.<Bonup> = new Vector.<Bonup>();
      
      private var battleName:String;
      
      private var vylo:String;
      
      private var bija:String;
      
      private var qyc:FocusWarningWindow;
      
      private var kid:Ruv;
      
      private var takysotuc:Toha;
      
      private var controlsHelpSupport:Mesenijoh;
      
      private var jopi:Kawubi;
      
      private var zybuqygi:Haqaje;
      
      private var dukes:Gegyjerur;
      
      private var qymefesag:Tiso;
      
      private var riw:Mule;
      
      private var qomefaqot:Lyratumy;
      
      private var parkourMode:Boolean;
      
      private var equipmentConstraintsMode:Tiz;
      
      public function Kyfaciki()
      {
         super();
         this.genetyti = new Beg();
         Hyn.init(500);
         OSGi.getInstance().registerService(Tupebeput,this);
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         this.sematile.update(_arg_2);
      }
      
      public function getBattleName() : String
      {
         var _local_1:String = this.battleName;
         var _local_2:Tiz = this.equipmentConstraintsMode;
         var _local_3:Boolean = this.parkourMode;
         if(doqa.suvo(_local_2,_local_3))
         {
            _local_1 = _local_1 + " " + doqa.vuqud(_local_2,_local_3);
         }
         return _local_1;
      }
      
      public function userConnect(_arg_1:ShortUserInfo) : void
      {
         this.myloraka.addMessage(_arg_1,this.vylo);
      }
      
      public function sywibo(_arg_1:ShortUserInfo) : void
      {
         this.myloraka.addMessage(_arg_1,this.bija);
      }
      
      public function updateUserKills(_arg_1:String, _arg_2:int) : void
      {
         this.reveso.updateUserKills(_arg_1,_arg_2);
      }
      
      public function changeTeamScore(_arg_1:BattleTeam, _arg_2:int) : void
      {
         this.reveso.birud(_arg_1,_arg_2);
      }
      
      public function tagew(_arg_1:uint, _arg_2:String) : void
      {
         this.sematile.addMessage(_arg_1,_arg_2);
      }
      
      public function objectLoaded(_arg_1:ClientObject) : void
      {
         this.qymefesag = new Tiso();
         this.riw = new Mule();
         this.zybuqygi = new Haqaje();
         display.stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      public function fujilo(_arg_1:Femegikad) : void
      {
         if(this.dukes == null)
         {
            this.dukes = new Gegyjerur();
         }
         this.dukes.fujilo(_arg_1);
      }
      
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
         removeDisplayObject(this.reveso);
         removeDisplayObject(this.myloraka);
         removeDisplayObject(this.genetyti);
         this.reveso = null;
         battleService.getBattleRunner().bapucic(this);
         if(this.takysotuc != null)
         {
            this.takysotuc.close();
         }
         if(this.controlsHelpSupport != null)
         {
            this.controlsHelpSupport.close();
         }
         this.riw.close();
         this.qymefesag.close();
         this.jopi.close();
         this.zybuqygi.close();
         if(this.kid != null)
         {
            this.kid.close();
         }
         this.kid = null;
         this.myloraka = null;
         this.sematile.removeFromParent();
         this.sematile = null;
         this.dukes.destroy();
         this.dukes = null;
         this.qomefaqot.close();
      }
      
      public function deactivate() : void
      {
      }
      
      public function activate() : void
      {
      }
      
      public function initObject(_arg_1:ClientObject, _arg_2:Object) : void
      {
         this.battleName = _arg_2.battleName;
         this.equipmentConstraintsMode = _arg_2.equipmentConstraintsMode;
         this.parkourMode = _arg_2.parkourMode;
         this.vylo = localeService.getText(TextConst.BATTLE_PLAYER_JOINED);
         this.bija = localeService.getText(TextConst.BATTLE_PLAYER_LEFT);
         var _local_3:Lyratumy = new Lyratumy(null);
         this.qomefaqot = _local_3;
      }
      
      public function init(_arg_1:ClientObject, _arg_2:Susapinef) : void
      {
         var _local_4:BattleType = null;
         var _local_5:Linizujim = null;
         var _local_6:Wetopeh = null;
         this.pobyketoz = _arg_2.pobyketoz;
         this.jopi = new Kawubi(this.genetyti);
         var _local_3:DisplayObjectContainer = tykih.fez();
         if(this.pobyketoz)
         {
            _local_5 = Linizujim(OSGi.getInstance().getService(Hylyv));
            _local_6 = Wetopeh(OSGi.getInstance().getService(Feh));
            _local_4 = _local_5 != null ? BattleType.CTF : (_local_6 != null ? BattleType.rovicateto : BattleType.TDM);
         }
         else
         {
            _local_4 = BattleType.DM || BattleType.JGR;
         }
         this.reveso = new Tuzeqoj(userPropertiesService.userName,_arg_2.fund,new Juva(_arg_2.scoreLimit,_arg_2.timeLimit * 60),_arg_2.hiwu,_local_4,true);
         if(_arg_2.hiwu > 0)
         {
            this.reveso.gihudowyk(_arg_2.hiwu);
         }
         _local_3.addChild(this.reveso);
         if(this.dukes == null)
         {
            this.dukes = new Gegyjerur();
         }
         this.dukes.wumeza(this.reveso);
         this.dukes.init();
         this.myloraka = new Codywo();
         _local_3.addChild(this.myloraka);
         this.sematile = new Tah();
         _local_3.addChild(this.sematile);
         battleService.getBattleRunner().wop(this);
         if(settingsService.showFPS)
         {
            _local_3.addChild(this.genetyti);
         }
         if(BattlefieldModel(battleService).spectatorMode)
         {
            this.duwyso();
         }
         else
         {
            this.takysotuc = new Toha();
            this.controlsHelpSupport = new Mesenijoh();
         }
         this.objectLoaded(_arg_1);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(_arg_1:Vector.<String>) : void
      {
         this.markSuspectedUsers(_arg_1);
      }
      
      private function duwyso() : void
      {
         var _local_1:Wejej = Wejej(OSGi.getInstance().getService(Wejej));
         this.kid = new Ruv(_local_1.cohuhylu(),this.myloraka,this.sematile,this.reveso,this.genetyti);
      }
      
      private function markSuspectedUsers(_arg_1:Vector.<String>) : void
      {
         var _local_2:String = null;
         for each(_local_2 in _arg_1)
         {
            this.qykoqibeh(_local_2,true);
         }
      }
      
      public function qedupoj(_arg_1:String) : void
      {
         this.myloraka.addMessage(null,_arg_1,null);
      }
      
      [Obfuscation(rename="false")]
      public function fundChange(_arg_1:int) : void
      {
         this.reveso.ciqatagu(_arg_1);
      }
      
      [Obfuscation(rename="false")]
      public function roundStart(_arg_1:int, _arg_2:Boolean) : void
      {
         this.reveso.jyfuk(_arg_2);
         if(_arg_1 > 0)
         {
            this.reveso.gihudowyk(_arg_1);
         }
         var _local_3:Cuqer = Cuqer(OSGi.getInstance().getService(Pywy));
         _local_3.roundStart();
      }
      
      [Obfuscation(rename="false")]
      public function roundFinish(_arg_1:Boolean, _arg_2:Vector.<Jomyceju>, _arg_3:int) : void
      {
         var _local_4:Cuqer = Cuqer(OSGi.getInstance().getService(Pywy));
         _local_4.roundFinish(false,_arg_1,_arg_3,_arg_2,100,0);
         this.reveso.fogegugi();
      }
      
      public function logUserAction(_arg_1:String, _arg_2:String, _arg_3:String = null) : void
      {
         var _local_4:Pywy = Pywy(OSGi.getInstance().getService(Pywy));
         var _local_5:ShortUserInfo = _local_4.getShortUserInfo(_arg_1);
         var _local_6:ShortUserInfo = _arg_3 == null ? null : _local_4.getShortUserInfo(_arg_3);
         this.myloraka.addMessage(_local_5,_arg_2,_local_6);
      }
      
      public function addKillMessage(_arg_1:String, _arg_2:String, _arg_3:DamageType) : void
      {
         var _local_4:Pywy = Pywy(OSGi.getInstance().getService(Pywy));
         var _local_5:ShortUserInfo = _local_4.getShortUserInfo(_arg_1);
         var _local_6:ShortUserInfo = _local_4.getShortUserInfo(_arg_2);
         this.myloraka.addKillMessage(_local_5,_local_6,_arg_3);
      }
      
      public function kemovypy(_arg_1:String, _arg_2:String) : void
      {
         var _local_3:Pywy = Pywy(OSGi.getInstance().getService(Pywy));
         var _local_4:ShortUserInfo = _local_3.getShortUserInfo(_arg_1);
         this.myloraka.addMessage(_local_4,_arg_2);
      }
      
      public function vylyz(_arg_1:String, _arg_2:String = null) : void
      {
         this.myloraka.addMessage(null,_arg_1,null);
      }
      
      public function kun(_arg_1:BattleTeam) : void
      {
         this.reveso.kun(_arg_1);
      }
      
      public function rim(_arg_1:BattleTeam) : void
      {
         this.reveso.rim(_arg_1);
      }
      
      public function naly(_arg_1:BattleTeam) : void
      {
         if(this.reveso != null)
         {
            this.reveso.naly(_arg_1);
         }
      }
      
      [Obfuscation(rename="false")]
      public function onRankChanged(_arg_1:String, _arg_2:int) : void
      {
         var _local_3:Pywy = Pywy(OSGi.getInstance().getService(Pywy));
         _local_3.myle(_arg_1,_arg_2);
         if(Num.cimise != null && _arg_1 == Num.cimise.user.id)
         {
            Toha(this.takysotuc).close();
         }
         var _local_4:Lyratumy = this.battleUserInfoService();
         _local_4.genericy(_arg_1,_arg_2);
      }
      
      private function onResize(_arg_1:Event) : void
      {
         var _local_2:int = display.stage.stageWidth;
         var _local_3:int = display.stage.stageHeight;
         if(this.sematile != null)
         {
            this.sematile.x = 0.5 * _local_2;
            this.sematile.y = 40;
         }
      }
      
      private function qykoqibeh(_arg_1:String, _arg_2:Boolean) : void
      {
         OSGi.clientLog.log("vote","set user suspicious nick %1 bool %2",_arg_1,_arg_2);
         var _local_3:Pywy = Pywy(OSGi.getInstance().getService(Pywy));
         _local_3.hejyc(_arg_1,_arg_2);
         var _local_4:Lyratumy = this.battleUserInfoService();
         _local_4.qapemajat(_arg_1,_arg_2);
      }
      
      [Obfuscation(rename="false")]
      public function statusProbablyCheaterChanged(_arg_1:String, _arg_2:Boolean) : void
      {
         this.qykoqibeh(_arg_1,_arg_2);
      }
      
      [Obfuscation(rename="false")]
      public function onComplaintConfirmed() : void
      {
         this.sematile.addMessage(MessageColor.YELLOW,localeService.getText(TextConst.TEXT_TEAM_KICK_COMPLAINT_SENT));
      }
      
      public function zupa(_arg_1:int) : void
      {
         this.reveso.zupa(_arg_1);
      }
      
      public function wyr() : void
      {
         this.reveso.wyr();
      }
      
      private function battleUserInfoService() : Lyratumy
      {
         return Lyratumy(this.qomefaqot);
      }
      
      public function bih(_arg_1:int) : void
      {
         this.sematile.lapibamyf(MessageColor.bivyzafo,localeService.getText(TanksLocale.TEXT_TOURNAMENT_BATTLE_TRAINING_LABEL),_arg_1 * 1000);
      }
      
      public function fejukuh(_arg_1:int) : void
      {
         this.sematile.lapibamyf(MessageColor.RED,localeService.getText(TanksLocale.TEXT_TOURNAMENT_BATTLE_STARTING_LABEL),_arg_1 * 1000);
      }
      
      public function getTimeLeftInSec() : int
      {
         return 10000;
      }
   }
}

