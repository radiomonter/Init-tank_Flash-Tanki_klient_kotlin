package obfuscation.pigotib
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Rujina;
   import alternativa.tanks.battle.events.Senyveky;
   import alternativa.tanks.gui.battle.BattleFinishTeamNotification;
   import alternativa.tanks.models.battle.gui.Tupebeput;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.utils.removeDisplayObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import forms.ChangeTeamAlert;
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
   import obfuscation.lelomifom.Negylyqi;
   import obfuscation.lelomifom.Sile;
   import obfuscation.rajideziv.Rolipu;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.battleservice.model.statistics.Bamapylaq;
   import projects.tanks.client.battleservice.model.statistics.Jomyceju;
   import projects.tanks.client.battleservice.model.statistics.Suc;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.flash.commons.services.serverhalt.IServerHaltService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class Lubylag extends Negylyqi implements Sile, ObjectLoadListener, ObjectLoadPostListener, ObjectUnloadListener, Pywy, BattleEventListener, Cuqer
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
      
      private var battleActive:Boolean;
      
      private var kykiju:Perez;
      
      private var puzos:Vector.<Tozutuv>;
      
      private var kygukycu:Vector.<Tozutuv>;
      
      private var paliti:Dictionary;
      
      private var jafome:BattleTeam;
      
      private var cico:BattleTeam;
      
      private var scoreRed:int;
      
      private var scoreBlue:int;
      
      private var hanybi:int;
      
      public function Lubylag()
      {
         super();
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Senyveky,this.serupunil);
         this.dejysa.jikina(Rujina,this.qoc);
      }
      
      private static function simu(_arg_1:BattleTeam) : void
      {
         var _local_2:ChangeTeamAlert = new ChangeTeamAlert(3,_arg_1 == BattleTeam.RED ? int(ChangeTeamAlert.RED) : int(ChangeTeamAlert.BLUE));
         _local_2.x = display.stage.stageWidth - _local_2.width >> 1;
         _local_2.y = display.stage.stageHeight - _local_2.height >> 1;
         tykih.fez().addChild(_local_2);
      }
      
      private static function moqy(_arg_1:Vector.<Bamapylaq>, _arg_2:Vector.<Bamapylaq>) : Dictionary
      {
         var _local_3:Bamapylaq = null;
         var _local_4:Bamapylaq = null;
         var _local_5:Momo = null;
         var _local_6:Dictionary = new Dictionary();
         for each(_local_3 in _arg_1)
         {
            _local_6[_local_3.user] = Beb.casabigu(_local_3,BattleTeam.RED);
         }
         for each(_local_4 in _arg_2)
         {
            _local_6[_local_4.user] = Beb.casabigu(_local_4,BattleTeam.BLUE);
         }
         for each(_local_5 in _local_6)
         {
            _local_5.loaded = true;
         }
         return _local_6;
      }
      
      private static function wym(_arg_1:Vector.<Tozutuv>, _arg_2:BattleTeam) : void
      {
         var _local_3:Tozutuv = null;
         var _local_5:int = 0;
         var _local_4:int = int(_arg_1.length);
         while(_local_5 < _local_4)
         {
            _local_3 = _arg_1[_local_5];
            if(_local_3 == null)
            {
               return;
            }
            _local_3.teamType = _arg_2;
            _local_5++;
         }
      }
      
      private function serupunil(_arg_1:Senyveky) : void
      {
         if(_arg_1.tank.tankData.userName == userPropertiesService.userId)
         {
            if(_arg_1.tank.tankData.teamType != this.cico)
            {
               this.cico = _arg_1.tank.tankData.teamType;
               simu(this.cico);
            }
         }
      }
      
      private function qoc(_arg_1:Rujina) : void
      {
         var _local_2:Tozutuv = this.seledi(_arg_1.tank.tankData.userName);
         _local_2.loaded = true;
         this.kykiju.kiwe(_local_2);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         this.cico = BattleTeam.NONE;
         this.paliti = moqy(getInitParam().jikudof,getInitParam().qirycuf);
         this.hanybi = getInitParam().jikudof.length + getInitParam().qirycuf.length;
         this.puzos = Beb.mufusyz(this.paliti,getInitParam().jikudof);
         this.kygukycu = Beb.mufusyz(this.paliti,getInitParam().qirycuf);
         var _local_1:Rululeqy = Rululeqy(OSGi.getInstance().getService(Tupebeput));
         this.kykiju = new Perez(_local_1.getBattleName(),true);
         this.kykiju.addEventListener(Tahana.EXIT,this.tibohe);
         this.kykiju.addEventListener(Tahana.CONTINUE,this.kevenasyt);
         tykih.sapareri().addChild(this.kykiju);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         this.battleActive = true;
         this.changeTeamScore(BattleTeam.RED,getInitParam().redScore);
         this.changeTeamScore(BattleTeam.BLUE,getInitParam().blueScore);
         this.kyg();
         this.dejysa.bijoja();
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         display.stage.addEventListener(Event.DEACTIVATE,this.wefuve);
      }
      
      private function kyg() : void
      {
         var _local_1:Tozutuv = this.seledi(userPropertiesService.userId);
         if(_local_1 != null)
         {
            this.jafome = _local_1.teamType;
         }
      }
      
      private function onKeyDown(_arg_1:KeyboardEvent) : void
      {
         if(_arg_1.keyCode == Keyboard.TAB && !bafat.miwyraze())
         {
            this.fid();
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
      
      private function fid() : void
      {
         if(this.battleActive)
         {
            this.kykiju.nofos(false,userPropertiesService.userId,this.puzos,this.kygukycu,false,0,this.jafome);
         }
      }
      
      private function ratijeki() : void
      {
         if(this.battleActive)
         {
            this.kykiju.hide();
         }
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
         this.puzos = null;
         this.kygukycu = null;
         this.paliti = null;
         this.cico = null;
         this.hanybi = 0;
      }
      
      [Obfuscation(rename="false")]
      public function changeTeamScore(_arg_1:BattleTeam, _arg_2:int) : void
      {
         if(_arg_1 == BattleTeam.RED)
         {
            this.scoreRed = _arg_2;
         }
         if(_arg_1 == BattleTeam.BLUE)
         {
            this.scoreBlue = _arg_2;
         }
         var _local_3:Rululeqy = Rululeqy(OSGi.getInstance().getService(Tupebeput));
         _local_3.changeTeamScore(_arg_1,_arg_2);
      }
      
      [Obfuscation(rename="false")]
      public function userConnect(_arg_1:String, _arg_2:Vector.<Bamapylaq>, _arg_3:BattleTeam) : void
      {
         var _local_4:Bamapylaq = Beb.ridaha(_arg_1,_arg_2);
         this.paliti[_arg_1] = Beb.casabigu(_local_4,_arg_3);
         ++this.hanybi;
         if(_arg_3 == BattleTeam.RED)
         {
            this.puzos = Beb.mufusyz(this.paliti,_arg_2);
            if(this.battleActive)
            {
               this.kykiju.nibow(this.puzos,_arg_3);
            }
         }
         if(_arg_3 == BattleTeam.BLUE)
         {
            this.kygukycu = Beb.mufusyz(this.paliti,_arg_2);
            if(this.battleActive)
            {
               this.kykiju.nibow(this.kygukycu,_arg_3);
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function sywibo(_arg_1:String) : void
      {
         var _local_2:Momo = this.paliti[_arg_1];
         var _local_3:Rululeqy = Rululeqy(OSGi.getInstance().getService(Tupebeput));
         _local_3.sywibo(_local_2.getShortUserInfo());
         if(this.battleActive)
         {
            this.kykiju.vevonij(_arg_1,_local_2.teamType);
         }
         if(_local_2.teamType == BattleTeam.RED)
         {
            this.puzos = Beb.kekamago(this.puzos,_arg_1);
         }
         if(_local_2.teamType == BattleTeam.BLUE)
         {
            this.kygukycu = Beb.kekamago(this.kygukycu,_arg_1);
         }
         delete this.paliti[_arg_1];
         --this.hanybi;
      }
      
      [Obfuscation(rename="false")]
      public function donanuno(_arg_1:Suc, _arg_2:BattleTeam) : void
      {
         var _local_3:Tozutuv = null;
         if(_arg_2 == BattleTeam.RED)
         {
            _local_3 = Beb.donanuno(this.puzos,_arg_1);
         }
         if(_arg_2 == BattleTeam.BLUE)
         {
            _local_3 = Beb.donanuno(this.kygukycu,_arg_1);
         }
         var _local_4:Rululeqy = Rululeqy(OSGi.getInstance().getService(Tupebeput));
         _local_4.updateUserKills(_arg_1.user,_arg_1.kills);
         this.kykiju.kiwe(_local_3);
      }
      
      [Obfuscation(rename="false")]
      public function cesipuvav(_arg_1:Vector.<Suc>, _arg_2:BattleTeam) : void
      {
         if(_arg_2 == BattleTeam.RED)
         {
            this.puzos = Beb.cesipuvav(this.paliti,_arg_1);
            this.kykiju.nibow(this.puzos,_arg_2);
         }
         if(_arg_2 == BattleTeam.BLUE)
         {
            this.kygukycu = Beb.cesipuvav(this.paliti,_arg_1);
            this.kykiju.nibow(this.kygukycu,_arg_2);
         }
      }
      
      [Obfuscation(rename="false")]
      public function gyf(_arg_1:Vector.<Suc>, _arg_2:Vector.<Suc>) : void
      {
         this.puzos = Beb.cesipuvav(this.paliti,_arg_1);
         this.kygukycu = Beb.cesipuvav(this.paliti,_arg_2);
         wym(this.puzos,BattleTeam.RED);
         wym(this.kygukycu,BattleTeam.BLUE);
         this.kyg();
         this.kykiju.nibow(this.puzos,BattleTeam.RED);
         this.kykiju.nibow(this.kygukycu,BattleTeam.BLUE);
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
      
      private function seledi(_arg_1:String) : Tozutuv
      {
         var _local_2:Tozutuv = Beb.myvogy(this.puzos,_arg_1);
         if(_local_2 == null)
         {
            _local_2 = Beb.myvogy(this.kygukycu,_arg_1);
         }
         return _local_2;
      }
      
      public function hejyc(_arg_1:String, _arg_2:Boolean) : void
      {
         var _local_3:Tozutuv = this.seledi(_arg_1);
         if(_local_3 != null)
         {
            _local_3.suspicious = _arg_2;
            this.kykiju.kiwe(_local_3);
         }
      }
      
      public function myle(_arg_1:String, _arg_2:int) : void
      {
         var _local_3:Tozutuv = this.seledi(_arg_1);
         _local_3.rank = _arg_2;
         this.kykiju.kiwe(_local_3);
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      public function roundStart() : void
      {
         this.battleActive = true;
         this.kykiju.hide();
         this.changeTeamScore(BattleTeam.RED,0);
         this.changeTeamScore(BattleTeam.BLUE,0);
      }
      
      public function ruwer() : void
      {
         this.battleActive = true;
         this.kykiju.hide();
      }
      
      public function roundFinish(_arg_1:Boolean, _arg_2:Boolean, _arg_3:int, _arg_4:Vector.<Jomyceju>, _arg_5:int, _arg_6:int) : void
      {
         var _local_7:int = 0;
         var _local_8:int = 0;
         this.battleActive = false;
         this.kykiju.hide();
         Beb.ryzuni(this.puzos,_arg_4,_arg_5);
         Beb.ryzuni(this.kygukycu,_arg_4,_arg_5);
         if(_arg_2)
         {
            this.kykiju.nofos(_arg_1,userPropertiesService.userId,this.puzos,this.kygukycu,true,!qag.isServerHalt ? int(_arg_3) : int(-1),this.jafome);
         }
         if(_arg_2 && lobbyLayoutService.isWindowOpenOverBattle() && !battleInfoService.isSpectatorMode())
         {
            _local_7 = Beb.kazysi(userPropertiesService.userId,_arg_4);
            _local_8 = 0;
            if(premiumService.hasPremium())
            {
               _local_8 += Beb.witimogar(_local_7,_arg_5);
            }
            notificationService.addNotification(new BattleFinishTeamNotification(this.digenatyk(),this.suvyn(),this.bolifeq(),this.daqepivak(),_local_7,_local_8));
         }
      }
      
      private function digenatyk() : Boolean
      {
         if(this.jafome == BattleTeam.RED)
         {
            return this.scoreRed > this.scoreBlue;
         }
         if(this.jafome == BattleTeam.BLUE)
         {
            return this.scoreBlue > this.scoreRed;
         }
         return false;
      }
      
      private function suvyn() : Boolean
      {
         if(this.jafome == BattleTeam.RED)
         {
            return this.scoreBlue > this.scoreRed;
         }
         if(this.jafome == BattleTeam.BLUE)
         {
            return this.scoreRed > this.scoreBlue;
         }
         return false;
      }
      
      private function daqepivak() : int
      {
         if(this.jafome == BattleTeam.RED)
         {
            return this.puzos.length;
         }
         if(this.jafome == BattleTeam.BLUE)
         {
            return this.kygukycu.length;
         }
         return 0;
      }
      
      private function bolifeq() : int
      {
         var _local_1:int = 0;
         if(this.jafome == BattleTeam.RED)
         {
            _local_1 = Beb.viv(this.puzos,userPropertiesService.userId);
         }
         else if(this.jafome == BattleTeam.BLUE)
         {
            _local_1 = Beb.viv(this.kygukycu,userPropertiesService.userId);
         }
         return _local_1 + 1;
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
      
      public function getUsersCount() : int
      {
         return this.hanybi;
      }
   }
}

