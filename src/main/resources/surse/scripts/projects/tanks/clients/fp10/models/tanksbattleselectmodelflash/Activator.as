package projects.tanks.clients.fp10.models.tanksbattleselectmodelflash
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.controllers.battlecreate.CreateBattleFormController;
   import alternativa.tanks.controllers.battleinfo.BattleInfoDMController;
   import alternativa.tanks.controllers.battleinfo.BattleInfoTeamController;
   import alternativa.tanks.controllers.battlelist.BattleListController;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.model.battleselect.*;
   import alternativa.tanks.model.battleselect.create.*;
   import alternativa.tanks.model.info.*;
   import alternativa.tanks.model.item.*;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.service.battle.BattleUserInfoService;
   import alternativa.tanks.service.battle.Fahy;
   import alternativa.tanks.service.battle.IBattleUserInfoService;
   import alternativa.tanks.service.battlecreate.IBattleCreateFormService;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.service.battleinfo.Qesybeloq;
   import alternativa.tanks.service.battlelist.BattleListFormService;
   import alternativa.tanks.service.battlelist.IBattleListFormService;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.battlecreate.CreateBattleFormView;
   import alternativa.tanks.view.battlecreate.LocaleCreateBattleForm;
   import alternativa.tanks.view.battleinfo.BattleInfoParamsView;
   import alternativa.tanks.view.battleinfo.LocaleBattleInfo;
   import alternativa.tanks.view.battleinfo.dm.BattleInfoDMView;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamView;
   import alternativa.tanks.view.battlelist.BattleListView;
   import alternativa.tanks.view.battlelist.LocaleBattleList;
   import alternativa.tanks.view.battlelist.forms.BattleBigButton;
   import obfuscation.bifaja.Rojifyw;
   import obfuscation.bopo.Degah;
   import obfuscation.fidyha.Hihik;
   import obfuscation.fubyt.*;
   import obfuscation.fusirykes.*;
   import obfuscation.fut.Zyv;
   import obfuscation.gilapu.*;
   import obfuscation.gyvutup.*;
   import obfuscation.hifoped.*;
   import obfuscation.lokaza.Kijorypad;
   import obfuscation.pysuzi.Kecuwy;
   import obfuscation.qaluvyjy.Pewutagaz;
   import obfuscation.qanyfi.*;
   import obfuscation.qikumuza.*;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.battleselect.model.battleselect.IBattleSelectModelBase;
   import projects.tanks.client.battleselect.model.battleselect.create.IBattleCreateModelBase;
   import projects.tanks.client.battleselect.model.info.Wyrikipo;
   import projects.tanks.client.battleselect.model.item.IBattleItemModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   
   public class Activator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var modelRegisterAdapt:ModelRegistry;
         var modelRegister:ModelRegistry;
         var _osgi:OSGi = param1;
         osgi = _osgi;
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            LocaleBattleList.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return LocaleBattleList.localeService;
         });
         osgi.injectService(IMoneyService,function(_arg_1:Object):void
         {
            BattleBigButton.moneyService = IMoneyService(_arg_1);
         },function():IMoneyService
         {
            return BattleBigButton.moneyService;
         });
         osgi.injectService(IHelpService,function(_arg_1:Object):void
         {
            BattleListView.helpService = IHelpService(_arg_1);
         },function():IHelpService
         {
            return BattleListView.helpService;
         });
         osgi.injectService(ITrackerService,function(_arg_1:Object):void
         {
            CreateBattleFormView.trackerService = ITrackerService(_arg_1);
         },function():ITrackerService
         {
            return CreateBattleFormView.trackerService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            LocaleCreateBattleForm.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return LocaleCreateBattleForm.localeService;
         });
         osgi.injectService(IAchievementService,function(_arg_1:Object):void
         {
            BattleInfoTeamView.achievementService = IAchievementService(_arg_1);
         },function():IAchievementService
         {
            return BattleInfoTeamView.achievementService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            BattleInfoTeamView.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return BattleInfoTeamView.battleInfoService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            BattleInfoTeamView.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return BattleInfoTeamView.lobbyLayoutService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BattleInfoParamsView.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BattleInfoParamsView.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            LocaleBattleInfo.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return LocaleBattleInfo.localeService;
         });
         osgi.injectService(IAchievementService,function(_arg_1:Object):void
         {
            BattleInfoDMView.achievementService = IAchievementService(_arg_1);
         },function():IAchievementService
         {
            return BattleInfoDMView.achievementService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            BattleInfoDMView.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return BattleInfoDMView.battleInfoService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            BattleInfoDMView.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return BattleInfoDMView.lobbyLayoutService;
         });
         osgi.injectService(IBattleInfoFormService,function(_arg_1:Object):void
         {
            BattleListController.battleInfoFormService = IBattleInfoFormService(_arg_1);
         },function():IBattleInfoFormService
         {
            return BattleListController.battleInfoFormService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            BattleListController.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return BattleListController.userPropertiesService;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            BattleListController.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return BattleListController.storageService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            BattleListController.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return BattleListController.display;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            BattleListController.logService = LogService(_arg_1);
         },function():LogService
         {
            return BattleListController.logService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            BattleListController.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return BattleListController.battleInfoService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            BattleListController.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return BattleListController.lobbyLayoutService;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            CreateBattleFormController.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return CreateBattleFormController.storageService;
         });
         osgi.injectService(IAchievementService,function(_arg_1:Object):void
         {
            CreateBattleFormController.achievementService = IAchievementService(_arg_1);
         },function():IAchievementService
         {
            return CreateBattleFormController.achievementService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            CreateBattleFormController.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return CreateBattleFormController.userPropertiesService;
         });
         osgi.injectService(IMoneyService,function(_arg_1:Object):void
         {
            BattleInfoDMController.moneyService = IMoneyService(_arg_1);
         },function():IMoneyService
         {
            return BattleInfoDMController.moneyService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            BattleInfoDMController.battleAlertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return BattleInfoDMController.battleAlertService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BattleInfoDMController.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BattleInfoDMController.localeService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            BattleInfoDMController.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return BattleInfoDMController.userPropertiesService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            BattleInfoDMController.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return BattleInfoDMController.lobbyLayoutService;
         });
         osgi.injectService(IMoneyService,function(_arg_1:Object):void
         {
            BattleInfoTeamController.moneyService = IMoneyService(_arg_1);
         },function():IMoneyService
         {
            return BattleInfoTeamController.moneyService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            BattleInfoTeamController.battleAlertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return BattleInfoTeamController.battleAlertService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BattleInfoTeamController.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BattleInfoTeamController.localeService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            BattleInfoTeamController.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return BattleInfoTeamController.lobbyLayoutService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            BattleInfoTeamController.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return BattleInfoTeamController.userPropertiesService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            BattleListFormService.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return BattleListFormService.display;
         });
         osgi.injectService(IBattleCreateFormService,function(_arg_1:Object):void
         {
            BattleListFormService.battleCreateFormService = IBattleCreateFormService(_arg_1);
         },function():IBattleCreateFormService
         {
            return BattleListFormService.battleCreateFormService;
         });
         osgi.injectService(IBattleInfoFormService,function(_arg_1:Object):void
         {
            BattleListFormService.battleInfoFormService = IBattleInfoFormService(_arg_1);
         },function():IBattleInfoFormService
         {
            return BattleListFormService.battleInfoFormService;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            BattleUserInfoService.logService = LogService(_arg_1);
         },function():LogService
         {
            return BattleUserInfoService.logService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            Fahy.friendsInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return Fahy.friendsInfoService;
         });
         osgi.injectService(IBattleUserInfoService,function(_arg_1:Object):void
         {
            Fahy.battleUserInfoService = IBattleUserInfoService(_arg_1);
         },function():IBattleUserInfoService
         {
            return Fahy.battleUserInfoService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            Qesybeloq.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return Qesybeloq.display;
         });
         osgi.injectService(ITrackerService,function(_arg_1:Object):void
         {
            Qesybeloq.trackerService = ITrackerService(_arg_1);
         },function():ITrackerService
         {
            return Qesybeloq.trackerService;
         });
         osgi.injectService(IBattleInfoFormService,function(_arg_1:Object):void
         {
            BattleTeamInfoModel.battleInfoFormService = IBattleInfoFormService(_arg_1);
         },function():IBattleInfoFormService
         {
            return BattleTeamInfoModel.battleInfoFormService;
         });
         osgi.injectService(ITrackerService,function(_arg_1:Object):void
         {
            BattleTeamInfoModel.trackerService = ITrackerService(_arg_1);
         },function():ITrackerService
         {
            return BattleTeamInfoModel.trackerService;
         });
         osgi.injectService(IBattleInfoFormService,function(_arg_1:Object):void
         {
            Kovobe.battleInfoFormService = IBattleInfoFormService(_arg_1);
         },function():IBattleInfoFormService
         {
            return Kovobe.battleInfoFormService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            Kovobe.battleAlertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return Kovobe.battleAlertService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Kovobe.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Kovobe.localeService;
         });
         osgi.injectService(IBattleInfoFormService,function(_arg_1:Object):void
         {
            BattleDmInfoModel.battleInfoFormService = IBattleInfoFormService(_arg_1);
         },function():IBattleInfoFormService
         {
            return BattleDmInfoModel.battleInfoFormService;
         });
         osgi.injectService(ITrackerService,function(_arg_1:Object):void
         {
            BattleDmInfoModel.trackerService = ITrackerService(_arg_1);
         },function():ITrackerService
         {
            return BattleDmInfoModel.trackerService;
         });
         osgi.injectService(IBattleInfoFormService,function(_arg_1:Object):void
         {
            Zuhidegod.battleInfoFormService = IBattleInfoFormService(_arg_1);
         },function():IBattleInfoFormService
         {
            return Zuhidegod.battleInfoFormService;
         });
         osgi.injectService(IBattleListFormService,function(_arg_1:Object):void
         {
            BattleTeamItemModel.battleListFormService = IBattleListFormService(_arg_1);
         },function():IBattleListFormService
         {
            return BattleTeamItemModel.battleListFormService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            BattleTeamItemModel.friendsInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return BattleTeamItemModel.friendsInfoService;
         });
         osgi.injectService(IBattleUserInfoService,function(_arg_1:Object):void
         {
            BattleTeamItemModel.battleUserInfoService = IBattleUserInfoService(_arg_1);
         },function():IBattleUserInfoService
         {
            return BattleTeamItemModel.battleUserInfoService;
         });
         osgi.injectService(IBattleListFormService,function(_arg_1:Object):void
         {
            BattleItemModel.battleListFormService = IBattleListFormService(_arg_1);
         },function():IBattleListFormService
         {
            return BattleItemModel.battleListFormService;
         });
         osgi.injectService(IBattleUserInfoService,function(_arg_1:Object):void
         {
            BattleItemModel.battleUserInfoService = IBattleUserInfoService(_arg_1);
         },function():IBattleUserInfoService
         {
            return BattleItemModel.battleUserInfoService;
         });
         osgi.injectService(IBattleListFormService,function(_arg_1:Object):void
         {
            BattleDMItemModel.battleListFormService = IBattleListFormService(_arg_1);
         },function():IBattleListFormService
         {
            return BattleDMItemModel.battleListFormService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            BattleDMItemModel.friendsInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return BattleDMItemModel.friendsInfoService;
         });
         osgi.injectService(IBattleUserInfoService,function(_arg_1:Object):void
         {
            BattleDMItemModel.battleUserInfoService = IBattleUserInfoService(_arg_1);
         },function():IBattleUserInfoService
         {
            return BattleDMItemModel.battleUserInfoService;
         });
         osgi.injectService(IBattleListFormService,function(_arg_1:Object):void
         {
            BattleSelectModel.battleListFormService = IBattleListFormService(_arg_1);
         },function():IBattleListFormService
         {
            return BattleSelectModel.battleListFormService;
         });
         osgi.injectService(IBattleInfoFormService,function(_arg_1:Object):void
         {
            BattleSelectModel.battleInfoFormService = IBattleInfoFormService(_arg_1);
         },function():IBattleInfoFormService
         {
            return BattleSelectModel.battleInfoFormService;
         });
         osgi.injectService(ITrackerService,function(_arg_1:Object):void
         {
            BattleSelectModel.trackerService = ITrackerService(_arg_1);
         },function():ITrackerService
         {
            return BattleSelectModel.trackerService;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            BattleSelectModel.logService = LogService(_arg_1);
         },function():LogService
         {
            return BattleSelectModel.logService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            BattleCreateModel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return BattleCreateModel.display;
         });
         osgi.injectService(ModelRegistry,function(_arg_1:Object):void
         {
            BattleCreateModel.modelRegistry = ModelRegistry(_arg_1);
         },function():ModelRegistry
         {
            return BattleCreateModel.modelRegistry;
         });
         osgi.injectService(ITrackerService,function(_arg_1:Object):void
         {
            BattleCreateModel.trackerService = ITrackerService(_arg_1);
         },function():ITrackerService
         {
            return BattleCreateModel.trackerService;
         });
         osgi.injectService(IBattleCreateFormService,function(_arg_1:Object):void
         {
            BattleCreateModel.battleCreateFormService = IBattleCreateFormService(_arg_1);
         },function():IBattleCreateFormService
         {
            return BattleCreateModel.battleCreateFormService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            BattleCreateModel.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return BattleCreateModel.userPropertiesService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            BattleCreateModel.battleAlertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return BattleCreateModel.battleAlertService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BattleCreateModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BattleCreateModel.localeService;
         });
         osgi.injectService(BattleFormatUtil,function(_arg_1:Object):void
         {
            CreateBattleFormController.doqa = BattleFormatUtil(_arg_1);
         },function():BattleFormatUtil
         {
            return CreateBattleFormController.doqa;
         });
         osgi.injectService(BattleFormatUtil,function(_arg_1:Object):void
         {
            BattleTeamInfoModel.doqa = BattleFormatUtil(_arg_1);
         },function():BattleFormatUtil
         {
            return BattleTeamInfoModel.doqa;
         });
         osgi.injectService(BattleFormatUtil,function(_arg_1:Object):void
         {
            BattleDmInfoModel.doqa = BattleFormatUtil(_arg_1);
         },function():BattleFormatUtil
         {
            return BattleDmInfoModel.doqa;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            BattleTeamInfoModel.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return BattleTeamInfoModel.alertService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BattleTeamInfoModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BattleTeamInfoModel.localeService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            BattleDmInfoModel.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return BattleDmInfoModel.alertService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            BattleDmInfoModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return BattleDmInfoModel.localeService;
         });
         osgi.injectService(BattleFormatUtil,function(_arg_1:Object):void
         {
            BattleListFormService.doqa = BattleFormatUtil(_arg_1);
         },function():BattleFormatUtil
         {
            return BattleListFormService.doqa;
         });
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt.registerAdapt(Gigymo,Sefigyke);
         modelRegisterAdapt.registerEvents(Gigymo,Hiqe);
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new BattleTeamInfoModel(),Vector.<Class>([Degah,ObjectLoadPostListener,ObjectUnloadListener]));
         modelRegister.add(new Kovobe(),Vector.<Class>([Wyrikipo,IObjectLoadListener,Gigymo]));
         modelRegister.add(new BattleDmInfoModel(),Vector.<Class>([Pewutagaz,ObjectLoadPostListener,ObjectUnloadListener]));
         modelRegisterAdapt.registerAdapt(Vosu,Myko);
         modelRegisterAdapt.registerEvents(Vosu,Zynut);
         modelRegister.add(new Zuhidegod(),Vector.<Class>([Rojifyw,Vosu,IObjectLoadListener]));
         modelRegister.add(new Wusaha(),Vector.<Class>([Hihik,Dot]));
         modelRegisterAdapt.registerAdapt(Dot,Cudag);
         modelRegisterAdapt.registerEvents(Dot,Riqehic);
         modelRegister.add(new Tebyqely(),Vector.<Class>([Kijorypad,Nywehohal,IObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(Nywehohal,Munezagew);
         modelRegisterAdapt.registerEvents(Nywehohal,Duhewaqiz);
         modelRegisterAdapt.registerAdapt(Batopa,Nyry);
         modelRegisterAdapt.registerEvents(Batopa,Joryp);
         modelRegister.add(new BattleTeamItemModel(),Vector.<Class>([Zyv,Batopa,BattleItem,ObjectLoadListener]));
         modelRegister.add(new BattleItemModel(),Vector.<Class>([IBattleItemModelBase,IObjectLoadListener,IBattleItem]));
         modelRegisterAdapt.registerAdapt(Hyv,Redefeju);
         modelRegisterAdapt.registerEvents(Hyv,Kofubygez);
         modelRegister.add(new BattleDMItemModel(),Vector.<Class>([Kecuwy,Hyv,BattleItem,ObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(IBattleItem,Zuvojaf);
         modelRegisterAdapt.registerEvents(IBattleItem,Tacitaju);
         modelRegisterAdapt.registerAdapt(BattleItem,Qeharesi);
         modelRegisterAdapt.registerEvents(BattleItem,Lybokan);
         modelRegister.add(new BattleSelectModel(),Vector.<Class>([IBattleSelectModelBase,ObjectLoadPostListener,ObjectUnloadListener]));
         modelRegister.add(new BattleCreateModel(),Vector.<Class>([IBattleCreateModelBase,IObjectLoadListener]));
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

