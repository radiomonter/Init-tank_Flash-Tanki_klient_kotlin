package obfuscation.revubag
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Rujina;
   import alternativa.tanks.gui.battle.BattleFinishDmNotification;
   import alternativa.tanks.models.battle.gui.Tupebeput;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.utils.removeDisplayObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import obfuscation.bude.BattleTeam;
   import obfuscation.gicuke.Perez;
   import obfuscation.joni.Beb;
   import obfuscation.joni.Momo;
   import obfuscation.joni.ShortUserInfo;
   import obfuscation.joni.Tozutuv;
   import obfuscation.joraky.Cuqer;
   import obfuscation.joraky.Pywy;
   import obfuscation.joraky.Rululeqy;
   import obfuscation.kumopurut.Tahana;
   import obfuscation.lopivyl.Pasysuwo;
   import obfuscation.lopivyl.Zevab;
   import obfuscation.rajideziv.Rolipu;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import projects.tanks.client.battleservice.model.statistics.Bamapylaq;
   import projects.tanks.client.battleservice.model.statistics.Jomyceju;
   import projects.tanks.client.battleservice.model.statistics.Suc;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.flash.commons.services.serverhalt.IServerHaltService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class Cewyn extends Zevab implements Pasysuwo, IObjectLoadListener, Pywy, BattleEventListener, Cuqer
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var qag:IServerHaltService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var tykih:BattleGUIService;
      
      [Inject]
      public static var bafat:BattleInputService;
      
      [Inject]
      public static var notificationService:INotificationService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var premiumService:PremiumService;
      
      private var dejysa:Baba;
      
      private var kykiju:Perez;
      
      private var _battleActive:Boolean;
      
      private var paliti:Dictionary;
      
      private var kacafop:Vector.<Tozutuv>;
      
      private var hanybi:int;
      
      public function Cewyn()
      {
         super();
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Rujina,this.qoc);
      }
      
      private static function moqy(_arg_1:Vector.<Bamapylaq>) : Dictionary
      {
         var _local_2:Momo = null;
         var _local_3:Bamapylaq = null;
         var _local_4:Momo = null;
         var _local_7:int = 0;
         var _local_5:Dictionary = new Dictionary();
         var _local_6:int = int(_arg_1.length);
         while(_local_7 < _local_6)
         {
            _local_3 = _arg_1[_local_7];
            _local_4 = Beb.casabigu(_local_3,BattleTeam.NONE);
            _local_5[_local_3.user] = _local_4;
            _local_7++;
         }
         for each(_local_2 in _local_5)
         {
            _local_2.loaded = true;
         }
         return _local_5;
      }
      
      private function qoc(_arg_1:Rujina) : void
      {
         var _local_2:Tozutuv = this.seledi(_arg_1.tank.tankData.userName);
         _local_2.loaded = true;
         this.kykiju.jurefyham(_local_2);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         this.paliti = moqy(getInitParam().rebar);
         this.kacafop = Beb.mufusyz(this.paliti,getInitParam().rebar);
         this.hanybi = getInitParam().rebar.length;
         var _local_1:Rululeqy = Rululeqy(OSGi.getInstance().getService(Tupebeput));
         this.kykiju = new Perez(_local_1.getBattleName(),false);
         this.kykiju.addEventListener(Tahana.EXIT,this.tibohe);
         this.kykiju.addEventListener(Tahana.CONTINUE,this.kevenasyt);
         tykih.sapareri().addChild(this.kykiju);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         this.battleActive = true;
         this.dejysa.bijoja();
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         display.stage.addEventListener(Event.DEACTIVATE,this.wefuve);
      }
      
      private function onKeyDown(_arg_1:KeyboardEvent) : void
      {
         if(_arg_1.keyCode == Keyboard.TAB && !bafat.miwyraze())
         {
            this.fid();
         }
      }
      
      private function fid() : void
      {
         if(this.battleActive)
         {
            this.kykiju.veqo(false,false,userPropertiesService.userId,this.kacafop,false,0);
         }
      }
      
      private function ratijeki() : void
      {
         if(this.battleActive)
         {
            this.kykiju.hide();
         }
      }
      
      private function onKeyUp(_arg_1:KeyboardEvent) : void
      {
         if(_arg_1.keyCode == Keyboard.TAB)
         {
            this.ratijeki();
         }
      }
      
      private function wefuve(_arg_1:Event) : void
      {
         this.ratijeki();
      }
      
      private function tibohe(_arg_1:Tahana) : void
      {
         if(!lobbyLayoutService.isSwitchInProgress())
         {
            if(!this.battleActive)
            {
               lobbyLayoutService.exitFromBattleWithoutNotify();
            }
            else
            {
               lobbyLayoutService.exitFromBattle();
            }
         }
      }
      
      private function kevenasyt(_arg_1:Tahana) : void
      {
         Rolipu(object.adapt(Rolipu)).continueBattle();
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         this.battleActive = false;
         this.dejysa.ciqon();
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         display.stage.removeEventListener(Event.DEACTIVATE,this.wefuve);
         this.kykiju.hide();
         this.kykiju.removeEventListener(Tahana.EXIT,this.tibohe);
         this.kykiju.removeEventListener(Tahana.CONTINUE,this.kevenasyt);
         removeDisplayObject(this.kykiju);
         this.kykiju = null;
         this.paliti.length = 0;
         this.kacafop.length = 0;
         this.kacafop = null;
         this.paliti = null;
         this.hanybi = 0;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloadedPost() : void
      {
      }
      
      [Obfuscation(rename="false")]
      public function donanuno(_arg_1:Suc) : void
      {
         var _local_2:Tozutuv = Beb.donanuno(this.kacafop,_arg_1);
         this.kykiju.jurefyham(_local_2);
         var _local_3:Rululeqy = Rululeqy(OSGi.getInstance().getService(Tupebeput));
         _local_3.updateUserKills(_local_2.userId,_local_2.kills);
      }
      
      [Obfuscation(rename="false")]
      public function cesipuvav(_arg_1:Vector.<Suc>) : void
      {
         var _local_4:int = 0;
         this.kacafop = Beb.cesipuvav(this.paliti,_arg_1);
         var _local_2:Rululeqy = Rululeqy(OSGi.getInstance().getService(Tupebeput));
         var _local_3:int = int(_arg_1.length);
         while(_local_4 < _local_3)
         {
            _local_2.updateUserKills(_arg_1[_local_4].user,_arg_1[_local_4].kills);
            _local_4++;
         }
         this.kykiju.zefypek(this.kacafop);
      }
      
      [Obfuscation(rename="false")]
      public function userConnect(_arg_1:String, _arg_2:Vector.<Bamapylaq>) : void
      {
         var _local_3:Bamapylaq = Beb.ridaha(_arg_1,_arg_2);
         this.paliti[_arg_1] = Beb.casabigu(_local_3,BattleTeam.NONE);
         ++this.hanybi;
         this.kacafop = Beb.mufusyz(this.paliti,_arg_2);
         if(this.battleActive)
         {
            this.kykiju.zefypek(this.kacafop);
         }
      }
      
      [Obfuscation(rename="false")]
      public function sywibo(_arg_1:String) : void
      {
         if(this.battleActive)
         {
            this.kykiju.vevonij(_arg_1,BattleTeam.NONE);
         }
         var _local_2:Rululeqy = Rululeqy(OSGi.getInstance().getService(Tupebeput));
         var _local_3:Momo = this.paliti[_arg_1];
         _local_2.sywibo(_local_3.getShortUserInfo());
         delete this.paliti[_arg_1];
         --this.hanybi;
         this.kacafop = Beb.kekamago(this.kacafop,_arg_1);
      }
      
      public function getShortUserInfo(_arg_1:String) : ShortUserInfo
      {
         var _local_2:Momo = this.paliti[_arg_1];
         if(_local_2 != null)
         {
            return _local_2.getShortUserInfo();
         }
         return null;
      }
      
      public function isLoaded(_arg_1:String) : Boolean
      {
         var _local_2:Momo = this.paliti[_arg_1];
         return _local_2 != null && _local_2.loaded;
      }
      
      public function hejyc(_arg_1:String, _arg_2:Boolean) : void
      {
         var _local_3:Tozutuv = this.seledi(_arg_1);
         if(_local_3 != null)
         {
            _local_3.suspicious = _arg_2;
            this.kykiju.jurefyham(_local_3);
         }
      }
      
      public function myle(_arg_1:String, _arg_2:int) : void
      {
         var _local_3:Tozutuv = this.seledi(_arg_1);
         _local_3.rank = _arg_2;
         this.kykiju.jurefyham(_local_3);
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      public function roundStart() : void
      {
         this.battleActive = true;
         this.kykiju.hide();
      }
      
      public function ruwer() : void
      {
         this.battleActive = false;
         this.kykiju.hide();
      }
      
      public function roundFinish(_arg_1:Boolean, _arg_2:Boolean, _arg_3:int, _arg_4:Vector.<Jomyceju>, _arg_5:int, _arg_6:int) : void
      {
         var _local_7:Boolean = false;
         var _local_8:int = 0;
         var _local_9:int = 0;
         this.battleActive = false;
         this.kykiju.hide();
         Beb.ryzuni(this.kacafop,_arg_4,_arg_5);
         if(_arg_2)
         {
            _local_7 = _arg_5 > 0;
            _arg_3 = !qag.isServerHalt ? int(_arg_3) : int(-1);
            this.kykiju.veqo(_arg_1,_local_7,userPropertiesService.userId,this.kacafop,true,_arg_3);
            if(lobbyLayoutService.isWindowOpenOverBattle() && !battleInfoService.isSpectatorMode())
            {
               _local_8 = Beb.kazysi(userPropertiesService.userId,_arg_4);
               _local_9 = 0;
               if(premiumService.hasPremium())
               {
                  _local_9 += Beb.witimogar(_local_8,_arg_5);
               }
               notificationService.addNotification(new BattleFinishDmNotification(this.bolifeq(),this.kacafop.length,_local_8,_local_9));
            }
         }
      }
      
      private function bolifeq() : int
      {
         return Beb.viv(this.kacafop,userPropertiesService.userId) + 1;
      }
      
      private function seledi(_arg_1:String) : Tozutuv
      {
         return Beb.myvogy(this.kacafop,_arg_1);
      }
      
      public function getUsersCount() : int
      {
         return this.hanybi;
      }
      
      private function get battleActive() : Boolean
      {
         return this._battleActive;
      }
      
      private function set battleActive(_arg_1:Boolean) : void
      {
         this._battleActive = _arg_1;
         battleInfoService.battleActive = _arg_1;
      }
   }
}

