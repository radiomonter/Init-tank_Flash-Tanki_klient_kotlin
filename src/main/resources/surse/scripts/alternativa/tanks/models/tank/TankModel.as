package alternativa.tanks.models.tank
{
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   import alternativa.model.IObjectLoadListener;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.register.ClientClass;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.BattleRunner;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Mawi;
   import alternativa.tanks.battle.events.Qeluzajy;
   import alternativa.tanks.battle.events.Qigawi;
   import alternativa.tanks.battle.events.Roteteh;
   import alternativa.tanks.battle.events.Rujina;
   import alternativa.tanks.battle.events.Senyveky;
   import alternativa.tanks.battle.events.Tujat;
   import alternativa.tanks.battle.events.Vibu;
   import alternativa.tanks.battle.events.Vovakopy;
   import alternativa.tanks.battle.events.Zolydys;
   import alternativa.tanks.battle.objects.tank.Budukaby;
   import alternativa.tanks.battle.objects.tank.ClientTankState;
   import alternativa.tanks.battle.objects.tank.Fufyzyky;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.TankControlLockBits;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.battle.objects.tank.tankskin.TankSkin;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   import alternativa.tanks.display.usertitle.TitleConfigFlags;
   import alternativa.tanks.display.usertitle.UserTitle;
   import alternativa.tanks.model.panel.IPanel;
   import alternativa.tanks.model.panel.PanelModel;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.battle.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battle.gui.Tupebeput;
   import alternativa.tanks.models.battlefield.Ceneq;
   import alternativa.tanks.models.tank.spawn.Nava;
   import alternativa.tanks.models.tank.spawn.Pipujic;
   import alternativa.tanks.models.tank.ultimate.IUltimateModel;
   import alternativa.tanks.models.tank.ultimate.UltimateModel;
   import alternativa.tanks.models.weapon.IWeaponModel;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.services.initialeffects.Fymydacog;
   import alternativa.tanks.services.initialeffects.IInitialEffectsService;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.types.Long;
   import com.alternativaplatform.projects.tanks.client.commons.types.DeathReason;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankParts;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankState;
   import com.alternativaplatform.projects.tanks.client.models.tank.ClientTank;
   import com.alternativaplatform.projects.tanks.client.models.tank.TankResources;
   import com.alternativaplatform.projects.tanks.client.models.tank.TankSoundScheme;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import fominskiy.server.models.premium.BattlePremiumService;
   import fominskiy.server.models.premium.IBattlePremiumService;
   import fominskiy.tanks.WeaponsManager;
   import obfuscation.bude.BattleTeam;
   import obfuscation.bylucaliv.Bile;
   import obfuscation.cawutare.Cej;
   import obfuscation.cawutare.Kipycuzed;
   import obfuscation.cawutare.Muguv;
   import obfuscation.cawutare.Qohygyd;
   import obfuscation.cawutare.Tane;
   import obfuscation.cawutare.Vicytiwil;
   import obfuscation.cetij.Meqisyn;
   import obfuscation.cetij.Vopetycy;
   import obfuscation.fafiqu.Kyqifav;
   import obfuscation.fafiqu.Nyf;
   import obfuscation.fafiqu.Vamobanoc;
   import obfuscation.fib.Mygopete;
   import obfuscation.fib.Wusu;
   import obfuscation.fib.Zuly;
   import obfuscation.garud.Giwomo;
   import obfuscation.garud.Hoqeg;
   import obfuscation.garud.Quhob;
   import obfuscation.garud.Rib;
   import obfuscation.garud.Rocuva;
   import obfuscation.garud.Zejotuwo;
   import obfuscation.gihyvy.Jebinup;
   import obfuscation.gihyvy.Zynyjah;
   import obfuscation.joraky.Kyfaciki;
   import obfuscation.joraky.Pywy;
   import obfuscation.kofen.Vector3d;
   import obfuscation.kyre.Myw;
   import obfuscation.likohot.Niqyvu;
   import obfuscation.likohot.Pahu;
   import obfuscation.mobakobup.Cymone;
   import obfuscation.modo.Bibeza;
   import obfuscation.modo.Gazib;
   import obfuscation.modo.Johad;
   import obfuscation.qusen.Pukimule;
   import obfuscation.qusen.Sunyva;
   import obfuscation.rofa.Maga;
   import obfuscation.sosa.Zaq;
   import obfuscation.wokogi.Gelifo;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import projects.tanks.client.battlefield.types.DamageType;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class TankModel extends Jebinup implements Zynyjah, Zejotuwo, Quhob, BattleEventListener, IObjectLoadListener, ITankModel
   {
      
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleUserInfoService:BattleUserInfoService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var derys:TankUsersRegistry;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var cotufulem:IInitialEffectsService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const cywogy:Number = 0;
      
      private static const nikarov:Number = 135;
      
      private static const cud:Vector3d = new Vector3d(0,0,0);
      
      private static const hohurez:int = 5;
      
      private static const jugicibap:Number = 1250;
      
      private static const dyquw:Number = 80000;
      
      private static const lavevige:int = 4000;
      
      private static const nidepece:Number = -10000;
      
      private static const luzipor:int = 3000;
      
      private var dejysa:Baba;
      
      private var ryjanitaq:Bez;
      
      private var lat:Dyh;
      
      private var hahas:Number = 7000;
      
      private var hikytuka:Number = 7050;
      
      private var bekufoly:int;
      
      private var jedu:Boolean;
      
      public var jeneto:int;
      
      private var tybop:Dictionary;
      
      private var nyvulosys:Dictionary;
      
      private var rojaby:IModelService;
      
      private var battlefield:BattlefieldModel;
      
      private var gui:Tupebeput;
      
      private var inventoryModel:Bibeza;
      
      private var nosaj:Ceneq;
      
      public var metegy:Num;
      
      private var gyta:int;
      
      private var nyhes:Boolean = true;
      
      private var buwobeg:int;
      
      private var tipoju:Situs;
      
      public var lyry:TankParts;
      
      private var panelModel:PanelModel;
      
      private var raguzohuf:Giwomo;
      
      private var hyv:Zuly;
      
      private var wydajom:Kyvuqufu;
      
      private var soqe:Pipujic;
      
      private var lefu:Bile;
      
      private var lizure:Bamapylaq;
      
      private var loz:int;
      
      private var qyvy:int;
      
      private var rylykyve:int;
      
      private var zep:int;
      
      private var sejecemovi:int;
      
      private var qorevokek:Kumy = new Kumy();
      
      private const zecipuqop:Pukimule = new Pukimule(new Vector3d(0,0,0),0,new Vector3d(0,0,0),new Vector3d(0,0,0),new Vector3d(0,0,0));
      
      private const pame:Sunyva = new Sunyva(0,0);
      
      private const tov:Dictionary = new Dictionary();
      
      public var tankDataById:Dictionary = new Dictionary();
      
      private var puvyguv:Vector3d = new Vector3d(0,0,0);
      
      private var biny:Vector3d = new Vector3d(0,0,0);
      
      private var picije:Vector3d = new Vector3d(0,0,0);
      
      private var jazumuj:Vector3d = new Vector3d(0,0,0);
      
      private const tysonivo:Quaternion = new Quaternion();
      
      private const dovy:Quaternion = new Quaternion();
      
      private const dovol:Vector3 = new Vector3();
      
      private var point:Vector3 = new Vector3();
      
      private var susenisac:Vector3 = new Vector3();
      
      private var wukaci:Vector3 = new Vector3();
      
      private var fawevotoj:RayHit = new RayHit();
      
      private var raqiw:Pukimule = new Pukimule(new Vector3d(0,0,0),0,new Vector3d(0,0,0),new Vector3d(0,0,0),new Vector3d(0,0,0));
      
      public function TankModel()
      {
         super();
         this.lefu = new Bile();
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Vovakopy,this.byzac);
         this.dejysa.jikina(Qigawi,this.necyjiw);
         this.dejysa.jikina(Zolydys,this.onSettingsAccepted);
         this.dejysa.bijoja();
         this.tipoju = new Situs();
         OSGi.getInstance().registerService(ITankModel,this);
         this.panelModel = PanelModel(OSGi.getInstance().getService(IPanel));
      }
      
      private static function pyretyh(_arg_1:UserTitle, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:BattleTeam, _arg_6:int) : void
      {
         _arg_1.setHealth(_arg_2);
         _arg_1.setLabelText(_arg_3);
         _arg_1.setRank(_arg_4);
         _arg_1.setTeamType(_arg_5);
         _arg_1.setConfiguration(_arg_6);
      }
      
      private static function vosofoze(_arg_1:TankParts) : Maga
      {
         var _local_2:Zaq = Zaq(_arg_1.hullObject.adapt(Zaq));
         var _local_3:Sound = _local_2.cazasu().engineIdleSound.sound;
         var _local_4:Sound = _local_2.cazasu().engineStartMovingSound.sound;
         var _local_5:Sound = _local_2.cazasu().engineMovingSound.sound;
         var _local_6:Sound = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,242699))).sound;
         return new Maga(_local_3,_local_4,_local_5,_local_6);
      }
      
      private static function hysapeni(_arg_1:Rocuva) : void
      {
         _arg_1.mitug(settingsService.inverseBackDriving);
      }
      
      private static function jocu(_arg_1:Num) : void
      {
         var _local_2:int = 0;
         var _local_3:ITankModel = null;
         var _local_4:UserTitle = null;
         var _local_5:Fymydacog = null;
         var _local_6:int = 0;
         var _local_7:int = 0;
         var _local_8:Vector.<Fymydacog> = cotufulem.pes(_arg_1.user.id);
         if(_local_8 != null)
         {
            _local_2 = getTimer();
            _local_4 = _arg_1.tank.title;
            for each(_local_5 in _local_8)
            {
               _local_6 = _local_2 - _local_5.vebica;
               _local_7 = _local_5.duration - _local_6;
               if(_local_7 > 0)
               {
                  _local_4.showIndicator(_local_5.effectId,_local_7,false,_local_5.effectLevel);
               }
            }
         }
      }
      
      public function objectLoaded(_arg_1:ClientObject) : void
      {
      }
      
      public function onTurretDirectionCorrection(_arg_1:Boolean) : void
      {
         var _local_2:Rib = Num.cimise.tank.sowiq();
         this.hymakesi(_local_2.getControl());
         this.lat.reset();
      }
      
      public function nowe() : void
      {
         battleService.getBattleRunner().wyqem(this.ryjanitaq);
         this.ryjanitaq.reset();
         battleService.getBattleRunner().wyqem(this.lat);
         this.lat.reset();
      }
      
      public function zevizisy(_arg_1:int) : void
      {
         this.hymakesi(_arg_1);
         this.lat.reset();
      }
      
      public function readyToSpawn(_arg_1:Tank) : void
      {
         if(_arg_1.tankData.local)
         {
            Mygopete(Num.cimise.user.getParams(Zuly)).handleReadyToSpawn();
         }
         else
         {
            Wusu(_arg_1.tankData.user.getParams(Zuly)).handleReadyToSpawn();
         }
      }
      
      private function dydikigi() : void
      {
         var _local_1:Pahu = Pahu(OSGi.getInstance().getService(Pahu));
         _local_1.dydikigi();
      }
      
      private function hymakesi(_arg_1:int) : void
      {
         var _local_2:Rib = this.sowiq(Num.cimise.user);
         var _local_3:Tank = Num.cimise.tank;
         this.tujucolo(_arg_1);
         this.pame.angle = _local_2.jesenebo();
         this.pame.control = _arg_1;
         server.jabazep(battleService.getBattleRunner().hulivyjam(),this.pame,_local_3.incarnation);
      }
      
      [Obfuscation(rename="false")]
      public function rotateTurret(_arg_1:ClientObject, _arg_2:Sunyva) : void
      {
         this.dabek(_arg_1,_arg_2.angle,_arg_2.control);
      }
      
      [Obfuscation(rename="false")]
      public function movementControl(_arg_1:ClientObject, _arg_2:int) : void
      {
         this.wopivoze(_arg_1).rolo(_arg_2);
      }
      
      [Obfuscation(rename="false")]
      public function moveAndSetTurretState(_arg_1:ClientObject, _arg_2:Pukimule, _arg_3:Number) : void
      {
         this.move(_arg_1,_arg_2);
         this.dabek(_arg_1,_arg_3,_arg_2.control);
      }
      
      public function gakawa(_arg_1:ClientObject, _arg_2:Vector3d, _arg_3:Vector3d, _arg_4:Vector3d, _arg_5:Vector3d, _arg_6:int) : void
      {
         var _local_7:Tank = this.getTankData(_arg_1).tank;
         if(_local_7 != null)
         {
            if(BattleUtils.gegigerod(_arg_2) && BattleUtils.gegigerod(_arg_3) && BattleUtils.gegigerod(_arg_4) && BattleUtils.gegigerod(_arg_5))
            {
               _local_7.lymyfedyh(_arg_2,_arg_3,_arg_4,_arg_5);
            }
            this.wopivoze(_arg_1).rolo(_arg_6);
         }
      }
      
      public function wopivoze(_arg_1:ClientObject) : Giwomo
      {
         return Giwomo(_arg_1.getParams(Giwomo));
      }
      
      private function dabek(_arg_1:ClientObject, _arg_2:Number, _arg_3:int) : void
      {
         var _local_4:Rib = null;
         var _local_5:Tank = this.getTankData(_arg_1).tank;
         if(_local_5 != null)
         {
            _local_4 = _local_5.sowiq();
            _local_4.kasasyta(_arg_2);
            _local_4.rolo(_arg_3);
         }
      }
      
      private function tujucolo(_arg_1:int) : void
      {
         if(this.qyvy != _arg_1)
         {
            this.qyvy = _arg_1;
            this.dydikigi();
         }
      }
      
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
         this.lefu.objectUnloaded(_arg_1);
         this.lubub(_arg_1);
         this.nyhive(_arg_1);
         delete this.tankDataById[_arg_1.id];
         delete this.tov[_arg_1.id];
      }
      
      private function roqyweni(_arg_1:ClientObject) : void
      {
         var _local_2:Piqy = this.dyq(_arg_1);
         if(Boolean(_local_2))
         {
            battleService.getBattleRunner().bapucic(_local_2);
            _arg_1.removeParams(Piqy);
         }
      }
      
      private function lubub(_arg_1:ClientObject) : void
      {
         derys.removeUser(_arg_1);
         if(derys.latokurif() == 0)
         {
            battleUserInfoService.pucuke(this.tipoju);
         }
      }
      
      private function gipijage(retybe:Num) : void
      {
         try
         {
            this.dejysa.dispatchEvent(new Tujat(retybe.tank,retybe.local));
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function nyhive(_arg_1:ClientObject) : void
      {
         var _local_2:Tank = this.getTankData(_arg_1).tank;
         this.roqyweni(_arg_1);
         this.removeTankFromBattle(_local_2);
         this.tyfuvuly(_local_2);
         this.gipijage(_local_2.tankData);
         this.wet(_local_2);
         _local_2.destroy();
      }
      
      private function wet(_arg_1:Tank) : void
      {
         if(_arg_1.tankData.local)
         {
            Wigu(_arg_1.bebosaca().removeParams(Wigu)).close();
            Muguv(_arg_1.bebosaca().removeParams(Muguv)).close();
            Mygopete(_arg_1.bebosaca().getParams(Zuly)).close();
            Gyjohul(_arg_1.bebosaca().removeParams(Gyjohul)).close();
            Qohygyd(_arg_1.bebosaca().removeParams(Qohygyd)).close();
            Qemigofa.teamType = BattleTeam.NONE;
            Kipycuzed(_arg_1.bebosaca().removeParams(Kipycuzed)).close();
            Cej(_arg_1.bebosaca().removeParams(Cej)).close();
            this.wopivoze(_arg_1.bebosaca()).close();
            Niqyvu(OSGi.getInstance().getService(Pahu)).getPauseSupport().close();
            Vicytiwil(_arg_1.bebosaca().removeParams(Vicytiwil)).close();
            Tane(_arg_1.bebosaca().removeParams(Tane)).close();
            WeaponsManager.clearSFXModel(_arg_1.bebosaca());
            this.ryjanitaq = null;
            this.lat = null;
            this.metegy.tank = null;
            Num.cimise = null;
         }
      }
      
      public function hysa(_arg_1:String, _arg_2:String) : ClientObject
      {
         var _local_3:ClientClass = new ClientClass(_arg_1,null,_arg_2);
         return new ClientObject(_arg_1,_local_3,_arg_2,null);
      }
      
      public function initObject(_arg_1:ClientObject, _arg_2:String, _arg_3:Number, _arg_4:Number, _arg_5:TankSoundScheme, _arg_6:TankParts, _arg_7:TankResources, _arg_8:Number, _arg_9:Number, _arg_10:Number, _arg_11:Number, _arg_12:String = null, _arg_13:int = 0, _arg_14:String = null) : void
      {
         if(this.rojaby == null)
         {
            this.boryho();
         }
         this.registerUser(_arg_1);
         _arg_1.putParams(Bamapylaq,new Bamapylaq(battleUserInfoService.kiq(_arg_12),battleUserInfoService.fotoqasy(_arg_12),true,battleUserInfoService.dijolycy(_arg_12)));
         this.createData(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6,_arg_7,_arg_8,_arg_9,_arg_10,_arg_11,_arg_12,_arg_13,_arg_14);
      }
      
      private function registerUser(_arg_1:ClientObject) : void
      {
         derys.addUser(_arg_1);
         if(derys.latokurif() == 1)
         {
            battleUserInfoService.fugireza(this.tipoju);
         }
      }
      
      private function createData(_arg_1:ClientObject, _arg_2:String, _arg_3:Number, _arg_4:Number, _arg_5:TankSoundScheme, _arg_6:TankParts, _arg_7:TankResources, _arg_8:Number, _arg_9:Number, _arg_10:Number, _arg_11:Number, _arg_12:String = null, _arg_13:int = 0, _arg_14:String = null) : void
      {
         var _local_15:Num = new Num();
         _local_15.user = _arg_1;
         _local_15.userName = _arg_12 == null ? userPropertiesService.userName : _arg_12;
         _local_15.mass = _arg_3;
         _local_15.hull = this.hysa(_arg_12 + "_hull",_arg_12 + "_hull");
         _local_15.turret = WeaponsManager.getObjectFor(_arg_6.turretObject.name);
         WeaponsManager.pinomo(_arg_1,_local_15.turret,_arg_8,_arg_9,_arg_10,_arg_11);
         _local_15.turretObject = _arg_6.turretObject;
         _arg_1.putParams(TankModel,_local_15);
         this.tankDataById[_arg_1.id] = _local_15;
         Kyqifav(OSGi.getInstance().getService(Vamobanoc)).objectLoaded();
      }
      
      public function wihaga(_arg_1:ClientObject, _arg_2:ClientTank, _arg_3:TankParts) : void
      {
         var _local_4:Num = this.getTankData(_arg_1);
         _local_4.local = _arg_2.self;
         _local_4.pohamozu = _arg_2.tankSpecification;
         var _local_5:Rib = this.jyr(_local_4);
         var _local_6:Hoqeg = this.hak(_arg_1);
         var _local_7:UserTitle = this.necywidy(_local_4);
         _arg_1.putParams(UserTitle,_local_7);
         var _local_8:Weapon = this.vajo(_local_4);
         this.cusuz(_local_8,_local_4);
         var _local_9:Tank = this.createTank(_local_5,_local_6,_local_8,_local_4,_arg_3,_local_7);
         this.rozobol(_local_9);
         this.mehov(_local_9);
         this.zalo(_local_9);
         _local_4.tank = _local_9;
         _local_4.teamType = _arg_2.teamType;
         _local_4.incarnation = _arg_2.incarnationId;
         _local_4.user = _arg_1;
         if(_local_4.local)
         {
            this.metegy = _local_4;
            this.hob();
            this.suvapo(_local_4);
            _arg_1.putParams(Zuly,new Mygopete(_local_9));
            _local_9.hehunawud(new Budukaby(_local_9));
         }
         else
         {
            _arg_1.putParams(Zuly,new Wusu(_local_9));
            _local_9.hehunawud(new Fufyzyky(_local_9));
            this.pat(_arg_1);
         }
         this.lefu.objectLoadedPost(_arg_1);
         this.gace(_local_4,_arg_2.tankSpecification,true);
         this.jekowydov(_local_4);
         this.dejysa.dispatchEvent(new Rujina(_local_4.tank,_local_4.local));
         if(this.beqe(_arg_2))
         {
            this.cosebu(_local_4,_arg_2);
         }
         if(_local_4.local)
         {
            Niqyvu(OSGi.getInstance().getService(Pahu)).localTankLoaded();
            Gelifo(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModel(Long.getLong(1286074115,-176946994))).localTankLoaded(_arg_1);
            this.dydikigi();
         }
      }
      
      private function rozobol(_arg_1:Tank) : void
      {
         if(_arg_1.tankData.local)
         {
            Num.cimise = _arg_1.tankData;
         }
      }
      
      private function beqe(_arg_1:ClientTank) : Boolean
      {
         return _arg_1.tankState != null && _arg_1.health > 0;
      }
      
      private function hob() : void
      {
         this.dejysa.ciqon();
         this.dejysa.bijoja();
      }
      
      private function zalo(_arg_1:Tank) : void
      {
         var _local_2:DataUnitValidator = _arg_1.sodupocac();
         _arg_1.bebosaca().putParams(Wigu,new Wigu(_local_2));
      }
      
      private function mehov(_arg_1:Tank) : void
      {
         var _local_2:Giwomo = null;
         var _local_3:Rocuva = null;
         if(_arg_1.tankData.local)
         {
            _local_3 = new Rocuva(_arg_1,this);
            _local_3.lock(TankControlLockBits.DEAD);
            hysapeni(_local_3);
            _local_2 = _local_3;
            _arg_1.tankData.user.putParams(Cej,new Cej(_local_3));
         }
         else
         {
            _local_2 = new Giwomo(_arg_1);
            _local_2.lock(TankControlLockBits.DEAD);
         }
         _arg_1.bebosaca().putParams(Giwomo,_local_2);
      }
      
      public function rusif(_arg_1:ClientObject, _arg_2:int) : void
      {
         this.wopivoze(_arg_1).lock(_arg_2);
         this.sowiq(_arg_1).lock(_arg_2);
      }
      
      public function lyli(_arg_1:ClientObject, _arg_2:int) : void
      {
         this.wopivoze(_arg_1).unlock(_arg_2);
         this.sowiq(_arg_1).unlock(_arg_2);
      }
      
      public function sowiq(_arg_1:ClientObject) : Rib
      {
         return Rib(_arg_1.getParams(Rib));
      }
      
      public function hak(_arg_1:ClientObject) : Hoqeg
      {
         return Hoqeg(_arg_1.getParams(Hoqeg));
      }
      
      private function pat(_arg_1:ClientObject) : void
      {
         var _local_2:Piqy = new Piqy(this.getTankData(_arg_1).tank,this.syt,4000,2000);
         _arg_1.putParams(Piqy,_local_2);
         battleService.getBattleRunner().wop(_local_2);
      }
      
      private function syt(_arg_1:ClientObject, _arg_2:Vector3d, _arg_3:Vector3d) : void
      {
         this.gakawa(_arg_1,_arg_2,_arg_3,cud,cud,0);
         this.getTankData(_arg_1).tank.qiniwu().saveState();
      }
      
      private function jekowydov(_arg_1:Num) : void
      {
         var _local_2:Pywy = Pywy(OSGi.getInstance().getService(Pywy));
         if(!_local_2.isLoaded(_arg_1.userName))
         {
            Kyfaciki(OSGi.getInstance().getService(Tupebeput)).userConnect(_local_2.getShortUserInfo(_arg_1.userName));
         }
      }
      
      private function jyr(_arg_1:Num) : Rib
      {
         var _local_2:Rib = null;
         var _local_3:Hoqeg = null;
         if(_arg_1.local)
         {
            _local_3 = this.hoheryh().hak(_arg_1);
            _local_2 = _local_3.sowiq();
            _local_2.setListener(this);
            _arg_1.user.putParams(Hoqeg,_local_3);
         }
         else
         {
            _local_2 = new Rib(true,this,_arg_1);
         }
         _arg_1.user.putParams(Rib,_local_2);
         return _local_2;
      }
      
      private function vajo(_arg_1:Num) : Weapon
      {
         var _local_2:IWeaponModel = BattleController.lymyb(_arg_1.turret);
         if(_arg_1.local)
         {
            return _local_2.kyqyqemy(_arg_1.user);
         }
         return _local_2.zigaguj(_arg_1.user);
      }
      
      private function cusuz(_arg_1:Weapon, _arg_2:Num) : void
      {
         if(_arg_2.local)
         {
            _arg_2.user.putParams(Hytaqe,new Tigucuq(_arg_1));
         }
         else
         {
            _arg_2.user.putParams(Hytaqe,new Kaqydaho(_arg_1));
         }
      }
      
      public function rijac() : void
      {
         var _local_4:Num = null;
         var _local_1:ClientObject = null;
         var _local_2:ITankModel = null;
         var _local_3:Tank = null;
         for each(_local_1 in derys.wakosibi())
         {
            _local_4 = this.getTankData(_local_1);
            if(_local_4 != Num.cimise)
            {
               _local_3 = _local_4.tank;
               if(_local_3 != null)
               {
                  this.rugif(_local_4);
                  jocu(_local_4);
               }
            }
         }
      }
      
      public function rugif(_arg_1:Num) : void
      {
         var _local_2:int = 0;
         var _local_3:Bamapylaq = null;
         var _local_4:Tank = null;
         var _local_5:Tank = null;
         if(Num.cimise != null)
         {
            _local_5 = Num.cimise.tank;
            if(_local_5.tankData.teamType != null)
            {
               _local_2 = TitleConfigFlags.LABEL | TitleConfigFlags.EFFECTS;
               _local_3 = this.ridaha(_arg_1.user);
               _local_4 = _arg_1.tank;
               if(Num.cimise != null && _local_4.fiveqejav(_local_5.tankData.teamType))
               {
                  _local_2 |= TitleConfigFlags.HEALTH;
               }
               pyretyh(_arg_1.tank.title,_local_4.tankData.health,_local_3.name,_local_3.rank,_local_4.tankData.teamType,_local_2);
            }
         }
         if(battleInfoService.isSpectatorMode())
         {
            _local_2 = TitleConfigFlags.LABEL | TitleConfigFlags.EFFECTS | TitleConfigFlags.HEALTH;
            _local_3 = this.ridaha(_arg_1.user);
            _local_4 = _arg_1.tank;
            pyretyh(_arg_1.tank.title,_local_4.tankData.health,_local_3.name,_local_3.rank,_local_4.tankData.teamType,_local_2);
         }
      }
      
      private function necywidy(_arg_1:Num) : UserTitle
      {
         var _local_2:UserTitle = null;
         var _local_3:Bamapylaq = null;
         var _local_4:BattleScene3D = battleService.getBattleScene3D();
         if(_arg_1.local)
         {
            _local_2 = new UserTitle(cywogy,_local_4.vujez(),10000,true);
            _local_3 = this.ridaha(_arg_1.user);
            _local_2.setRank(_local_3.rank);
            _local_2.setLabelText(_local_3.name);
            _local_2.setConfiguration(TitleConfigFlags.HEALTH | TitleConfigFlags.WEAPON | TitleConfigFlags.EFFECTS);
         }
         else
         {
            _local_2 = new UserTitle(nikarov,_local_4.jidokezyp(),10000,false);
            _local_2.setSuspicious(battleUserInfoService.suwiq(_arg_1.userName));
            _local_2.setPremium(BattlePremiumService(OSGi.getInstance().getService(IBattlePremiumService)).hasUserPremium(_arg_1.userName));
         }
         return _local_2;
      }
      
      public function getTitle(_arg_1:ClientObject) : UserTitle
      {
         return UserTitle(_arg_1.getParams(UserTitle));
      }
      
      public function ridaha(_arg_1:ClientObject) : Bamapylaq
      {
         return Bamapylaq(_arg_1.getParams(Bamapylaq));
      }
      
      public function activateTank(_arg_1:ClientObject) : void
      {
         var _local_2:Num = this.getTankData(_arg_1);
         if(_local_2 == null || _local_2.tank == null)
         {
            return;
         }
         _local_2.tank.bagubado();
         this.sihobi(_arg_1).temirih();
         this.sihobi(_arg_1).fygojamo(TankControlLockBits.DEAD | TankControlLockBits.DISABLED);
         if(_local_2.local)
         {
            _local_2.tank.padabanu(_local_2.tank.wupylapen() | Myw.kyrupecan);
            this.dejysa.dispatchEvent(new Qeluzajy(_local_2.tank));
         }
         this.dejysa.dispatchEvent(new Roteteh(_local_2.tank));
         UltimateModel(OSGi.getInstance().getService(IUltimateModel)).onTankSpawn(_local_2);
         this.tyfuvuly(_local_2.tank);
      }
      
      public function sihobi(_arg_1:ClientObject) : Hytaqe
      {
         return Hytaqe(_arg_1.getParams(Hytaqe));
      }
      
      public function setTemperature(_arg_1:ClientObject, _arg_2:Number) : void
      {
         var _local_3:Num = this.getTankData(_arg_1);
         if(_local_3 == null || _local_3.tank == null)
         {
            return;
         }
         this.lulowic(_local_3.tank,_arg_2);
      }
      
      public function getTankData(_arg_1:ClientObject) : Num
      {
         if(_arg_1 == null)
         {
            return null;
         }
         return Num(_arg_1.getParams(TankModel));
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      public function move(_arg_1:ClientObject, _arg_2:Pukimule) : void
      {
         this.gec(_arg_1,_arg_2);
         this.mevavil(_arg_1,_arg_2);
      }
      
      private function mehy(_arg_1:ClientObject, _arg_2:Pukimule) : void
      {
         var _local_3:Body = null;
         var _local_4:Number = NaN;
         var _local_5:Tank = this.getTankData(_arg_1).tank;
         if(_local_5 != null)
         {
            _local_3 = _local_5.qiniwu();
            _local_4 = 0.5;
            this.qunacu(_local_4,_local_3.state.position,_arg_2.position,_arg_2.position);
            this.qunacu(_local_4,_local_3.state.velocity,_arg_2.linearVelocity,_arg_2.linearVelocity);
            this.qunacu(_local_4,_local_3.state.angularVelocity,_arg_2.angularVelocity,_arg_2.angularVelocity);
            this.rajedemu(_local_4,_local_3.state.orientation,_arg_2.orientation,_arg_2.orientation);
         }
      }
      
      private function mevavil(_arg_1:ClientObject, _arg_2:Pukimule) : void
      {
         this.gakawa(_arg_1,_arg_2.position,_arg_2.orientation,_arg_2.linearVelocity,_arg_2.angularVelocity,_arg_2.control);
      }
      
      private function gec(_arg_1:ClientObject, _arg_2:Pukimule) : void
      {
         var _local_3:Piqy = this.dyq(_arg_1);
         _local_3.vun(_arg_2.position,_arg_2.orientation);
         this.mehy(_arg_1,_arg_2);
      }
      
      public function dyq(_arg_1:ClientObject) : Piqy
      {
         return Piqy(_arg_1.getParams(Piqy));
      }
      
      private function qunacu(_arg_1:Number, _arg_2:Vector3, _arg_3:Vector3d, _arg_4:Vector3d) : void
      {
         _arg_4.x = _arg_2.x + (_arg_3.x - _arg_2.x) * _arg_1;
         _arg_4.y = _arg_2.y + (_arg_3.y - _arg_2.y) * _arg_1;
         _arg_4.z = _arg_2.z + (_arg_3.z - _arg_2.z) * _arg_1;
      }
      
      private function rajedemu(_arg_1:Number, _arg_2:Quaternion, _arg_3:Vector3d, _arg_4:Vector3d) : void
      {
         this.tysonivo.setFromEulerAnglesXYZ(_arg_3.x,_arg_3.y,_arg_3.z);
         this.dovy.slerp(_arg_2,this.tysonivo,_arg_1);
         this.dovy.getEulerAngles(this.dovol);
         _arg_4.x = this.dovol.x;
         _arg_4.y = this.dovol.y;
         _arg_4.z = this.dovol.z;
      }
      
      public function zugylu(_arg_1:Tank) : void
      {
         var _local_2:Dictionary = battleService.paluhu();
         _local_2[_arg_1.bij().qenokeru()] = true;
         _local_2[_arg_1.bij().repijumu()] = true;
      }
      
      private function tyfuvuly(_arg_1:Tank) : void
      {
         var _local_2:Dictionary = battleService.paluhu();
         delete _local_2[_arg_1.bij().qenokeru()];
         delete _local_2[_arg_1.bij().repijumu()];
      }
      
      public function dunym(_arg_1:Tank) : void
      {
         this.tov[_arg_1.tankData.userName] = _arg_1;
         _arg_1.bydehim(BattlefieldModel(OSGi.getInstance().getService(BattleService)));
         this.dejysa.dispatchEvent(new Senyveky(_arg_1,_arg_1.tankData.local));
      }
      
      public function removeTankFromBattle(_arg_1:Tank) : void
      {
         if(Boolean(this.tov[_arg_1.bebosaca().id]))
         {
            delete this.tov[_arg_1.bebosaca().id];
            _arg_1.hucagy();
            battleEventDispatcher.dispatchEvent(new Mawi(_arg_1));
         }
      }
      
      private function byzac(_arg_1:Vovakopy) : void
      {
         this.bojy();
      }
      
      private function bojy() : void
      {
         var _local_1:ClientObject = null;
         var _local_2:Tank = null;
         for each(_local_2 in this.tov)
         {
            if(_local_2 != null)
            {
               _local_2.disable();
               this.rusif(_local_2.bebosaca(),TankControlLockBits.DISABLED);
               _local_2.tankData.enabled = false;
               this.sihobi(_local_2.bebosaca()).covymyf(TankControlLockBits.DISABLED,false);
            }
         }
      }
      
      private function necyjiw(_arg_1:Qigawi) : void
      {
         var _local_2:ClientObject = null;
         var _local_3:Tank = null;
         for each(_local_3 in this.tov)
         {
            this.removeTankFromBattle(_local_3);
         }
      }
      
      public function prepareToSpawn(_arg_1:ClientObject, _arg_2:Vector3d, _arg_3:Vector3d) : void
      {
         if(this.metegy != null && _arg_1 == this.metegy.user)
         {
            this.wydajom.nocyryl(_arg_2,_arg_3);
            this.rer();
            this.soqe = new Pipujic(battleService.nepojinig(),object);
            battleService.getBattleRunner().wop(this.soqe);
         }
      }
      
      public function setReadyToPlace() : void
      {
         this.rer();
         server.setReadyToPlace();
      }
      
      private function rer() : void
      {
         if(Boolean(this.soqe))
         {
            battleService.getBattleRunner().bapucic(this.soqe);
            this.soqe = null;
         }
      }
      
      public function spawn(_arg_1:ClientObject, _arg_2:TankSpecification, _arg_3:BattleTeam, _arg_4:Vector3d, _arg_5:Vector3d, _arg_6:int, _arg_7:int) : void
      {
         var _local_8:int = 0;
         var _local_9:Piqy = null;
         var _local_10:Num = this.getTankData(_arg_1);
         if(_local_10.local)
         {
            Qemigofa.teamType = _arg_3;
         }
         _local_10.enabled = true;
         _local_10.incarnation = _arg_7;
         _local_10.teamType = _arg_3;
         var _local_11:Tank = _local_10.tank;
         this.removeTankFromBattle(_local_11);
         _local_11.spawn(_arg_3,_arg_7);
         _local_11.jafipefy();
         this.poqosirut(_local_10,_arg_6);
         this.lyli(_arg_1,TankControlLockBits.DEAD | TankControlLockBits.DISABLED);
         _local_8 = !this.ridaha(_local_10.user).isLocal ? int(0) : int(this.wopivoze(_arg_1).ligirom());
         this.gakawa(_local_10.user,_arg_4,_arg_5,cud,cud,_local_8);
         _local_9 = this.dyq(_arg_1);
         if(Boolean(_local_9))
         {
            _local_9.vun(_arg_4,_arg_5);
         }
         if(_local_10.local)
         {
            this.zugylu(_local_11);
            this.nowe();
            battleService.palecidev();
            battleService.bofoh();
            battleService.getBattleRunner().necuwu(_local_11.qiniwu());
            _local_11.title.show();
            this.rijac();
         }
         else
         {
            this.zugylu(_local_11);
            this.rugif(_local_11.tankData);
            this.sowiq(_local_11.bebosaca()).rolo(0);
         }
         this.gace(_local_10,_arg_2,true);
         this.dunym(_local_10.tank);
         if(_local_10.local)
         {
            _local_10 = this.metegy;
            this.buwobeg = getTimer() + BattlefieldModel(battleService).getRespawnInvulnerabilityPeriod();
            this.nyhes = false;
         }
      }
      
      public function kill(_arg_1:ClientObject, _arg_2:DeathReason, _arg_3:String, _arg_4:DamageType) : void
      {
         this.die(_arg_1);
         battleEventDispatcher.dispatchEvent(new Meqisyn(_arg_3,_arg_1.id,_arg_4));
      }
      
      public function die(_arg_1:ClientObject) : void
      {
         var _local_2:Num = this.getTankData(_arg_1);
         if(_local_2 == null || _local_2.tank == null)
         {
            return;
         }
         if(_local_2.local)
         {
            this.lysi(true);
            battleService.gonuju();
            battleService.vedyquqyp();
            battleEventDispatcher.dispatchEvent(Vibu.EVENT);
         }
         _local_2.enabled = false;
         _local_2.health = 0;
         this.sihobi(_local_2.user).covymyf(TankControlLockBits.DEAD,false);
         this.sihobi(_local_2.user).qufosyb();
         _local_2.tank.kill();
         _local_2.tank.disable();
         _local_2.spawnState = ClientTankState.DEAD;
         _local_2.tank.padabanu(_local_2.tank.wupylapen() & ~Myw.kyrupecan);
         this.rusif(_arg_1,TankControlLockBits.DEAD);
         this.vow(_local_2);
         UltimateModel(OSGi.getInstance().getService(IUltimateModel)).onLocalTankKilled(_local_2);
         battleService.getBattleRunner().wop(new Nava(getTimer() + 3000,_local_2.tank));
         battleEventDispatcher.dispatchEvent(new Vopetycy(_local_2.tank));
      }
      
      public function changeHealth(_arg_1:ClientObject, _arg_2:int) : void
      {
         var _local_3:Num = this.getTankData(_arg_1);
         if(_local_3 == null || _local_3.tank == null)
         {
            return;
         }
         this.poqosirut(_local_3,_arg_2);
      }
      
      public function changeSpecification(_arg_1:ClientObject, _arg_2:TankSpecification, _arg_3:Boolean) : void
      {
         var _local_4:Num = this.getTankData(_arg_1);
         if(_local_4 == null || _local_4.tank == null)
         {
            return;
         }
         this.gace(_local_4,_arg_2,_arg_3);
      }
      
      public function update(_arg_1:Tank, _arg_2:int, _arg_3:int, _arg_4:Number, _arg_5:Number, _arg_6:Vector3) : void
      {
         if(_arg_1.tankData.local)
         {
            this.hegerit(_arg_2,_arg_3);
         }
      }
      
      public function nocidafim() : Dictionary
      {
         return this.tov;
      }
      
      public function effectStarted(_arg_1:ClientObject, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:int) : void
      {
         var _local_6:UserTitle = null;
         var _local_7:int = 0;
         var _local_8:ClientObject = derys.bebosaca(_arg_1.id);
         var _local_9:Boolean = true;
         if(_local_8 != null)
         {
            _local_6 = this.getTitle(_arg_1);
            if(_local_6 != null)
            {
               if(_local_6.hasAnyFlag(TitleConfigFlags.EFFECTS))
               {
                  _local_9 = false;
                  _local_7 = this.fyrob(_arg_2,_arg_3);
                  _local_6.showIndicator(_arg_2,_local_7,_arg_4,_arg_5);
               }
            }
         }
         if(_local_9)
         {
            cotufulem.addInitialEffect(_arg_1.id,_arg_2,_arg_3,_arg_5);
         }
      }
      
      private function fyrob(_arg_1:int, _arg_2:int) : int
      {
         return int(_arg_2);
      }
      
      public function effectStopped(_arg_1:ClientObject, _arg_2:int, _arg_3:Boolean) : void
      {
         var _local_4:UserTitle = null;
         cotufulem.pewy(_arg_1.id,_arg_2);
         var _local_5:ClientObject = derys.bebosaca(_arg_1.id);
         if(_local_5 != null)
         {
            _local_4 = this.getTitle(_arg_1);
            if(_local_4 != null)
            {
               _local_4.hideIndicator(_arg_2,_arg_3);
            }
         }
      }
      
      private function supiq(_arg_1:int) : Boolean
      {
         return _arg_1 == Johad.hocypo;
      }
      
      private function boryho() : void
      {
         this.rojaby = IModelService(OSGi.getInstance().getService(IModelService));
         this.gui = OSGi.getInstance().getService(Tupebeput) as Tupebeput;
         this.inventoryModel = Bibeza(this.rojaby.getModelsByInterface(Bibeza)[0]);
      }
      
      private function cosebu(_arg_1:Num, _arg_2:ClientTank) : void
      {
         _arg_1.enabled = true;
         var _local_3:TankState = _arg_2.tankState;
         _arg_1.tank.spawn(_arg_1.teamType,_arg_1.incarnation);
         this.poqosirut(_arg_1,_arg_2.health);
         if(_arg_2.health <= 0)
         {
            _arg_1.tank.bij().qafubohy();
            _arg_1.tank.title.hide();
            this.rusif(_arg_1.user,TankControlLockBits.DEAD);
         }
         else
         {
            this.lyli(_arg_1.user,TankControlLockBits.ALL);
            _arg_1.tank.title.show();
            this.rugif(_arg_1);
            this.sihobi(_arg_1.user).temirih();
            this.sihobi(_arg_1.user).fygojamo(TankControlLockBits.ALL);
         }
         this.gakawa(_arg_1.user,_local_3.position,_local_3.orientation,cud,cud,_local_3.control);
         this.dabek(_arg_1.user,_local_3.turretAngle,_local_3.turretControl);
         switch(_arg_2.spawnState)
         {
            case ClientTankState.deqalo:
               _arg_1.tank.jafipefy();
               break;
            case ClientTankState.neqahi:
               _arg_1.tank.bagubado();
         }
         this.dunym(_arg_1.tank);
      }
      
      private function suvapo(_arg_1:Num) : void
      {
         _arg_1.user.putParams(Muguv,new Muguv(_arg_1.tank,5000));
         hysapeni(Rocuva(this.wopivoze(_arg_1.user)));
         this.wydajom = new Kyvuqufu(battleService.bezycavag());
         this.ryjanitaq = new Bez(_arg_1.tank,this.tov);
         this.lat = new Dyh(_arg_1.tank);
         var _local_2:Gyjohul = new Gyjohul(_arg_1.tank,this.tov);
         _arg_1.user.putParams(Gyjohul,_local_2);
         battleService.getBattleScene3D().qomasabyg(_local_2);
         battleService.zoru(_arg_1.tank);
         _arg_1.user.putParams(Kipycuzed,new Kipycuzed(_arg_1.tank));
         _arg_1.user.putParams(Tane,new Tane(_arg_1.tank));
         _arg_1.user.putParams(Vicytiwil,new Vicytiwil(_arg_1.user));
         battleService.fibisezoc();
      }
      
      private function onSettingsAccepted(_arg_1:Zolydys) : void
      {
         if(this.wopivoze(Num.cimise.user) != null)
         {
            hysapeni(Rocuva(this.wopivoze(Num.cimise.user)));
         }
      }
      
      public function kero() : void
      {
         battleService.getBattleRunner().wapiti(this.ryjanitaq);
         battleService.getBattleRunner().wapiti(this.lat);
      }
      
      public function noh(_arg_1:int) : void
      {
         this.ryjanitaq.pyhukal();
      }
      
      public function lysi(_arg_1:Boolean) : void
      {
         var _local_2:Giwomo = this.wopivoze(this.metegy.user);
         this.mewo(_local_2.ligirom(),_arg_1);
         this.ryjanitaq.reset();
      }
      
      private function mewo(_arg_1:int, _arg_2:Boolean) : void
      {
         var _local_3:Tank = null;
         if(this.tov[Num.cimise.userName] != null)
         {
            _local_3 = Num.cimise.tank;
            this.vyjedoki(_arg_1);
            _local_3.jug(this.zecipuqop.position,this.zecipuqop.orientation,this.zecipuqop.linearVelocity,this.zecipuqop.angularVelocity);
            this.zecipuqop.control = _arg_1 | this.sowiq(Num.cimise.user).getControl();
            this.quta(battleService.getBattleRunner().hulivyjam(),_arg_2);
         }
      }
      
      private function dihipa(_arg_1:int, _arg_2:Boolean) : void
      {
         var _local_3:ITankModel = null;
         var _local_4:Tank = null;
         var _local_5:int = 0;
         if(this.tov[Num.cimise.userName] != null)
         {
            _local_4 = Num.cimise.tank;
            this.vyjedoki(_arg_1);
            _local_4.cuwyd(this.zecipuqop.position,this.zecipuqop.orientation,this.zecipuqop.linearVelocity,this.zecipuqop.angularVelocity);
            this.zecipuqop.control = _arg_1;
            _local_5 = battleService.getBattleRunner().hulivyjam() - BattleRunner.rasomil;
            this.quta(_local_5,_arg_2);
         }
      }
      
      public function kaj(_arg_1:Boolean) : void
      {
         var _local_2:Giwomo = this.wopivoze(Num.cimise.user);
         this.dihipa(_local_2.ligirom(),true);
      }
      
      private function vyjedoki(_arg_1:int) : void
      {
         if(this.loz != _arg_1)
         {
            this.loz = _arg_1;
            this.dydikigi();
         }
      }
      
      private function quta(_arg_1:int, _arg_2:Boolean) : void
      {
         if(_arg_1 <= this.rylykyve)
         {
            return;
         }
         if(_arg_2)
         {
            server.berypej(_arg_1,Qemigofa.liwalycir(),this.zecipuqop,this.sowiq(Num.cimise.user).jesenebo());
            Vetezo.qeker(this.zecipuqop,this.raqiw);
            this.rylykyve = _arg_1;
         }
         else if(Vetezo.rorubez(this.zecipuqop,this.raqiw))
         {
            if(this.zecipuqop.control != this.raqiw.control)
            {
               this.zyh(_arg_1,this.zecipuqop.control);
            }
         }
         else
         {
            this.kedizolyp(_arg_1,this.zecipuqop);
         }
      }
      
      private function zyh(_arg_1:int, _arg_2:int) : void
      {
         if(_arg_1 <= this.zep || _arg_1 <= this.sejecemovi)
         {
            return;
         }
         server.mim(_arg_1,Qemigofa.liwalycir(),_arg_2);
         this.raqiw.control = _arg_2;
         this.sejecemovi = _arg_1;
      }
      
      private function kedizolyp(_arg_1:int, _arg_2:Pukimule) : void
      {
         if(_arg_1 <= this.zep)
         {
            return;
         }
         server.leqizihy(_arg_1,Qemigofa.liwalycir(),_arg_2);
         Vetezo.qeker(_arg_2,this.raqiw);
         this.zep = _arg_1;
      }
      
      private function fiveqejav(_arg_1:BattleTeam, _arg_2:BattleTeam) : Boolean
      {
         return _arg_1 != BattleTeam.NONE && _arg_1 == _arg_2;
      }
      
      private function vow(_arg_1:Num) : void
      {
         battleService.getBattleScene3D().addGraphicEffect(new Nyf(_arg_1));
      }
      
      private function hoheryh() : Cymone
      {
         var _local_1:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         return _local_1.getModelsByInterface(Cymone)[0] as Cymone;
      }
      
      public function zugituji(_arg_1:ClientObject) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("battle;activate_tank");
      }
      
      private function hegerit(_arg_1:int, _arg_2:int) : void
      {
         if(this.metegy.enabled)
         {
            if(this.metegy.spawnState != ClientTankState.neqahi && _arg_1 >= this.buwobeg && this.metegy.tank.zaki == 0)
            {
               this.buwobeg = int.MAX_VALUE;
               this.zugituji(this.metegy.user);
            }
         }
      }
      
      private function poqosirut(_arg_1:Num, _arg_2:int) : void
      {
         _arg_1.health = _arg_2;
         this.getTitle(_arg_1.user).setHealth(_arg_2);
         var _local_3:* = 10000;
         if(_arg_1.local)
         {
            this.inventoryModel.wazetap(Johad.hocypo,Gazib.dyzupoqy,_arg_2 >= _local_3);
         }
      }
      
      private function gace(_arg_1:Num, _arg_2:TankSpecification, _arg_3:Boolean) : void
      {
         _arg_1.tank.sabinijy(BattleUtils.pamo(_arg_2.speed),_arg_3);
         _arg_1.tank.setMaxTurnSpeed(_arg_2.turnSpeed,_arg_3);
         _arg_1.tank.seduq(BattleUtils.pamo(_arg_2.acceleration));
         _arg_1.tank.nerawub(BattleUtils.pamo(_arg_2.reverseAcceleration));
         _arg_1.tank.tuqetok(BattleUtils.pamo(_arg_2.sideAcceleration));
         _arg_1.tank.setTurnAcceleration(_arg_2.turnAcceleration);
         _arg_1.tank.gimefapew(_arg_2.reverseTurnAcceleration);
         _arg_1.tank.sowiq().setMaxTurnSpeed(_arg_2.turretRotationSpeed,true);
         _arg_1.tank.sowiq().setTurnAcceleration(_arg_2.turretTurnAcceleration);
      }
      
      private function createTank(_arg_1:Rib, _arg_2:Hoqeg, _arg_3:Weapon, _arg_4:Num, _arg_5:TankParts, _arg_6:UserTitle) : Tank
      {
         var _local_7:Maga = vosofoze(_arg_5);
         var _local_8:TankSkin = new TankSkin(_arg_5.hullObject,_arg_5.turretObject,_arg_5.coloringObject,ImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,97860))));
         var _local_9:* = 10000;
         var _local_10:Tank = new Tank(_local_8,_arg_1,_local_7,_arg_2,_arg_3,_arg_6,_arg_4.mass,_arg_4.local,battleEventDispatcher,_local_9,50,25,_arg_4.pohamozu.dampingCoeff);
         _local_10.tankData = _arg_4;
         return _local_10;
      }
      
      private function lulowic(_arg_1:Tank, _arg_2:Number) : void
      {
         _arg_1.setTemperature(_arg_2);
      }
   }
}

