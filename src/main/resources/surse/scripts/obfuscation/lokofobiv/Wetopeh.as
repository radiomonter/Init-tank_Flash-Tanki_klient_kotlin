package obfuscation.lokofobiv
{
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.TeamDMTargetEvaluator;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Mawi;
   import alternativa.tanks.battle.events.Qeluzajy;
   import alternativa.tanks.battle.events.Qigawi;
   import alternativa.tanks.battle.events.Rujina;
   import alternativa.tanks.battle.events.Senyveky;
   import alternativa.tanks.battle.events.Tujat;
   import alternativa.tanks.battle.events.Vegepos;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.models.battle.battlefield.BattleType;
   import alternativa.tanks.models.battle.gui.Tupebeput;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import obfuscation.bude.BattleTeam;
   import obfuscation.cetij.Vopetycy;
   import obfuscation.fatik.Tevozyta;
   import obfuscation.fatik.Zer;
   import obfuscation.gejaky.Pyqirowad;
   import obfuscation.hato.Jybupe;
   import obfuscation.hato.Ruwuv;
   import obfuscation.jiw.Huzyd;
   import obfuscation.jiw.Quwuhyby;
   import obfuscation.juha.Fafit;
   import obfuscation.juha.Pyni;
   import obfuscation.ligy.Cicef;
   import obfuscation.ligy.Rypybuje;
   import obfuscation.ligy.Wynid;
   import obfuscation.ligy.Zyjova;
   import obfuscation.lysu.Kyroqu;
   import obfuscation.lysu.Soja;
   import obfuscation.lysu.Tifufip;
   import obfuscation.modo.Bibeza;
   import obfuscation.modo.Gazib;
   import obfuscation.modo.Johad;
   import obfuscation.nefysehu.Mehy;
   import obfuscation.nefysehu.Soca;
   import obfuscation.qasa.Hysuwes;
   import obfuscation.qasa.Mowupime;
   import obfuscation.qasa.Nubiwywyg;
   import obfuscation.syhis.Linebaz;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   
   public class Wetopeh extends Cicef implements Rypybuje, ObjectLoadListener, ObjectLoadPostListener, ObjectUnloadListener, Feh, BattleEventListener
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var cicefuqo:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var kyb:BattleGUIService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      private var qedohat:Vector.<TeamDMTargetEvaluator>;
      
      private var seki:Tupebeput;
      
      private var inventoryModel:Bibeza;
      
      private var quga:Dictionary = new Dictionary();
      
      private var cigypy:Vector.<Tenonykaj>;
      
      private var dejysa:Baba;
      
      private var myb:Quwuhyby;
      
      private var zunudaka:Pyqirowad;
      
      private var gaz:Tank;
      
      private var tov:Dictionary;
      
      private var rif:IGameObject;
      
      private var jidih:Lubeno;
      
      private var jutufi:Kyroqu;
      
      private var fivocad:Soja;
      
      private var rero:Ruwuv;
      
      public function Wetopeh()
      {
         super();
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Qigawi,this.necyjiw);
         this.dejysa.jikina(Qeluzajy,this.wuwi);
         this.dejysa.jikina(Rujina,this.qoc);
         this.dejysa.jikina(Tujat,this.vavydisy);
         this.dejysa.jikina(Vopetycy,this.fabademyl);
         this.dejysa.jikina(Senyveky,this.serupunil);
         this.dejysa.jikina(Mawi,this.divy);
      }
      
      private static function gagihuso(_arg_1:IGameObject, _arg_2:Long) : IGameObject
      {
         return _arg_1.space.getObject(_arg_2);
      }
      
      private static function lodu(_arg_1:Zyjova) : BattleTeam
      {
         if(_arg_1 == Zyjova.RED)
         {
            return BattleTeam.RED;
         }
         if(_arg_1 == Zyjova.BLUE)
         {
            return BattleTeam.BLUE;
         }
         throw new Error();
      }
      
      private function serupunil(_arg_1:Senyveky) : void
      {
         this.tov[_arg_1.tank.tankData.userName] = _arg_1.tank;
         var _local_2:int = this.bimy().kike(_arg_1.tank.tankData.userName);
         if(_local_2 >= 0)
         {
            this.jozagirij(_local_2,_arg_1.tank,this.jutufi);
         }
      }
      
      private function tadabiwu(_arg_1:Class) : Object
      {
         Model.object = this.rif;
         var _local_2:Object = getData(_arg_1);
         Model.popObject();
         return _local_2;
      }
      
      private function divy(_arg_1:Mawi) : void
      {
         var _local_2:Tank = _arg_1.tank;
         this.higijaky().zolycoz(_local_2);
         delete this.tov[_local_2];
      }
      
      private function qoc(_arg_1:Rujina) : void
      {
         if(_arg_1.isLocal)
         {
            this.gaz = _arg_1.tank;
            this.myb.show();
            this.zunudaka.visible = true;
         }
      }
      
      private function vavydisy(_arg_1:Tujat) : void
      {
         if(_arg_1.tank == this.gaz)
         {
            this.gaz = null;
         }
      }
      
      private function fabademyl(_arg_1:Vopetycy) : void
      {
         this.higijaky().zolycoz(_arg_1.cuzipin);
      }
      
      private function higijaky() : Soja
      {
         return this.fivocad;
      }
      
      private function wuwi(_arg_1:Object) : void
      {
         var _local_2:TeamDMTargetEvaluator = null;
         var _local_3:BattleTeam = Qeluzajy(_arg_1).tank.tankData.teamType;
         for each(_local_2 in this.qedohat)
         {
            _local_2.bobaku(_local_3);
         }
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         var _local_1:IModelService = IModelService(OSGi.getInstance().getService(IModelService));
         this.rif = Model.object;
         this.seki = Tupebeput(OSGi.getInstance().getService(Tupebeput));
         this.inventoryModel = Bibeza(_local_1.getModelsByInterface(Bibeza)[0]);
         this.cigypy = new Vector.<Tenonykaj>();
         this.tov = new Dictionary();
         this.dejysa.bijoja();
         this.jidih = new Lubeno();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         this.nigur();
         this.byqow();
         this.jutufi = new Kyroqu(cicefuqo,getInitParam().resources);
         this.fivocad = new Soja();
         this.rero = new Ruwuv(battleService.kyfyrid,getInitParam().rero);
      }
      
      private function nigur() : void
      {
         this.qedohat = new Vector.<TeamDMTargetEvaluator>();
         var _local_1:Nubiwywyg = new Nubiwywyg();
         battleService.lipa(_local_1);
         this.qedohat.push(_local_1);
         var _local_2:Mowupime = new Mowupime();
         battleService.nygeq(_local_2);
         this.qedohat.push(_local_2);
         var _local_3:Hysuwes = new Hysuwes();
         battleService.cocuk(_local_3);
         this.qedohat.push(_local_3);
         var _local_4:Tevozyta = new Tevozyta();
         battleService.sipase(_local_4);
         this.qedohat.push(_local_4);
      }
      
      private function byqow() : void
      {
         var _local_1:Wynid = null;
         var _local_2:Pyni = null;
         var _local_3:Tenonykaj = null;
         var _local_4:Lubeno = null;
         var _local_5:String = null;
         this.myb = new Quwuhyby(battleService.getBattleScene3D().cewubu());
         battleService.getBattleScene3D().toqok(this.myb,0);
         var _local_6:Vector.<Pyni> = new Vector.<Pyni>();
         for each(_local_1 in getInitParam().points)
         {
            _local_2 = this.niwimo(_local_1);
            this.quga[_local_1.id] = _local_2;
            battleService.getBattleRunner().wop(_local_2);
            _local_6.push(_local_2);
            _local_3 = new Tenonykaj(_local_2.getPosition(),BattleUtils.pamo(getInitParam().cevyqy),BattleUtils.pamo(getInitParam().sepo),_local_1.id,this,battleService.getBattleRunner().soc(),getInitParam().pih);
            this.cigypy.push(_local_3);
            battleService.getBattleRunner().wapicyjim(_local_3);
            this.myb.nonobili(new Huzyd(_local_2));
            _local_4 = this.bimy();
            for each(_local_5 in _local_1.myhybumo)
            {
               _local_4.add(_local_5,_local_1.id);
            }
         }
         this.zunudaka = new Pyqirowad(_local_6);
         this.zunudaka.visible = false;
         kyb.fez().addChild(this.zunudaka);
         battleService.getBattleScene3D().toqok(this.zunudaka,0);
         this.seki.fujilo(this.zunudaka);
         if(battleInfoService.isSpectatorMode())
         {
            this.myb.show();
            this.zunudaka.visible = true;
         }
      }
      
      private function niwimo(_arg_1:Wynid) : Pyni
      {
         var _local_2:Fafit = new Fafit(_arg_1.name,battleService.getBattleScene3D(),getInitParam().resources);
         var _local_3:Vector3 = BattleUtils.haq(_arg_1.position);
         var _local_4:Linebaz = getInitParam().rero;
         var _local_5:Jybupe = new Jybupe(battleService,_local_4.pointScoreIncreasingSound.sound,_local_4.pointScoreDecreasingSound.sound);
         var _local_6:Pyni = new Pyni(_arg_1.id,_arg_1.name,_local_3,battleService,this,_local_5,_local_2);
         _local_6.jesydyq = _arg_1.myhybumo.length;
         _local_6.jojate(_arg_1.state);
         _local_6.weg(_arg_1.score,_arg_1.vahe);
         return _local_6;
      }
      
      private function bimy() : Lubeno
      {
         return this.jidih;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         this.qedohat = null;
         battleService.lipa(null);
         battleService.nygeq(null);
         battleService.cocuk(null);
         battleService.sipase(null);
         this.dejysa.ciqon();
         this.zunudaka.removeFromParent();
         this.zunudaka = null;
         this.tov = null;
      }
      
      [Obfuscation(rename="false")]
      public function tankEnteredPointZone(_arg_1:int, _arg_2:String) : void
      {
         var _local_3:Pyni = this.quga[_arg_1];
         ++_local_3.jesydyq;
         var _local_4:Tank = this.tov[_arg_2];
         if(_local_4 != null)
         {
            this.jozagirij(_arg_1,_local_4,this.jutufi);
         }
         else
         {
            this.bimy().add(_arg_2,_arg_1);
         }
      }
      
      private function jozagirij(_arg_1:int, _arg_2:Tank, _arg_3:Kyroqu) : void
      {
         var _local_4:Tifufip = Tifufip(battleService.getObjectPool().getObject(Tifufip));
         var _local_5:Pyni = this.quga[_arg_1];
         var _local_6:Vector3 = new Vector3();
         _local_5.readPosition(_local_6);
         _local_4.init(_arg_2.bij().rocipaga(),_local_6,_arg_3.kekapa(_arg_2.tankData.teamType),battleService.paluhu());
         this.higijaky().vakydiqip(_arg_2,_local_4);
      }
      
      [Obfuscation(rename="false")]
      public function tankLeftPointZone(_arg_1:int, _arg_2:String) : void
      {
         var _local_3:Pyni = this.quga[_arg_1];
         --_local_3.jesydyq;
         var _local_4:Tank = this.tov[_arg_2];
         if(_local_4 != null)
         {
            this.higijaky().zolycoz(_local_4);
         }
         else
         {
            this.bimy().remove(_arg_2);
         }
      }
      
      public function hapyqyv() : BattleType
      {
         return BattleType.rovicateto;
      }
      
      public function gemokir() : Zer
      {
         var _local_1:Tevozyta = new Tevozyta();
         this.qedohat.push(_local_1);
         return _local_1;
      }
      
      [Obfuscation(rename="false")]
      public function setPointProgress(_arg_1:int, _arg_2:Number, _arg_3:Number) : void
      {
         var _local_4:Pyni = this.quga[_arg_1];
         _local_4.weg(_arg_2,_arg_3);
      }
      
      [Obfuscation(rename="false")]
      public function setPointState(_arg_1:int, _arg_2:Zyjova) : void
      {
         var _local_3:Pyni = this.quga[_arg_1];
         var _local_4:Zyjova = _local_3.poforiv();
         _local_3.jojate(_arg_2);
         if(_arg_2 == Zyjova.NEUTRAL)
         {
            this.byry(_local_3,_local_4);
         }
         else
         {
            this.meqemus(_local_3);
         }
      }
      
      private function byry(_arg_1:Pyni, _arg_2:Zyjova) : void
      {
         var _local_3:BattleTeam = lodu(_arg_2);
         var _local_4:Soca = this.wekewi(_local_3);
         var _local_5:String = _local_4.getMessage(_arg_1.getName());
         this.seki.tagew(_local_4.color,_local_5);
         this.seki.qedupoj(_local_5);
         this.lonevefen().kope(_local_3);
      }
      
      private function wekewi(_arg_1:BattleTeam) : Soca
      {
         if(this.gaz == null)
         {
            return Mehy.dikabad(_arg_1);
         }
         if(_arg_1 == this.gaz.tankData.teamType)
         {
            return Mehy.zipa;
         }
         return Mehy.nuwuwery;
      }
      
      private function meqemus(_arg_1:Pyni) : void
      {
         var _local_2:BattleTeam = lodu(_arg_1.poforiv());
         var _local_3:Soca = this.mygupu(_local_2);
         var _local_4:String = _local_3.getMessage(_arg_1.getName());
         this.seki.tagew(_local_3.color,_local_4);
         this.seki.qedupoj(_local_4);
         this.lonevefen().tyvyzop(_local_2);
      }
      
      private function mygupu(_arg_1:BattleTeam) : Soca
      {
         if(this.gaz == null)
         {
            return Mehy.mygupu(_arg_1);
         }
         if(_arg_1 == this.gaz.tankData.teamType)
         {
            return Mehy.wyh;
         }
         return Mehy.rucybedu;
      }
      
      private function fomiha() : void
      {
         var _local_1:Pyni = null;
         for each(_local_1 in this.quga)
         {
            _local_1.reset();
         }
      }
      
      [Obfuscation(rename="false")]
      public function pointCaptureStarted(_arg_1:BattleTeam) : void
      {
         this.lonevefen().kumyqike(_arg_1);
      }
      
      [Obfuscation(rename="false")]
      public function pointCaptureStopped(_arg_1:BattleTeam) : void
      {
         this.lonevefen().muqyjukin(_arg_1);
      }
      
      private function lonevefen() : Ruwuv
      {
         return this.rero;
      }
      
      public function hikime(_arg_1:int) : void
      {
         this.dejysa.dispatchEvent(Vegepos.figahe);
         Network(OSGi.getInstance().getService(INetworker)).send("battle;tank_capturing_point;" + _arg_1);
      }
      
      public function fyf(_arg_1:int) : void
      {
         this.dejysa.dispatchEvent(Vegepos.figahe);
         Network(OSGi.getInstance().getService(INetworker)).send("battle;tank_leave_capturing_point;" + _arg_1);
      }
      
      public function riwasumod(_arg_1:int) : void
      {
         this.inventoryModel.wazetap(Johad.MINE,Gazib.dyzupoqy,true);
      }
      
      public function vis(_arg_1:int) : void
      {
         this.inventoryModel.wazetap(Johad.MINE,Gazib.dyzupoqy,false);
      }
      
      private function necyjiw(_arg_1:Object) : void
      {
         this.reset();
      }
      
      private function reset() : void
      {
         this.fomiha();
         this.vopevaged();
      }
      
      private function vopevaged() : void
      {
         var _local_1:Tenonykaj = null;
         for each(_local_1 in this.cigypy)
         {
            _local_1.reset();
         }
      }
      
      public function ces(_arg_1:int) : void
      {
         var _local_2:int = _arg_1;
      }
      
      [Obfuscation(rename="false")]
      public function vyjo() : void
      {
         this.reset();
      }
   }
}

