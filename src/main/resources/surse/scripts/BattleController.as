package
{
   import alternativa.init.BattlefieldGUIActivator;
   import alternativa.init.BattlefieldModelActivator;
   import alternativa.init.BattlefieldSharedActivator;
   import alternativa.init.TanksWarfareActivator;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.register.ClientClass;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.ClientTankState;
   import alternativa.tanks.models.battle.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battle.gui.Tupebeput;
   import alternativa.tanks.models.battle.gui.chat.ChatModel;
   import alternativa.tanks.models.battle.gui.chat.Wejej;
   import alternativa.tanks.models.battle.gui.inventory.InventoryModel;
   import alternativa.tanks.models.battle.jgr.BattleJGRModel;
   import alternativa.tanks.models.battle.jgr.JuggernautModel;
   import alternativa.tanks.models.battle.jgr.killstreak.KillStreakModel;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ultimate.IUltimateModel;
   import alternativa.tanks.models.tank.ultimate.UltimateModel;
   import alternativa.tanks.models.weapon.IWeaponModel;
   import alternativa.tanks.models.weapon.shaft.Fofewago;
   import alternativa.tanks.models.weapon.smoky.Riqicuso;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.services.initialeffects.IInitialEffectsService;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.types.Long;
   import com.alternativaplatform.projects.tanks.client.commons.types.DeathReason;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankParts;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankState;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.BattleBonus;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.BattlefieldSoundScheme;
   import com.alternativaplatform.projects.tanks.client.models.tank.ClientTank;
   import flash.utils.Dictionary;
   import fominskiy.gui.ServerMessage;
   import fominskiy.gui.Waralosa;
   import fominskiy.networking.INetworkListener;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import fominskiy.networking.commands.Command;
   import fominskiy.networking.commands.Type;
   import fominskiy.server.models.inventory.ServerInventoryData;
   import fominskiy.server.models.inventory.ServerInventoryModel;
   import fominskiy.server.models.premium.BattlePremiumService;
   import fominskiy.server.models.premium.IBattlePremiumService;
   import fominskiy.tanks.WeaponsManager;
   import fominskiy.utils.BonusCludge;
   import obfuscation.badu.Jytamutid;
   import obfuscation.badu.Wydu;
   import obfuscation.beteg.Vatejataj;
   import obfuscation.bude.BattleTeam;
   import obfuscation.cefivofyh.Puwid;
   import obfuscation.cefivofyh.Tevyky;
   import obfuscation.dewa.Cuq;
   import obfuscation.dozas.Zeqyfypoj;
   import obfuscation.fabuqy.Suvozimi;
   import obfuscation.fafiqu.Kyqifav;
   import obfuscation.fafiqu.Vamobanoc;
   import obfuscation.falohif.Susapinef;
   import obfuscation.fatik.Fugorybo;
   import obfuscation.gasovufe.Pygek;
   import obfuscation.gybivyveq.Tiz;
   import obfuscation.hasitaze.Gypuza;
   import obfuscation.hasitaze.Rajyc;
   import obfuscation.hewug.Zogy;
   import obfuscation.hifi.Lela;
   import obfuscation.hizohofog.Dusy;
   import obfuscation.hizohofog.Lyf;
   import obfuscation.hizohofog.Nefoq;
   import obfuscation.hufikutu.Vivubefav;
   import obfuscation.huqibunob.Gema;
   import obfuscation.jahuj.BattleGoldBonusesModel;
   import obfuscation.jete.Hiharec;
   import obfuscation.jihadufef.Mihadiwo;
   import obfuscation.johek.Tytuhe;
   import obfuscation.joraky.Kyfaciki;
   import obfuscation.joraky.Pywy;
   import obfuscation.jyku.Myfy;
   import obfuscation.jyku.Novawilaj;
   import obfuscation.kewic.Pafijoban;
   import obfuscation.kisagehy.Dyrur;
   import obfuscation.kisagehy.Holij;
   import obfuscation.kisagehy.Joqece;
   import obfuscation.kisagehy.Qomopesu;
   import obfuscation.kisagehy.Waqi;
   import obfuscation.kofen.Vector3d;
   import obfuscation.lelomifom.Mikiqejav;
   import obfuscation.ligy.Dijiz;
   import obfuscation.ligy.Wynid;
   import obfuscation.ligy.Zyjova;
   import obfuscation.lin.Gacisucy;
   import obfuscation.lin.Zyhogy;
   import obfuscation.lokofobiv.Feh;
   import obfuscation.lokofobiv.Wetopeh;
   import obfuscation.lopivyl.Biru;
   import obfuscation.lyguh.Codyw;
   import obfuscation.lyguh.Gerujywiv;
   import obfuscation.migyqis.Jaquz;
   import obfuscation.modo.Bibeza;
   import obfuscation.mujusaqim.Hylyv;
   import obfuscation.mujusaqim.Linizujim;
   import obfuscation.pekyfo.Byma;
   import obfuscation.pigotib.Lubylag;
   import obfuscation.qasa.Tohiruce;
   import obfuscation.qef.Puge;
   import obfuscation.qusen.Pukimule;
   import obfuscation.qusen.Sunyva;
   import obfuscation.revubag.Cewyn;
   import obfuscation.rofa.Puqo;
   import obfuscation.samelosin.Fabiwo;
   import obfuscation.samona.Diqije;
   import obfuscation.syhis.Hegug;
   import obfuscation.syhis.Linebaz;
   import obfuscation.tupujy.Qemokumy;
   import obfuscation.vafy.Lomyger;
   import obfuscation.venu.Pocifafoc;
   import obfuscation.verymi.Pypi;
   import obfuscation.verymi.Tazudeqe;
   import obfuscation.wokogi.Gelifo;
   import obfuscation.zajun.Qiqa;
   import obfuscation.zoniseg.Nel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.GameTypeRegistry;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.registry.SpaceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import platform.client.fp10.core.type.impl.GameClass;
   import platform.client.fp10.core.type.impl.GameObject;
   import platform.client.fp10.core.type.impl.Space;
   import projects.tanks.client.battlefield.models.battle.jgr.JuggernautCC;
   import projects.tanks.client.battlefield.models.battle.jgr.killstreak.KillStreakCC;
   import projects.tanks.client.battlefield.models.battle.jgr.killstreak.KillStreakItem;
   import projects.tanks.client.battlefield.types.DamageType;
   import projects.tanks.client.battleservice.model.statistics.Bamapylaq;
   import projects.tanks.client.battleservice.model.statistics.Jomyceju;
   import projects.tanks.client.battleservice.model.statistics.Suc;
   import projects.tanks.client.commons.models.coloring.ColoringCC;
   import projects.tanks.client.garage.models.item.object3ds.Object3DSCC;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class BattleController implements INetworkListener
   {
      
      public static var activeTanks:Dictionary;
      
      public static var client:ClientObject;
      
      private static var qikej:Nel;
      
      private static var gikynelop:Riqicuso;
      
      private static var now:Puge;
      
      private static var pytyjec:Pocifafoc;
      
      private static var wyjomuv:Vatejataj;
      
      private static var wudico:Mihadiwo;
      
      private static var kasete:Zeqyfypoj;
      
      private static var vyhopiby:Fugorybo;
      
      private static var vof:Fofewago;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService = OSGi.getInstance().getService(IUserPropertiesService) as IUserPropertiesService;
      
      [Inject]
      public static var moneyService:IMoneyService = OSGi.getInstance().getService(IMoneyService) as IMoneyService;
      
      public static var resourceRegistry:ResourceRegistry = OSGi.getInstance().getService(ResourceRegistry) as ResourceRegistry;
      
      public static var modelRegistry:ModelRegistry = OSGi.getInstance().getService(ModelRegistry) as ModelRegistry;
      
      public static var gameTypeRegistry:GameTypeRegistry = OSGi.getInstance().getService(GameTypeRegistry) as GameTypeRegistry;
      
      private var battle:BattlefieldModelActivator;
      
      private var serverInventoryModel:ServerInventoryModel = new ServerInventoryModel();
      
      private var zocu:Gema;
      
      private var zew:Zogy;
      
      private var wucy:Lela;
      
      private var sijod:Tazudeqe;
      
      private var tykekyd:Cewyn;
      
      private var muhytijog:Lubylag;
      
      private var chatModel:ChatModel;
      
      private var battlePremiumService:BattlePremiumService;
      
      private var jezyrag:BattleGoldBonusesModel;
      
      private var fec:Tohiruce;
      
      private var qevigega:Tytuhe;
      
      private var battleSpace:ISpace;
      
      private var battleJGRModel:BattleJGRModel;
      
      private var juggernautModel:JuggernautModel;
      
      private var killStreakModel:KillStreakModel;
      
      public function BattleController()
      {
         super();
         this.battleSpace = new Space(Long.getLong(10568210,51255591),null,null,false);
         SpaceRegistry(OSGi.getInstance().getService(SpaceRegistry)).addSpace(this.battleSpace);
         var _local_1:TanksWarfareActivator = new TanksWarfareActivator();
         _local_1.start(OSGi.getInstance());
         var _local_2:BattlefieldGUIActivator = new BattlefieldGUIActivator();
         _local_2.start(OSGi.getInstance());
         var _local_3:BattlefieldSharedActivator = new BattlefieldSharedActivator();
         _local_3.start(OSGi.getInstance());
         this.zocu = new Gema();
         this.battle = new BattlefieldModelActivator();
         this.battle.start(OSGi.getInstance());
         var _local_4:TanksWarfareActivator = new TanksWarfareActivator();
         _local_4.start(OSGi.getInstance());
         OSGi.getInstance().registerService(BattleService,BattlefieldModel(modelRegistry.getModel(Long.getLong(1723277227,1936126557))));
         var _local_7:UltimateModel = new UltimateModel();
         OSGi.getInstance().registerService(IUltimateModel,_local_7);
         activeTanks = new Dictionary();
         var _local_5:Kyqifav = new Kyqifav();
         this.juggernautModel = JuggernautModel(modelRegistry.getModel(new JuggernautModel().id));
         this.killStreakModel = KillStreakModel(modelRegistry.getModel(new KillStreakModel().id));
         this.battlePremiumService = new BattlePremiumService();
         OSGi.getInstance().registerService(IBattlePremiumService,this.battlePremiumService);
         OSGi.getInstance().registerService(Vamobanoc,_local_5);
         this.zew = new Zogy();
         this.wucy = new Lela();
         gikynelop = new Riqicuso();
         pytyjec = new Pocifafoc();
         wyjomuv = new Vatejataj();
         now = new Puge();
         vof = new Fofewago();
         vyhopiby = new Fugorybo();
         kasete = new Zeqyfypoj();
         qikej = new Nel();
         wudico = new Mihadiwo();
         var _local_6:Vector.<Long> = new Vector.<Long>();
         _local_6.push(Long.getLong(947299051,-358915161));
         _local_6.push(Long.getLong(1497301838,-1092921347));
         _local_6.push(Long.getLong(923418047,-17313881));
         _local_6.push(Long.getLong(1099120188,-904226430));
         _local_6.push(Long.getLong(1129811198,-16275595));
         gameTypeRegistry.createClass(Long.getLong(14025,684260),_local_6);
         this.jezyrag = BattleGoldBonusesModel(modelRegistry.getModel(Long.getLong(118876660,-1267889929)));
         this.jezyrag.putInitParams(new Pygek(SoundResource(resourceRegistry.getResource(Long.getLong(0,269321)))));
         this.fec = Tohiruce(modelRegistry.getModel(Long.getLong(815932807,-684891581)));
         this.qevigega = Tytuhe(modelRegistry.getModel(Long.getLong(759725658,1071543601)));
         this.battleJGRModel = BattleJGRModel(modelRegistry.getModel(new BattleJGRModel().id));
         Puqo.init();
      }
      
      private static function racamy(_arg_1:String) : int
      {
         if(_arg_1 == "A")
         {
            return 0;
         }
         if(_arg_1 == "B")
         {
            return 1;
         }
         if(_arg_1 == "C")
         {
            return 2;
         }
         if(_arg_1 == "D")
         {
            return 3;
         }
         if(_arg_1 == "E")
         {
            return 4;
         }
         if(_arg_1 == "F")
         {
            return 5;
         }
         if(_arg_1 == "G")
         {
            return 6;
         }
         if(_arg_1 == "H")
         {
            return 7;
         }
         return 0;
      }
      
      public static function lymyb(_arg_1:ClientObject) : IWeaponModel
      {
         var _local_4:* = undefined;
         var _local_6:Qiqa = null;
         var _local_7:Vivubefav = null;
         var _local_8:Pafijoban = null;
         var _local_9:Diqije = null;
         var _local_10:Qemokumy = null;
         var _local_11:Hiharec = null;
         var _local_12:Cuq = null;
         var _local_13:Hiharec = null;
         var _local_14:Rajyc = null;
         var _local_15:Byma = null;
         var _local_3:IWeaponModel = null;
         var _local_2:String = _arg_1.id.split("_")[0];
         _local_4 = WeaponsManager.specialEntity[_arg_1.id];
         var _local_5:Fabiwo = WeaponsManager.shotDatas[_arg_1.id];
         switch(_local_2)
         {
            case "smoky":
               _local_3 = gikynelop;
               break;
            case "shaft":
               _local_6 = new Qiqa();
               _local_6.afterShotPause = _local_4.afterShotPause;
               _local_6.aimingImpact = _local_4.aimingImpact;
               _local_6.chargeRate = _local_4.charge_rate;
               _local_6.tikinapys = _local_4.discharge_rate;
               _local_6.fastShotEnergy = _local_4.fastShotEnergy;
               _local_6.roz = _local_4.horizontal_targeting_speed;
               _local_6.fysejydu = _local_4.initial_fov;
               _local_6.kazobilu = _local_4.max_energy;
               _local_6.minAimedShotEnergy = _local_4.minAimedShotEnergy;
               _local_6.vuqet = _local_4.minimum_fov;
               _local_6.kuri = ImageResource(resourceRegistry.getResource(Long.getLong(0,_local_4.reticleImageId)));
               _local_6.rotationCoeffKmin = _local_4.rotationCoeffKmin;
               _local_6.rotationCoeffT1 = _local_4.rotationCoeffT1;
               _local_6.rotationCoeffT2 = _local_4.rotationCoeffT2;
               _local_6.wybokukic = _local_4.shrubs_hiding_radius_max;
               _local_6.tututi = _local_4.shrubs_hiding_radius_min;
               _local_6.targetingAcceleration = _local_4.targetingAcceleration;
               _local_6.targetingTransitionTime = _local_4.targetingTransitionTime;
               _local_6.gusu = _local_4.vertical_targeting_speed;
               vof.putInitParams(_local_6);
               vof.objectLoaded(_arg_1);
               _local_3 = vof;
               break;
            case "railgun":
               _local_7 = new Vivubefav();
               _local_7.chargingTimeMsec = _local_4.chargingTimeMsec;
               _local_7.weakeningCoeff = _local_4.weakeningCoeff;
               qikej.putInitParams(_local_7);
               qikej.objectLoaded(_arg_1);
               _local_3 = qikej;
               break;
            case "ricochet":
               _local_8 = new Pafijoban();
               _local_8.energyCapacity = _local_4.energyCapacity;
               _local_8.energyPerShot = _local_4.energyPerShot;
               _local_8.energyRechargeSpeed = _local_4.energyRechargeSpeed;
               _local_8.maxRicochetCount = _local_4.maxRicochetCount;
               _local_8.shellRadius = _local_4.shellRadius;
               _local_8.shellSpeed = _local_4.shellSpeed;
               _local_8.shotDistance = _local_4.shotDistance;
               vyhopiby.putInitParams(_local_8);
               vyhopiby.objectLoaded(_arg_1);
               _local_3 = vyhopiby;
               break;
            case "twins":
               _local_9 = new Diqije();
               _local_9.distance = _local_4.distance;
               _local_9.shellRadius = _local_4.shellRadius;
               _local_9.speed = _local_4.speed;
               pytyjec.putInitParams(_local_9);
               pytyjec.objectLoaded(_arg_1);
               _local_3 = pytyjec;
               break;
            case "flamethrower":
               _local_10 = new Qemokumy();
               _local_10.coneAngle = _local_4.coneAngle;
               _local_10.range = _local_4.range;
               _local_11 = new Hiharec(_local_4.energyCapacity,_local_4.energyDischargeSpeed,_local_4.energyRechargeSpeed,_local_4.tickIntervalMsec);
               _arg_1.putParams(Hiharec,_local_11);
               now.putInitParams(_local_10);
               now.objectLoaded(_arg_1);
               _local_3 = now;
               break;
            case "freeze":
               _local_12 = new Cuq();
               _local_12.damageAreaConeAngle = _local_4.damageAreaConeAngle;
               _local_12.damageAreaRange = _local_4.damageAreaRange;
               _local_13 = new Hiharec(_local_4.energyCapacity,_local_4.energyDischargeSpeed,_local_4.energyRechargeSpeed,_local_4.tickIntervalMsec);
               _arg_1.putParams(Hiharec,_local_13);
               kasete.putInitParams(_local_12);
               kasete.objectLoaded(_arg_1);
               _local_3 = kasete;
               break;
            case "isida":
               _local_14 = new Rajyc();
               _local_14.capacity = _local_4.capacity;
               _local_14.chargeRate = _local_4.chargeRate;
               _local_14.checkPeriodMsec = _local_4.checkPeriodMsec;
               _local_14.coneAngle = _local_4.coneAngle;
               _local_14.dischargeDamageRate = _local_4.dischargeDamageRate;
               _local_14.dischargeHealingRate = _local_4.dischargeHealingRate;
               _local_14.dischargeIdleRate = _local_4.dischargeIdleRate;
               _local_14.radius = _local_4.radius;
               wyjomuv.putInitParams(_local_14);
               wyjomuv.objectLoaded(_arg_1);
               _local_3 = wyjomuv;
               break;
            case "thunder":
               _local_15 = new Byma();
               _local_15.impactForce = _local_4.impactForce;
               _local_15.minSplashDamagePercent = _local_4.minSplashDamagePercent;
               _local_15.radiusOfMaxSplashDamage = _local_4.radiusOfMaxSplashDamage;
               _local_15.splashDamageRadius = _local_4.splashDamageRadius;
               _arg_1.putParams(Byma,_local_15);
               _local_3 = wudico;
         }
         return _local_3;
      }
      
      public function onData(data:Command) : void
      {
         var parser:Object = null;
         var battle:Susapinef = null;
         var datastat:Object = null;
         var json:Object = null;
         var specList:String = null;
         var suspiciousUsers:Vector.<String> = null;
         var tempArr:Array = null;
         var pos:Vector3d = null;
         var bonusCC:Object = null;
         var bonuses:Array = null;
         var jsonBonus:Object = null;
         var bonus:BattleBonus = null;
         var targetHit:Jaquz = null;
         var affectedTanks:Vector.<Myfy> = null;
         var affect:Myfy = null;
         var ctfModel:Linizujim = null;
         var ctfCC:Object = null;
         var lighting:Object = null;
         var flagCC:Dusy = null;
         var ctfSounds:Nefoq = null;
         var blueFlag:Lyf = null;
         var redFlag:Lyf = null;
         var redTeamColor:Wydu = null;
         var blueTeamColor:Wydu = null;
         var flagLighting:Jytamutid = null;
         var resources:Object = null;
         var model:Wetopeh = null;
         var points:Dijiz = null;
         var obj:Object = null;
         var redPointColor:Wydu = null;
         var bluePointColor:Wydu = null;
         var neutralPointColor:Wydu = null;
         var pointsLighting:Jytamutid = null;
         var point:Wynid = null;
         var userId:Object = null;
         var rotateTurretCommand:Sunyva = null;
         var movementCommand:Pukimule = null;
         var moveCommand:Pukimule = null;
         var table:ServerMessage = null;
         var jsParser:Object = null;
         var items:Array = null;
         var item:Object = null;
         var _item:ServerInventoryData = null;
         var jsArray:Object = null;
         var effects:Array = null;
         var mines:Object = null;
         var activeMines:Vector.<Codyw> = null;
         var minesCC:Gerujywiv = null;
         var battleMine:Codyw = null;
         var userss:Vector.<Bamapylaq> = null;
         var userInfo:Bamapylaq = null;
         var blues:Vector.<Bamapylaq> = null;
         var reds:Vector.<Bamapylaq> = null;
         var cc:Mikiqejav = null;
         var blueUserInfo:Bamapylaq = null;
         var redUserInfo:Bamapylaq = null;
         var bluess:Vector.<Suc> = null;
         var redss:Vector.<Suc> = null;
         var blueUserInfoo:Suc = null;
         var redUserInfoo:Suc = null;
         var players:Vector.<Bamapylaq> = null;
         var info:Bamapylaq = null;
         var usersss:Vector.<Bamapylaq> = null;
         var bfModel:BattlefieldModel = null;
         var cpModel:Wetopeh = null;
         var modelsService:IModelService = null;
         var inventoryModel:InventoryModel = null;
         var alert:Waralosa = null;
         var _local_1:Object = null;
         var _local_2:Vector.<KillStreakItem> = null;
         var i:int = 0;
         var spec:* = undefined;
         var user:* = undefined;
         var bonusss:* = undefined;
         var jsonArray:* = undefined;
         var mine:* = undefined;
         var blue:* = undefined;
         var red:* = undefined;
         var bluee:* = undefined;
         var redd:* = undefined;
         var player:* = undefined;
         try
         {
            switch(data.type)
            {
               case Type.BATTLE:
                  if(data.args[0] == "init_battle_model")
                  {
                     this.initBattle(data.args[1]);
                  }
                  else if(data.args[0] == "init_gui_model")
                  {
                     parser = JSON.parse(data.args[1]);
                     battle = new Susapinef();
                     battle.blueScore = parser.score_blue;
                     battle.fund = parser.fund;
                     battle.redScore = parser.score_red;
                     battle.scoreLimit = parser.scoreLimit;
                     battle.pobyketoz = parser.team;
                     battle.hiwu = parser.currTime;
                     battle.timeLimit = parser.timeLimit;
                     this.chatModel = new ChatModel();
                     OSGi.getInstance().registerService(Wejej,this.chatModel);
                     this.chatModel.objectLoaded();
                     Kyfaciki(OSGi.getInstance().getService(Tupebeput)).init(new ClientObject("bfObject",null,"bfObject",null),battle);
                     datastat = new Object();
                     datastat.battleName = parser.name;
                     datastat.equipmentConstraintsMode = this.teqom(parser.equipmentConstraintsMode);
                     datastat.parkourMode = parser.parkourMode;
                     Kyfaciki(OSGi.getInstance().getService(Tupebeput)).initObject(null,datastat);
                     this.serverInventoryModel.init();
                     this.zocu.ping();
                  }
                  else if(data.args[0] == "set_premium_players")
                  {
                     json = JSON.parse(data.args[1]);
                     this.battlePremiumService.clear();
                     this.battlePremiumService.init(json.data);
                  }
                  else if(data.args[0] == "init_tank")
                  {
                     this.initTank(data.args[1]);
                  }
                  else if(data.args[0] == "gold_spawn")
                  {
                     this.wucy.nojomugik(data.args[2],data.args[1]);
                  }
                  else if(data.args[0] == "notificationBonusContainsUid")
                  {
                     this.wucy.notificationBonusContainsUid(data.args[1],data.args[2]);
                  }
                  else if(data.args[0] == "update_spectator_list")
                  {
                     parser = JSON.parse(data.args[1]);
                     specList = "Spectators: ";
                     for each(spec in parser.spects)
                     {
                        specList += spec + ", ";
                     }
                     specList = specList.substring(0,specList.length - 2);
                     this.chatModel.nyrabyt(specList);
                  }
                  else if(data.args[0] == "markSuspectedUsers")
                  {
                     parser = JSON.parse(data.args[1]);
                     suspiciousUsers = new Vector.<String>();
                     for each(user in parser)
                     {
                        suspiciousUsers.push(user);
                     }
                     Kyfaciki(OSGi.getInstance().getService(Tupebeput)).objectLoadedPost(suspiciousUsers);
                  }
                  else if(data.args[0] == "activate_tank")
                  {
                     if(activeTanks[data.args[1]] != null)
                     {
                        TankModel(OSGi.getInstance().getService(ITankModel)).activateTank(activeTanks[data.args[1]]);
                     }
                  }
                  else if(data.args[0] == "kill_tank")
                  {
                     if(activeTanks[data.args[1]] != null)
                     {
                        TankModel(OSGi.getInstance().getService(ITankModel)).kill(activeTanks[data.args[1]],DeathReason.getReason(data.args[2]),data.args[3],this.getDamageType(data.args[4]));
                     }
                  }
                  else if(data.args[0] == "die")
                  {
                     TankModel(OSGi.getInstance().getService(ITankModel)).die(activeTanks[data.args[1]]);
                  }
                  else if(data.args[0] == "prepare_to_spawn")
                  {
                     if(activeTanks[data.args[1]] != null)
                     {
                        tempArr = String(data.args[2]).split("@");
                        pos = new Vector3d(tempArr[0],tempArr[1],tempArr[2]);
                        TankModel(OSGi.getInstance().getService(ITankModel)).prepareToSpawn(activeTanks[data.args[1]],pos,new Vector3d(0,0,tempArr[3]));
                     }
                  }
                  else if(data.args[0] == "spawn")
                  {
                     this.spawn(data.args[1]);
                  }
                  else if(data.args[0] == "chat")
                  {
                     this.onChatMessage(data.args[1]);
                  }
                  else if(data.args[0] == "spectator_message")
                  {
                     this.chatModel.addMessage(null,data.args[1],BattleTeam.NONE);
                  }
                  else if(data.args[0] == "spectator_team_message")
                  {
                     this.chatModel.raki(null,data.args[1]);
                  }
                  else if(data.args[0] == "remove_user")
                  {
                     this.removeUser(data.args[1]);
                  }
                  else if(data.args[0] == "reloadScheduled")
                  {
                     Gelifo(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModel(Long.getLong(1286074115,-176946994))).onDeathScheduled(data.args[1]);
                  }
                  else if(data.args[0] == "onReload")
                  {
                     Gelifo(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModel(Long.getLong(1286074115,-176946994))).onReload(activeTanks[data.args[1]]);
                  }
                  else if(data.args[0] == "ping")
                  {
                     Network(OSGi.getInstance().getService(INetworker)).send("battle;pong");
                  }
                  else if(data.args[0] == "init_bonuses_data")
                  {
                     json = JSON.parse(data.args[1]);
                     for each(bonusss in json.bonuses)
                     {
                        bonusCC = new Object();
                        bonusCC.lighting = new Object();
                        bonusCC.lighting.attenuationBegin = bonusss.lighting.attenuationBegin;
                        bonusCC.lighting.attenuationEnd = bonusss.lighting.attenuationEnd;
                        bonusCC.lighting.lightIntensity = bonusss.lighting.intensity;
                        bonusCC.lighting.lightColor = bonusss.lighting.color;
                        bonusCC.boxResource = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,bonusss.resourceId)));
                        bonusCC.cordResource = ImageResource(resourceRegistry.getResource(Long.getLong(0,json.cordResource)));
                        bonusCC.parachuteInnerResource = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,json.parachuteInnerResource)));
                        bonusCC.parachuteResource = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,json.parachuteResource)));
                        bonusCC.pickupSoundResource = SoundResource(resourceRegistry.getResource(Long.getLong(0,json.pickupSoundResource)));
                        BonusCludge.resourceByName[bonusss.id] = bonusCC;
                     }
                  }
                  else if(data.args[0] == "init_bonuses")
                  {
                     jsonArray = JSON.parse(data.args[1]);
                     bonuses = new Array();
                     for each(jsonBonus in jsonArray)
                     {
                        bonus = new BattleBonus();
                        bonus.id = jsonBonus.id;
                        bonus.objectId = jsonBonus.id;
                        bonus.position = new Vector3d(jsonBonus.position.x,jsonBonus.position.y,jsonBonus.position.z);
                        bonus.timeFromAppearing = jsonBonus.timeFromAppearing;
                        bonus.timeLife = jsonBonus.timeLife;
                        bonus.bonusResourceId = BonusCludge.resourceByName[bonus.id.split("_")[0]].boxResource.id;
                        bonus.lighting = BonusCludge.resourceByName[bonus.id.split("_")[0]].lighting;
                        bonuses.push(bonus);
                     }
                     BattlefieldModel(modelRegistry.getModel(Long.getLong(1723277227,1936126557))).initBonuses(null,bonuses);
                  }
                  else if(data.args[0] == "spawn_bonus")
                  {
                     this.parseSpawnBonus(data.args[1]);
                  }
                  else if(data.args[0] == "bonus_taken")
                  {
                     BattlefieldModel(modelRegistry.getModel(Long.getLong(1723277227,1936126557))).bonusTaken(null,data.args[1]);
                  }
                  else if(data.args[0] == "user_log")
                  {
                     Kyfaciki(OSGi.getInstance().getService(Tupebeput)).logUserAction(data.args[1],data.args[2]);
                  }
                  else if(data.args[0] == "remove_bonus")
                  {
                     BattlefieldModel(modelRegistry.getModel(Long.getLong(1723277227,1936126557))).removeBonus(null,data.args[1]);
                  }
                  else if(data.args[0] == "start_fire")
                  {
                     this.parseStartFire(activeTanks[data.args[1]],data.args[1],data.args.length > 2 ? data.args[2] : "");
                  }
                  else if(data.args[0] == "static_shot")
                  {
                     this.juvutok(activeTanks[data.args[1]],data.args[2]);
                  }
                  else if(data.args[0] == "dummy_shot")
                  {
                     this.buvigubef(activeTanks[data.args[1]],data.args[2]);
                  }
                  else if(data.args[0] == "target_shot")
                  {
                     this.juwuvu(activeTanks[data.args[1]],data.args[2]);
                  }
                  else if(data.args[0] == "shot")
                  {
                     this.parseFire(activeTanks[data.args[1]],data.args[2]);
                  }
                  else if(data.args[0] == "set_target")
                  {
                     parser = JSON.parse(data.args[2]);
                     targetHit = new Jaquz();
                     targetHit.localHitPoint = this.objToVec3d(parser.localHitPoint);
                     targetHit.target = activeTanks[parser.target];
                     wyjomuv.juvilyvyb(activeTanks[data.args[1]],this.tagezo(parser.actionType),targetHit);
                  }
                  else if(data.args[0] == "reset_target")
                  {
                     wyjomuv.doverizu(activeTanks[data.args[1]]);
                  }
                  else if(data.args[0] == "change_health")
                  {
                     TankModel(OSGi.getInstance().getService(ITankModel)).changeHealth(activeTanks[data.args[1]],data.args[2]);
                  }
                  else if(data.args[0] == "damage_tank")
                  {
                     affectedTanks = new Vector.<Myfy>();
                     affect = new Myfy();
                     affect.qyfuq = data.args[2];
                     affect.target = data.args[1];
                     affect.qaluju = Novawilaj.Jul(data.args[3]);
                     affectedTanks.push(affect);
                     this.zew.vicujapyl(affectedTanks);
                  }
                  else if(data.args[0] == "init_shots_data")
                  {
                     this.parseShotsData(data.args[1]);
                  }
                  else if(data.args[0] == "stop_fire")
                  {
                     this.paqe(activeTanks[data.args[1]],data.args[1]);
                  }
                  else if(data.args[0] == "update_player_statistic")
                  {
                     this.wene(data.args[1]);
                  }
                  else if(data.args[0] == "change_fund")
                  {
                     Kyfaciki(OSGi.getInstance().getService(Tupebeput)).fundChange(data.args[1]);
                  }
                  else if(data.args[0] == "battle_finish")
                  {
                     this.parseFinishBattle(data.args[1]);
                  }
                  else if(data.args[0] == "battle_restart")
                  {
                     BattlefieldModel(modelRegistry.getModel(Long.getLong(1723277227,1936126557))).battleRestart(null);
                     Kyfaciki(OSGi.getInstance().getService(Tupebeput)).roundStart(data.args[1],true);
                     if(this.muhytijog != null)
                     {
                        this.muhytijog.roundStart();
                     }
                     else
                     {
                        this.tykekyd.roundStart();
                     }
                     Kyfaciki(OSGi.getInstance().getService(Tupebeput)).fundChange(0);
                  }
                  else if(data.args[0] == "change_spec_tank")
                  {
                     this.parseChangeSpecTank(activeTanks[data.args[1]],data.args[2]);
                  }
                  else if(data.args[0] == "change_temperature_tank")
                  {
                     TankModel(OSGi.getInstance().getService(ITankModel)).setTemperature(activeTanks[data.args[1]],data.args[2]);
                  }
                  else if(data.args[0] == "change_team_scores")
                  {
                     Kyfaciki(OSGi.getInstance().getService(Tupebeput)).changeTeamScore(this.niwav(data.args[1]),data.args[2]);
                  }
                  else if(data.args[0] == "init_dm_model")
                  {
                     this.qevigega.objectLoadedPost();
                  }
                  else if(data.args[0] == "init_tdm_model")
                  {
                     this.fec.objectLoadedPost();
                  }
                  else if(data.args[0] == "init_ctf_model")
                  {
                     ctfModel = null;
                     ctfModel = new Linizujim();
                     OSGi.getInstance().registerService(Hylyv,ctfModel);
                  }
                  else if(data.args[0] == "init_flags")
                  {
                     json = JSON.parse(data.args[1]);
                     ctfCC = JSON.parse(json.resources);
                     lighting = JSON.parse(json.lighting);
                     flagCC = new Dusy();
                     ctfSounds = new Nefoq();
                     blueFlag = new Lyf();
                     blueFlag.vylon = new Vector3d(json.basePosBlueFlag.x,json.basePosBlueFlag.y,json.basePosBlueFlag.z);
                     blueFlag.dumetone = json.blueFlagCarrierId;
                     blueFlag.rulijo = json.posBlueFlag == null ? null : new Vector3d(json.posBlueFlag.x,json.posBlueFlag.y,json.posBlueFlag.z);
                     redFlag = new Lyf();
                     redFlag.vylon = new Vector3d(json.basePosRedFlag.x,json.basePosRedFlag.y,json.basePosRedFlag.z);
                     redFlag.dumetone = json.redFlagCarrierId;
                     redFlag.rulijo = json.posRedFlag == null ? null : new Vector3d(json.posRedFlag.x,json.posRedFlag.y,json.posRedFlag.z);
                     flagCC.gip = blueFlag;
                     flagCC.blueFlagSprite = ImageResource(resourceRegistry.getResource(Long.getLong(0,ctfCC.blueFlagSprite)));
                     flagCC.bluePedestalModel = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,ctfCC.bluePedestalModel)));
                     flagCC.sacymowuw = redFlag;
                     flagCC.redFlagSprite = ImageResource(resourceRegistry.getResource(Long.getLong(0,ctfCC.redFlagSprite)));
                     flagCC.redPedestalModel = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,ctfCC.redPedestalModel)));
                     ctfSounds.flagDropSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,ctfCC.flagDropSound)));
                     ctfSounds.flagReturnSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,ctfCC.flagReturnSound)));
                     ctfSounds.flagTakeSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,ctfCC.flagTakeSound)));
                     ctfSounds.winSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,ctfCC.winSound)));
                     flagCC.rero = ctfSounds;
                     redTeamColor = new Wydu(lighting.redColor,lighting.redColorIntensity);
                     blueTeamColor = new Wydu(lighting.blueColor,lighting.blueColorIntensity);
                     flagLighting = new Jytamutid(redTeamColor,blueTeamColor,null,lighting.attenuationBegin,lighting.attenuationEnd);
                     ILightingEffectsService(OSGi.getInstance().getService(ILightingEffectsService)).setLightForMode(Suvozimi.CTF,flagLighting);
                     (OSGi.getInstance().getService(Hylyv) as Linizujim).putInitParams(flagCC);
                     (OSGi.getInstance().getService(Hylyv) as Linizujim).objectLoadedPost();
                  }
                  else if(data.args[0] == "init_dom_model")
                  {
                     json = JSON.parse(data.args[1]);
                     resources = JSON.parse(json.resources);
                     lighting = JSON.parse(json.lighting);
                     model = null;
                     points = new Dijiz();
                     points.points = new Vector.<Wynid>();
                     for each(obj in json.points)
                     {
                        point = new Wynid();
                        point.name = obj.id;
                        point.id = racamy(obj.id);
                        point.position = new Vector3d(obj.x,obj.y,obj.z);
                        point.score = obj.score;
                        point.myhybumo = new Vector.<String>();
                        point.state = this.ryreg(obj.state);
                        for each(userId in obj.occupated_users)
                        {
                           point.myhybumo.push(userId);
                        }
                        points.points.push(point);
                     }
                     points.cevyqy = 10;
                     points.sepo = json.mine_activation_radius;
                     points.pih = 500;
                     points.resources = new Hegug();
                     points.resources.bigLetters = ImageResource(resourceRegistry.getResource(Long.getLong(0,resources.bigLetters)));
                     points.resources.blueCircle = ImageResource(resourceRegistry.getResource(Long.getLong(0,resources.blueCircle)));
                     points.resources.bluePedestalTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,resources.bluePedestalTexture)));
                     points.resources.blueRay = ImageResource(resourceRegistry.getResource(Long.getLong(0,resources.blueRay)));
                     points.resources.blueRayTip = ImageResource(resourceRegistry.getResource(Long.getLong(0,resources.blueRayTip)));
                     points.resources.neutralCircle = ImageResource(resourceRegistry.getResource(Long.getLong(0,resources.neutralCircle)));
                     points.resources.neutralPedestalTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,resources.neutralPedestalTexture)));
                     points.resources.pedestal = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,resources.pedestal)));
                     points.resources.redCircle = ImageResource(resourceRegistry.getResource(Long.getLong(0,resources.redCircle)));
                     points.resources.redPedestalTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,resources.redPedestalTexture)));
                     points.resources.redRay = ImageResource(resourceRegistry.getResource(Long.getLong(0,resources.redRay)));
                     points.resources.redRayTip = ImageResource(resourceRegistry.getResource(Long.getLong(0,resources.redRayTip)));
                     points.rero = new Linebaz();
                     points.rero.pointCapturedNegativeSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,resources.pointCapturedNegativeSound)));
                     points.rero.pointCapturedPositiveSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,resources.pointCapturedPositiveSound)));
                     points.rero.pointCaptureStartNegativeSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,resources.pointCaptureStartNegativeSound)));
                     points.rero.pointCaptureStartPositiveSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,resources.pointCaptureStartPositiveSound)));
                     points.rero.pointCaptureStopNegativeSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,resources.pointCaptureStopNegativeSound)));
                     points.rero.pointCaptureStopPositiveSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,resources.pointCaptureStopPositiveSound)));
                     points.rero.pointNeutralizedNegativeSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,resources.pointNeutralizedNegativeSound)));
                     points.rero.pointNeutralizedPositiveSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,resources.pointNeutralizedPositiveSound)));
                     points.rero.pointScoreDecreasingSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,resources.pointScoreDecreasingSound)));
                     points.rero.pointScoreIncreasingSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,resources.pointScoreIncreasingSound)));
                     redPointColor = new Wydu(lighting.redPointColor,lighting.redPointIntensity);
                     bluePointColor = new Wydu(lighting.bluePointColor,lighting.bluePointIntensity);
                     neutralPointColor = new Wydu(lighting.neutralPointColor,lighting.neutralPointIntensity);
                     pointsLighting = new Jytamutid(redPointColor,bluePointColor,neutralPointColor,lighting.attenuationBegin,lighting.attenuationEnd);
                     ILightingEffectsService(OSGi.getInstance().getService(ILightingEffectsService)).setLightForMode(Suvozimi.CP,pointsLighting);
                     model = new Wetopeh();
                     model.putInitParams(points);
                     model.objectLoaded();
                     model.objectLoadedPost();
                     OSGi.getInstance().registerService(Feh,model);
                  }
                  else if(data.args[0] == "local_critical_hit")
                  {
                     gikynelop.zugebyto(activeTanks[data.args[1]]);
                  }
                  else if(data.args[0] == "rotateTurret")
                  {
                     parser = JSON.parse(data.args[1]);
                     rotateTurretCommand = new Sunyva();
                     if(isNaN(parser.angle))
                     {
                        return;
                     }
                     rotateTurretCommand.angle = parser.angle;
                     rotateTurretCommand.control = parser.control;
                     TankModel(OSGi.getInstance().getService(ITankModel)).rotateTurret(activeTanks[parser.tankId],rotateTurretCommand);
                  }
                  else if(data.args[0] == "movementControl")
                  {
                     parser = JSON.parse(data.args[1]);
                     TankModel(OSGi.getInstance().getService(ITankModel)).movementControl(activeTanks[parser.tankId],parser.control);
                  }
                  else if(data.args[0] == "move")
                  {
                     parser = JSON.parse(data.args[1]);
                     movementCommand = new Pukimule();
                     movementCommand.angularVelocity = this.objToVec3d(parser.angularVelocity);
                     movementCommand.control = parser.control;
                     movementCommand.linearVelocity = this.objToVec3d(parser.linearVelocity);
                     movementCommand.orientation = this.objToVec3d(parser.orientation);
                     movementCommand.position = this.objToVec3d(parser.position);
                     TankModel(OSGi.getInstance().getService(ITankModel)).move(activeTanks[parser.tankId],movementCommand);
                  }
                  else if(data.args[0] == "fullMove")
                  {
                     parser = JSON.parse(data.args[1]);
                     moveCommand = new Pukimule();
                     moveCommand.angularVelocity = this.objToVec3d(parser.angularVelocity);
                     moveCommand.control = parser.control;
                     moveCommand.linearVelocity = this.objToVec3d(parser.linearVelocity);
                     moveCommand.orientation = this.objToVec3d(parser.orientation);
                     moveCommand.position = this.objToVec3d(parser.position);
                     TankModel(OSGi.getInstance().getService(ITankModel)).moveAndSetTurretState(activeTanks[parser.tankId],moveCommand,parser.turretDirection);
                  }
                  else if(data.args[0] == "flagTaken")
                  {
                     Linizujim(OSGi.getInstance().getService(Hylyv)).flagTaken(data.args[1],this.niwav(data.args[2]));
                  }
                  else if(data.args[0] == "deliver_flag")
                  {
                     Linizujim(OSGi.getInstance().getService(Hylyv)).flagDelivered(this.niwav(data.args[1]),data.args[2]);
                  }
                  else if(data.args[0] == "flag_drop")
                  {
                     json = JSON.parse(data.args[1]);
                     Linizujim(OSGi.getInstance().getService(Hylyv)).dropFlag(new Vector3d(json.x,json.y,json.z),this.niwav(json.flagTeam));
                  }
                  else if(data.args[0] == "return_flag")
                  {
                     Linizujim(OSGi.getInstance().getService(Hylyv)).returnFlagToBase(this.niwav(data.args[1]),data.args[2] == "null" ? null : data.args[2]);
                  }
                  else if(data.args[0] == "show_warning_table")
                  {
                     table = new ServerMessage(data.args[1]);
                  }
                  else if(data.args[0] == "init_inventory")
                  {
                     jsParser = JSON.parse(data.args[1]);
                     items = new Array();
                     for each(item in jsParser.items)
                     {
                        _item = new ServerInventoryData();
                        _item.count = item.count;
                        _item.id = item.id;
                        _item.itemEffectTime = item.itemEffectTime;
                        _item.itemRestSec = item.itemRestSec;
                        _item.slotId = item.slotId;
                        items.push(_item);
                     }
                     this.serverInventoryModel.initInventory(items);
                  }
                  else if(data.args[0] == "updateCount")
                  {
                     this.serverInventoryModel.updateCount(data.args[1],data.args[2]);
                  }
                  else if(data.args[0] == "activate_item")
                  {
                     this.serverInventoryModel.activateItem(data.args[1],data.args[2],data.args[3] == "true" ? true : false);
                  }
                  else if(data.args[0] == "enable_effect")
                  {
                     this.serverInventoryModel.enableEffect(data.args[2],data.args[3]);
                     TankModel(OSGi.getInstance().getService(ITankModel)).effectStarted(activeTanks[data.args[1]],data.args[2],data.args[3],data.args[4] == "true" ? true : false,data.args[5]);
                  }
                  else if(data.args[0] == "disable_effect")
                  {
                     TankModel(OSGi.getInstance().getService(ITankModel)).effectStopped(activeTanks[data.args[1]],data.args[2],data.args[3] == "true" ? true : false);
                  }
                  else if(data.args[0] == "init_effects")
                  {
                     jsArray = JSON.parse(data.args[1]);
                     effects = new Array();
                     for each(obj in jsArray.effects)
                     {
                        IInitialEffectsService(OSGi.getInstance().getService(IInitialEffectsService)).addInitialEffect(obj.userID,obj.itemIndex,obj.durationTime,obj.effectLevel);
                     }
                  }
                  else if(data.args[0] == "init_mine_model")
                  {
                     parser = JSON.parse(data.args[1]);
                     mines = JSON.parse(data.args[2]);
                     resources = parser.resources;
                     activeMines = new Vector.<Codyw>();
                     minesCC = new Gerujywiv();
                     for each(mine in mines.mines)
                     {
                        battleMine = new Codyw();
                        battleMine.activated = true;
                        battleMine.mineId = mine.mineId;
                        battleMine.ownerId = mine.ownerId;
                        battleMine.position = new Vector3d(mine.x,mine.y,mine.z);
                        activeMines.push(battleMine);
                     }
                     minesCC.activateSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,resources.activateSound)));
                     minesCC.qakiliny = parser.activationTimeMsec;
                     minesCC.jupola = activeMines;
                     minesCC.blueMineTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,resources.blueMineTexture)));
                     minesCC.deactivateSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,resources.deactivateSound)));
                     minesCC.enemyMineTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,resources.enemyMineTexture)));
                     minesCC.explosionMarkTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,resources.explosionMarkTexture)));
                     minesCC.explosionSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,resources.explosionSound)));
                     minesCC.farVisibilityRadius = parser.farVisibilityRadius;
                     minesCC.friendlyMineTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,resources.friendlyMineTexture)));
                     minesCC.idleExplosionTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,resources.idleExplosionTexture)));
                     minesCC.impactForce = parser.impactForce;
                     minesCC.mainExplosionTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,resources.mainExplosionTexture)));
                     minesCC.minDistanceFromBase = parser.minDistanceFromBase;
                     minesCC.model3ds = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,resources.model3ds)));
                     minesCC.nearVisibilityRadius = parser.nearVisibilityRadius;
                     minesCC.radius = parser.radius;
                     minesCC.redMineTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,resources.redMineTexture)));
                     this.sijod = new Tazudeqe();
                     OSGi.getInstance().registerService(Pypi,this.sijod);
                     this.sijod.putInitParams(minesCC);
                     this.sijod.objectLoaded();
                  }
                  else if(data.args[0] == "remove_mines")
                  {
                     this.sijod.geku(data.args[1]);
                  }
                  else if(data.args[0] == "put_mine")
                  {
                     json = JSON.parse(data.args[1]);
                     this.sijod.kajafe(json.mineId,json.x,json.y,json.z,json.userId);
                  }
                  else if(data.args[0] == "activate_mine")
                  {
                     this.sijod.mis(data.args[1]);
                  }
                  else if(data.args[0] == "hit_mine")
                  {
                     this.sijod.tegapij(data.args[1],data.args[2]);
                  }
                  else if(data.args[0] == "tank_capturing_point")
                  {
                     Wetopeh(OSGi.getInstance().getService(Feh)).tankEnteredPointZone(racamy(data.args[1]),activeTanks[data.args[2]].id);
                  }
                  else if(data.args[0] == "tank_leave_capturing_point")
                  {
                     Wetopeh(OSGi.getInstance().getService(Feh)).tankLeftPointZone(racamy(data.args[2]),activeTanks[data.args[1]].id);
                  }
                  else if(data.args[0] == "set_point_score")
                  {
                     Wetopeh(OSGi.getInstance().getService(Feh)).setPointProgress(racamy(data.args[1]),Number(data.args[2]),Number(data.args[3]));
                  }
                  else if(data.args[0] == "point_captured_by")
                  {
                     Wetopeh(OSGi.getInstance().getService(Feh)).setPointState(racamy(data.args[2]),data.args[1] == "blue" ? Zyjova.BLUE : (data.args[1] == "red" ? Zyjova.RED : Zyjova.NEUTRAL));
                  }
                  else if(data.args[0] == "point_lost_by")
                  {
                     Wetopeh(OSGi.getInstance().getService(Feh)).setPointState(racamy(data.args[2]),Zyjova.NEUTRAL);
                  }
                  else if(data.args[0] == "pointCaptureStarted")
                  {
                     Wetopeh(OSGi.getInstance().getService(Feh)).pointCaptureStarted(this.niwav(data.args[1]));
                  }
                  else if(data.args[0] == "pointCaptureStopped")
                  {
                     Wetopeh(OSGi.getInstance().getService(Feh)).pointCaptureStopped(this.niwav(data.args[1]));
                  }
                  else if(data.args[0] == "pong")
                  {
                     this.zocu.pong();
                  }
                  else if(data.args[0] == "ping")
                  {
                     Network(OSGi.getInstance().getService(INetworker)).send("battle;pong");
                  }
                  else if(data.args[0] == "gold_taken")
                  {
                     this.jezyrag.wyhasu(activeTanks[data.args[1]],data.args[2] == "true" ? true : false);
                  }
                  else if(data.args[0] == "update_rang")
                  {
                     Kyfaciki(OSGi.getInstance().getService(Tupebeput)).onRankChanged(data.args[1],data.args[2]);
                  }
                  else if(data.args[0] == "start_manual_targeting")
                  {
                     vof.vywovygak(activeTanks[data.args[1]]);
                  }
                  else if(data.args[0] == "stop_manual_targeting")
                  {
                     vof.lyl(activeTanks[data.args[1]]);
                  }
                  else if(data.args[0] == "init_dm_statistics")
                  {
                     this.tykekyd = new Cewyn();
                     OSGi.getInstance().registerService(Pywy,this.tykekyd);
                     parser = JSON.parse(data.args[1]);
                     userss = new Vector.<Bamapylaq>();
                     for each(user in parser.users)
                     {
                        userInfo = new Bamapylaq();
                        userInfo.chatModeratorLevel = this.dijolycy(user.chatModeratorLevel);
                        userInfo.deaths = user.deaths;
                        userInfo.kills = user.kills;
                        userInfo.rank = user.rank;
                        userInfo.score = user.score;
                        userInfo.uid = user.uid;
                        userInfo.user = user.uid;
                        userss.push(userInfo);
                     }
                     this.tykekyd.putInitParams(new Biru(userss));
                     this.tykekyd.objectLoaded();
                     this.tykekyd.objectLoadedPost();
                  }
                  else if(data.args[0] == "init_team_statistics")
                  {
                     this.muhytijog = new Lubylag();
                     OSGi.getInstance().registerService(Pywy,this.muhytijog);
                     parser = JSON.parse(data.args[1]);
                     blues = new Vector.<Bamapylaq>();
                     reds = new Vector.<Bamapylaq>();
                     for each(blue in parser.blues)
                     {
                        blueUserInfo = new Bamapylaq();
                        blueUserInfo.chatModeratorLevel = this.dijolycy(blue.chatModeratorLevel);
                        blueUserInfo.deaths = blue.deaths;
                        blueUserInfo.kills = blue.kills;
                        blueUserInfo.rank = blue.rank;
                        blueUserInfo.score = blue.score;
                        blueUserInfo.uid = blue.uid;
                        blueUserInfo.user = blue.uid;
                        blues.push(blueUserInfo);
                     }
                     for each(red in parser.reds)
                     {
                        redUserInfo = new Bamapylaq();
                        redUserInfo.chatModeratorLevel = this.dijolycy(red.chatModeratorLevel);
                        redUserInfo.deaths = red.deaths;
                        redUserInfo.kills = red.kills;
                        redUserInfo.rank = red.rank;
                        redUserInfo.score = red.score;
                        redUserInfo.uid = red.uid;
                        redUserInfo.user = red.uid;
                        reds.push(redUserInfo);
                     }
                     cc = new Mikiqejav();
                     cc.jikudof = reds;
                     cc.qirycuf = blues;
                     cc.blueScore = parser.blueScore;
                     cc.redScore = parser.redScore;
                     this.muhytijog.putInitParams(cc);
                     this.muhytijog.objectLoaded();
                     this.muhytijog.objectLoadedPost();
                  }
                  else if(data.args[0] == "statusProbablyCheaterChanged")
                  {
                     Kyfaciki(OSGi.getInstance().getService(Tupebeput)).statusProbablyCheaterChanged(data.args[1],data.args[2] == "true" ? true : false);
                  }
                  else if(data.args[0] == "confirm_vote")
                  {
                     Kyfaciki(OSGi.getInstance().getService(Tupebeput)).onComplaintConfirmed();
                  }
                  else if(data.args[0] == "swap_teams")
                  {
                     parser = JSON.parse(data.args[1]);
                     bluess = new Vector.<Suc>();
                     redss = new Vector.<Suc>();
                     for each(bluee in parser.blues)
                     {
                        blueUserInfoo = new Suc();
                        blueUserInfoo.deaths = bluee.deaths;
                        blueUserInfoo.kills = bluee.kills;
                        blueUserInfoo.score = bluee.score;
                        blueUserInfoo.user = bluee.uid;
                        bluess.push(blueUserInfoo);
                     }
                     for each(redd in parser.reds)
                     {
                        redUserInfoo = new Suc();
                        redUserInfoo.deaths = redd.deaths;
                        redUserInfoo.kills = redd.kills;
                        redUserInfoo.score = redd.score;
                        redUserInfoo.user = redd.uid;
                        redss.push(redUserInfoo);
                     }
                     this.muhytijog.gyf(redss,bluess);
                  }
                  else if(data.args[0] == "user_connect_team")
                  {
                     parser = JSON.parse(data.args[1]);
                     players = new Vector.<Bamapylaq>();
                     for each(player in parser.players)
                     {
                        info = new Bamapylaq();
                        info.chatModeratorLevel = this.dijolycy(player.chatModeratorLevel);
                        info.deaths = player.deaths;
                        info.kills = player.kills;
                        info.rank = player.rank;
                        info.score = player.score;
                        info.uid = player.uid;
                        info.user = player.uid;
                        players.push(info);
                     }
                     this.muhytijog.userConnect(parser.id,players,this.niwav(parser.team));
                  }
                  else if(data.args[0] == "user_disconnect_team")
                  {
                     this.muhytijog.sywibo(data.args[1]);
                  }
                  else if(data.args[0] == "user_connect_dm")
                  {
                     parser = JSON.parse(data.args[1]);
                     usersss = new Vector.<Bamapylaq>();
                     for each(user in parser.players)
                     {
                        info = new Bamapylaq();
                        info.chatModeratorLevel = this.dijolycy(user.chatModeratorLevel);
                        info.deaths = user.deaths;
                        info.kills = user.kills;
                        info.rank = user.rank;
                        info.score = user.score;
                        info.uid = user.uid;
                        info.user = user.uid;
                        usersss.push(info);
                     }
                     this.tykekyd.userConnect(parser.id,usersss);
                  }
                  else if(data.args[0] == "user_disconnect_dm")
                  {
                     this.tykekyd.sywibo(data.args[1]);
                  }
                  else if(data.args[0] == "unload_battle")
                  {
                     bfModel = BattlefieldModel(modelRegistry.getModel(Long.getLong(1723277227,1936126557)));
                     BattleController(OSGi.getInstance().getService(IBattleController)).destroy();
                     bfModel.objectUnloaded();
                     Kyfaciki(OSGi.getInstance().getService(Tupebeput)).objectUnloaded(null);
                     if(this.muhytijog != null)
                     {
                        this.muhytijog.objectUnloaded();
                        this.muhytijog = null;
                     }
                     else
                     {
                        this.tykekyd.objectUnloaded();
                        this.tykekyd = null;
                     }
                     Network(OSGi.getInstance().getService(INetworker)).removeListener(OSGi.getInstance().getService(IBattleController) as BattleController);
                     this.chatModel.objectUnloaded();
                     OSGi.getInstance().unregisterService(Wejej);
                     WeaponsManager.destroy();
                     ctfModel = OSGi.getInstance().getService(Hylyv) as Linizujim;
                     if(ctfModel != null)
                     {
                        ctfModel.objectUnloaded();
                        OSGi.getInstance().unregisterService(Hylyv);
                     }
                     cpModel = OSGi.getInstance().getService(Feh) as Wetopeh;
                     if(cpModel != null)
                     {
                        cpModel.objectUnloaded();
                        OSGi.getInstance().unregisterService(Feh);
                     }
                     this.qevigega.objectUnloaded();
                     this.fec.objectUnloaded();
                     modelsService = IModelService(OSGi.getInstance().getService(IModelService));
                     inventoryModel = InventoryModel(modelsService.getModelsByInterface(Bibeza)[0]);
                     if(inventoryModel != null)
                     {
                        inventoryModel.objectUnloaded(null);
                     }
                     this.sijod.objectUnloaded();
                     OSGi.getInstance().unregisterService(Pypi);
                     BonusCludge.resourceByName = new Dictionary();
                  }
                  else if(data.args[0] == "addOneGoldRegion")
                  {
                     BattlefieldModel(modelRegistry.getModel(Long.getLong(1723277227,1936126557))).addGoldRegion(new Vector3(data.args[1],data.args[2],data.args[3]),data.args[4]);
                  }
                  else if(data.args[0] == "removeOneGoldRegion")
                  {
                     BattlefieldModel(modelRegistry.getModel(Long.getLong(1723277227,1936126557))).removeGoldRegion(data.args[1]);
                  }
                  else if(data.args[0] == "addBonusRegion")
                  {
                     BattlefieldModel(modelRegistry.getModel(Long.getLong(1723277227,1936126557))).addBonusRegion(new Vector3(data.args[1],data.args[2],data.args[3]),data.args[4]);
                  }
                  else if(data.args[0] == "activate_depended_cooldown")
                  {
                     this.serverInventoryModel.activateDependedCooldown(data.args[1],data.args[2]);
                  }
                  else if(data.args[0] == "activate_cooldown")
                  {
                     this.serverInventoryModel.activateCooldown(data.args[1],data.args[2]);
                  }
                  else if(data.args[0] == "init_ulitmate_model")
                  {
                     UltimateModel(OSGi.getInstance().getService(IUltimateModel)).initUltimate();
                  }
                  else if(data.args[0] == "activate_ultimate")
                  {
                     UltimateModel(OSGi.getInstance().getService(IUltimateModel)).activateUltimate(activeTanks[data.args[1]],data.args[2]);
                  }
                  else if(data.args[0] == "add_ultimate_charge")
                  {
                     UltimateModel(OSGi.getInstance().getService(IUltimateModel)).addCharge(data.args[1]);
                  }
                  else if(data.args[0] == "update_ultimate_charge")
                  {
                     UltimateModel(OSGi.getInstance().getService(IUltimateModel)).updateCharge(data.args[1]);
                  }
                  else if(data.args[0] == "show_ultimate_charged")
                  {
                     UltimateModel(OSGi.getInstance().getService(IUltimateModel)).showUltimateCharged(activeTanks[data.args[1]]);
                  }
                  else if(data.args[0] == "bossChanged")
                  {
                     this.juggernautModel.bossChanged(data.args[1]);
                  }
                  else if(data.args[0] == "bossKilled")
                  {
                     this.juggernautModel.bossKilled();
                  }
                  else if(data.args[0] == "killStreakAchived")
                  {
                     this.killStreakModel.killStreakAchived(data.args[1],this.juggernautModel.bossId());
                  }
                  else if(data.args[0] == "init_jgr_model")
                  {
                     _local_1 = JSON.parse(data.args[1]);
                     _local_2 = new Vector.<KillStreakItem>();
                     i = 0;
                     for each(obj in _local_1.killStreaks)
                     {
                        _local_2.push(new KillStreakItem(i,obj.messageToBoss,obj.messageToVictims,SoundResource(resourceRegistry.getResource(Long.getLong(0,obj.soundResourceId)))));
                        i++;
                     }
                     this.battleJGRModel.objectLoadedPost();
                     this.juggernautModel.putInitParams(new JuggernautCC(SoundResource(resourceRegistry.getResource(Long.getLong(0,1500012))),SoundResource(resourceRegistry.getResource(Long.getLong(0,1500013)))));
                     this.juggernautModel.objectLoadedPost();
                     this.killStreakModel.putInitParams(new KillStreakCC(_local_2));
                     this.killStreakModel.objectLoaded();
                  }
                  else if(data.args[0] == "battle_message")
                  {
                     Kyfaciki(OSGi.getInstance().getService(Tupebeput)).tagew(uint(data.args[1]),String(data.args[2]));
                  }
            }
         }
         catch(e:Error)
         {
            throw e;
         }
      }
      
      private function teqom(_arg_1:String) : Tiz
      {
         switch(_arg_1)
         {
            case "NONE":
               return Tiz.NONE;
            case "HornetRailgun":
               return Tiz.HORNET_RAILGUN;
            case "WaspRailgun":
               return Tiz.WASP_RAILGUN;
            case "HornetWaspRailgun":
               return Tiz.HORNET_WASP_RAILGUN;
            default:
               return Tiz.NONE;
         }
      }
      
      private function niwav(_arg_1:String) : BattleTeam
      {
         switch(_arg_1.toLowerCase())
         {
            case "blue":
               return BattleTeam.BLUE;
            case "red":
               return BattleTeam.RED;
            default:
               return BattleTeam.NONE;
         }
      }
      
      private function tagezo(_arg_1:String) : Gypuza
      {
         switch(_arg_1)
         {
            case "idle":
               return Gypuza.IDLE;
            case "heal":
               return Gypuza.HEALING;
            case "damage":
               return Gypuza.DAMAGING;
            default:
               return Gypuza.OFF;
         }
      }
      
      private function getDamageType(_arg_1:String) : DamageType
      {
         var damageType:DamageType = null;
         switch(_arg_1)
         {
            case "smoky":
               damageType = DamageType.SMOKY;
               break;
            case "flamethrower":
               damageType = DamageType.FIREBIRD;
               break;
            case "twins":
               damageType = DamageType.TWINS;
               break;
            case "railgun":
               damageType = DamageType.RAILGUN;
               break;
            case "isida":
               damageType = DamageType.ISIS;
               break;
            case "shaft":
               damageType = DamageType.SHAFT;
               break;
            case "freeze":
               damageType = DamageType.FREEZE;
               break;
            case "ricochet":
               damageType = DamageType.RICOCHET;
               break;
            case "thunder":
               damageType = DamageType.THUNDER;
               break;
            case "mine":
               damageType = DamageType.MINE;
         }
         return damageType;
      }
      
      private function dijolycy(_arg_1:int) : ChatModeratorLevel
      {
         switch(_arg_1)
         {
            case 0:
               return ChatModeratorLevel.NONE;
            case 1:
               return ChatModeratorLevel.CANDIDATE;
            case 2:
               return ChatModeratorLevel.MODERATOR;
            case 3:
               return ChatModeratorLevel.ADMINISTRATOR;
            case 4:
               return ChatModeratorLevel.COMMUNITY_MANAGER;
            default:
               return ChatModeratorLevel.NONE;
         }
      }
      
      private function ryreg(_arg_1:String) : Zyjova
      {
         switch(_arg_1)
         {
            case "red":
               return Zyjova.RED;
            case "blue":
               return Zyjova.BLUE;
            default:
               return Zyjova.NEUTRAL;
         }
      }
      
      private function parseChangeSpecTank(_arg_1:ClientObject, _arg_2:String) : void
      {
         var _local_3:Object = JSON.parse(_arg_2);
         var _local_4:TankSpecification = new TankSpecification();
         _local_4.speed = _local_3.speed;
         _local_4.turnSpeed = _local_3.turnSpeed;
         _local_4.turretRotationSpeed = _local_3.turretRotationSpeed;
         _local_4.acceleration = _local_3.acceleration;
         _local_4.dampingCoeff = _local_3.dampingCoeff;
         _local_4.reverseAcceleration = _local_3.reverseAcceleration;
         _local_4.reverseTurnAcceleration = _local_3.reverseTurnAcceleration;
         _local_4.sideAcceleration = _local_3.sideAcceleration;
         _local_4.dampingCoeff = _local_3.dampingCoeff;
         _local_4.turnAcceleration = _local_3.turnAcceleration;
         _local_4.turretTurnAcceleration = _local_3.turretTurnAcceleration;
         TankModel(OSGi.getInstance().getService(ITankModel)).changeSpecification(_arg_1,_local_4,false);
      }
      
      private function parseFinishBattle(_arg_1:String) : void
      {
         var _local_4:Object = null;
         var _local_5:Jomyceju = null;
         var _local_2:Vector.<Jomyceju> = new Vector.<Jomyceju>();
         var _local_3:Object = JSON.parse(_arg_1);
         for each(_local_4 in _local_3.users)
         {
            _local_5 = new Jomyceju();
            _local_5.userId = _local_4.id;
            _local_5.runecufyh = _local_4.prize;
            _local_5.sejukulyq = 0;
            _local_5.bejo = _local_4.prize;
            _local_2.push(_local_5);
         }
         Kyfaciki(OSGi.getInstance().getService(Tupebeput)).roundFinish(true,_local_2,int(_local_3.time_to_restart / 1000));
         BattlefieldModel(modelRegistry.getModel(Long.getLong(1723277227,1936126557))).battleFinish(null);
      }
      
      private function wene(_arg_1:String) : void
      {
         var _local_2:Object = JSON.parse(_arg_1);
         var _local_3:Suc = new Suc();
         _local_3.deaths = _local_2.deaths;
         _local_3.kills = _local_2.kills;
         _local_3.score = _local_2.score;
         _local_3.user = _local_2.id;
         if(this.muhytijog != null)
         {
            this.muhytijog.donanuno(_local_3,this.niwav(_local_2.team_type));
         }
         else
         {
            this.tykekyd.donanuno(_local_3);
         }
      }
      
      private function spawn(_arg_1:String) : void
      {
         var _local_2:Object = JSON.parse(_arg_1);
         var _local_3:Vector3d = new Vector3d(_local_2.x,_local_2.y,_local_2.z);
         var _local_4:Vector3d = new Vector3d(0,0,_local_2.rot);
         var _local_5:TankSpecification = new TankSpecification();
         _local_5.speed = _local_2.speed;
         _local_5.turnSpeed = _local_2.turn_speed;
         _local_5.turretRotationSpeed = _local_2.turret_rotation_speed;
         _local_5.acceleration = _local_2.acceleration;
         _local_5.dampingCoeff = _local_2.dampingCoeff;
         _local_5.reverseAcceleration = _local_2.reverseAcceleration;
         _local_5.reverseTurnAcceleration = _local_2.reverseTurnAcceleration;
         _local_5.sideAcceleration = _local_2.sideAcceleration;
         _local_5.turnAcceleration = _local_2.turnAcceleration;
         _local_5.turretTurnAcceleration = _local_2.turretTurnAcceleration;
         TankModel(OSGi.getInstance().getService(ITankModel)).spawn(activeTanks[_local_2.tank_id],_local_5,this.niwav(_local_2.team_type),_local_3,_local_4,_local_2.health,_local_2.incration_id);
      }
      
      private function parseShotsData(_arg_1:String) : void
      {
         var _local_5:Object = null;
         var _local_6:Fabiwo = null;
         var _local_7:* = undefined;
         var _local_2:Object = JSON.parse(_arg_1);
         var _local_3:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         var _local_4:Tevyky = Tevyky(_local_3.getModelsByInterface(Puwid)[0]);
         for each(_local_5 in _local_2.weapons)
         {
            _local_6 = new Fabiwo(_local_5.reload);
            _local_6.dyrewuneb.value = _local_5.auto_aiming_down;
            _local_6.vom.value = _local_5.auto_aiming_up;
            _local_6.dyheh.value = _local_5.num_rays_down;
            _local_6.votyfyzo.value = _local_5.num_rays_up;
            if(Boolean(_local_5.has_wwd))
            {
               _local_4.initObject(WeaponsManager.getObjectFor(_local_5.id),_local_5.max_damage_radius,_local_5.min_damage_percent,_local_5.min_damage_radius);
            }
            _local_7 = _local_5.special_entity;
            WeaponsManager.shotDatas[_local_5.id] = _local_6;
            WeaponsManager.specialEntity[_local_5.id] = _local_7;
         }
      }
      
      private function paqe(_arg_1:ClientObject, _arg_2:String) : void
      {
         if(TankModel(OSGi.getInstance().getService(ITankModel)) == null)
         {
            return;
         }
         var _local_3:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         if(TankModel(OSGi.getInstance().getService(ITankModel)) == null || activeTanks[_arg_1.id] as ClientObject == null)
         {
            return;
         }
         var _local_4:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(activeTanks[_arg_1.id] as ClientObject);
         if(_local_4 == null || _local_4.turret == null || _local_4.turret.id == null)
         {
            return;
         }
         var _local_5:String = _local_4.turret.id.split("_")[0];
         switch(_local_5)
         {
            case "flamethrower":
               now.kowywer(_arg_1);
               return;
            case "isida":
               wyjomuv.kycohafo(_arg_1);
               return;
            case "freeze":
               kasete.kowywer(_arg_1);
               return;
            default:
               return;
         }
      }
      
      private function parseStartFire(_arg_1:ClientObject, _arg_2:String, _arg_3:String) : void
      {
         var _local_4:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         if(TankModel(OSGi.getInstance().getService(ITankModel)) == null || activeTanks[_arg_1.id] as ClientObject == null)
         {
            return;
         }
         var _local_5:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(activeTanks[_arg_1.id] as ClientObject);
         if(_local_5 == null || _local_5.turret == null || _local_5.turret.id == null)
         {
            return;
         }
         var _local_6:String = _local_5.turret.id.split("_")[0];
         switch(_local_6)
         {
            case "railgun":
               qikej.sygydyjo(_arg_1);
               return;
            case "flamethrower":
               now.startFire(_arg_1);
               return;
            case "freeze":
               kasete.startFire(_arg_1);
               return;
            default:
               return;
         }
      }
      
      private function parseFire(_arg_1:ClientObject, _arg_2:String) : void
      {
         var _local_3:Object = JSON.parse(_arg_2);
         var _local_4:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(activeTanks[_arg_1.id] as ClientObject);
         if(_local_4 == null || _local_4.turret == null || _local_4.turret.id == null)
         {
            return;
         }
         var _local_5:String = _local_4.turret.id.split("_")[0];
         switch(_local_5)
         {
            case "smoky":
               gikynelop.pekuna(_arg_1);
               return;
            case "twins":
               OSGi.clientLog.log("crash","twins js %1",_arg_2);
               pytyjec.cijafe(_arg_1,_local_3.currentBarrel,_local_3.shotId,this.objToVec3d(_local_3.shotDirection));
               return;
            case "ricochet":
               vyhopiby.cijafe(_arg_1,_local_3.shotDirectionX,_local_3.shotDirectionY,_local_3.shotDirectionZ);
               return;
            case "thunder":
               wudico.pekuna(_arg_1);
               return;
            default:
               return;
         }
      }
      
      private function juvutok(_arg_1:ClientObject, _arg_2:String) : void
      {
         var _local_3:Object = JSON.parse(_arg_2);
         var _local_4:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(activeTanks[_arg_1.id] as ClientObject);
         if(_local_4 == null || _local_4.turret == null || _local_4.turret.id == null)
         {
            return;
         }
         var _local_5:String = _local_4.turret.id.split("_")[0];
         switch(_local_5)
         {
            case "smoky":
               gikynelop.lepyfipyg(_arg_1,this.objToVec3d(_local_3.hitPosition));
               return;
            case "thunder":
               wudico.lepyfipyg(_arg_1,this.objToVec3d(_local_3.hitPoint));
               return;
            default:
               return;
         }
      }
      
      private function buvigubef(_arg_1:ClientObject, _arg_2:String) : void
      {
         var _local_3:Object = JSON.parse(_arg_2);
         var _local_4:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(activeTanks[_arg_1.id] as ClientObject);
         if(_local_4 == null || _local_4.turret == null || _local_4.turret.id == null)
         {
            return;
         }
         var _local_5:String = _local_4.turret.id.split("_")[0];
         switch(_local_5)
         {
            case "ricochet":
               vyhopiby.nakole(_arg_1);
               return;
            case "twins":
               OSGi.clientLog.log("crash","twins js %1",_arg_2);
               pytyjec.nakole(_arg_1,_local_3.currentBarrel);
               return;
            case "railgun":
               qikej.nakole(_arg_1);
               return;
            default:
               return;
         }
      }
      
      private function juwuvu(_arg_1:ClientObject, _arg_2:String) : void
      {
         var _local_3:Object = null;
         var _local_6:Array = null;
         var _local_7:Array = null;
         var _local_8:Vector.<ClientObject> = null;
         var _local_9:Vector.<Vector3d> = null;
         var _local_10:int = 0;
         var _local_11:Vector3d = null;
         var _local_12:* = undefined;
         _local_3 = JSON.parse(_arg_2);
         var _local_4:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(activeTanks[_arg_1.id] as ClientObject);
         if(_local_4 == null || _local_4.turret == null || _local_4.turret.id == null)
         {
            return;
         }
         var _local_5:String = _local_4.turret.id.split("_")[0];
         switch(_local_5)
         {
            case "railgun":
               _local_6 = _local_3.targets as Array;
               _local_7 = _local_3.hitPositions as Array;
               _local_8 = new Vector.<ClientObject>();
               _local_9 = new Vector.<Vector3d>();
               _local_10 = 0;
               while(_local_10 < _local_7.length)
               {
                  _local_11 = this.objToVec3d(_local_7[_local_10]);
                  _local_9.push(_local_11);
                  _local_10++;
               }
               for each(_local_12 in _local_6)
               {
                  _local_8.push(activeTanks[_local_12]);
               }
               qikej.cijafe(_arg_1,this.objToVec3d(_local_3.staticHitPosition),_local_8,_local_9);
               return;
            case "smoky":
               gikynelop.gulib(_arg_1,activeTanks[_local_3.target],this.objToVec3d(_local_3.hitPosition),_local_3.weakening,_local_3.critical);
               return;
            case "thunder":
               wudico.gulib(_arg_1,activeTanks[_local_3.target],this.objToVec3d(_local_3.relativeHitPoint));
               return;
            case "shaft":
               vof.cijafe(_arg_1,this.objToVec3d(_local_3.staticHitPosition),activeTanks[_local_3.target],this.objToVec3d(_local_3.hitPoint),_local_3.impactForce);
               return;
            default:
               return;
         }
      }
      
      private function objToVec3d(_arg_1:Object) : Vector3d
      {
         if(_arg_1 == null)
         {
            return null;
         }
         return new Vector3d(_arg_1.x,_arg_1.y,_arg_1.z);
      }
      
      private function parseSpawnBonus(_arg_1:String) : void
      {
         var _local_2:Object = JSON.parse(_arg_1);
         var _local_3:ClientClass = new ClientClass(_local_2.id,null,_local_2.id,null);
         var _local_4:ClientObject = new ClientObject(_local_2.id,_local_3,_local_3.name,null);
         var _local_5:Object = BonusCludge.resourceByName[_local_2.id.split("_")[0]];
         BattlefieldModel(modelRegistry.getModel(Long.getLong(1723277227,1936126557))).addBonus(_local_4,_local_2.id,_local_2.id,new Vector3d(_local_2.x,_local_2.y,_local_2.z),_local_2.disappearing_time,BonusCludge.resourceByName[_local_2.id.split("_")[0]].boxResource.id,_local_5);
      }
      
      private function removeUser(_arg_1:String) : void
      {
         Gacisucy(OSGi.getInstance().getService(Zyhogy)).objectUnloaded();
         TankModel(OSGi.getInstance().getService(ITankModel)).objectUnloaded(activeTanks[_arg_1]);
         delete activeTanks[_arg_1];
      }
      
      private function onChatMessage(_arg_1:String) : void
      {
         var _local_2:Object = JSON.parse(_arg_1);
         if(!_local_2.system)
         {
            if(Boolean(_local_2.team))
            {
               this.chatModel.vepebuk(_local_2.nickname,_local_2.message,this.niwav(_local_2.team_type));
            }
            else
            {
               this.chatModel.addMessage(_local_2.nickname,_local_2.message,this.niwav(_local_2.team_type));
            }
         }
         else
         {
            this.chatModel.fikaqu(_local_2.message);
         }
      }
      
      private function moveTank(_arg_1:String) : void
      {
         var _local_2:Object = JSON.parse(_arg_1);
         var _local_3:Pukimule = new Pukimule();
         var _local_4:Vector3d = new Vector3d();
         var _local_5:Vector3d = new Vector3d();
         var _local_6:Vector3d = new Vector3d();
         var _local_7:Vector3d = new Vector3d();
         _local_4.x = _local_2.position.x;
         _local_4.y = _local_2.position.y;
         _local_4.z = _local_2.position.z;
         _local_5.x = _local_2.orient.x;
         _local_5.y = _local_2.orient.y;
         _local_5.z = _local_2.orient.z;
         _local_6.x = _local_2.line.x;
         _local_6.y = _local_2.line.y;
         _local_6.z = _local_2.line.z;
         _local_7.x = _local_2.angle.x;
         _local_7.y = _local_2.angle.y;
         _local_7.z = _local_2.angle.z;
         var _local_8:Number = Number(_local_2.turretDir);
         var _local_9:int = int(_local_2.ctrlBits);
         var _local_10:int = int(_local_2.turretBits);
         _local_3.angularVelocity = _local_7;
         _local_3.control = _local_9;
         _local_3.linearVelocity = _local_6;
         _local_3.orientation = _local_5;
         _local_3.position = _local_4;
         if(activeTanks[_local_2.tank_id] != null)
         {
            TankModel(OSGi.getInstance().getService(ITankModel)).move(activeTanks[_local_2.tank_id] as ClientObject,_local_3);
         }
      }
      
      private function riwamajoc(_arg_1:ClientObject, _arg_2:String, _arg_3:Object, _arg_4:IGameObject) : void
      {
         WeaponsManager.initBCSH(_arg_3,_arg_4);
         WeaponsManager.initLighting(_arg_3,_arg_4);
         Model.object = _arg_4;
         switch(_arg_2.split("_")[0])
         {
            case "smoky":
               WeaponsManager.getSmokySFX(_arg_1,_arg_3);
               break;
            case "flamethrower":
               WeaponsManager.getFlamethrowerSFX(_arg_1,_arg_3);
               break;
            case "twins":
               WeaponsManager.getTwinsSFX(_arg_1,_arg_3);
               break;
            case "railgun":
               WeaponsManager.getRailgunSFX(_arg_1,_arg_3);
               break;
            case "ricochet":
               WeaponsManager.getRicochetSFXModel(_arg_1,_arg_3);
               break;
            case "freeze":
               WeaponsManager.getFrezeeSFXModel(_arg_1,_arg_3);
               break;
            case "isida":
               WeaponsManager.getIsidaSFX(_arg_1,_arg_3);
               break;
            case "shaft":
               WeaponsManager.getShaftSFX(_arg_1,_arg_3);
               break;
            case "thunder":
               WeaponsManager.getThunderSFX(_arg_1,_arg_3);
         }
         Model.popObject();
      }
      
      private function initTank(_arg_1:String) : void
      {
         var _local_12:TankState = null;
         var _local_2:Object = JSON.parse(_arg_1);
         var _local_3:Object = JSON.parse(_local_2.partsObject);
         var _local_4:ColoringCC = new ColoringCC();
         var _local_5:Object3DSCC = new Object3DSCC();
         var _local_6:Object3DSCC = new Object3DSCC();
         var _local_7:Lomyger = new Lomyger();
         _local_7.engineIdleSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_local_3.engineIdleSound)));
         _local_7.engineStartMovingSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_local_3.engineStartMovingSound)));
         _local_7.engineMovingSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_local_3.engineMovingSound)));
         if(resourceRegistry.getResource(Long.getLong(0,_local_2.colormap_id)) is MultiframeImageResource)
         {
            _local_4.animatedColoring = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_local_2.colormap_id)));
         }
         else
         {
            _local_4.coloring = ImageResource(resourceRegistry.getResource(Long.getLong(0,_local_2.colormap_id)));
         }
         _local_6.resourceId = Long.getLong(0,_local_2.hullResource);
         _local_5.resourceId = Long.getLong(0,_local_2.turretResource);
         var _local_8:TankParts = new TankParts();
         _local_8.hullObject = new GameObject(Long.getLong(0,_local_2.hullResource),GameClass(gameTypeRegistry.getClass(Long.getLong(14025,684260))),_local_2.hull_id,null);
         _local_8.turretObject = new GameObject(Long.getLong(0,_local_2.turretResource),GameClass(gameTypeRegistry.getClass(Long.getLong(14025,684260))),_local_2.turret_id,null);
         _local_8.coloringObject = new GameObject(Long.getLong(0,_local_2.colormap_id),GameClass(gameTypeRegistry.getClass(Long.getLong(14025,684260))),_local_2.colormap_id,null);
         Model.object = _local_8.hullObject;
         modelRegistry.getModel(_local_8.hullObject.gameClass.models[1]).putInitParams(_local_6);
         modelRegistry.getModel(_local_8.hullObject.gameClass.models[2]).putInitParams(_local_7);
         Model.popObject();
         Model.object = _local_8.turretObject;
         modelRegistry.getModel(_local_8.turretObject.gameClass.models[1]).putInitParams(_local_5);
         Model.popObject();
         Model.object = _local_8.coloringObject;
         modelRegistry.getModel(_local_8.coloringObject.gameClass.models[0]).putInitParams(_local_4);
         Model.popObject();
         activeTanks[_local_2.tank_id] = this.initClientObject(_local_2.tank_id,_local_2.tank_id);
         var _local_9:TankSpecification = new TankSpecification();
         _local_9.speed = _local_2.maxSpeed;
         _local_9.turnSpeed = _local_2.maxTurnSpeed;
         _local_9.turretRotationSpeed = _local_2.turret_turn_speed;
         _local_9.acceleration = _local_2.acceleration;
         _local_9.dampingCoeff = _local_2.dampingCoeff;
         _local_9.reverseAcceleration = _local_2.reverseAcceleration;
         _local_9.reverseTurnAcceleration = _local_2.reverseTurnAcceleration;
         _local_9.sideAcceleration = _local_2.sideAcceleration;
         _local_9.turnAcceleration = _local_2.turnAcceleration;
         _local_9.turretTurnAcceleration = _local_2.turretTurnAcceleration;
         var _local_10:Vector3d = new Vector3d();
         var _local_11:Array = String(_local_2.position).split("@");
         _local_10.x = int(_local_11[0]);
         _local_10.y = int(_local_11[1]);
         _local_10.z = int(_local_11[2]);
         if(!_local_2.state_null)
         {
            _local_12 = new TankState();
            _local_12.health = _local_2.health;
            _local_12.orientation = new Vector3d(0,0,_local_11[3]);
            _local_12.position = _local_10;
            _local_12.turretAngle = _local_2.turretAngle;
            _local_12.turretControl = _local_2.turretControl;
         }
         var _local_13:ClientTank = new ClientTank();
         _local_13.health = _local_2.health;
         _local_13.incarnationId = _local_2.icration;
         _local_13.self = _local_2.tank_id == client.id;
         var _local_14:String = _local_2.state;
         _local_13.spawnState = _local_14 == "newcome" ? ClientTankState.deqalo : (_local_14 == "active" ? ClientTankState.neqahi : (_local_14 == "suicide" ? ClientTankState.DEAD : ClientTankState.neqahi));
         _local_13.tankSpecification = _local_9;
         _local_13.tankState = _local_12;
         _local_13.teamType = this.niwav(_local_2.team_type);
         var _local_15:TankModel = OSGi.getInstance().getService(ITankModel) as TankModel;
         _local_15.initObject(activeTanks[_local_2.tank_id],_local_2.battleId,_local_2.mass,_local_2.power,null,_local_8,null,_local_2.impact_force,_local_2.kickback,_local_2.turret_rotation_accel,_local_2.turret_turn_speed,_local_2.nickname,_local_2.rank);
         this.riwamajoc(activeTanks[_local_2.tank_id],_local_2.turret_id,JSON.parse(_local_2.sfxData),_local_8.turretObject);
         _local_15.wihaga(activeTanks[_local_2.tank_id],_local_13,_local_8);
         Gacisucy(OSGi.getInstance().getService(Zyhogy)).objectLoaded();
      }
      
      private function initBattle(_arg_1:String) : void
      {
         var _local_2:Object = JSON.parse(_arg_1);
         var _local_3:Object = JSON.parse(_local_2.map_graphic_data);
         var _local_4:Object = JSON.parse(_local_2.skybox);
         var _local_5:Vector.<Long> = new Vector.<Long>();
         _local_5.push(Long.getLong(1092696378,-225264163));
         _local_5.push(Long.getLong(1723277227,1936126557));
         var _local_6:GameTypeRegistry = OSGi.getInstance().getService(GameTypeRegistry) as GameTypeRegistry;
         _local_6.createClass(Long.getLong(150325,6843660),_local_5);
         var _local_7:ModelRegistry = OSGi.getInstance().getService(ModelRegistry) as ModelRegistry;
         var _local_8:ResourceRegistry = OSGi.getInstance().getService(ResourceRegistry) as ResourceRegistry;
         var _local_9:Joqece = new Joqece();
         _local_9.back = ImageResource(_local_8.getResource(Long.getLong(0,_local_4.back)));
         _local_9.bottom = ImageResource(_local_8.getResource(Long.getLong(0,_local_4.bottom)));
         _local_9.front = ImageResource(_local_8.getResource(Long.getLong(0,_local_4.front)));
         _local_9.left = ImageResource(_local_8.getResource(Long.getLong(0,_local_4.left)));
         _local_9.right = ImageResource(_local_8.getResource(Long.getLong(0,_local_4.right)));
         _local_9.top = ImageResource(_local_8.getResource(Long.getLong(0,_local_4.top)));
         var _local_10:Qomopesu = new Qomopesu(new Waqi(_local_3.dustAlpha,_local_3.dustDensity,_local_3.dustFarDistance,_local_3.dustNearDistance,MultiframeImageResource(_local_8.getResource(Long.getLong(0,_local_2.dustParticle))),_local_3.dustSize),new Holij(_local_3.angleX,_local_3.angleZ,_local_3.lightColor,_local_3.shadowColor),new Dyrur(_local_3.fogAlpha,_local_3.fogColor,_local_3.farLimit,_local_3.nearLimit),_local_3.gravity,_local_8.getResource(Long.getLong(0,_local_2.mapId)) as MapResource,new Vector3d(10,3,0),_local_3.skyboxRevolutionSpeed,_local_9,_local_3.ssaoColor);
         var _local_11:IGameObject = this.battleSpace.createObject(Long.getLong(0,_local_2.mapId),GameClass(_local_6.getClass(Long.getLong(150325,6843660))),"BattlefieldModel object");
         Model.object = _local_11;
         _local_7.getModel(_local_11.gameClass.models[0]).putInitParams(_local_10);
         Model.popObject();
         this.initLocalClientObject(userPropertiesService.userName,userPropertiesService.userName);
         var _local_12:BattlefieldSoundScheme = new BattlefieldSoundScheme();
         var _local_13:Object = new Object();
         _local_13.battleId = _local_2.battleId;
         _local_13.minRank = _local_2.minRank;
         _local_13.maxRank = _local_2.maxRank;
         _local_13.ambientSoundId = Long.getLong(0,_local_2.sound_id);
         _local_13.reArmorEnabled = _local_2.reArmorEnabled;
         BattlefieldModel(_local_7.getModel(Long.getLong(1723277227,1936126557))).initObject(client,_local_2.active,_local_10,null,_local_12,_local_2.kick_period_ms,_local_2.map_id,_local_2.invisible_time,_local_2.skybox_id,_local_2.spectator,_local_11,_local_13);
      }
      
      public function initClientObject(_arg_1:String, _arg_2:String) : ClientObject
      {
         var _local_3:ClientClass = new ClientClass(_arg_1,null,_arg_2);
         return new ClientObject(_arg_1,_local_3,_arg_2,null);
      }
      
      private function initLocalClientObject(_arg_1:String, _arg_2:String) : void
      {
         var _local_3:ClientClass = new ClientClass(_arg_1,null,_arg_2);
         var _local_4:ClientObject = new ClientObject(_arg_1,_local_3,_arg_2,null);
         client = _local_4;
      }
      
      public function destroy() : void
      {
         var _local_1:* = undefined;
         BattlefieldModel(modelRegistry.getModel(Long.getLong(1723277227,1936126557))).spectatorMode = false;
         for each(_local_1 in activeTanks)
         {
            TankModel(OSGi.getInstance().getService(ITankModel)).objectUnloaded(_local_1 as ClientObject);
            Gacisucy(OSGi.getInstance().getService(Zyhogy)).objectUnloaded();
         }
         activeTanks = new Dictionary();
      }
   }
}

