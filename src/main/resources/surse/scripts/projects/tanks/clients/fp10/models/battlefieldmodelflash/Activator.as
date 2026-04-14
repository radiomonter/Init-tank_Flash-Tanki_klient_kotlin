package projects.tanks.clients.fp10.models.battlefieldmodelflash
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.dump.IDumpService;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.battle.BattleRunner;
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.BattleView;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.scene3d.FadingDecalsRenderer;
   import alternativa.tanks.bg.IBackgroundService;
   import alternativa.tanks.bonuses.BonusObject3DBase;
   import alternativa.tanks.bonuses.BonusPickupAnimation;
   import alternativa.tanks.bonuses.GroundSpawnRenderer;
   import alternativa.tanks.bonuses.ParachuteDetachAnimation;
   import alternativa.tanks.bonuses.RemovalAnimation;
   import alternativa.tanks.bonuses.SpawnAnimation;
   import alternativa.tanks.bonuses.SpawnFlashRenderer;
   import alternativa.tanks.camera.CameraBookmark;
   import alternativa.tanks.camera.FollowCameraController;
   import alternativa.tanks.camera.Zyzy;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.Symub;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.models.battle.battlefield.BattleModel;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.battle.battlefield.BattlefieldEvents;
   import alternativa.tanks.models.battle.battlefield.BattlefieldEventsAdapt;
   import alternativa.tanks.models.battle.battlefield.BattlefieldEventsEvents;
   import alternativa.tanks.models.battle.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battle.battlefield.FollowCameraControllerLocker;
   import alternativa.tanks.models.battle.battlefield.SpectatorFogToggleSupport;
   import alternativa.tanks.models.battle.battlefield.SpectatorUserTitleRenderer;
   import alternativa.tanks.models.battle.battlefield.StageFrameRateController;
   import alternativa.tanks.models.battle.gui.chat.ChatModel;
   import alternativa.tanks.models.battle.gui.chat.Robyq;
   import alternativa.tanks.models.battle.gui.chat.Suku;
   import alternativa.tanks.models.battle.gui.chat.Tiwawi;
   import alternativa.tanks.models.battle.gui.chat.Wejej;
   import alternativa.tanks.models.battle.gui.inventory.InventoryItemModel;
   import alternativa.tanks.models.battle.gui.inventory.InventoryModel;
   import alternativa.tanks.models.battle.gui.markers.PointIndicatorStateProvider;
   import alternativa.tanks.models.battle.jgr.BattleJGRModel;
   import alternativa.tanks.models.battle.jgr.Juggernaut;
   import alternativa.tanks.models.battle.jgr.JuggernautModel;
   import alternativa.tanks.models.battle.jgr.killstreak.KillStreakModel;
   import alternativa.tanks.models.tank.Bez;
   import alternativa.tanks.models.tank.Gyjohul;
   import alternativa.tanks.models.tank.Kyvuqufu;
   import alternativa.tanks.models.tank.Situs;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.Wigu;
   import alternativa.tanks.models.tank.spawn.Nava;
   import alternativa.tanks.models.tank.spawn.Pipujic;
   import alternativa.tanks.models.weapon.shaft.Fofewago;
   import alternativa.tanks.models.weapon.shaft.Hora;
   import alternativa.tanks.models.weapon.shaft.Myqawyni;
   import alternativa.tanks.models.weapon.shared.Lerih;
   import alternativa.tanks.models.weapon.shared.Zicoha;
   import alternativa.tanks.models.weapon.smoky.Riqicuso;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battlegui.Bohago;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.battlereadiness.BattleReadinessService;
   import alternativa.tanks.services.battlereadiness.Lenadet;
   import alternativa.tanks.services.bonusregion.BonusRegionService;
   import alternativa.tanks.services.colortransform.ColorTransformService;
   import alternativa.tanks.services.initialeffects.IInitialEffectsService;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.tanks.services.mipmapping.MipMappingService;
   import alternativa.tanks.services.ping.PingService;
   import alternativa.tanks.services.spectatorservice.SpectatorService;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import alternativa.tanks.services.targeting.Cifoduk;
   import alternativa.tanks.services.targeting.Lipasod;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.utils.DataValidator;
   import alternativa.utils.TextureMaterialRegistry;
   import obfuscation.beteg.Ruzesu;
   import obfuscation.beteg.Vatejataj;
   import obfuscation.buzoduhe.Lyfiqok;
   import obfuscation.bylucaliv.Bile;
   import obfuscation.cawutare.Cej;
   import obfuscation.cawutare.Gen;
   import obfuscation.cawutare.Gotowo;
   import obfuscation.cawutare.Kipycuzed;
   import obfuscation.cawutare.Muguv;
   import obfuscation.cawutare.Qohygyd;
   import obfuscation.cawutare.Tane;
   import obfuscation.cawutare.Vicytiwil;
   import obfuscation.dozas.Gek;
   import obfuscation.dozas.Zeqyfypoj;
   import obfuscation.facod.Jybawabaz;
   import obfuscation.fafiqu.Genyku;
   import obfuscation.fafiqu.Kyqifav;
   import obfuscation.fafiqu.Syce;
   import obfuscation.fafiqu.Vamobanoc;
   import obfuscation.fatik.Docokesy;
   import obfuscation.fatik.Fugorybo;
   import obfuscation.fatik.Ryfafapuk;
   import obfuscation.fatik.Vijiv;
   import obfuscation.fib.Mygopete;
   import obfuscation.fizeg.Zalizanef;
   import obfuscation.fuco.Doleni;
   import obfuscation.fymimywi.Codywo;
   import obfuscation.garud.Hoqeg;
   import obfuscation.garud.Rib;
   import obfuscation.garud.Rocuva;
   import obfuscation.garud.Rorucozok;
   import obfuscation.garud.Vaba;
   import obfuscation.gasovufe.Wuv;
   import obfuscation.gicuke.Benonizo;
   import obfuscation.gicuke.Gywipez;
   import obfuscation.gicuke.Perez;
   import obfuscation.gitepy.Mafew;
   import obfuscation.gitepy.Pys;
   import obfuscation.gur.Wonesegy;
   import obfuscation.gyny.TankTurnOverModel;
   import obfuscation.hizohofog.Birupu;
   import obfuscation.huqibunob.Gema;
   import obfuscation.jahuj.BattleGoldBonusesModel;
   import obfuscation.jebucahu.Bike;
   import obfuscation.jewyti.Feb;
   import obfuscation.jihadufef.Kikimy;
   import obfuscation.jihadufef.Mihadiwo;
   import obfuscation.jiw.Quwuhyby;
   import obfuscation.johek.Tytuhe;
   import obfuscation.joni.Gegyjerur;
   import obfuscation.joraky.Cuqer;
   import obfuscation.joraky.Kawubi;
   import obfuscation.joraky.Kyfaciki;
   import obfuscation.joraky.Mesenijoh;
   import obfuscation.joraky.Mule;
   import obfuscation.joraky.Pywy;
   import obfuscation.joraky.Ruv;
   import obfuscation.joraky.Tiso;
   import obfuscation.joraky.Toha;
   import obfuscation.juha.Fafit;
   import obfuscation.kajiz.Dapynoc;
   import obfuscation.kajiz.Vopefow;
   import obfuscation.kajiz.Wega;
   import obfuscation.kelideci.IChatModelBase;
   import obfuscation.kevidery.Jivo;
   import obfuscation.kevidery.Luga;
   import obfuscation.kisagehy.Zewufyb;
   import obfuscation.kudajazo.Licy;
   import obfuscation.kutyqypy.Busen;
   import obfuscation.kutyqypy.Hupylaqul;
   import obfuscation.kutyqypy.Zekuzejob;
   import obfuscation.kyre.Kysusufyk;
   import obfuscation.kyt.Kijuro;
   import obfuscation.kyvubyqu.Fovynakok;
   import obfuscation.likohot.Niqyvu;
   import obfuscation.lin.Gacisucy;
   import obfuscation.lin.Gewi;
   import obfuscation.lin.Sarocely;
   import obfuscation.lokofobiv.Wetopeh;
   import obfuscation.lopivyl.Pasysuwo;
   import obfuscation.lyjufaq.Zokisase;
   import obfuscation.lykegyc.Cok;
   import obfuscation.lysu.Soja;
   import obfuscation.mujusaqim.Byjeso;
   import obfuscation.mujusaqim.Fitef;
   import obfuscation.mujusaqim.Hewofyh;
   import obfuscation.mujusaqim.Hylyv;
   import obfuscation.mujusaqim.Linizujim;
   import obfuscation.mujusaqim.Zubisewi;
   import obfuscation.nabi.ControlsHelper;
   import obfuscation.nabi.Lotime;
   import obfuscation.nefysehu.Soca;
   import obfuscation.peve.Gic;
   import obfuscation.peve.Kanutu;
   import obfuscation.peve.Pagu;
   import obfuscation.peve.Vogab;
   import obfuscation.pigotib.Lubylag;
   import obfuscation.pikobu.Munano;
   import obfuscation.poluto.Covize;
   import obfuscation.poluto.Fowu;
   import obfuscation.poluto.Rutyqy;
   import obfuscation.poluto.Wewewyjy;
   import obfuscation.qasa.Tohiruce;
   import obfuscation.qef.Paderonuv;
   import obfuscation.qef.Puge;
   import obfuscation.qef.Vogigy;
   import obfuscation.qejoqa.Nogatomuz;
   import obfuscation.qevosuh.Muwyru;
   import obfuscation.qir.Beg;
   import obfuscation.quqykor.Vypybuham;
   import obfuscation.rajideziv.Bonyjygyp;
   import obfuscation.rajideziv.Mujyhon;
   import obfuscation.rajideziv.Rolipu;
   import obfuscation.rajideziv.Tawik;
   import obfuscation.raryzuzif.Sijy;
   import obfuscation.revubag.Cewyn;
   import obfuscation.rihyj.Haqaje;
   import obfuscation.rihyj.Wotufuduv;
   import obfuscation.rilid.Dadobap;
   import obfuscation.rilid.Kuqedeqi;
   import obfuscation.rilid.Tepysy;
   import obfuscation.rilid.Vatu;
   import obfuscation.rofa.Gojaca;
   import obfuscation.rofa.Sound3DEffect;
   import obfuscation.rofa.Tyno;
   import obfuscation.rokal.Fyzeqap;
   import obfuscation.rokal.Gusuredu;
   import obfuscation.rokal.Losusoq;
   import obfuscation.rokal.Riwizy;
   import obfuscation.siw.Bufofav;
   import obfuscation.siw.Gyfira;
   import obfuscation.sosa.Buje;
   import obfuscation.sosa.Dyry;
   import obfuscation.sosa.Vepewob;
   import obfuscation.sosa.Zaq;
   import obfuscation.tyf.Dysihuma;
   import obfuscation.tyf.Tyvyzos;
   import obfuscation.tyhyzah.Dyn;
   import obfuscation.vacogofiv.Sybo;
   import obfuscation.vafy.Mewiq;
   import obfuscation.vat.Tidip;
   import obfuscation.vat.Visipykif;
   import obfuscation.vecuhamep.Futop;
   import obfuscation.vecuhamep.Jijapib;
   import obfuscation.vecuhamep.Meqof;
   import obfuscation.vecuhamep.Sokawyt;
   import obfuscation.venu.Mureke;
   import obfuscation.venu.Pocifafoc;
   import obfuscation.venu.Vobecibyb;
   import obfuscation.verymi.Mit;
   import obfuscation.verymi.Tazudeqe;
   import obfuscation.vet.Ruro;
   import obfuscation.wadili.Vysip;
   import obfuscation.wite.Juzyvyfy;
   import obfuscation.wokogi.Gelifo;
   import obfuscation.zeruwela.Gymynuc;
   import obfuscation.zima.Jig;
   import obfuscation.zima.Kyjojypyr;
   import obfuscation.zima.Rarimequ;
   import obfuscation.zoniseg.Nel;
   import obfuscation.zoniseg.RailgunSFXModel;
   import obfuscation.zosehicat.Now;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.battlefield.models.battle.battlefield.Rejeh;
   import projects.tanks.client.battlefield.models.battle.jgr.IJuggernautModelBase;
   import projects.tanks.client.battlefield.models.battle.jgr.killstreak.IKillStreakModelBase;
   import projects.tanks.client.battleservice.model.battle.jgr.IBattleJGRModelBase;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.flash.commons.services.serverhalt.IServerHaltService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.IBlockUserService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenStateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   import services.contextmenu.IContextMenuService;
   
   public class Activator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var modelRegister:ModelRegistry;
         var modelRegisterAdapt:ModelRegistry;
         var _osgi:OSGi = param1;
         osgi = _osgi;
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Bohago.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Bohago.display;
         });
         osgi.injectService(TargetingInputManager,function(_arg_1:Object):void
         {
            Vaba.vekol = TargetingInputManager(_arg_1);
         },function():TargetingInputManager
         {
            return Vaba.vekol;
         });
         osgi.injectService(TargetingModeService,function(_arg_1:Object):void
         {
            Vaba.pulat = TargetingModeService(_arg_1);
         },function():TargetingModeService
         {
            return Vaba.pulat;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            FollowCameraControllerLocker.norata = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return FollowCameraControllerLocker.norata;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            SpectatorFogToggleSupport.qakygyju = IDisplay(_arg_1);
         },function():IDisplay
         {
            return SpectatorFogToggleSupport.qakygyju;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            SpectatorFogToggleSupport.bafat = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return SpectatorFogToggleSupport.bafat;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            SpectatorFogToggleSupport.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return SpectatorFogToggleSupport.battleService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Ruv.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Ruv.display;
         });
         osgi.injectService(IPanelView,function(_arg_1:Object):void
         {
            Ruv.panelView = IPanelView(_arg_1);
         },function():IPanelView
         {
            return Ruv.panelView;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            Ruv.settingsService = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return Ruv.settingsService;
         });
         osgi.injectService(SpectatorService,function(_arg_1:Object):void
         {
            Ruv.kybewu = SpectatorService(_arg_1);
         },function():SpectatorService
         {
            return Ruv.kybewu;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            Ruv.pojotahut = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return Ruv.pojotahut;
         });
         osgi.injectService(BattleGUIService,function(_arg_1:Object):void
         {
            Ruv.ketit = BattleGUIService(_arg_1);
         },function():BattleGUIService
         {
            return Ruv.ketit;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(_arg_1:Object):void
         {
            Gen.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(_arg_1);
         },function():IDialogWindowsDispatcherService
         {
            return Gen.dialogWindowsDispatcherService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            Gen.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return Gen.lobbyLayoutService;
         });
         osgi.injectService(IDialogsService,function(_arg_1:Object):void
         {
            Gen.dialogService = IDialogsService(_arg_1);
         },function():IDialogsService
         {
            return Gen.dialogService;
         });
         osgi.injectService(IBlurService,function(_arg_1:Object):void
         {
            Gen.blurService = IBlurService(_arg_1);
         },function():IBlurService
         {
            return Gen.blurService;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            Gen.bafat = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return Gen.bafat;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Gen.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Gen.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            SpectatorUserTitleRenderer.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return SpectatorUserTitleRenderer.battleEventDispatcher;
         });
         osgi.injectService(SpectatorService,function(_arg_1:Object):void
         {
            SpectatorUserTitleRenderer.kybewu = SpectatorService(_arg_1);
         },function():SpectatorService
         {
            return SpectatorUserTitleRenderer.kybewu;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            Kipycuzed.bafat = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return Kipycuzed.bafat;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Mygopete.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Mygopete.battleEventDispatcher;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Feb.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Feb.display;
         });
         osgi.injectService(TankUsersRegistry,function(_arg_1:Object):void
         {
            Feb.derys = TankUsersRegistry(_arg_1);
         },function():TankUsersRegistry
         {
            return Feb.derys;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Feb.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Feb.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Feb.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Feb.battleEventDispatcher;
         });
         osgi.injectService(IContextMenuService,function(_arg_1:Object):void
         {
            Feb.contextMenuService = IContextMenuService(_arg_1);
         },function():IContextMenuService
         {
            return Feb.contextMenuService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Suku.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Suku.display;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            Suku.norata = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return Suku.norata;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Suku.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Suku.battleEventDispatcher;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Suku.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Suku.localeService;
         });
         osgi.injectService(IBlockUserService,function(_arg_1:Object):void
         {
            Suku.blockUserService = IBlockUserService(_arg_1);
         },function():IBlockUserService
         {
            return Suku.blockUserService;
         });
         osgi.injectService(BattleGUIService,function(_arg_1:Object):void
         {
            Suku.kyb = BattleGUIService(_arg_1);
         },function():BattleGUIService
         {
            return Suku.kyb;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            Suku.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return Suku.battleInfoService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            Suku.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return Suku.userPropertiesService;
         });
         osgi.injectService(BattleUserInfoService,function(_arg_1:Object):void
         {
            Suku.userInfoService = BattleUserInfoService(_arg_1);
         },function():BattleUserInfoService
         {
            return Suku.userInfoService;
         });
         osgi.injectService(FullscreenService,function(_arg_1:Object):void
         {
            Suku.fullscreenService = FullscreenService(_arg_1);
         },function():FullscreenService
         {
            return Suku.fullscreenService;
         });
         osgi.injectService(TargetingInputManager,function(_arg_1:Object):void
         {
            Suku.lijukysuw = TargetingInputManager(_arg_1);
         },function():TargetingInputManager
         {
            return Suku.lijukysuw;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Robyq.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Robyq.localeService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            Gywipez.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return Gywipez.battleInfoService;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            Toha.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return Toha.storageService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Toha.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Toha.battleEventDispatcher;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            Toha.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return Toha.userPropertiesService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Toha.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Toha.display;
         });
         osgi.injectService(BattleGUIService,function(_arg_1:Object):void
         {
            Toha.kyb = BattleGUIService(_arg_1);
         },function():BattleGUIService
         {
            return Toha.kyb;
         });
         osgi.injectService(IHelpService,function(_arg_1:Object):void
         {
            Lotime.helpService = IHelpService(_arg_1);
         },function():IHelpService
         {
            return Lotime.helpService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Lotime.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Lotime.localeService;
         });
         osgi.injectService(TextureMaterialRegistry,function(_arg_1:Object):void
         {
            Now.dyb = TextureMaterialRegistry(_arg_1);
         },function():TextureMaterialRegistry
         {
            return Now.dyb;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Now.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Now.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Wetopeh.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Wetopeh.battleService;
         });
         osgi.injectService(EffectsMaterialRegistry,function(_arg_1:Object):void
         {
            Wetopeh.cicefuqo = EffectsMaterialRegistry(_arg_1);
         },function():EffectsMaterialRegistry
         {
            return Wetopeh.cicefuqo;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Wetopeh.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Wetopeh.battleEventDispatcher;
         });
         osgi.injectService(BattleGUIService,function(_arg_1:Object):void
         {
            Wetopeh.kyb = BattleGUIService(_arg_1);
         },function():BattleGUIService
         {
            return Wetopeh.kyb;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            Wetopeh.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return Wetopeh.battleInfoService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Gegyjerur.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Gegyjerur.display;
         });
         osgi.injectService(BattleGUIService,function(_arg_1:Object):void
         {
            Gegyjerur.tykih = BattleGUIService(_arg_1);
         },function():BattleGUIService
         {
            return Gegyjerur.tykih;
         });
         osgi.injectService(ColorTransformService,function(_arg_1:Object):void
         {
            Fafit.wefu = ColorTransformService(_arg_1);
         },function():ColorTransformService
         {
            return Fafit.wefu;
         });
         osgi.injectService(TextureMaterialRegistry,function(_arg_1:Object):void
         {
            Fafit.suner = TextureMaterialRegistry(_arg_1);
         },function():TextureMaterialRegistry
         {
            return Fafit.suner;
         });
         osgi.injectService(ILightingEffectsService,function(_arg_1:Object):void
         {
            Fafit.qapy = ILightingEffectsService(_arg_1);
         },function():ILightingEffectsService
         {
            return Fafit.qapy;
         });
         osgi.injectService(TextureMaterialRegistry,function(_arg_1:Object):void
         {
            Kijuro.suner = TextureMaterialRegistry(_arg_1);
         },function():TextureMaterialRegistry
         {
            return Kijuro.suner;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Kijuro.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Kijuro.battleService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            Munano.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return Munano.battleInfoService;
         });
         osgi.injectService(TankUsersRegistry,function(_arg_1:Object):void
         {
            Munano.derys = TankUsersRegistry(_arg_1);
         },function():TankUsersRegistry
         {
            return Munano.derys;
         });
         osgi.injectService(BattleUserInfoService,function(_arg_1:Object):void
         {
            Munano.userInfoService = BattleUserInfoService(_arg_1);
         },function():BattleUserInfoService
         {
            return Munano.userInfoService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            FadingDecalsRenderer.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return FadingDecalsRenderer.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Bike.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Bike.battleService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Cewyn.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Cewyn.display;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            Cewyn.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return Cewyn.lobbyLayoutService;
         });
         osgi.injectService(IServerHaltService,function(_arg_1:Object):void
         {
            Cewyn.qag = IServerHaltService(_arg_1);
         },function():IServerHaltService
         {
            return Cewyn.qag;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            Cewyn.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return Cewyn.userPropertiesService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Cewyn.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Cewyn.battleEventDispatcher;
         });
         osgi.injectService(BattleGUIService,function(_arg_1:Object):void
         {
            Cewyn.tykih = BattleGUIService(_arg_1);
         },function():BattleGUIService
         {
            return Cewyn.tykih;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            Cewyn.bafat = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return Cewyn.bafat;
         });
         osgi.injectService(INotificationService,function(_arg_1:Object):void
         {
            Cewyn.notificationService = INotificationService(_arg_1);
         },function():INotificationService
         {
            return Cewyn.notificationService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            Cewyn.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return Cewyn.battleInfoService;
         });
         osgi.injectService(PremiumService,function(_arg_1:Object):void
         {
            Cewyn.premiumService = PremiumService(_arg_1);
         },function():PremiumService
         {
            return Cewyn.premiumService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Benonizo.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Benonizo.localeService;
         });
         osgi.injectService(TargetingInputManager,function(_arg_1:Object):void
         {
            Cifoduk.vekol = TargetingInputManager(_arg_1);
         },function():TargetingInputManager
         {
            return Cifoduk.vekol;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Cifoduk.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Cifoduk.battleEventDispatcher;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Cifoduk.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Cifoduk.display;
         });
         osgi.injectService(FullscreenStateService,function(_arg_1:Object):void
         {
            Cifoduk.comihar = FullscreenStateService(_arg_1);
         },function():FullscreenStateService
         {
            return Cifoduk.comihar;
         });
         osgi.injectService(FullscreenService,function(_arg_1:Object):void
         {
            Cifoduk.dowiruduj = FullscreenService(_arg_1);
         },function():FullscreenService
         {
            return Cifoduk.dowiruduj;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            Cifoduk.settingsService = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return Cifoduk.settingsService;
         });
         osgi.injectService(KeysBindingService,function(_arg_1:Object):void
         {
            Cifoduk.tytol = KeysBindingService(_arg_1);
         },function():KeysBindingService
         {
            return Cifoduk.tytol;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Lipasod.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Lipasod.display;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            Lipasod.zudysy = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return Lipasod.zudysy;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            Lipasod.bafat = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return Lipasod.bafat;
         });
         osgi.injectService(FullscreenService,function(_arg_1:Object):void
         {
            Lipasod.dowiruduj = FullscreenService(_arg_1);
         },function():FullscreenService
         {
            return Lipasod.dowiruduj;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Lipasod.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Lipasod.battleEventDispatcher;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Perez.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Perez.display;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Perez.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Perez.localeService;
         });
         osgi.injectService(TargetingInputManager,function(_arg_1:Object):void
         {
            Perez.vekol = TargetingInputManager(_arg_1);
         },function():TargetingInputManager
         {
            return Perez.vekol;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Codywo.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Codywo.display;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Lubylag.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Lubylag.display;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            Lubylag.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return Lubylag.lobbyLayoutService;
         });
         osgi.injectService(IServerHaltService,function(_arg_1:Object):void
         {
            Lubylag.qag = IServerHaltService(_arg_1);
         },function():IServerHaltService
         {
            return Lubylag.qag;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            Lubylag.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return Lubylag.userPropertiesService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Lubylag.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Lubylag.battleEventDispatcher;
         });
         osgi.injectService(BattleGUIService,function(_arg_1:Object):void
         {
            Lubylag.tykih = BattleGUIService(_arg_1);
         },function():BattleGUIService
         {
            return Lubylag.tykih;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            Lubylag.bafat = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return Lubylag.bafat;
         });
         osgi.injectService(INotificationService,function(_arg_1:Object):void
         {
            Lubylag.notificationService = INotificationService(_arg_1);
         },function():INotificationService
         {
            return Lubylag.notificationService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            Lubylag.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return Lubylag.battleInfoService;
         });
         osgi.injectService(PremiumService,function(_arg_1:Object):void
         {
            Lubylag.premiumService = PremiumService(_arg_1);
         },function():PremiumService
         {
            return Lubylag.premiumService;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            Kawubi.settingsService = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return Kawubi.settingsService;
         });
         osgi.injectService(BattleGUIService,function(_arg_1:Object):void
         {
            Kawubi.kyb = BattleGUIService(_arg_1);
         },function():BattleGUIService
         {
            return Kawubi.kyb;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Muguv.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Muguv.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Muguv.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Muguv.battleService;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            Muguv.norata = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return Muguv.norata;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Muguv.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Muguv.display;
         });
         osgi.injectService(KeysBindingService,function(_arg_1:Object):void
         {
            Muguv.tytol = KeysBindingService(_arg_1);
         },function():KeysBindingService
         {
            return Muguv.tytol;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Zyzy.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Zyzy.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Lenadet.talofege = BattleService(_arg_1);
         },function():BattleService
         {
            return Lenadet.talofege;
         });
         osgi.injectService(ILoaderWindowService,function(_arg_1:Object):void
         {
            Lenadet.loaderWindowService = ILoaderWindowService(_arg_1);
         },function():ILoaderWindowService
         {
            return Lenadet.loaderWindowService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            Lenadet.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return Lenadet.lobbyLayoutService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            BattleRunnerProvider.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return BattleRunnerProvider.battleService;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            BattleView.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return BattleView.storageService;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            BattleView.bafat = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return BattleView.bafat;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            BattleView.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return BattleView.display;
         });
         osgi.injectService(KeysBindingService,function(_arg_1:Object):void
         {
            BattleView.tytol = KeysBindingService(_arg_1);
         },function():KeysBindingService
         {
            return BattleView.tytol;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            BattleView.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return BattleView.battleService;
         });
         osgi.injectService(IBackgroundService,function(_arg_1:Object):void
         {
            BattleView.mymodo = IBackgroundService(_arg_1);
         },function():IBackgroundService
         {
            return BattleView.mymodo;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            BattlefieldModel.logService = LogService(_arg_1);
         },function():LogService
         {
            return BattlefieldModel.logService;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            BattlefieldModel.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return BattlefieldModel.storageService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            BattlefieldModel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return BattlefieldModel.display;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            BattlefieldModel.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return BattlefieldModel.battleEventDispatcher;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            BattlefieldModel.settings = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return BattlefieldModel.settings;
         });
         osgi.injectService(IBackgroundService,function(_arg_1:Object):void
         {
            BattlefieldModel.mymodo = IBackgroundService(_arg_1);
         },function():IBackgroundService
         {
            return BattlefieldModel.mymodo;
         });
         osgi.injectService(MipMappingService,function(_arg_1:Object):void
         {
            BattlefieldModel.nawep = MipMappingService(_arg_1);
         },function():MipMappingService
         {
            return BattlefieldModel.nawep;
         });
         osgi.injectService(TextureMaterialRegistry,function(_arg_1:Object):void
         {
            BattlefieldModel.suner = TextureMaterialRegistry(_arg_1);
         },function():TextureMaterialRegistry
         {
            return BattlefieldModel.suner;
         });
         osgi.injectService(ColorTransformService,function(_arg_1:Object):void
         {
            BattlefieldModel.wefu = ColorTransformService(_arg_1);
         },function():ColorTransformService
         {
            return BattlefieldModel.wefu;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            BattlefieldModel.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return BattlefieldModel.battleInfoService;
         });
         osgi.injectService(BattleReadinessService,function(_arg_1:Object):void
         {
            BattlefieldModel.cafolo = BattleReadinessService(_arg_1);
         },function():BattleReadinessService
         {
            return BattlefieldModel.cafolo;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            BattlefieldModel.bafat = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return BattlefieldModel.bafat;
         });
         osgi.injectService(BattleGUIService,function(_arg_1:Object):void
         {
            BattlefieldModel.kyb = BattleGUIService(_arg_1);
         },function():BattleGUIService
         {
            return BattlefieldModel.kyb;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            BattlefieldModel.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return BattlefieldModel.lobbyLayoutService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BattlefieldModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BattlefieldModel.localeService;
         });
         osgi.injectService(TargetingInputManager,function(_arg_1:Object):void
         {
            BattlefieldModel.lijukysuw = TargetingInputManager(_arg_1);
         },function():TargetingInputManager
         {
            return BattlefieldModel.lijukysuw;
         });
         osgi.injectService(TargetingModeService,function(_arg_1:Object):void
         {
            BattlefieldModel.pulat = TargetingModeService(_arg_1);
         },function():TargetingModeService
         {
            return BattlefieldModel.pulat;
         });
         osgi.injectService(INotificationService,function(_arg_1:Object):void
         {
            BattlefieldModel.notificationService = INotificationService(_arg_1);
         },function():INotificationService
         {
            return BattlefieldModel.notificationService;
         });
         osgi.injectService(KeysBindingService,function(_arg_1:Object):void
         {
            BattlefieldModel.tytol = KeysBindingService(_arg_1);
         },function():KeysBindingService
         {
            return BattlefieldModel.tytol;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Soca.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Soca.localeService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Soja.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Soja.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            SpawnFlashRenderer.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return SpawnFlashRenderer.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            ParachuteDetachAnimation.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return ParachuteDetachAnimation.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            BonusPickupAnimation.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return BonusPickupAnimation.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            RemovalAnimation.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return RemovalAnimation.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Gyjohul.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Gyjohul.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Gyjohul.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Gyjohul.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            BonusObject3DBase.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return BonusObject3DBase.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            SpawnAnimation.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return SpawnAnimation.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            GroundSpawnRenderer.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return GroundSpawnRenderer.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Ruro.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Ruro.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Wega.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Wega.battleService;
         });
         osgi.injectService(PingService,function(_arg_1:Object):void
         {
            Beg.rutiwofy = PingService(_arg_1);
         },function():PingService
         {
            return Beg.rutiwofy;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Vogigy.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Vogigy.battleService;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            FollowCameraController.settings = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return FollowCameraController.settings;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            FollowCameraController.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return FollowCameraController.storageService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            FollowCameraController.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return FollowCameraController.display;
         });
         osgi.injectService(TargetingInputManager,function(_arg_1:Object):void
         {
            FollowCameraController.vekol = TargetingInputManager(_arg_1);
         },function():TargetingInputManager
         {
            return FollowCameraController.vekol;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            FollowCameraController.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return FollowCameraController.battleEventDispatcher;
         });
         osgi.injectService(KeysBindingService,function(_arg_1:Object):void
         {
            FollowCameraController.tytol = KeysBindingService(_arg_1);
         },function():KeysBindingService
         {
            return FollowCameraController.tytol;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Quwuhyby.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Quwuhyby.battleService;
         });
         osgi.injectService(TargetingModeService,function(_arg_1:Object):void
         {
            Rutyqy.pulat = TargetingModeService(_arg_1);
         },function():TargetingModeService
         {
            return Rutyqy.pulat;
         });
         osgi.injectService(TargetingInputManager,function(_arg_1:Object):void
         {
            Rutyqy.vekol = TargetingInputManager(_arg_1);
         },function():TargetingInputManager
         {
            return Rutyqy.vekol;
         });
         osgi.injectService(KeysBindingService,function(_arg_1:Object):void
         {
            Rutyqy.tytol = KeysBindingService(_arg_1);
         },function():KeysBindingService
         {
            return Rutyqy.tytol;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Tyno.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Tyno.battleService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            Tyno.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return Tyno.userInfoService;
         });
         osgi.injectService(TextureMaterialRegistry,function(_arg_1:Object):void
         {
            Tyno.suner = TextureMaterialRegistry(_arg_1);
         },function():TextureMaterialRegistry
         {
            return Tyno.suner;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Rocuva.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Rocuva.display;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Rocuva.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Rocuva.battleEventDispatcher;
         });
         osgi.injectService(KeysBindingService,function(_arg_1:Object):void
         {
            Rocuva.qefag = KeysBindingService(_arg_1);
         },function():KeysBindingService
         {
            return Rocuva.qefag;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Hoqeg.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Hoqeg.display;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Hoqeg.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Hoqeg.battleService;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            Hoqeg.norata = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return Hoqeg.norata;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Hoqeg.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Hoqeg.battleEventDispatcher;
         });
         osgi.injectService(TargetingModeService,function(_arg_1:Object):void
         {
            Hoqeg.madilywid = TargetingModeService(_arg_1);
         },function():TargetingModeService
         {
            return Hoqeg.madilywid;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Hoqeg.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Hoqeg.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Zicoha.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Zicoha.battleService;
         });
         osgi.injectService(TargetingInputManager,function(_arg_1:Object):void
         {
            Covize.hydycefa = TargetingInputManager(_arg_1);
         },function():TargetingInputManager
         {
            return Covize.hydycefa;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            Covize.settingsService = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return Covize.settingsService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Covize.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Covize.display;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Rarimequ.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Rarimequ.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Mihadiwo.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Mihadiwo.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Mihadiwo.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Mihadiwo.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Lyfiqok.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Lyfiqok.battleService;
         });
         osgi.injectService(EffectsMaterialRegistry,function(_arg_1:Object):void
         {
            Kikimy.suner = EffectsMaterialRegistry(_arg_1);
         },function():EffectsMaterialRegistry
         {
            return Kikimy.suner;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Kikimy.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Kikimy.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Sarocely.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Sarocely.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Wewewyjy.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Wewewyjy.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Wonesegy.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Wonesegy.battleService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Wonesegy.lorunar = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Wonesegy.lorunar;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            Wonesegy.settings = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return Wonesegy.settings;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Fowu.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Fowu.battleService;
         });
         osgi.injectService(TargetingInputManager,function(_arg_1:Object):void
         {
            Fowu.vekol = TargetingInputManager(_arg_1);
         },function():TargetingInputManager
         {
            return Fowu.vekol;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Rorucozok.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Rorucozok.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Kyjojypyr.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Kyjojypyr.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Dapynoc.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Dapynoc.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Luga.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Luga.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Kysusufyk.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Kysusufyk.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Sound3DEffect.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Sound3DEffect.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Kyvuqufu.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Kyvuqufu.battleService;
         });
         osgi.injectService(BattleReadinessService,function(_arg_1:Object):void
         {
            Kyvuqufu.cafolo = BattleReadinessService(_arg_1);
         },function():BattleReadinessService
         {
            return Kyvuqufu.cafolo;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Tyvyzos.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Tyvyzos.display;
         });
         osgi.injectService(BattleGUIService,function(_arg_1:Object):void
         {
            Tyvyzos.tykih = BattleGUIService(_arg_1);
         },function():BattleGUIService
         {
            return Tyvyzos.tykih;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Tyvyzos.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Tyvyzos.localeService;
         });
         osgi.injectService(EffectsMaterialRegistry,function(_arg_1:Object):void
         {
            Kyqifav.suner = EffectsMaterialRegistry(_arg_1);
         },function():EffectsMaterialRegistry
         {
            return Kyqifav.suner;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Kyqifav.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Kyqifav.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Gacisucy.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Gacisucy.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Symub.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Symub.battleService;
         });
         osgi.injectService(TargetingInputManager,function(_arg_1:Object):void
         {
            Rib.vekol = TargetingInputManager(_arg_1);
         },function():TargetingInputManager
         {
            return Rib.vekol;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            ChatModel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return ChatModel.display;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            ChatModel.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return ChatModel.battleInfoService;
         });
         osgi.injectService(BattleGUIService,function(_arg_1:Object):void
         {
            ChatModel.kyb = BattleGUIService(_arg_1);
         },function():BattleGUIService
         {
            return ChatModel.kyb;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            Tiwawi.norata = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return Tiwawi.norata;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Vopefow.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Vopefow.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            BattleUtils.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return BattleUtils.battleService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Lerih.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Lerih.display;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Lerih.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Lerih.battleEventDispatcher;
         });
         osgi.injectService(TargetingInputManager,function(_arg_1:Object):void
         {
            Lerih.vekol = TargetingInputManager(_arg_1);
         },function():TargetingInputManager
         {
            return Lerih.vekol;
         });
         osgi.injectService(TargetingModeService,function(_arg_1:Object):void
         {
            Lerih.pulat = TargetingModeService(_arg_1);
         },function():TargetingModeService
         {
            return Lerih.pulat;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            Lerih.settingsService = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return Lerih.settingsService;
         });
         osgi.injectService(KeysBindingService,function(_arg_1:Object):void
         {
            Lerih.tytol = KeysBindingService(_arg_1);
         },function():KeysBindingService
         {
            return Lerih.tytol;
         });
         osgi.injectService(TargetingModeService,function(_arg_1:Object):void
         {
            Mafew.pulat = TargetingModeService(_arg_1);
         },function():TargetingModeService
         {
            return Mafew.pulat;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Mafew.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Mafew.display;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Pys.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Pys.display;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Gotowo.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Gotowo.display;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Gotowo.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Gotowo.battleEventDispatcher;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            Gotowo.bafat = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return Gotowo.bafat;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            Gotowo.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return Gotowo.lobbyLayoutService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(_arg_1:Object):void
         {
            Gotowo.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(_arg_1);
         },function():IDialogWindowsDispatcherService
         {
            return Gotowo.dialogWindowsDispatcherService;
         });
         osgi.injectService(IDialogsService,function(_arg_1:Object):void
         {
            Gotowo.dialogsService = IDialogsService(_arg_1);
         },function():IDialogsService
         {
            return Gotowo.dialogsService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Gotowo.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Gotowo.battleService;
         });
         osgi.injectService(BattleGUIService,function(_arg_1:Object):void
         {
            Gotowo.tykih = BattleGUIService(_arg_1);
         },function():BattleGUIService
         {
            return Gotowo.tykih;
         });
         osgi.injectService(FullscreenStateService,function(_arg_1:Object):void
         {
            Gotowo.fullscreenStateService = FullscreenStateService(_arg_1);
         },function():FullscreenStateService
         {
            return Gotowo.fullscreenStateService;
         });
         osgi.injectService(KeysBindingService,function(_arg_1:Object):void
         {
            Gotowo.tytol = KeysBindingService(_arg_1);
         },function():KeysBindingService
         {
            return Gotowo.tytol;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Niqyvu.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Niqyvu.battleService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Tiso.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Tiso.display;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Tiso.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Tiso.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Tiso.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Tiso.battleService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Tiso.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Tiso.localeService;
         });
         osgi.injectService(BattleGUIService,function(_arg_1:Object):void
         {
            Tiso.tykih = BattleGUIService(_arg_1);
         },function():BattleGUIService
         {
            return Tiso.tykih;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Hewofyh.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Hewofyh.battleService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            Linizujim.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return Linizujim.battleInfoService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Linizujim.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Linizujim.battleService;
         });
         osgi.injectService(TextureMaterialRegistry,function(_arg_1:Object):void
         {
            Linizujim.suner = TextureMaterialRegistry(_arg_1);
         },function():TextureMaterialRegistry
         {
            return Linizujim.suner;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Linizujim.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Linizujim.battleEventDispatcher;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Linizujim.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Linizujim.localeService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Linizujim.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Linizujim.display;
         });
         osgi.injectService(BattleUserInfoService,function(_arg_1:Object):void
         {
            Linizujim.userInfoService = BattleUserInfoService(_arg_1);
         },function():BattleUserInfoService
         {
            return Linizujim.userInfoService;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            Linizujim.norata = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return Linizujim.norata;
         });
         osgi.injectService(KeysBindingService,function(_arg_1:Object):void
         {
            Linizujim.tytol = KeysBindingService(_arg_1);
         },function():KeysBindingService
         {
            return Linizujim.tytol;
         });
         osgi.injectService(ILightingEffectsService,function(_arg_1:Object):void
         {
            Byjeso.qapy = ILightingEffectsService(_arg_1);
         },function():ILightingEffectsService
         {
            return Byjeso.qapy;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Byjeso.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Byjeso.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Bez.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Bez.battleEventDispatcher;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Tane.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Tane.battleEventDispatcher;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            Mit.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return Mit.battleInfoService;
         });
         osgi.injectService(TextureMaterialRegistry,function(_arg_1:Object):void
         {
            Tazudeqe.dyb = TextureMaterialRegistry(_arg_1);
         },function():TextureMaterialRegistry
         {
            return Tazudeqe.dyb;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Tazudeqe.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Tazudeqe.battleService;
         });
         osgi.injectService(IDumpService,function(_arg_1:Object):void
         {
            Tazudeqe.zipemah = IDumpService(_arg_1);
         },function():IDumpService
         {
            return Tazudeqe.zipemah;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Tazudeqe.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Tazudeqe.battleEventDispatcher;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Nava.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Nava.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Nava.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Nava.battleService;
         });
         osgi.injectService(EffectsMaterialRegistry,function(_arg_1:Object):void
         {
            Jivo.suner = EffectsMaterialRegistry(_arg_1);
         },function():EffectsMaterialRegistry
         {
            return Jivo.suner;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Jivo.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Jivo.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Riqicuso.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Riqicuso.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Riqicuso.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Riqicuso.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Nel.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Nel.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Nel.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Nel.battleEventDispatcher;
         });
         osgi.injectService(EffectsMaterialRegistry,function(_arg_1:Object):void
         {
            RailgunSFXModel.suner = EffectsMaterialRegistry(_arg_1);
         },function():EffectsMaterialRegistry
         {
            return RailgunSFXModel.suner;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            RailgunSFXModel.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return RailgunSFXModel.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Fofewago.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Fofewago.battleService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Fofewago.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Fofewago.display;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Fofewago.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Fofewago.battleEventDispatcher;
         });
         osgi.injectService(EffectsMaterialRegistry,function(_arg_1:Object):void
         {
            Myqawyni.suner = EffectsMaterialRegistry(_arg_1);
         },function():EffectsMaterialRegistry
         {
            return Myqawyni.suner;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Myqawyni.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Myqawyni.battleService;
         });
         osgi.injectService(TargetingModeService,function(_arg_1:Object):void
         {
            Hora.pulat = TargetingModeService(_arg_1);
         },function():TargetingModeService
         {
            return Hora.pulat;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Hora.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Hora.display;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Fugorybo.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Fugorybo.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Fugorybo.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Fugorybo.battleEventDispatcher;
         });
         osgi.injectService(EffectsMaterialRegistry,function(_arg_1:Object):void
         {
            Ryfafapuk.suner = EffectsMaterialRegistry(_arg_1);
         },function():EffectsMaterialRegistry
         {
            return Ryfafapuk.suner;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Ryfafapuk.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Ryfafapuk.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Docokesy.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Docokesy.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Vijiv.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Vijiv.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Gojaca.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Gojaca.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Mureke.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Mureke.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Vobecibyb.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Vobecibyb.battleService;
         });
         osgi.injectService(EffectsMaterialRegistry,function(_arg_1:Object):void
         {
            Vobecibyb.suner = EffectsMaterialRegistry(_arg_1);
         },function():EffectsMaterialRegistry
         {
            return Vobecibyb.suner;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Pocifafoc.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Pocifafoc.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Pocifafoc.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Pocifafoc.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Puge.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Puge.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Puge.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Puge.battleEventDispatcher;
         });
         osgi.injectService(EffectsMaterialRegistry,function(_arg_1:Object):void
         {
            Paderonuv.suner = EffectsMaterialRegistry(_arg_1);
         },function():EffectsMaterialRegistry
         {
            return Paderonuv.suner;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Paderonuv.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Paderonuv.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Gek.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Gek.battleService;
         });
         osgi.injectService(EffectsMaterialRegistry,function(_arg_1:Object):void
         {
            Gek.suner = EffectsMaterialRegistry(_arg_1);
         },function():EffectsMaterialRegistry
         {
            return Gek.suner;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Zeqyfypoj.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Zeqyfypoj.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Zeqyfypoj.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Zeqyfypoj.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Dyn.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Dyn.battleService;
         });
         osgi.injectService(EffectsMaterialRegistry,function(_arg_1:Object):void
         {
            Ruzesu.suner = EffectsMaterialRegistry(_arg_1);
         },function():EffectsMaterialRegistry
         {
            return Ruzesu.suner;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Ruzesu.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Ruzesu.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Vatejataj.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Vatejataj.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Vatejataj.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Vatejataj.battleEventDispatcher;
         });
         osgi.injectService(DataValidator,function(_arg_1:Object):void
         {
            Sijy.pypiw = DataValidator(_arg_1);
         },function():DataValidator
         {
            return Sijy.pypiw;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Sijy.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Sijy.battleService;
         });
         osgi.injectService(CommandService,function(_arg_1:Object):void
         {
            Sijy.commandService = CommandService(_arg_1);
         },function():CommandService
         {
            return Sijy.commandService;
         });
         osgi.injectService(IClientLog,function(_arg_1:Object):void
         {
            StageFrameRateController.clientLog = IClientLog(_arg_1);
         },function():IClientLog
         {
            return StageFrameRateController.clientLog;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            StageFrameRateController.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return StageFrameRateController.display;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BattleGoldBonusesModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BattleGoldBonusesModel.localeService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            BattleGoldBonusesModel.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return BattleGoldBonusesModel.battleService;
         });
         osgi.injectService(BattleUserInfoService,function(_arg_1:Object):void
         {
            BattleGoldBonusesModel.userInfoService = BattleUserInfoService(_arg_1);
         },function():BattleUserInfoService
         {
            return BattleGoldBonusesModel.userInfoService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            BattleGoldBonusesModel.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return BattleGoldBonusesModel.userPropertiesService;
         });
         osgi.injectService(TankUsersRegistry,function(_arg_1:Object):void
         {
            Situs.ciwitu = TankUsersRegistry(_arg_1);
         },function():TankUsersRegistry
         {
            return Situs.ciwitu;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Soca.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Soca.localeService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            Bile.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return Bile.userInfoService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            BattleRunner.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return BattleRunner.battleService;
         });
         osgi.injectService(TextureMaterialRegistry,function(_arg_1:Object):void
         {
            Kijuro.suner = TextureMaterialRegistry(_arg_1);
         },function():TextureMaterialRegistry
         {
            return Kijuro.suner;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Kijuro.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Kijuro.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Gymynuc.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Gymynuc.battleEventDispatcher;
         });
         osgi.injectService(BattleUserInfoService,function(_arg_1:Object):void
         {
            Gymynuc.userInfoService = BattleUserInfoService(_arg_1);
         },function():BattleUserInfoService
         {
            return Gymynuc.userInfoService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            Gymynuc.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return Gymynuc.userPropertiesService;
         });
         osgi.injectService(IHelpService,function(_arg_1:Object):void
         {
            Mesenijoh.helpService = IHelpService(_arg_1);
         },function():IHelpService
         {
            return Mesenijoh.helpService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            Mesenijoh.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return Mesenijoh.lobbyLayoutService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ControlsHelper.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ControlsHelper.localeService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Tohiruce.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Tohiruce.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Tohiruce.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Tohiruce.battleEventDispatcher;
         });
         osgi.injectService(BattleUserInfoService,function(_arg_1:Object):void
         {
            Gewi.battleUserInfoService = BattleUserInfoService(_arg_1);
         },function():BattleUserInfoService
         {
            return Gewi.battleUserInfoService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Visipykif.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Visipykif.localeService;
         });
         osgi.injectService(IBlockUserService,function(_arg_1:Object):void
         {
            Visipykif.blockUserService = IBlockUserService(_arg_1);
         },function():IBlockUserService
         {
            return Visipykif.blockUserService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Tidip.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Tidip.localeService;
         });
         osgi.injectService(IBlockUserService,function(_arg_1:Object):void
         {
            Tidip.blockUserService = IBlockUserService(_arg_1);
         },function():IBlockUserService
         {
            return Tidip.blockUserService;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            Cej.settings = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return Cej.settings;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            BattleJGRModel.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return BattleJGRModel.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Tytuhe.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Tytuhe.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Mule.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Mule.battleEventDispatcher;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Mule.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Mule.localeService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Mygopete.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Mygopete.battleEventDispatcher;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            Pipujic.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return Pipujic.lobbyLayoutService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Gelifo.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Gelifo.battleEventDispatcher;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Dysihuma.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Dysihuma.display;
         });
         osgi.injectService(BattleGUIService,function(_arg_1:Object):void
         {
            Dysihuma.tykih = BattleGUIService(_arg_1);
         },function():BattleGUIService
         {
            return Dysihuma.tykih;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Dysihuma.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Dysihuma.localeService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Qohygyd.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Qohygyd.battleEventDispatcher;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Qohygyd.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Qohygyd.display;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Qohygyd.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Qohygyd.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            Haqaje.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return Haqaje.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Haqaje.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Haqaje.battleService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(_arg_1:Object):void
         {
            Haqaje.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(_arg_1);
         },function():IDialogWindowsDispatcherService
         {
            return Haqaje.dialogWindowsDispatcherService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            Haqaje.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return Haqaje.lobbyLayoutService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Wotufuduv.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Wotufuduv.display;
         });
         osgi.injectService(IBlurService,function(_arg_1:Object):void
         {
            Wotufuduv.blurService = IBlurService(_arg_1);
         },function():IBlurService
         {
            return Wotufuduv.blurService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Wotufuduv.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Wotufuduv.localeService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Vicytiwil.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Vicytiwil.display;
         });
         osgi.injectService(BattleFormatUtil,function(_arg_1:Object):void
         {
            Kyfaciki.doqa = BattleFormatUtil(_arg_1);
         },function():BattleFormatUtil
         {
            return Kyfaciki.doqa;
         });
         osgi.injectService(DataValidator,function(_arg_1:Object):void
         {
            Wigu.pypiw = DataValidator(_arg_1);
         },function():DataValidator
         {
            return Wigu.pypiw;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            CameraBookmark.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return CameraBookmark.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Jig.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Jig.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            InventoryItemModel.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return InventoryItemModel.battleEventDispatcher;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            InventoryModel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return InventoryModel.display;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            InventoryModel.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return InventoryModel.battleEventDispatcher;
         });
         osgi.injectService(BattleInputService,function(_arg_1:Object):void
         {
            InventoryModel.bafat = BattleInputService(_arg_1);
         },function():BattleInputService
         {
            return InventoryModel.bafat;
         });
         osgi.injectService(BattleGUIService,function(_arg_1:Object):void
         {
            InventoryModel.battleGuiService = BattleGUIService(_arg_1);
         },function():BattleGUIService
         {
            return InventoryModel.battleGuiService;
         });
         osgi.injectService(KeysBindingService,function(_arg_1:Object):void
         {
            InventoryModel.tytol = KeysBindingService(_arg_1);
         },function():KeysBindingService
         {
            return InventoryModel.tytol;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            InventoryModel.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return InventoryModel.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Jybawabaz.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Jybawabaz.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Zokisase.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Zokisase.battleService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            BonusRegionService.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return BonusRegionService.battleService;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            BonusRegionService.settings = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return BonusRegionService.settings;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Kyfaciki.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Kyfaciki.localeService;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            Kyfaciki.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return Kyfaciki.battleService;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            Kyfaciki.settingsService = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return Kyfaciki.settingsService;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            Kyfaciki.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return Kyfaciki.storageService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            Kyfaciki.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return Kyfaciki.userPropertiesService;
         });
         osgi.injectService(IHelpService,function(_arg_1:Object):void
         {
            Kyfaciki.helpService = IHelpService(_arg_1);
         },function():IHelpService
         {
            return Kyfaciki.helpService;
         });
         osgi.injectService(BattleGUIService,function(_arg_1:Object):void
         {
            Kyfaciki.tykih = BattleGUIService(_arg_1);
         },function():BattleGUIService
         {
            return Kyfaciki.tykih;
         });
         osgi.injectService(BattleFormatUtil,function(_arg_1:Object):void
         {
            Kyfaciki.doqa = BattleFormatUtil(_arg_1);
         },function():BattleFormatUtil
         {
            return Kyfaciki.doqa;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Kyfaciki.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Kyfaciki.display;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            TankModel.logService = LogService(_arg_1);
         },function():LogService
         {
            return TankModel.logService;
         });
         osgi.injectService(ISettingsService,function(_arg_1:Object):void
         {
            TankModel.settingsService = ISettingsService(_arg_1);
         },function():ISettingsService
         {
            return TankModel.settingsService;
         });
         osgi.injectService(BattleEventDispatcher,function(_arg_1:Object):void
         {
            TankModel.battleEventDispatcher = BattleEventDispatcher(_arg_1);
         },function():BattleEventDispatcher
         {
            return TankModel.battleEventDispatcher;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            TankModel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return TankModel.display;
         });
         osgi.injectService(BattleService,function(_arg_1:Object):void
         {
            TankModel.battleService = BattleService(_arg_1);
         },function():BattleService
         {
            return TankModel.battleService;
         });
         osgi.injectService(BattleUserInfoService,function(_arg_1:Object):void
         {
            TankModel.battleUserInfoService = BattleUserInfoService(_arg_1);
         },function():BattleUserInfoService
         {
            return TankModel.battleUserInfoService;
         });
         osgi.injectService(TankUsersRegistry,function(_arg_1:Object):void
         {
            TankModel.derys = TankUsersRegistry(_arg_1);
         },function():TankUsersRegistry
         {
            return TankModel.derys;
         });
         osgi.injectService(IInitialEffectsService,function(_arg_1:Object):void
         {
            TankModel.cotufulem = IInitialEffectsService(_arg_1);
         },function():IInitialEffectsService
         {
            return TankModel.cotufulem;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            TankModel.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return TankModel.battleInfoService;
         });
         osgi.injectService(TankUsersRegistry,function(_arg_1:Object):void
         {
            Nogatomuz.derys = TankUsersRegistry(_arg_1);
         },function():TankUsersRegistry
         {
            return Nogatomuz.derys;
         });
         osgi.injectService(PingService,function(_arg_1:Object):void
         {
            Gema.rutiwofy = PingService(_arg_1);
         },function():PingService
         {
            return Gema.rutiwofy;
         });
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new ChatModel(),Vector.<Class>([IChatModelBase,Wejej,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new TankTurnOverModel(),Vector.<Class>([Doleni,BattleEventListener,Bufofav]));
         modelRegister.add(new Cewyn(),Vector.<Class>([Pasysuwo,IObjectLoadListener,Pywy,BattleEventListener,Cuqer]));
         modelRegister.add(new Bonyjygyp(),Vector.<Class>([Juzyvyfy,Rolipu]));
         modelRegisterAdapt.registerAdapt(Rolipu,Tawik);
         modelRegisterAdapt.registerEvents(Rolipu,Mujyhon);
         modelRegister.add(new Linizujim(),Vector.<Class>([Birupu,Hylyv,ObjectLoadListener,ObjectUnloadListener,BattleEventListener]));
         modelRegisterAdapt.registerAdapt(Hylyv,Fitef);
         modelRegisterAdapt.registerEvents(Hylyv,Zubisewi);
         modelRegister.add(new Dadobap(),Vector.<Class>([Zewufyb,Kuqedeqi]));
         modelRegisterAdapt.registerAdapt(Kuqedeqi,Tepysy);
         modelRegisterAdapt.registerEvents(Kuqedeqi,Vatu);
         modelRegister.add(new Dyry(),Vector.<Class>([Mewiq,Zaq]));
         modelRegisterAdapt.registerAdapt(Zaq,Vepewob);
         modelRegisterAdapt.registerEvents(Zaq,Buje);
         modelRegisterAdapt.registerAdapt(Vamobanoc,Genyku);
         modelRegisterAdapt.registerEvents(Vamobanoc,Syce);
         modelRegister.add(new Kyqifav(),Vector.<Class>([Vypybuham,ObjectLoadListener,ObjectUnloadListener,Vamobanoc]));
         modelRegister.add(new Meqof(),Vector.<Class>([Vysip,ObjectLoadListener,Jijapib]));
         modelRegisterAdapt.registerAdapt(Jijapib,Sokawyt);
         modelRegisterAdapt.registerEvents(Jijapib,Futop);
         modelRegisterAdapt.registerAdapt(Riwizy,Losusoq);
         modelRegisterAdapt.registerEvents(Riwizy,Gusuredu);
         modelRegister.add(new Fyzeqap(),Vector.<Class>([Muwyru,Riwizy]));
         modelRegister.add(new BattleGoldBonusesModel(),Vector.<Class>([Wuv,ObjectLoadListener]));
         modelRegister.add(new BattlefieldModel(),Vector.<Class>([Rejeh,ObjectLoadListener,ObjectUnloadListener,BattleService]));
         modelRegisterAdapt.registerAdapt(Kanutu,Gic);
         modelRegisterAdapt.registerEvents(Kanutu,Pagu);
         modelRegister.add(new Vogab(),Vector.<Class>([Licy,Kanutu]));
         modelRegisterAdapt.registerAdapt(Zekuzejob,Busen);
         modelRegisterAdapt.registerEvents(Zekuzejob,Hupylaqul);
         modelRegister.add(new Gymynuc(),Vector.<Class>([Cok,BattleEventListener,BattlefieldEvents]));
         modelRegisterAdapt.registerAdapt(BattlefieldEvents,BattlefieldEventsAdapt);
         modelRegisterAdapt.registerEvents(BattlefieldEvents,BattlefieldEventsEvents);
         modelRegister.add(new Tohiruce(),Vector.<Class>([Zalizanef,ObjectLoadPostListener,ObjectUnloadListener,BattleEventListener,BattleModel]));
         modelRegister.add(new Tytuhe(),Vector.<Class>([Fovynakok,ObjectLoadPostListener,ObjectUnloadListener,BattleModel]));
         modelRegister.add(new JuggernautModel(),Vector.<Class>([IJuggernautModelBase,Juggernaut,ObjectLoadListener,ObjectUnloadListener,ObjectLoadPostListener,PointIndicatorStateProvider]));
         modelRegister.add(new BattleJGRModel(),Vector.<Class>([IBattleJGRModelBase,BattleModel,ObjectLoadPostListener]));
         modelRegister.add(new KillStreakModel(),Vector.<Class>([IKillStreakModelBase,ObjectLoadListener]));
         modelRegister.add(new Gelifo(),Vector.<Class>([Sybo,Gyfira]));
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

