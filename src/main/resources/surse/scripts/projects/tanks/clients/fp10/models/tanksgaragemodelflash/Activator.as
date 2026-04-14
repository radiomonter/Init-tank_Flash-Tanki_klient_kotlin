package projects.tanks.clients.fp10.models.tanksgaragemodelflash
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.dump.IDumpService;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.blur.IBlurService;
   import alternativa.tanks.gui.ConfirmAlert;
   import alternativa.tanks.gui.GarageWindow;
   import alternativa.tanks.gui.Hovoja;
   import alternativa.tanks.gui.ItemInfoPanel;
   import alternativa.tanks.gui.buttons.CrystalButton;
   import alternativa.tanks.gui.buttons.GarageButton;
   import alternativa.tanks.gui.effects.BlinkEffect;
   import alternativa.tanks.gui.effects.FlashEffect;
   import alternativa.tanks.gui.effects.GlowEffect;
   import alternativa.tanks.gui.garagelist.GarageListController;
   import alternativa.tanks.gui.tankpreview.TankPreviewWindow;
   import alternativa.tanks.gui.upgrade.SelectUpgradeWindow;
   import alternativa.tanks.gui.upgrade.UpgradeButton;
   import alternativa.tanks.gui.upgrade.UpgradeInfoForm;
   import alternativa.tanks.gui.upgrade.UpgradeWindowBase;
   import alternativa.tanks.help.FirstMoneyHelper;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.model.garage.GarageModel;
   import alternativa.tanks.model.garage.Qaqenifa;
   import alternativa.tanks.model.garage.Voku;
   import alternativa.tanks.model.garage.Zawasigo;
   import alternativa.tanks.model.garage.upgrade.FlushUpgrades;
   import alternativa.tanks.model.garage.upgrade.FlushUpgradesAdapt;
   import alternativa.tanks.model.garage.upgrade.FlushUpgradesEvents;
   import alternativa.tanks.model.garage.upgrade.UpgradeGarageItem;
   import alternativa.tanks.model.garage.upgrade.UpgradeGarageItemAdapt;
   import alternativa.tanks.model.garage.upgrade.UpgradeGarageItemEvents;
   import alternativa.tanks.model.garage.upgrade.UpgradeGarageItemModel;
   import alternativa.tanks.model.item.buyable.BuyableModel;
   import alternativa.tanks.model.item.buyable.IBuyable;
   import alternativa.tanks.model.item.buyable.IBuyableAdapt;
   import alternativa.tanks.model.item.buyable.IBuyableEvents;
   import alternativa.tanks.model.item.category.IItemCategory;
   import alternativa.tanks.model.item.category.IItemCategoryAdapt;
   import alternativa.tanks.model.item.category.IItemCategoryEvents;
   import alternativa.tanks.model.item.category.IItemViewCategory;
   import alternativa.tanks.model.item.category.IItemViewCategoryAdapt;
   import alternativa.tanks.model.item.category.IItemViewCategoryEvents;
   import alternativa.tanks.model.item.category.ItemCategoryModel;
   import alternativa.tanks.model.item.category.ItemViewCategoryModel;
   import alternativa.tanks.model.item.countable.CountableItemModel;
   import alternativa.tanks.model.item.countable.ICountableItem;
   import alternativa.tanks.model.item.countable.ICountableItemAdapt;
   import alternativa.tanks.model.item.countable.ICountableItemEvents;
   import alternativa.tanks.model.item.discount.DiscountCollectorModel;
   import alternativa.tanks.model.item.discount.DiscountModel;
   import alternativa.tanks.model.item.discount.ICollectDiscount;
   import alternativa.tanks.model.item.discount.ICollectDiscountAdapt;
   import alternativa.tanks.model.item.discount.ICollectDiscountEvents;
   import alternativa.tanks.model.item.discount.IDiscount;
   import alternativa.tanks.model.item.discount.IDiscountAdapt;
   import alternativa.tanks.model.item.discount.IDiscountEvents;
   import alternativa.tanks.model.item.droppablegold.DroppableGoldItemModel;
   import alternativa.tanks.model.item.item.IItem;
   import alternativa.tanks.model.item.item.IItemAdapt;
   import alternativa.tanks.model.item.item.IItemEvents;
   import alternativa.tanks.model.item.item.ItemModel;
   import alternativa.tanks.model.item.kit.Catypab;
   import alternativa.tanks.model.item.kit.Foz;
   import alternativa.tanks.model.item.kit.GarageKit;
   import alternativa.tanks.model.item.kit.Zyceqasa;
   import alternativa.tanks.model.item.modification.IModification;
   import alternativa.tanks.model.item.modification.IModificationAdapt;
   import alternativa.tanks.model.item.modification.IModificationEvents;
   import alternativa.tanks.model.item.modification.ModificationModel;
   import alternativa.tanks.model.item.present.PresentItem;
   import alternativa.tanks.model.item.present.PresentItemAdapt;
   import alternativa.tanks.model.item.present.PresentItemEvents;
   import alternativa.tanks.model.item.present.PresentItemModel;
   import alternativa.tanks.model.item.properties.ItemProperties;
   import alternativa.tanks.model.item.properties.ItemPropertiesAdapt;
   import alternativa.tanks.model.item.properties.ItemPropertiesEvents;
   import alternativa.tanks.model.item.properties.ItemPropertiesModel;
   import alternativa.tanks.model.item.skins.AvailableSkins;
   import alternativa.tanks.model.item.skins.AvailableSkinsAdapt;
   import alternativa.tanks.model.item.skins.AvailableSkinsEvents;
   import alternativa.tanks.model.item.skins.AvailableSkinsItemModel;
   import alternativa.tanks.model.item.skins.MountSkin;
   import alternativa.tanks.model.item.skins.MountSkinAdapt;
   import alternativa.tanks.model.item.skins.MountSkinEvents;
   import alternativa.tanks.model.item.skins.MountSkinItemModel;
   import alternativa.tanks.model.item.temporary.ITemporaryItem;
   import alternativa.tanks.model.item.temporary.ITemporaryItemAdapt;
   import alternativa.tanks.model.item.temporary.ITemporaryItemEvents;
   import alternativa.tanks.model.item.temporary.TemporaryItemModel;
   import alternativa.tanks.model.item.upgradable.UpgradableItem;
   import alternativa.tanks.model.item.upgradable.UpgradableItemAdapt;
   import alternativa.tanks.model.item.upgradable.UpgradableItemEvents;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import alternativa.tanks.model.item.upgradable.UpgradableParamsModel;
   import alternativa.tanks.model.item3d.Item3DModel;
   import alternativa.tanks.model.lootboxes.LootBoxModel;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.service.delaymountcategory.IDelayMountCategoryService;
   import alternativa.tanks.service.delaymountcategory.Mylafisu;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import alternativa.tanks.service.fps.FPSService;
   import alternativa.tanks.service.garage.GarageService;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.item.Vihew;
   import alternativa.tanks.service.item.upgradable.speedup.SpeedUpCostCalculatorService;
   import alternativa.tanks.service.item3d.ITank3DViewer;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import alternativa.tanks.service.itempropertyparams.Nijazote;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.notificationcategories.INotificationGarageCategoriesService;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.temporaryitem.ITemporaryItemService;
   import alternativa.tanks.service.temporaryitem.Kogom;
   import alternativa.tanks.service.temporaryitemnotify.Ceqibavub;
   import alternativa.tanks.service.temporaryitemnotify.ITemporaryItemNotifyService;
   import alternativa.tanks.tracker.ITrackerService;
   import controls.timer.CountDownTimerOnCompleteBefore;
   import obfuscation.dylum.Tazywe;
   import obfuscation.jakypa.Fawi;
   import obfuscation.jakypa.Zono;
   import obfuscation.jykyliv.Puhoka;
   import obfuscation.kysunek.Liwa;
   import obfuscation.kysunek.Lof;
   import obfuscation.myrudatof.Bavipok;
   import obfuscation.myrudatof.Fyr;
   import obfuscation.myrudatof.Gehu;
   import obfuscation.myrudatof.Jibosahe;
   import obfuscation.myrudatof.Lok;
   import obfuscation.myrudatof.Nafoh;
   import obfuscation.myrudatof.Nebizo;
   import obfuscation.myrudatof.Qokagow;
   import obfuscation.nubezeqyr.Cafa;
   import obfuscation.nupah.Fekev;
   import obfuscation.silulu.Jozaz;
   import obfuscation.silulu.Kok;
   import obfuscation.silulu.Sahef;
   import obfuscation.silulu.Zuludod;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import projects.tanks.client.garage.models.garage.IGarageModelBase;
   import projects.tanks.client.garage.models.garage.upgrade.IUpgradeGarageItemModelBase;
   import projects.tanks.client.garage.models.item.buyable.IBuyableModelBase;
   import projects.tanks.client.garage.models.item.category.IItemCategoryModelBase;
   import projects.tanks.client.garage.models.item.countable.ICountableItemModelBase;
   import projects.tanks.client.garage.models.item.discount.IDiscountCollectorModelBase;
   import projects.tanks.client.garage.models.item.discount.IDiscountModelBase;
   import projects.tanks.client.garage.models.item.droppablegold.IDroppableGoldItemModelBase;
   import projects.tanks.client.garage.models.item.item.IItemModelBase;
   import projects.tanks.client.garage.models.item.item3d.IItem3DModelBase;
   import projects.tanks.client.garage.models.item.kit.Jyred;
   import projects.tanks.client.garage.models.item.lootbox.ILootBoxModelBase;
   import projects.tanks.client.garage.models.item.modification.IModificationModelBase;
   import projects.tanks.client.garage.models.item.present.IPresentItemModelBase;
   import projects.tanks.client.garage.models.item.properties.IItemPropertiesModelBase;
   import projects.tanks.client.garage.models.item.temporary.ITemporaryItemModelBase;
   import projects.tanks.client.garage.models.item.upgradeable.IUpgradeableParamsConstructorModelBase;
   import projects.tanks.client.garage.models.item.view.IItemViewCategoryModelBase;
   import projects.tanks.client.garage.skins.IAvailableSkinsItemModelBase;
   import projects.tanks.client.garage.skins.IMountSkinItemModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck.UidCheckService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import utils.resource.IResourceLoadingComplete;
   
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
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Puhoka.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Puhoka.localeService;
         });
         osgi.injectService(UidCheckService,function(_arg_1:Object):void
         {
            Puhoka.zitafafa = UidCheckService(_arg_1);
         },function():UidCheckService
         {
            return Puhoka.zitafafa;
         });
         osgi.injectService(ItemService,function(_arg_1:Object):void
         {
            GarageListController.itemService = ItemService(_arg_1);
         },function():ItemService
         {
            return GarageListController.itemService;
         });
         osgi.injectService(PremiumService,function(_arg_1:Object):void
         {
            GarageListController.premiumService = PremiumService(_arg_1);
         },function():PremiumService
         {
            return GarageListController.premiumService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            GarageListController.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return GarageListController.userPropertiesService;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            GarageListController.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return GarageListController.storageService;
         });
         osgi.injectService(INotificationGarageCategoriesService,function(_arg_1:Object):void
         {
            GarageListController.notificationGarageCategoriesService = INotificationGarageCategoriesService(_arg_1);
         },function():INotificationGarageCategoriesService
         {
            return GarageListController.notificationGarageCategoriesService;
         });
         osgi.injectService(GarageService,function(_arg_1:Object):void
         {
            GarageListController.garageService = GarageService(_arg_1);
         },function():GarageService
         {
            return GarageListController.garageService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ConfirmAlert.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ConfirmAlert.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ItemInfoPanel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ItemInfoPanel.localeService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            ItemInfoPanel.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return ItemInfoPanel.userPropertiesService;
         });
         osgi.injectService(ItemService,function(_arg_1:Object):void
         {
            ItemInfoPanel.itemService = ItemService(_arg_1);
         },function():ItemService
         {
            return ItemInfoPanel.itemService;
         });
         osgi.injectService(IClientLog,function(_arg_1:Object):void
         {
            ItemInfoPanel.clientLog = IClientLog(_arg_1);
         },function():IClientLog
         {
            return ItemInfoPanel.clientLog;
         });
         osgi.injectService(IMoneyService,function(_arg_1:Object):void
         {
            ItemInfoPanel.moneyService = IMoneyService(_arg_1);
         },function():IMoneyService
         {
            return ItemInfoPanel.moneyService;
         });
         osgi.injectService(IPanelView,function(_arg_1:Object):void
         {
            ItemInfoPanel.panelView = IPanelView(_arg_1);
         },function():IPanelView
         {
            return ItemInfoPanel.panelView;
         });
         osgi.injectService(ItemPropertyParamsService,function(_arg_1:Object):void
         {
            ItemInfoPanel.propertyService = ItemPropertyParamsService(_arg_1);
         },function():ItemPropertyParamsService
         {
            return ItemInfoPanel.propertyService;
         });
         osgi.injectService(IDialogsService,function(_arg_1:Object):void
         {
            ItemInfoPanel.dialogService = IDialogsService(_arg_1);
         },function():IDialogsService
         {
            return ItemInfoPanel.dialogService;
         });
         osgi.injectService(ITank3DViewer,function(_arg_1:Object):void
         {
            ItemInfoPanel.parami = ITank3DViewer(_arg_1);
         },function():ITank3DViewer
         {
            return ItemInfoPanel.parami;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            UpgradeButton.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return UpgradeButton.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            UpgradeWindowBase.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return UpgradeWindowBase.localeService;
         });
         osgi.injectService(IMoneyService,function(_arg_1:Object):void
         {
            SelectUpgradeWindow.moneyService = IMoneyService(_arg_1);
         },function():IMoneyService
         {
            return SelectUpgradeWindow.moneyService;
         });
         osgi.injectService(IDialogsService,function(_arg_1:Object):void
         {
            SelectUpgradeWindow.dialogService = IDialogsService(_arg_1);
         },function():IDialogsService
         {
            return SelectUpgradeWindow.dialogService;
         });
         osgi.injectService(ItemPropertyParamsService,function(_arg_1:Object):void
         {
            SelectUpgradeWindow.propertyService = ItemPropertyParamsService(_arg_1);
         },function():ItemPropertyParamsService
         {
            return SelectUpgradeWindow.propertyService;
         });
         osgi.injectService(ItemPropertyParamsService,function(_arg_1:Object):void
         {
            UpgradeInfoForm.propertyService = ItemPropertyParamsService(_arg_1);
         },function():ItemPropertyParamsService
         {
            return UpgradeInfoForm.propertyService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            UpgradeInfoForm.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return UpgradeInfoForm.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            GarageWindow.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return GarageWindow.localeService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            GarageWindow.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return GarageWindow.userPropertiesService;
         });
         osgi.injectService(IClientLog,function(_arg_1:Object):void
         {
            GarageWindow.clientLog = IClientLog(_arg_1);
         },function():IClientLog
         {
            return GarageWindow.clientLog;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            GarageWindow.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return GarageWindow.alertService;
         });
         osgi.injectService(ItemService,function(_arg_1:Object):void
         {
            GarageWindow.itemService = ItemService(_arg_1);
         },function():ItemService
         {
            return GarageWindow.itemService;
         });
         osgi.injectService(IMoneyService,function(_arg_1:Object):void
         {
            GarageWindow.moneyService = IMoneyService(_arg_1);
         },function():IMoneyService
         {
            return GarageWindow.moneyService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            GarageWindow.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return GarageWindow.lobbyLayoutService;
         });
         osgi.injectService(ITrackerService,function(_arg_1:Object):void
         {
            GarageWindow.trackerService = ITrackerService(_arg_1);
         },function():ITrackerService
         {
            return GarageWindow.trackerService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            GarageWindow.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return GarageWindow.battleInfoService;
         });
         osgi.injectService(ITank3DViewer,function(_arg_1:Object):void
         {
            GarageWindow.tank3DViewer = ITank3DViewer(_arg_1);
         },function():ITank3DViewer
         {
            return GarageWindow.tank3DViewer;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            GarageButton.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return GarageButton.localeService;
         });
         osgi.injectService(IMoneyService,function(_arg_1:Object):void
         {
            GarageButton.moneyService = IMoneyService(_arg_1);
         },function():IMoneyService
         {
            return GarageButton.moneyService;
         });
         osgi.injectService(PremiumService,function(_arg_1:Object):void
         {
            GarageButton.premiumService = PremiumService(_arg_1);
         },function():PremiumService
         {
            return GarageButton.premiumService;
         });
         osgi.injectService(IMoneyService,function(_arg_1:Object):void
         {
            CrystalButton.moneyService = IMoneyService(_arg_1);
         },function():IMoneyService
         {
            return CrystalButton.moneyService;
         });
         osgi.injectService(FPSService,function(_arg_1:Object):void
         {
            GlowEffect.fpsService = FPSService(_arg_1);
         },function():FPSService
         {
            return GlowEffect.fpsService;
         });
         osgi.injectService(FPSService,function(_arg_1:Object):void
         {
            FlashEffect.fpsService = FPSService(_arg_1);
         },function():FPSService
         {
            return FlashEffect.fpsService;
         });
         osgi.injectService(FPSService,function(_arg_1:Object):void
         {
            BlinkEffect.fpsService = FPSService(_arg_1);
         },function():FPSService
         {
            return BlinkEffect.fpsService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Nijazote.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Nijazote.localeService;
         });
         osgi.injectService(IClientLog,function(_arg_1:Object):void
         {
            Nijazote.logger = IClientLog(_arg_1);
         },function():IClientLog
         {
            return Nijazote.logger;
         });
         osgi.injectService(ItemPropertyParamsService,function(_arg_1:Object):void
         {
            UpgradableItemPropertyValue.propertyParamsService = ItemPropertyParamsService(_arg_1);
         },function():ItemPropertyParamsService
         {
            return UpgradableItemPropertyValue.propertyParamsService;
         });
         osgi.injectService(SpeedUpCostCalculatorService,function(_arg_1:Object):void
         {
            UpgradableItemPropertyValue.speedUpCostCalculator = SpeedUpCostCalculatorService(_arg_1);
         },function():SpeedUpCostCalculatorService
         {
            return UpgradableItemPropertyValue.speedUpCostCalculator;
         });
         osgi.injectService(ItemService,function(_arg_1:Object):void
         {
            UpgradableItemPropertyValue.itemService = ItemService(_arg_1);
         },function():ItemService
         {
            return UpgradableItemPropertyValue.itemService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            FirstMoneyHelper.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return FirstMoneyHelper.localeService;
         });
         osgi.injectService(ITrackerService,function(_arg_1:Object):void
         {
            GarageModel.trackerService = ITrackerService(_arg_1);
         },function():ITrackerService
         {
            return GarageModel.trackerService;
         });
         osgi.injectService(IDumpService,function(_arg_1:Object):void
         {
            GarageModel.dumpService = IDumpService(_arg_1);
         },function():IDumpService
         {
            return GarageModel.dumpService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            GarageModel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return GarageModel.display;
         });
         osgi.injectService(ModelRegistry,function(_arg_1:Object):void
         {
            GarageModel.modelRegistry = ModelRegistry(_arg_1);
         },function():ModelRegistry
         {
            return GarageModel.modelRegistry;
         });
         osgi.injectService(IHelpService,function(_arg_1:Object):void
         {
            GarageModel.helpService = IHelpService(_arg_1);
         },function():IHelpService
         {
            return GarageModel.helpService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            GarageModel.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return GarageModel.userPropertiesService;
         });
         osgi.injectService(IClientLog,function(_arg_1:Object):void
         {
            GarageModel.clientLog = IClientLog(_arg_1);
         },function():IClientLog
         {
            return GarageModel.clientLog;
         });
         osgi.injectService(ItemService,function(_arg_1:Object):void
         {
            GarageModel.itemService = ItemService(_arg_1);
         },function():ItemService
         {
            return GarageModel.itemService;
         });
         osgi.injectService(IBlurService,function(_arg_1:Object):void
         {
            GarageModel.blurService = IBlurService(_arg_1);
         },function():IBlurService
         {
            return GarageModel.blurService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            GarageModel.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return GarageModel.localeService;
         });
         osgi.injectService(ITemporaryItemService,function(_arg_1:Object):void
         {
            GarageModel.temporaryItemService = ITemporaryItemService(_arg_1);
         },function():ITemporaryItemService
         {
            return GarageModel.temporaryItemService;
         });
         osgi.injectService(ITemporaryItemNotifyService,function(_arg_1:Object):void
         {
            GarageModel.temporaryItemNotifyService = ITemporaryItemNotifyService(_arg_1);
         },function():ITemporaryItemNotifyService
         {
            return GarageModel.temporaryItemNotifyService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            GarageModel.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return GarageModel.lobbyLayoutService;
         });
         osgi.injectService(ITank3DViewer,function(_arg_1:Object):void
         {
            GarageModel.tank3DViewer = ITank3DViewer(_arg_1);
         },function():ITank3DViewer
         {
            return GarageModel.tank3DViewer;
         });
         osgi.injectService(IAchievementService,function(_arg_1:Object):void
         {
            GarageModel.achievementService = IAchievementService(_arg_1);
         },function():IAchievementService
         {
            return GarageModel.achievementService;
         });
         osgi.injectService(IMoneyService,function(_arg_1:Object):void
         {
            GarageModel.moneyService = IMoneyService(_arg_1);
         },function():IMoneyService
         {
            return GarageModel.moneyService;
         });
         osgi.injectService(ILoaderWindowService,function(_arg_1:Object):void
         {
            GarageModel.loaderWindowService = ILoaderWindowService(_arg_1);
         },function():ILoaderWindowService
         {
            return GarageModel.loaderWindowService;
         });
         osgi.injectService(GarageService,function(_arg_1:Object):void
         {
            GarageModel.garageService = GarageService(_arg_1);
         },function():GarageService
         {
            return GarageModel.garageService;
         });
         osgi.injectService(CommandService,function(_arg_1:Object):void
         {
            GarageModel.commandService = CommandService(_arg_1);
         },function():CommandService
         {
            return GarageModel.commandService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            GarageModel.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return GarageModel.battleInfoService;
         });
         osgi.injectService(IDelayMountCategoryService,function(_arg_1:Object):void
         {
            GarageModel.cazygova = IDelayMountCategoryService(_arg_1);
         },function():IDelayMountCategoryService
         {
            return GarageModel.cazygova;
         });
         osgi.injectService(ItemPropertyParamsService,function(_arg_1:Object):void
         {
            UpgradableParamsModel.propertyService = ItemPropertyParamsService(_arg_1);
         },function():ItemPropertyParamsService
         {
            return UpgradableParamsModel.propertyService;
         });
         osgi.injectService(ItemService,function(_arg_1:Object):void
         {
            UpgradableParamsModel.itemService = ItemService(_arg_1);
         },function():ItemService
         {
            return UpgradableParamsModel.itemService;
         });
         osgi.injectService(IClientLog,function(_arg_1:Object):void
         {
            UpgradableParamsModel.logger = IClientLog(_arg_1);
         },function():IClientLog
         {
            return UpgradableParamsModel.logger;
         });
         osgi.injectService(ItemService,function(_arg_1:Object):void
         {
            Item3DModel.itemService = ItemService(_arg_1);
         },function():ItemService
         {
            return Item3DModel.itemService;
         });
         osgi.injectService(ITank3DViewer,function(_arg_1:Object):void
         {
            Item3DModel.tank3DViewer = ITank3DViewer(_arg_1);
         },function():ITank3DViewer
         {
            return Item3DModel.tank3DViewer;
         });
         osgi.injectService(ResourceRegistry,function(_arg_1:Object):void
         {
            Item3DModel.resourceRegistry = ResourceRegistry(_arg_1);
         },function():ResourceRegistry
         {
            return Item3DModel.resourceRegistry;
         });
         osgi.injectService(ITemporaryItemService,function(_arg_1:Object):void
         {
            TemporaryItemModel.temporaryItemService = ITemporaryItemService(_arg_1);
         },function():ITemporaryItemService
         {
            return TemporaryItemModel.temporaryItemService;
         });
         osgi.injectService(ITemporaryItemNotifyService,function(_arg_1:Object):void
         {
            TemporaryItemModel.temporaryItemNotifyService = ITemporaryItemNotifyService(_arg_1);
         },function():ITemporaryItemNotifyService
         {
            return TemporaryItemModel.temporaryItemNotifyService;
         });
         osgi.injectService(ITemporaryItemNotifyService,function(_arg_1:Object):void
         {
            Kogom.temporaryItemNotifyService = ITemporaryItemNotifyService(_arg_1);
         },function():ITemporaryItemNotifyService
         {
            return Kogom.temporaryItemNotifyService;
         });
         osgi.injectService(GarageService,function(_arg_1:Object):void
         {
            DiscountModel.garageService = GarageService(_arg_1);
         },function():GarageService
         {
            return DiscountModel.garageService;
         });
         osgi.injectService(ItemService,function(_arg_1:Object):void
         {
            Catypab.itemService = ItemService(_arg_1);
         },function():ItemService
         {
            return Catypab.itemService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            Catypab.userPropertyService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return Catypab.userPropertyService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Lof.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Lof.localeService;
         });
         osgi.injectService(ItemService,function(_arg_1:Object):void
         {
            Lof.itemService = ItemService(_arg_1);
         },function():ItemService
         {
            return Lof.itemService;
         });
         osgi.injectService(ItemService,function(_arg_1:Object):void
         {
            Liwa.itemService = ItemService(_arg_1);
         },function():ItemService
         {
            return Liwa.itemService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Liwa.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Liwa.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Hovoja.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Hovoja.localeService;
         });
         osgi.injectService(ItemService,function(_arg_1:Object):void
         {
            Bavipok.itemService = ItemService(_arg_1);
         },function():ItemService
         {
            return Bavipok.itemService;
         });
         osgi.injectService(ItemService,function(_arg_1:Object):void
         {
            Mylafisu.itemService = ItemService(_arg_1);
         },function():ItemService
         {
            return Mylafisu.itemService;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            Mylafisu.logService = LogService(_arg_1);
         },function():LogService
         {
            return Mylafisu.logService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            ItemInfoPanel.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return ItemInfoPanel.lobbyLayoutService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            ItemInfoPanel.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return ItemInfoPanel.battleInfoService;
         });
         osgi.injectService(IDelayMountCategoryService,function(_arg_1:Object):void
         {
            ItemInfoPanel.cazygova = IDelayMountCategoryService(_arg_1);
         },function():IDelayMountCategoryService
         {
            return ItemInfoPanel.cazygova;
         });
         osgi.injectService(IDelayMountCategoryService,function(_arg_1:Object):void
         {
            Tazywe.cazygova = IDelayMountCategoryService(_arg_1);
         },function():IDelayMountCategoryService
         {
            return Tazywe.cazygova;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            Tazywe.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return Tazywe.lobbyLayoutService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            Tazywe.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return Tazywe.battleInfoService;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            Tazywe.logService = LogService(_arg_1);
         },function():LogService
         {
            return Tazywe.logService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            TankPreviewWindow.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return TankPreviewWindow.localeService;
         });
         osgi.injectService(ILobbyLayoutService,function(_arg_1:Object):void
         {
            TankPreviewWindow.lobbyLayoutService = ILobbyLayoutService(_arg_1);
         },function():ILobbyLayoutService
         {
            return TankPreviewWindow.lobbyLayoutService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            Vihew.userPropertyService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return Vihew.userPropertyService;
         });
         osgi.injectService(ItemPropertyParamsService,function(_arg_1:Object):void
         {
            Vihew.propertyService = ItemPropertyParamsService(_arg_1);
         },function():ItemPropertyParamsService
         {
            return Vihew.propertyService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Vihew.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Vihew.localeService;
         });
         osgi.injectService(GarageService,function(_arg_1:Object):void
         {
            Vihew.garageService = GarageService(_arg_1);
         },function():GarageService
         {
            return Vihew.garageService;
         });
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt.registerAdapt(PresentItem,PresentItemAdapt);
         modelRegisterAdapt.registerEvents(PresentItem,PresentItemEvents);
         modelRegister.add(new PresentItemModel(),Vector.<Class>([IPresentItemModelBase,PresentItem]));
         modelRegister.add(new ItemModel(),Vector.<Class>([IItemModelBase,IItem]));
         modelRegisterAdapt.registerAdapt(IItem,IItemAdapt);
         modelRegisterAdapt.registerEvents(IItem,IItemEvents);
         modelRegisterAdapt.registerAdapt(IItemViewCategory,IItemViewCategoryAdapt);
         modelRegisterAdapt.registerEvents(IItemViewCategory,IItemViewCategoryEvents);
         modelRegisterAdapt.registerAdapt(IItemCategory,IItemCategoryAdapt);
         modelRegisterAdapt.registerEvents(IItemCategory,IItemCategoryEvents);
         modelRegister.add(new ItemCategoryModel(),Vector.<Class>([IItemCategoryModelBase,IItemCategory]));
         modelRegister.add(new ItemViewCategoryModel(),Vector.<Class>([IItemViewCategoryModelBase,IItemViewCategory]));
         modelRegister.add(new BuyableModel(),Vector.<Class>([IBuyableModelBase,IBuyable]));
         modelRegisterAdapt.registerAdapt(IBuyable,IBuyableAdapt);
         modelRegisterAdapt.registerEvents(IBuyable,IBuyableEvents);
         modelRegisterAdapt.registerAdapt(IModification,IModificationAdapt);
         modelRegisterAdapt.registerEvents(IModification,IModificationEvents);
         modelRegister.add(new ModificationModel(),Vector.<Class>([IModificationModelBase,IModification]));
         modelRegisterAdapt.registerAdapt(ItemProperties,ItemPropertiesAdapt);
         modelRegisterAdapt.registerEvents(ItemProperties,ItemPropertiesEvents);
         modelRegister.add(new ItemPropertiesModel(),Vector.<Class>([IItemPropertiesModelBase,ItemProperties]));
         modelRegister.add(new UpgradableParamsModel(),Vector.<Class>([IUpgradeableParamsConstructorModelBase,ObjectLoadPostListener,UpgradableItem,ObjectUnloadListener]));
         modelRegisterAdapt.registerAdapt(UpgradableItem,UpgradableItemAdapt);
         modelRegisterAdapt.registerEvents(UpgradableItem,UpgradableItemEvents);
         modelRegister.add(new CountableItemModel(),Vector.<Class>([ICountableItemModelBase,ICountableItem,IObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(ICountableItem,ICountableItemAdapt);
         modelRegisterAdapt.registerEvents(ICountableItem,ICountableItemEvents);
         modelRegister.add(new Item3DModel(),Vector.<Class>([IItem3DModelBase,IObjectLoadListener]));
         modelRegister.add(new TemporaryItemModel(),Vector.<Class>([ITemporaryItemModelBase,ITemporaryItem,IObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(ITemporaryItem,ITemporaryItemAdapt);
         modelRegisterAdapt.registerEvents(ITemporaryItem,ITemporaryItemEvents);
         modelRegister.add(new DiscountModel(),Vector.<Class>([IDiscountModelBase,ICollectDiscount,ObjectLoadPostListener,ObjectUnloadListener,CountDownTimerOnCompleteBefore]));
         modelRegister.add(new DiscountCollectorModel(),Vector.<Class>([IDiscountCollectorModelBase,IDiscount]));
         modelRegisterAdapt.registerAdapt(IDiscount,IDiscountAdapt);
         modelRegisterAdapt.registerEvents(IDiscount,IDiscountEvents);
         modelRegisterAdapt.registerAdapt(ICollectDiscount,ICollectDiscountAdapt);
         modelRegisterAdapt.registerEvents(ICollectDiscount,ICollectDiscountEvents);
         modelRegisterAdapt.registerAdapt(GarageKit,Foz);
         modelRegisterAdapt.registerEvents(GarageKit,Zyceqasa);
         modelRegister.add(new Catypab(),Vector.<Class>([Jyred,GarageKit,ICollectDiscount]));
         modelRegister.add(new Sahef(),Vector.<Class>([Fekev,Zuludod]));
         modelRegisterAdapt.registerAdapt(Zuludod,Jozaz);
         modelRegisterAdapt.registerEvents(Zuludod,Kok);
         modelRegister.add(new Jibosahe(),Vector.<Class>([Zono,Nebizo]));
         modelRegisterAdapt.registerAdapt(Nafoh,Qokagow);
         modelRegisterAdapt.registerEvents(Nafoh,Fyr);
         modelRegister.add(new Bavipok(),Vector.<Class>([Fawi,Nafoh]));
         modelRegisterAdapt.registerAdapt(Nebizo,Lok);
         modelRegisterAdapt.registerEvents(Nebizo,Gehu);
         modelRegister.add(new GarageModel(),Vector.<Class>([IGarageModelBase,ObjectLoadListener,Ceqibavub,Voku,IResourceLoadingComplete]));
         modelRegisterAdapt.registerAdapt(Voku,Zawasigo);
         modelRegisterAdapt.registerEvents(Voku,Qaqenifa);
         modelRegister.add(new LootBoxModel(),Vector.<Class>([ILootBoxModelBase,ObjectLoadListener]));
         modelRegister.add(new Tazywe(),Vector.<Class>([Cafa,ObjectLoadPostListener,ObjectUnloadListener]));
         modelRegisterAdapt.registerAdapt(AvailableSkins,AvailableSkinsAdapt);
         modelRegisterAdapt.registerEvents(AvailableSkins,AvailableSkinsEvents);
         modelRegister.add(new AvailableSkinsItemModel(),Vector.<Class>([IAvailableSkinsItemModelBase,AvailableSkins]));
         modelRegisterAdapt.registerAdapt(MountSkin,MountSkinAdapt);
         modelRegisterAdapt.registerEvents(MountSkin,MountSkinEvents);
         modelRegister.add(new MountSkinItemModel(),Vector.<Class>([IMountSkinItemModelBase,MountSkin]));
         modelRegisterAdapt.registerAdapt(ITemporaryItem,ITemporaryItemAdapt);
         modelRegisterAdapt.registerEvents(ITemporaryItem,ITemporaryItemEvents);
         modelRegister.add(new DroppableGoldItemModel(),Vector.<Class>([IDroppableGoldItemModelBase,ObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(FlushUpgrades,FlushUpgradesAdapt);
         modelRegisterAdapt.registerEvents(FlushUpgrades,FlushUpgradesEvents);
         modelRegister.add(new UpgradeGarageItemModel(),Vector.<Class>([IUpgradeGarageItemModelBase,UpgradeGarageItem,ObjectLoadPostListener,CountDownTimerOnCompleteBefore,ObjectUnloadListener,ObjectLoadListener,FlushUpgrades]));
         modelRegisterAdapt.registerAdapt(UpgradeGarageItem,UpgradeGarageItemAdapt);
         modelRegisterAdapt.registerEvents(UpgradeGarageItem,UpgradeGarageItemEvents);
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

