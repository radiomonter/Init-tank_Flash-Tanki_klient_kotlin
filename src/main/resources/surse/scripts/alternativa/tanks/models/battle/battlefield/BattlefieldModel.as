package alternativa.tanks.models.battle.battlefield
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import alternativa.physics.collision.types.AABB;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.BattleRunner;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.BattleView;
   import alternativa.tanks.battle.SpeedHackChecker;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Gysugomem;
   import alternativa.tanks.battle.events.Qigawi;
   import alternativa.tanks.battle.events.Qub;
   import alternativa.tanks.battle.events.Vegepos;
   import alternativa.tanks.battle.events.Vovakopy;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   import alternativa.tanks.battle.scene3d.DecalFactory;
   import alternativa.tanks.bg.IBackgroundService;
   import alternativa.tanks.bonuses.Bonus;
   import alternativa.tanks.bonuses.BonusCache;
   import alternativa.tanks.camera.FollowCameraController;
   import alternativa.tanks.camera.Wedisatoj;
   import alternativa.tanks.camera.Zynomy;
   import alternativa.tanks.gui.error.ErrorNotification;
   import alternativa.tanks.models.battle.gui.Tupebeput;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ultimate.IUltimateModel;
   import alternativa.tanks.models.tank.ultimate.UltimateModel;
   import alternativa.tanks.models.weapon.shared.CommonTargetEvaluator;
   import alternativa.tanks.models.weapon.shared.Qunomili;
   import alternativa.tanks.models.weapon.shared.Wil;
   import alternativa.tanks.models.weapon.shared.Zyzeri;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   import alternativa.tanks.service.settings.keybinding.GameActionEnum;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.battleinput.Tyd;
   import alternativa.tanks.services.battlereadiness.BattleReadinessService;
   import alternativa.tanks.services.bonusregion.BonusRegionService;
   import alternativa.tanks.services.colortransform.Bajoryta;
   import alternativa.tanks.services.colortransform.ColorTransformService;
   import alternativa.tanks.services.mipmapping.MipMappingService;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.DataValidationErrorEvent;
   import alternativa.tanks.utils.objectpool.ObjectPool;
   import alternativa.types.Long;
   import alternativa.utils.DebugPanel;
   import alternativa.utils.TextureMaterialRegistry;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.BattleBonus;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.BattlefieldResources;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.BattlefieldSoundScheme;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.geom.Vector3D;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import obfuscation.cawutare.Gen;
   import obfuscation.fatik.Zer;
   import obfuscation.jewyti.Duso;
   import obfuscation.joraky.Lyratumy;
   import obfuscation.joraky.Pywy;
   import obfuscation.kisagehy.Dyrur;
   import obfuscation.kisagehy.Holij;
   import obfuscation.kisagehy.Qomopesu;
   import obfuscation.kofen.Vector3d;
   import obfuscation.kyre.TanksCollisionDetector;
   import obfuscation.kyt.Kijuro;
   import obfuscation.lozewaby.Guh;
   import obfuscation.raryzuzif.Sijy;
   import obfuscation.rilid.Kuqedeqi;
   import obfuscation.rofa.ISound3DEffect;
   import obfuscation.ronadylez.Jypig;
   import obfuscation.vynoq.Nykabebin;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battlefield.models.battle.battlefield.Rejeh;
   import projects.tanks.client.battlefield.models.battle.battlefield.Zotimum;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class BattlefieldModel extends Zotimum implements BattleService, Rejeh, ObjectLoadListener, ObjectUnloadListener, BattleEventListener
   {
      
      public static var gofu:Sijy;
      
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var settings:ISettingsService;
      
      [Inject]
      public static var mymodo:IBackgroundService;
      
      [Inject]
      public static var nawep:MipMappingService;
      
      [Inject]
      public static var suner:TextureMaterialRegistry;
      
      [Inject]
      public static var wefu:ColorTransformService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var cafolo:BattleReadinessService;
      
      [Inject]
      public static var bafat:BattleInputService;
      
      [Inject]
      public static var kyb:BattleGUIService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var lijukysuw:TargetingInputManager;
      
      [Inject]
      public static var pulat:TargetingModeService;
      
      [Inject]
      public static var notificationService:INotificationService;
      
      [Inject]
      public static var tytol:KeysBindingService;
      
      private static const zuvawep:int = 60;
      
      private static const foky:int = 3000;
      
      private static const fijiw:int = 5000;
      
      private static const gomihu:Vector3D = new Vector3D();
      
      private static const ticysuzo:Vector3D = new Vector3D();
      
      private static const CHANNEL:String = "battle";
      
      private static const qicymudoz:String = "battle2server";
      
      private const vopa:ObjectPool = new ObjectPool();
      
      private const nyvyfytug:TimeStatistics = new TimeStatistics();
      
      private const jewyrewis:Wil = new Nykabebin();
      
      private var fykozure:BattleView;
      
      private var wagynuw:DebugPanel;
      
      private var dejysa:Baba;
      
      private var qyluvun:TankModel;
      
      private var battleActive:Boolean;
      
      private var ambientSound:AmbientSound;
      
      private var reba:SpeedHackChecker;
      
      public var ladar:BattlefieldData;
      
      private var cacefe:StageFrameRateController;
      
      private var nabugy:Boolean;
      
      private var qowir:CommonTargetEvaluator;
      
      private var bonusRegionService:BonusRegionService;
      
      private var gymuvu:Qunomili;
      
      private var sodiwamil:Zyzeri;
      
      private var cilenipy:Zer;
      
      private var jemuwuz:Zynomy;
      
      private var sodydic:FollowCameraController;
      
      private var culyb:Wedisatoj;
      
      private var cygakaly:Duso;
      
      private var sinesi:Vector3 = new Vector3();
      
      private var mipimy:Vector3 = new Vector3();
      
      private var gui:Tupebeput;
      
      public var spectatorMode:Boolean;
      
      public var qitep:Jypig = new Jypig();
      
      private var cuv:Object3DRevolver;
      
      private var collisionDetector:TanksCollisionDetector;
      
      private var rijynuvu:BattleRunner;
      
      private var battleData:BattleData;
      
      private var vuto:Qomopesu;
      
      private var juvyba:BattleScene3D;
      
      private var logger:Logger;
      
      private var velumipi:Logger;
      
      private var vadynoja:SpectatorUserTitleRenderer;
      
      private var nym:FollowCameraControllerLocker;
      
      private var gynorete:SpectatorFogToggleSupport;
      
      private var larupakic:Gen;
      
      private var jegubu:Boolean;
      
      private var navu:Boolean;
      
      private var pewinol:Boolean;
      
      private var mapId:Long;
      
      public function BattlefieldModel()
      {
         super();
         this.velumipi = logService.getLogger(qicymudoz);
         this.logger = logService.getLogger(CHANNEL);
         this.sesul();
      }
      
      public static function vyb(_arg_1:Vector3, _arg_2:Vector3D) : void
      {
         _arg_2.x = _arg_1.x;
         _arg_2.y = _arg_1.y;
         _arg_2.z = _arg_1.z;
      }
      
      private function sesul() : void
      {
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Qub,this.seram);
         this.dejysa.jikina(DataValidationErrorEvent,this.lokodo);
         this.dejysa.bijoja();
      }
      
      public function getBattleScene3D() : BattleScene3D
      {
         return this.juvyba;
      }
      
      public function getBattleView() : BattleView
      {
         return this.fykozure;
      }
      
      public function negak(_arg_1:Event) : void
      {
      }
      
      public function byganuly(_arg_1:Event) : void
      {
      }
      
      private function kizohapib() : void
      {
         var _local_1:Boolean = false;
         if(cafolo.isBattleReady())
         {
            _local_1 = settings.muteSound;
            this.rijynuvu.lokezi().hud(_local_1);
            this.ambientSound.play(!_local_1 && settings.bgSound);
         }
      }
      
      public function pykeb(_arg_1:Event) : void
      {
         this.juvyba.huc(settings.showSkyBox);
         this.kizohapib();
         this.welejon();
         this.cacefe.pivugi(settings.adaptiveFPS);
      }
      
      public function welejon() : void
      {
         this.juvyba.gumy(settings.graphicsAutoQuality,this.mapId.toString());
         if(!settings.graphicsAutoQuality)
         {
            this.juvyba.zyboh(settings.fog);
            this.juvyba.dewecul(settings.shadows);
            this.juvyba.finifep(settings.dynamicShadows);
            this.juvyba.qazid(settings.wobyza);
            this.juvyba.tytole(settings.dust);
            this.juvyba.woc(settings.ssao);
            this.juvyba.garocifuf(settings.dynamicLighting);
            this.juvyba.qaqedy(settings.antialiasing);
         }
         this.juvyba.mahokobes(true);
         nawep.setMipMapping(settings.mipMapping);
      }
      
      public function cybe(_arg_1:BitmapData) : void
      {
         this.juvyba.cybe(_arg_1);
      }
      
      public function komoga() : BattlefieldData
      {
         return this.ladar;
      }
      
      public function initObject(clientObject:ClientObject, battleActive:Boolean, battlemap:Qomopesu, battlefieldResources:BattlefieldResources, battlefieldSoundScheme:BattlefieldSoundScheme, idleKickPeriodMsec:int, mapDescriptorResourceId:String, respawnInvulnerabilityPeriodMsec:int, skyboxTextureResourceId:String, spectator:Boolean, battleObject:IGameObject, battleParameters:Object) : void
      {
         var modelService:IModelService = null;
         try
         {
            this.battleActive = battleActive;
            this.vuto = battlemap;
            this.spectatorMode = spectator;
            this.qyluvun = OSGi.getInstance().getService(ITankModel) as TankModel;
            modelService = IModelService(OSGi.getInstance().getService(IModelService));
            this.gui = OSGi.getInstance().getService(Tupebeput) as Tupebeput;
            this.ladar = new BattlefieldData();
            this.bonusRegionService = new BonusRegionService(battleEventDispatcher);
            this.ladar.bfObject = clientObject;
            this.ladar.mazobek = display.contentLayer;
            this.ladar.tuhi = respawnInvulnerabilityPeriodMsec;
            this.ladar.bafebyvyz = idleKickPeriodMsec;
            battleInfoService.reArmorEnabled = battleParameters.reArmorEnabled;
            battleInfoService.spectator = spectator;
            battleInfoService.setCurrentSelectionBattle(battleParameters.battleId,battleParameters.minRank,battleParameters.maxRank);
            battleInfoService.currentBattleId = battleParameters.battleId;
            wefu.setColorTransform(Bajoryta.jozegofag(battlemap.nosisaw,0.5));
            this.kynuj(battleParameters.ambientSoundId);
            this.peqose();
            this.vivopajin(battleObject);
            this.rijynuvu.lokezi().hud(true);
            this.ambientSound = new AmbientSound(this.battleData.ambientSound,this.rijynuvu.lokezi());
            this.geby();
            this.reba = new SpeedHackChecker(battleEventDispatcher);
            this.nyvyfytug.reset();
         }
         catch(e:Error)
         {
            jajonipu(e);
         }
      }
      
      public function addGoldRegion(pos:Vector3, id:String) : void
      {
         this.bonusRegionService.addAndShowGoldRegion(pos,id);
      }
      
      public function removeGoldRegion(id:String) : void
      {
         this.bonusRegionService.hideAndRemoveGoldRegion(id);
      }
      
      public function addBonusRegion(pos:Vector3, name:String) : void
      {
         this.bonusRegionService.addAndShowRegion(pos,name);
      }
      
      private function geby() : void
      {
         settings.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.pykeb);
      }
      
      private function lagigyw() : void
      {
         settings.removeEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.pykeb);
      }
      
      public function initBonuses(_arg_1:ClientObject, _arg_2:Array) : void
      {
         var _local_3:BattleBonus = null;
         if(_arg_2 == null)
         {
            return;
         }
         for each(_local_3 in _arg_2)
         {
            this.teqidep(_local_3.id,_local_3.objectId,_local_3.position,_arg_1,_local_3.timeLife,_local_3.timeFromAppearing,_local_3.bonusResourceId,_local_3.lighting);
         }
      }
      
      public function addBonus(_arg_1:ClientObject, _arg_2:String, _arg_3:String, _arg_4:Vector3d, _arg_5:int, _arg_6:Long, _arg_7:Object) : void
      {
         this.teqidep(_arg_2,_arg_3,_arg_4,_arg_1,_arg_5,0,_arg_6,_arg_7);
      }
      
      public function removeBonus(_arg_1:ClientObject, _arg_2:String) : void
      {
         if(this.ladar == null)
         {
            return;
         }
         var _local_3:Bonus = this.ladar.bonuses[_arg_2];
         if(_local_3 != null)
         {
            delete this.ladar.bonuses[_arg_2];
            _local_3.remove();
         }
      }
      
      public function bonusTaken(_arg_1:ClientObject, _arg_2:String) : void
      {
         if(this.ladar == null)
         {
            return;
         }
         var _local_3:Bonus = this.ladar.bonuses[_arg_2];
         if(_local_3 != null)
         {
            delete this.ladar.bonuses[_arg_2];
            _local_3.pickup();
         }
      }
      
      public function onTankCollision(_arg_1:Bonus) : void
      {
         battleEventDispatcher.dispatchEvent(Vegepos.figahe);
         this.kykur(_arg_1.bonusId);
      }
      
      private function kynuj(_arg_1:Long) : void
      {
         this.battleData = new BattleData();
         this.battleData.synuwuf(300000);
         this.battleData.ambientSound = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(_arg_1)).sound;
         this.battleData.vonadeny = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,878808))).sound;
      }
      
      public function peqose() : void
      {
         this.juvyba = new BattleScene3D(display.stage,suner,0.5);
         var _local_1:Qomopesu = this.vuto;
         var _local_2:Dyrur = _local_1.fogParams;
         var _local_3:Holij = _local_1.nosisaw;
         this.juvyba.horidawu(_local_2.color,_local_2.alpha,_local_2.nearLimit,_local_2.farLimit);
         this.juvyba.muge(_local_3.lightColor,_local_3.shadowColor,_local_3.angleX,_local_3.angleZ);
         this.fykozure = new BattleView();
         var _local_4:Number = _local_1.gravity;
         this.rijynuvu = new BattleRunner(_local_4,this.battleData.ambientSound,battleEventDispatcher);
         this.ladar.collisionDetector = this.rijynuvu.soc();
         this.juvyba.gipa(new DecalFactory(this.rijynuvu.soc()));
         this.juvyba.tihajyw(this,_local_1.bobu);
         this.juvyba.ziwic(_local_1.ssaoColor);
         this.cacefe = new StageFrameRateController(display.stage,this.rijynuvu,this.nyvyfytug);
         this.cacefe.pivugi(settings.adaptiveFPS);
         this.fykozure.lacyfu(kyb.qocuwo());
         this.wagynuw = new DebugPanel();
         this.wagynuw.visible = false;
         display.stage.addChild(this.wagynuw);
         this.sodydic = new FollowCameraController();
         this.culyb = new Wedisatoj(foky);
         this.larupakic = new Gen();
      }
      
      private function vivopajin(_arg_1:IGameObject) : void
      {
         this.wuloc();
         var _local_2:Kuqedeqi = this.neju(_arg_1);
         var _local_3:MapResource = _local_2.kof();
         this.mapId = _local_3.id;
         var _local_4:XML = XML(_local_3.mapData.toString());
         var _local_5:Sijy = new Sijy(suner,_local_3.libRegistry);
         _local_5.build(_local_4,this.wokyr);
         gofu = _local_5;
      }
      
      private function neju(_arg_1:IGameObject) : Kuqedeqi
      {
         return Kuqedeqi(_arg_1.adapt(Kuqedeqi));
      }
      
      private function wuloc() : void
      {
         var _local_1:BattleSkyBox = new BattleSkyBox(this.vuto.nopoh);
         this.juvyba.johoqup(_local_1);
         this.juvyba.huc(settings.showSkyBox);
         var _local_2:Vector3 = BattleUtils.haq(this.vuto.joneb);
         var _local_3:Number = this.vuto.comacena;
         this.cuv = new Object3DRevolver(_local_1,_local_2,_local_3);
         this.juvyba.toqok(this.cuv,0);
      }
      
      private function kykur(_arg_1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("battle;attempt_to_take_bonus;" + _arg_1);
      }
      
      public function bakicubir(_arg_1:ClientObject) : void
      {
         this.battleActive = true;
      }
      
      public function battleFinish(_arg_1:ClientObject) : void
      {
         var _local_2:* = undefined;
         var _local_3:Bonus = null;
         this.battleActive = false;
         battleEventDispatcher.dispatchEvent(new Vovakopy());
         UltimateModel(OSGi.getInstance().getService(IUltimateModel)).onBattleFinish();
         this.bonusRegionService.hideAndRemoveGoldRegions();
         for(_local_2 in this.ladar.bonuses)
         {
            _local_3 = this.ladar.bonuses[_local_2];
            _local_3.remove();
            delete this.ladar.bonuses[_local_2];
         }
      }
      
      public function battleRestart(_arg_1:ClientObject) : void
      {
         this.battleActive = true;
         battleEventDispatcher.dispatchEvent(new Qigawi());
      }
      
      public function objectLoaded() : void
      {
         battleInfoService.setInBattle(true);
         this.welejon();
         this.nyvyfytug.reset();
         this.addListeners();
         this.ladar.time = getTimer();
         if(!this.spectatorMode)
         {
            this.fykeje();
         }
         else
         {
            Network(OSGi.getInstance().getService(INetworker)).send("battle;spectator_user_init");
            this.vabit();
         }
         battleInfoService.battleLoad();
         (OSGi.getInstance().getService(IPanelView) as IPanelView).unlock();
      }
      
      private function fykeje() : void
      {
         lijukysuw.init();
         pulat.init();
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      public function objectUnloaded() : void
      {
         var _local_1:Bonus = null;
         if(this.spectatorMode)
         {
            this.nym.close();
            this.gynorete.close();
            this.vadynoja.close();
         }
         this.battleActive = false;
         if(this.ladar == null)
         {
            return;
         }
         battleEventDispatcher.dispatchEvent(new BattleLoadEvent());
         this.cacefe.debo();
         this.cacefe = null;
         this.lagigyw();
         this.juvyba.shutdown();
         this.rijynuvu.shutdown();
         this.removeListeners();
         this.larupakic.close();
         this.larupakic = null;
         Lyratumy(OSGi.getInstance().getService(BattleUserInfoService)).close();
         OSGi.getInstance().unregisterService(Pywy);
         this.fykozure.fivata();
         this.fykozure.destroy();
         this.fykozure = null;
         this.juvyba.cewubu().view.clear();
         this.juvyba.cewubu().view = null;
         this.zoru(null);
         this.wagynuw = null;
         for each(_local_1 in this.ladar.bonuses)
         {
            _local_1.remove();
            _local_1 = null;
         }
         this.ladar.collisionDetector.destroy();
         this.ladar.collisionDetector = null;
         this.ladar.physicsScene = null;
         mymodo.drawBg();
         battleInfoService.setInBattle(false);
         battleInfoService.resetCurrentBattle();
         wefu.setColorTransform(null);
         cafolo.reset();
         kyb.hide();
         this.sodydic.close();
         this.sodydic = null;
         this.culyb.close();
         this.culyb = null;
         if(Boolean(this.cygakaly))
         {
            this.cygakaly.close();
            this.cygakaly = null;
         }
         BonusCache.clear();
         if(!this.spectatorMode)
         {
            pulat.close();
            lijukysuw.close();
         }
         this.ladar = null;
         this.jegubu = false;
         this.getObjectPool().clear();
         this.navu = false;
      }
      
      public function addGraphicEffect(_arg_1:GraphicEffect) : void
      {
         this.juvyba.addGraphicEffect(_arg_1);
      }
      
      public function wikyhih(_arg_1:ISound3DEffect) : void
      {
         this.rijynuvu.lokezi().vakydiqip(_arg_1);
      }
      
      public function dop() : void
      {
         kyb.show();
         this.juvyba.lace();
         this.kizohapib();
      }
      
      public function getObjectPool() : ObjectPool
      {
         return this.vopa;
      }
      
      public function pafobome(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         if(this.juvyba.zuv() != this.sodydic)
         {
            return;
         }
         this.sodydic.deactivate();
         this.sodydic.ruvuruc(_arg_1,_arg_2,this.sinesi,this.mipimy);
         this.culyb.init(this.sinesi,this.mipimy);
         this.juvyba.sefu(this.culyb);
      }
      
      public function gonuju() : void
      {
         this.sodydic.muduqi(true);
      }
      
      public function vedyquqyp() : void
      {
         this.sodydic.nozejoke();
      }
      
      public function palecidev() : void
      {
         this.sodydic.muduqi(false);
      }
      
      public function rutewa(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         this.sodydic.rozyqagyr(_arg_1,_arg_2);
      }
      
      public function sidanige() : void
      {
         if(this.juvyba != null)
         {
            this.juvyba.cewubu().rotationY = 0;
            this.sodydic.lurel();
         }
      }
      
      public function bofoh() : void
      {
         this.sodydic.activate();
         this.sodydic.lurel();
      }
      
      public function vabit() : void
      {
         var _local_1:Vector3 = new Vector3();
         var _local_2:Vector3 = new Vector3();
         this.qan(_local_1,_local_2,gofu.lypeb());
         this.juvyba.cewubu().setPosition(_local_1);
         this.juvyba.cewubu().lookAt(_local_2.x,_local_2.y,_local_2.z);
         this.cygakaly = new Duso();
         this.cygakaly.activate();
         this.sefu(this.cygakaly);
         var _local_3:SpectatorUserTitleRenderer = new SpectatorUserTitleRenderer();
         this.vadynoja = _local_3;
         this.juvyba.qomasabyg(_local_3);
         cafolo.jiju();
         this.nym = new FollowCameraControllerLocker(this.cygakaly);
         this.gynorete = new SpectatorFogToggleSupport();
         if(!lobbyLayoutService.isSwitchInProgress())
         {
            bafat.unlock(Tyd.byzidaj);
         }
      }
      
      public function qan(_arg_1:Vector3, _arg_2:Vector3, _arg_3:AABB) : void
      {
         _arg_1.x = _arg_3.minX;
         _arg_1.y = _arg_3.minY;
         _arg_1.z = _arg_3.maxZ + fijiw;
         _arg_2.x = (_arg_3.minX + _arg_3.maxX) / 2;
         _arg_2.y = (_arg_3.minY + _arg_3.maxY) / 2;
         _arg_2.z = _arg_3.minZ;
      }
      
      public function sefu(_arg_1:Zynomy) : void
      {
         this.juvyba.sefu(_arg_1);
      }
      
      public function zoru(_arg_1:Tank) : void
      {
         this.sodydic.juvilyvyb(_arg_1);
      }
      
      public function getRespawnInvulnerabilityPeriod() : int
      {
         return this.komoga().tuhi;
      }
      
      public function qynot(_arg_1:String, _arg_2:String) : void
      {
         this.wagynuw.printValue(_arg_1,_arg_2);
      }
      
      public function cudofypo(_arg_1:Boolean) : void
      {
         var _local_2:Boolean = settings.muteSound;
         this.rijynuvu.lokezi().hud(_local_2);
      }
      
      public function gusipeva() : FollowCameraController
      {
         return this.sodydic;
      }
      
      private function wokyr() : void
      {
         this.gui = OSGi.getInstance().getService(Tupebeput) as Tupebeput;
         if(!this.spectatorMode)
         {
            Network(OSGi.getInstance().getService(INetworker)).send("battle;get_init_data_local_tank");
         }
         this.sodydic.pimana(gofu.jidokezyp());
         this.bynamazo();
         cafolo.sylutysiv();
         battleEventDispatcher.dispatchEvent(new Gysugomem());
         this.objectLoaded();
      }
      
      private function bynamazo() : void
      {
         display.stage.frameRate += 1;
         --display.stage.frameRate;
      }
      
      private function addListeners() : void
      {
         display.stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKey);
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function removeListeners() : void
      {
         display.stage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKey);
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var event:Event = param1;
         try
         {
            this.tick();
            return;
         }
         catch(e:Error)
         {
            jajonipu(e);
            return;
         }
      }
      
      private function tick() : void
      {
         this.nyvyfytug.update();
         this.rijynuvu.tick();
         lijukysuw.tick();
         pulat.tick();
      }
      
      private function jajonipu(_arg_1:Error) : void
      {
         if(!this.pewinol)
         {
            this.pewinol = true;
            this.velumipi.error(_arg_1.getStackTrace());
            this.qodymil();
         }
      }
      
      private function qodymil() : void
      {
         notificationService.addNotification(new ErrorNotification());
      }
      
      public function getBattleRunner() : BattleRunner
      {
         return this.rijynuvu;
      }
      
      public function updateTanks(_arg_1:int, _arg_2:int, _arg_3:Number, _arg_4:Number) : void
      {
         var _local_6:Tank = null;
         var _local_5:Vector3 = this.juvyba.cewubu().position;
         for each(_local_6 in this.qyluvun.nocidafim())
         {
            this.qyluvun.update(_local_6 as Tank,_arg_1,_arg_2,_arg_3,_arg_4,_local_5);
         }
      }
      
      private function onKeyDown(_arg_1:KeyboardEvent) : void
      {
         var _local_2:GameActionEnum = null;
         if(!bafat.miwyraze())
         {
            _local_2 = tytol.jikamybu(_arg_1.keyCode);
            if(_local_2 == GameActionEnum.OPEN_GARAGE)
            {
               lobbyLayoutService.showGarage();
            }
         }
      }
      
      private function onKey(_arg_1:KeyboardEvent) : void
      {
         if(!bafat.miwyraze())
         {
            if(_arg_1.type == KeyboardEvent.KEY_DOWN)
            {
               this.tabuduhy(_arg_1);
            }
         }
      }
      
      private function tabuduhy(_arg_1:KeyboardEvent) : void
      {
      }
      
      public function rep() : CommonTargetEvaluator
      {
         return this.qowir;
      }
      
      public function lipa(_arg_1:CommonTargetEvaluator) : void
      {
         this.qowir = _arg_1;
      }
      
      public function moq() : Wil
      {
         return this.jewyrewis;
      }
      
      public function hacuqajy() : Qunomili
      {
         return this.gymuvu;
      }
      
      public function nygeq(_arg_1:Qunomili) : void
      {
         this.gymuvu = _arg_1;
      }
      
      public function bepupyba() : Zyzeri
      {
         return this.sodiwamil;
      }
      
      public function cocuk(_arg_1:Zyzeri) : void
      {
         this.sodiwamil = _arg_1;
      }
      
      public function duzyna() : int
      {
         return this.battleData.duzyna();
      }
      
      public function huruvo() : Sound
      {
         return this.battleData.vonadeny;
      }
      
      public function get kyfyrid() : Guh
      {
         return this.rijynuvu.lokezi();
      }
      
      public function lurimire() : Boolean
      {
         return this.battleActive;
      }
      
      public function paluhu() : Dictionary
      {
         return this.juvyba.zamume();
      }
      
      public function vome() : void
      {
         this.sefu(this.sodydic);
      }
      
      public function hulivyjam() : int
      {
         return this.rijynuvu.hulivyjam();
      }
      
      public function fibisezoc() : void
      {
         this.jegubu = true;
      }
      
      public function bezycavag() : Boolean
      {
         return !this.jegubu;
      }
      
      public function nepojinig() : int
      {
         return this.culyb.duration;
      }
      
      public function holyh() : Boolean
      {
         return this.navu;
      }
      
      public function hadapag(_arg_1:Boolean) : void
      {
         this.navu = _arg_1;
      }
      
      public function gemokir() : Zer
      {
         return this.cilenipy;
      }
      
      public function sipase(_arg_1:Zer) : void
      {
         this.cilenipy = _arg_1;
      }
      
      private function seram(_arg_1:Qub) : void
      {
         var _local_2:Qub = _arg_1;
         server.nybofe(Vector.<int>(_local_2.fok));
      }
      
      private function lokodo(_arg_1:DataValidationErrorEvent) : void
      {
         this.jadada(_arg_1.type);
      }
      
      private function jadada(_arg_1:int) : void
      {
         var _local_2:int = _arg_1;
         server.vucigazy(_local_2);
      }
      
      private function teqidep(_arg_1:String, _arg_2:String, _arg_3:Vector3d, _arg_4:ClientObject, _arg_5:int, _arg_6:int, _arg_7:Long, _arg_8:Object) : Bonus
      {
         if(_arg_1 == null)
         {
            return null;
         }
         var _local_9:Kijuro = new Kijuro();
         _local_9.initObject(_arg_4,_arg_7,Long.getLong(0,1000065),_arg_5,Long.getLong(0,170005),Long.getLong(0,170004),Long.getLong(0,269321),_arg_8);
         var _local_10:Bonus = _local_9.tohubyfoj(_arg_1);
         _local_10.spawn(new Vector3(_arg_3.x,_arg_3.y,_arg_3.z),_arg_6,150,this.onTankCollision);
         this.ladar.bonuses[_local_10.bonusId] = _local_10;
         return _local_10;
      }
   }
}

