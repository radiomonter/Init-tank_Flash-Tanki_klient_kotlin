package
{
   import alternativa.init.GarageModelActivator;
   import alternativa.osgi.OSGi;
   import alternativa.service.IModelService;
   import alternativa.tanks.gui.RepatriateBonusWindow;
   import alternativa.tanks.model.ChatModel;
   import alternativa.tanks.model.achievement.AchievementModel;
   import alternativa.tanks.model.battleselect.BattleSelectModel;
   import alternativa.tanks.model.battleselect.create.BattleCreateModel;
   import alternativa.tanks.model.donationalert.DonationAlertModel;
   import alternativa.tanks.model.friends.battleinvite.BattleInviteModel;
   import alternativa.tanks.model.friends.loader.FriendsLoaderModel;
   import alternativa.tanks.model.garage.GarageModel;
   import alternativa.tanks.model.garage.availableitems.AvailableItemsModel;
   import alternativa.tanks.model.garage.rankupsupplybonus.RankUpSupplyBonusModel;
   import alternativa.tanks.model.info.Gigymo;
   import alternativa.tanks.model.info.Kovobe;
   import alternativa.tanks.model.item.BattleItemModel;
   import alternativa.tanks.model.item.droppablegold.DroppableGoldItemModel;
   import alternativa.tanks.model.item.skins.AvailableSkinsItemModel;
   import alternativa.tanks.model.item.skins.MountSkinItemModel;
   import alternativa.tanks.model.item3d.Item3DModel;
   import alternativa.tanks.model.lootboxes.LootBoxModel;
   import alternativa.tanks.model.news.NewsShowingModel;
   import alternativa.tanks.model.panel.IPanel;
   import alternativa.tanks.model.panel.PanelModel;
   import alternativa.tanks.model.premiumaccount.alert.PremiumAccountAlertModel;
   import alternativa.tanks.model.presents.NewPresentsShowingModel;
   import alternativa.tanks.model.referals.ReferalsModel;
   import alternativa.tanks.model.settings.SettingsModel;
   import alternativa.tanks.model.shop.items.promo.IPromoCodeActivateService;
   import alternativa.tanks.model.shop.items.promo.PromoCodeActivateService;
   import alternativa.tanks.model.socialnetwork.SocialNetworkPanelModel;
   import alternativa.tanks.model.useremailandpassword.PasswordService;
   import alternativa.tanks.model.useremailandpassword.UserEmailAndPasswordModel;
   import alternativa.tanks.model.userproperties.UserPropertiesModel;
   import alternativa.tanks.service.dailyquest.Pugasuzyw;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.panel.PanelView;
   import alternativa.types.Long;
   import flash.events.EventDispatcher;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import fominskiy.networking.INetworkListener;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import fominskiy.networking.commands.Command;
   import fominskiy.networking.commands.Type;
   import forms.MainPanel;
   import obfuscation.bifaja.Dosyfuso;
   import obfuscation.bopo.Wecy;
   import obfuscation.bude.BattleTeam;
   import obfuscation.ciqinamob.Bycyjoze;
   import obfuscation.dykuwiwoz.Tonag;
   import obfuscation.dylum.Tazywe;
   import obfuscation.fabuqy.Nukoki;
   import obfuscation.fabuqy.Suvozimi;
   import obfuscation.fidyha.Fucumig;
   import obfuscation.fubyt.BattleTeamItemModel;
   import obfuscation.fusirykes.BattleDMItemModel;
   import obfuscation.fut.Donoqof;
   import obfuscation.gilapu.Zuhidegod;
   import obfuscation.gybivyveq.Tiz;
   import obfuscation.gyvutup.BattleTeamInfoModel;
   import obfuscation.jufuniqa.Cyfu;
   import obfuscation.lecezik.Tabaw;
   import obfuscation.lokaza.Pawaj;
   import obfuscation.muc.Nuwyzogi;
   import obfuscation.nubezeqyr.Ruvetuki;
   import obfuscation.pejug.Magyp;
   import obfuscation.puwope.Jor;
   import obfuscation.pysuzi.Homevobi;
   import obfuscation.qaluvyjy.Zoti;
   import obfuscation.qanyfi.BattleDmInfoModel;
   import obfuscation.qedajyt.Juva;
   import obfuscation.qenomy.Gipafili;
   import obfuscation.qupylitaf.Hek;
   import obfuscation.ras.Zufuku;
   import obfuscation.wahyfeny.Jigece;
   import obfuscation.wane.Jit;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.GameTypeRegistry;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.registry.SpaceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import platform.client.fp10.core.type.impl.GameClass;
   import platform.client.fp10.core.type.impl.GameObject;
   import platform.client.fp10.core.type.impl.Space;
   import platform.client.models.commons.description.DescriptionModelCC;
   import platform.client.models.commons.periodtime.TimePeriodModelCC;
   import platform.client.models.commons.types.ValidationStatus;
   import projects.tanks.client.achievements.model.achievements.Jypofa;
   import projects.tanks.client.battleselect.model.battleselect.create.BattleCreateCC;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   import projects.tanks.client.battleselect.model.info.Qaru;
   import projects.tanks.client.battleselect.model.item.BattleItemCC;
   import projects.tanks.client.battleselect.model.item.BattleSuspicionLevel;
   import projects.tanks.client.chat.models.chat.chat.ChatCC;
   import projects.tanks.client.chat.models.news.showing.NewsItemData;
   import projects.tanks.client.chat.types.ChatMessage;
   import projects.tanks.client.chat.types.UserStatus;
   import projects.tanks.client.commons.models.coloring.ColoringCC;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   import projects.tanks.client.garage.models.garage.GarageModelCC;
   import projects.tanks.client.garage.models.item.buyable.BuyableCC;
   import projects.tanks.client.garage.models.item.category.ItemCategoryCC;
   import projects.tanks.client.garage.models.item.countable.CountableItemCC;
   import projects.tanks.client.garage.models.item.discount.DiscountCC;
   import projects.tanks.client.garage.models.item.droppablegold.DroppableGoldItemCC;
   import projects.tanks.client.garage.models.item.item.ItemModelCC;
   import projects.tanks.client.garage.models.item.item3d.Item3DCC;
   import projects.tanks.client.garage.models.item.kit.KitGiftItem;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   import projects.tanks.client.garage.models.item.kit.Tam;
   import projects.tanks.client.garage.models.item.lootbox.LootBoxCategory;
   import projects.tanks.client.garage.models.item.lootbox.LootBoxModelCC;
   import projects.tanks.client.garage.models.item.lootbox.LootBoxReward;
   import projects.tanks.client.garage.models.item.modification.ModificationCC;
   import projects.tanks.client.garage.models.item.object3ds.Object3DSCC;
   import projects.tanks.client.garage.models.item.present.PresentItemCC;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.client.garage.models.item.properties.ItemGaragePropertyData;
   import projects.tanks.client.garage.models.item.properties.ItemPropertiesCC;
   import projects.tanks.client.garage.models.item.properties.ItemProperty;
   import projects.tanks.client.garage.models.item.temporary.TemporaryItemCC;
   import projects.tanks.client.garage.models.item.upgradeable.UpgradableParamsCC;
   import projects.tanks.client.garage.models.item.upgradeable.calculators.LinearParams;
   import projects.tanks.client.garage.models.item.upgradeable.types.GaragePropertyData;
   import projects.tanks.client.garage.models.item.upgradeable.types.PropertyData;
   import projects.tanks.client.garage.models.item.view.ItemViewCategoryCC;
   import projects.tanks.client.garage.skins.AvailableSkinsCC;
   import projects.tanks.client.garage.skins.MountedSkinCC;
   import projects.tanks.client.panel.model.battleinvite.BattleInviteMessage;
   import projects.tanks.client.panel.model.bonus.showing.image.BonusImageCC;
   import projects.tanks.client.panel.model.bonus.showing.info.BonusInfoCC;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemCC;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemsShowingCC;
   import projects.tanks.client.panel.model.dailyquest.Nokomojob;
   import projects.tanks.client.panel.model.garage.GarageItemInfo;
   import projects.tanks.client.panel.model.garage.rankupsupplybonus.RankUpSupplyBonusInfo;
   import projects.tanks.client.panel.model.news.showing.NewsShowingCC;
   import projects.tanks.client.panel.model.premiumaccount.alert.PremiumAccountAlertCC;
   import projects.tanks.client.panel.model.profile.userproperty.UserPropertyCC;
   import projects.tanks.client.panel.model.referrals.ReferrerPanelCC;
   import projects.tanks.client.panel.model.socialnetwork.SocialNetworkPanelCC;
   import projects.tanks.client.panel.model.socialnetwork.SocialNetworkPanelParams;
   import projects.tanks.client.tanksservices.model.notifier.battle.BattleNotifierData;
   import projects.tanks.client.tanksservices.model.notifier.online.OnlineNotifierData;
   import projects.tanks.client.tanksservices.model.notifier.premium.PremiumNotifierCC;
   import projects.tanks.client.tanksservices.model.notifier.premium.PremiumNotifierData;
   import projects.tanks.client.tanksservices.model.notifier.rank.RankNotifierData;
   import projects.tanks.client.tanksservices.model.notifier.uid.UidNotifierData;
   import projects.tanks.client.tanksservices.types.battle.BattleInfoData;
   import projects.tanks.client.users.model.friends.container.UserContainerCC;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   import projects.tanks.clients.flash.commons.models.battlelinkactivator.BattleLinkActivatorModel;
   import projects.tanks.clients.flash.commons.models.layout.notify.ILobbyLayoutNotify;
   import projects.tanks.clients.flash.commons.models.layout.notify.LobbyLayoutNotifyModel;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.FriendsModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.IFriends;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.accepted.FriendsAcceptedModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.acceptednotificator.FriendsAcceptedNotificatorModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.incoming.FriendsIncomingModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.incomingnotificator.FriendsIncomingNotificatorModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.outgoing.FriendsOutgoingModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifier;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle.BattleNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.online.OnlineNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.premium.PremiumNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.rank.RankNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.uid.UidNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck.UidCheckModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   
   public class Lobby extends EventDispatcher implements INetworkListener
   {
      
      public static var rypyq:RankNotifierModel;
      
      public static var fej:UidNotifierModel;
      
      public static var keduh:OnlineNotifierModel;
      
      public static var rowebatoz:BattleNotifierModel;
      
      public static var gameTypeRegistry:GameTypeRegistry = OSGi.getInstance().getService(GameTypeRegistry) as GameTypeRegistry;
      
      public static var modelRegistry:ModelRegistry = OSGi.getInstance().getService(ModelRegistry) as ModelRegistry;
      
      public static var resourceRegistry:ResourceRegistry = OSGi.getInstance().getService(ResourceRegistry) as ResourceRegistry;
      
      public static var zyky:Boolean = true;
      
      public var garage:GarageModelActivator;
      
      private var networker:Network;
      
      private var buvis:String;
      
      private var modelRegister:IModelService;
      
      private var zumyqysof:ISpace;
      
      private var nesudomig:ISpace;
      
      private var zohimuj:ISpace;
      
      private var chatModel:ChatModel;
      
      private var zelupado:FriendsModel;
      
      private var lanune:FriendsLoaderModel;
      
      private var lojifep:FriendsAcceptedModel;
      
      private var gevanadiv:FriendsAcceptedNotificatorModel;
      
      private var wed:FriendsIncomingModel;
      
      private var car:FriendsIncomingNotificatorModel;
      
      private var wyvu:FriendsOutgoingModel;
      
      private var fohuw:BattleInviteModel;
      
      private var korope:BattleLinkActivatorModel;
      
      private var midimiqany:UserNotifierModel;
      
      private var cykasy:PremiumNotifierModel;
      
      private var wutiz:SocialNetworkPanelModel;
      
      private var tob:SettingsModel;
      
      private var rity:DonationAlertModel;
      
      private var newPresents:NewPresentsShowingModel;
      
      private var qyfary:PremiumAccountAlertModel;
      
      private var userProperties:UserPropertiesModel;
      
      private var kedorajyzu:AvailableItemsModel;
      
      private var koqyh:NewsShowingModel;
      
      private var zironed:AchievementModel;
      
      private var ritove:RankUpSupplyBonusModel;
      
      private var kisulize:GarageModel;
      
      private var pacugehev:Jor;
      
      private var gecywoko:Tazywe;
      
      private var kyqil:int = 0;
      
      private var bonusWindow:RepatriateBonusWindow;
      
      private var kucuhalo:int;
      
      private var funije:BattleSelectModel;
      
      private var kubytym:BattleCreateModel;
      
      private var sepyce:UidCheckModel;
      
      private var jopu:Jit;
      
      private var zika:Vector.<IGameObject> = new Vector.<IGameObject>();
      
      private var mykafojid:Vector.<IGameObject> = new Vector.<IGameObject>();
      
      private var qihun:Jigece;
      
      private var jyvokic:Pugasuzyw;
      
      private var tifa:Zufuku;
      
      private var panelser:MainPanel;
      
      public function Lobby()
      {
         super();
         this.garage = new GarageModelActivator();
         this.garage.start(OSGi.getInstance());
         this.modelRegister = OSGi.getInstance().getService(IModelService) as IModelService;
         this.cyjofig();
         this.wutiz = new SocialNetworkPanelModel();
         this.tob = new SettingsModel();
         this.rity = new DonationAlertModel();
         this.newPresents = new NewPresentsShowingModel();
         this.cykasy = new PremiumNotifierModel();
         this.qyfary = new PremiumAccountAlertModel();
         this.userProperties = new UserPropertiesModel();
         this.kedorajyzu = new AvailableItemsModel();
         this.koqyh = new NewsShowingModel();
         this.zironed = new AchievementModel();
         this.ritove = new RankUpSupplyBonusModel();
         this.kisulize = GarageModel(modelRegistry.getModel(Long.getLong(0,300040010)));
         this.gecywoko = Tazywe(modelRegistry.getModel(Long.getLong(0,300040005)));
         this.chatModel = new ChatModel();
         this.zumyqysof = new Space(Long.getLong(884380667,214),null,null,false);
         this.nesudomig = new Space(Long.getLong(59235923,646943),null,null,false);
         this.zohimuj = new Space(Long.getLong(52835823,6349643),null,null,false);
         SpaceRegistry(OSGi.getInstance().getService(SpaceRegistry)).addSpace(this.zohimuj);
         SpaceRegistry(OSGi.getInstance().getService(SpaceRegistry)).addSpace(this.nesudomig);
         SpaceRegistry(OSGi.getInstance().getService(SpaceRegistry)).addSpace(this.zumyqysof);
         var _local_1:Vector.<Long> = new Vector.<Long>();
         _local_1.push(Long.getLong(800589377,840038407));
         _local_1.push(Long.getLong(1424296501,-807048170));
         _local_1.push(Long.getLong(492245786,-1837686060));
         _local_1.push(Long.getLong(916213531,-841295065));
         _local_1.push(Long.getLong(644770553,-155779331));
         _local_1.push(Long.getLong(580825858,-1941731225));
         _local_1.push(Long.getLong(0,300040017));
         _local_1.push(Long.getLong(0,300040029));
         _local_1.push(Long.getLong(0,300040004));
         _local_1.push(Long.getLong(1497301838,-1092921347));
         _local_1.push(Long.getLong(947299051,-358915161));
         _local_1.push(Long.getLong(0,300040023));
         _local_1.push(Long.getLong(687238537,2002147897));
         _local_1.push(Long.getLong(1896140971,-1323660734));
         _local_1.push(Long.getLong(1215266592,-1320571870));
         _local_1.push(Long.getLong(1870140649,1080360405));
         _local_1.push(Long.getLong(882584998,678334280));
         _local_1.push(Long.getLong(0,300040010));
         _local_1.push(Long.getLong(1891481944,-1293130596));
         _local_1.push(Long.getLong(888433053,2115284408));
         _local_1.push(Long.getLong(253893103,1551357114));
         _local_1.push(Long.getLong(0,300040005));
         _local_1.push(new LootBoxModel().id);
         _local_1.push(new AvailableSkinsItemModel().id);
         _local_1.push(new MountSkinItemModel().id);
         var _local_2:GameTypeRegistry = OSGi.getInstance().getService(GameTypeRegistry) as GameTypeRegistry;
         _local_2.createClass(Long.getLong(15025,684360),_local_1);
         this.pacugehev = Jor(modelRegistry.getModel(Long.getLong(2058573415,-746879275)));
         this.funije = BattleSelectModel(modelRegistry.getModel(Long.getLong(0,300090011)));
         this.kubytym = BattleCreateModel(modelRegistry.getModel(Long.getLong(0,300090002)));
         this.sepyce = UidCheckModel(modelRegistry.getModel(Long.getLong(1543089237,611543143)));
         this.sepyce.objectLoaded();
         this.jopu = Jit(modelRegistry.getModel(Long.getLong(1190039526,-1224288945)));
         this.qihun = Jigece(modelRegistry.getModel(Long.getLong(1726782619,1524609945)));
         this.jyvokic = Pugasuzyw(modelRegistry.getModel(Long.getLong(1044301282,-2025301046)));
         this.tifa = Zufuku(modelRegistry.getModel(Long.getLong(432617209,-1426923357)));
      }
      
      private function cyjofig() : *
      {
         this.zelupado = new FriendsModel();
         this.lanune = new FriendsLoaderModel();
         this.lojifep = new FriendsAcceptedModel();
         this.gevanadiv = new FriendsAcceptedNotificatorModel();
         this.wed = new FriendsIncomingModel();
         this.car = new FriendsIncomingNotificatorModel();
         this.wyvu = new FriendsOutgoingModel();
         this.zelupado.objectLoaded();
         this.lanune.objectLoaded();
         OSGi.getInstance().registerService(IFriends,this.zelupado);
         IUserInfoService(OSGi.getInstance().getService(IUserInfoService)).init();
         rypyq = new RankNotifierModel();
         this.midimiqany = new UserNotifierModel();
         fej = new UidNotifierModel();
         keduh = new OnlineNotifierModel();
         OSGi.getInstance().registerService(UserNotifier,this.midimiqany);
         rowebatoz = new BattleNotifierModel();
         rowebatoz.objectLoaded();
         this.fohuw = new BattleInviteModel();
         this.fohuw.objectLoaded();
         this.korope = new BattleLinkActivatorModel();
         this.korope.objectLoaded();
      }
      
      public function onData(data:Command) : void
      {
         var parser:Object = null;
         var chatCC:ChatCC = null;
         var linksWhiteList:Vector.<String> = null;
         var battleMessage:BattleInviteMessage = null;
         var bits:Vector.<int> = null;
         var bit:String = null;
         var rankData:Vector.<RankNotifierData> = null;
         var uidData:Vector.<UidNotifierData> = null;
         var onlineData:Vector.<OnlineNotifierData> = null;
         var battleData:Vector.<BattleNotifierData> = null;
         var rankNotifierData:RankNotifierData = null;
         var uidNotifierData:UidNotifierData = null;
         var onlineNotifierData:OnlineNotifierData = null;
         var battleNotifierData:BattleNotifierData = null;
         var friends:Array = null;
         var incoming:Array = null;
         var outcoming:Array = null;
         var users:Vector.<String> = null;
         var u:Object = null;
         var incomingFriendsContainer:UserContainerCC = null;
         var new_friends:Array = null;
         var new_accepted_friends:Array = null;
         var obj:Object = null;
         var cc:PremiumAccountAlertCC = null;
         var premiumCC:PremiumNotifierCC = null;
         var uidObject:UidNotifierData = null;
         var premiumData:Vector.<PremiumNotifierData> = null;
         var premiumObject:PremiumNotifierData = null;
         var battleObject:BattleNotifierData = null;
         var onlineObject:OnlineNotifierData = null;
         var rankObject:RankNotifierData = null;
         var battleGameObject:IGameObject = null;
         var temp:BattleController = null;
         var battleInfoGameObject:IGameObject = null;
         var battleInfoUser:BattleInfoUser = null;
         var socialParams:SocialNetworkPanelCC = null;
         var socialNetworkPanelParams:SocialNetworkPanelParams = null;
         var achievements:Vector.<Jypofa> = null;
         var achievementId:Object = null;
         var achievement:Jypofa = null;
         var bonusModels:Vector.<Long> = null;
         var bonusObject:IGameObject = null;
         var items:Vector.<GarageItemInfo> = null;
         var iteminfo:GarageItemInfo = null;
         var currentObjectsInGarageSpace:Vector.<IGameObject> = null;
         var object:IGameObject = null;
         var gameobj:IGameObject = null;
         var currentObjectsInSpace:Vector.<IGameObject> = null;
         var currentObjectsInInfoSpace:Vector.<IGameObject> = null;
         var supplies:Vector.<RankUpSupplyBonusInfo> = null;
         var supplyInfo:RankUpSupplyBonusInfo = null;
         var battleSelectObject:IGameObject = null;
         var quests:Vector.<Magyp> = null;
         var weeklyQuestDescription:Gipafili = null;
         var dailyQuest:Magyp = null;
         var prizes:Vector.<Nokomojob> = null;
         var dailyQuestPrize:Nokomojob = null;
         var weeklyQuestRewards:Vector.<Cyfu> = null;
         var questReward:Cyfu = null;
         var item3DModel:Item3DModel = null;
         var mountedItems:Vector.<IGameObject> = null;
         var item:IGameObject = null;
         var _local_7:ReferalsModel = null;
         var _local_1:Vector.<LootBoxReward> = null;
         var _local_2:Object = null;
         var _local_3:* = undefined;
         var _local_4:LootBoxReward = null;
         var _local_5:LootBoxModel = null;
         var _local_6:IGameObject = null;
         var link:* = undefined;
         var itemm:* = undefined;
         var supply:* = undefined;
         var quest:* = undefined;
         var prize:* = undefined;
         var reward:* = undefined;
         try
         {
            switch(data.type)
            {
               case Type.LOBBY_CHAT:
                  if(data.args[0] == "system")
                  {
                     this.hovomaluq(data.args[1],data.args[2] == "true" ? true : false);
                  }
                  else if(data.args[0] == "clear_all")
                  {
                     this.chatModel.clearAllMessages();
                  }
                  else if(data.args[0] == "init_messages")
                  {
                     parser = JSON.parse(data.args[2]);
                     chatCC = new ChatCC();
                     linksWhiteList = new Vector.<String>();
                     chatCC.chatModeratorLevel = this.dijolycy(parser.chatModeratorLevel);
                     chatCC.admin = parser.admin;
                     chatCC.antifloodEnabled = parser.antifloodEnabled;
                     chatCC.bufferSize = parser.bufferSize;
                     chatCC.chatEnabled = parser.chatEnabled;
                     chatCC.enterCost = parser.enterCost;
                     chatCC.minChar = parser.minChar;
                     chatCC.minWord = parser.minWord;
                     chatCC.selfName = parser.selfName;
                     chatCC.symbolCost = parser.symbolCost;
                     chatCC.typingSpeedAntifloodEnabled = parser.typingSpeedAntifloodEnabled;
                     for each(link in parser.linksWhiteList)
                     {
                        linksWhiteList.push(link);
                     }
                     chatCC.linksWhiteList = linksWhiteList;
                     this.chatModel.putInitParams(chatCC);
                     this.chatModel.objectLoaded();
                     this.bylega(data.args[1]);
                  }
                  else if(data.args[0] == "clean_by")
                  {
                     this.chatModel.cleanUsersMessages(data.args[1]);
                  }
                  else
                  {
                     this.pur(data.args[0]);
                  }
                  break;
               case Type.LOBBY:
                  if(data.args[0] == "init_panel")
                  {
                     this.initPanel(data.args[1]);
                     this.tob.objectLoadedPost();
                  }
                  else if(data.args[0] == "invite_to_battle")
                  {
                     parser = JSON.parse(data.args[2]);
                     battleMessage = new BattleInviteMessage();
                     battleMessage.availableRank = parser.availableRank;
                     battleMessage.availableSlot = parser.availableSlot;
                     battleMessage.battleId = parser.battleId;
                     battleMessage.gameHost = "vk.com";
                     battleMessage.mapName = parser.mapName;
                     battleMessage.mode = Hek.getType(parser.mode);
                     battleMessage.noSuppliesBattle = parser.noSuppliesBattle;
                     battleMessage.privateBattle = parser.privateBattle;
                     battleMessage.remote = false;
                     battleMessage.serverNumber = 1;
                     battleMessage.url = parser.battleId;
                     this.fohuw.notify(data.args[1],battleMessage);
                  }
                  else if(data.args[0] == "user_leave_from_battle")
                  {
                     rowebatoz.leaveBattle(data.args[1]);
                  }
                  else if(data.args[0] == "reject_invite")
                  {
                     this.fohuw.rejected(data.args[1]);
                  }
                  else if(data.args[0] == "accept_invite")
                  {
                     this.fohuw.accepted(data.args[1]);
                  }
                  else if(data.args[0] == "battle_is_not_alive")
                  {
                     this.korope.dead(data.args[1]);
                  }
                  else if(data.args[0] == "set_double_crystalls")
                  {
                     PanelView(OSGi.getInstance().getService(IPanelView)).getPanel().hasDoubleCrystal = data.args[1];
                  }
                  else if(data.args[0] == "show_alert")
                  {
                     this.pacugehev.show(data.args[1]);
                  }
                  else if(data.args[0] == "wrong_captcha")
                  {
                     bits = new Vector.<int>();
                     for each(bit in String(data.args[1]).split(","))
                     {
                        bits.push(parseInt(bit));
                     }
                     this.tob.bobawu(CaptchaLocation.ACCOUNT_SETTINGS_FORM,bits);
                  }
                  else if(data.args[0] == "captchaAnswerCorrect")
                  {
                     this.tob.captchaAnswerCorrect(CaptchaLocation.ACCOUNT_SETTINGS_FORM);
                  }
                  else if(data.args[0] == "battle_is_alive")
                  {
                     this.korope.alive(data.args[1]);
                  }
                  else if(data.args[0] == "update_user_consumer")
                  {
                     parser = JSON.parse(data.args[1]);
                     rankData = new Vector.<RankNotifierData>();
                     uidData = new Vector.<UidNotifierData>();
                     onlineData = new Vector.<OnlineNotifierData>();
                     battleData = new Vector.<BattleNotifierData>();
                     rankNotifierData = new RankNotifierData();
                     rankNotifierData.userId = parser.id;
                     rankNotifierData.rank = parser.rank;
                     rankData.push(rankNotifierData);
                     uidNotifierData = new UidNotifierData();
                     uidNotifierData.userId = parser.id;
                     uidNotifierData.uid = parser.id;
                     uidData.push(uidNotifierData);
                     onlineNotifierData = new OnlineNotifierData();
                     onlineNotifierData.online = parser.online;
                     onlineNotifierData.userId = parser.id;
                     onlineNotifierData.serverNumber = 1;
                     onlineData.push(onlineNotifierData);
                     if(parser.battleId != null)
                     {
                        battleNotifierData = new BattleNotifierData();
                        battleNotifierData.battleData = new BattleInfoData();
                        battleNotifierData.battleData.battleId = parser.battleId;
                        battleNotifierData.battleData.mapName = parser.mapName;
                        battleNotifierData.battleData.mode = this.muwih(parser.mode);
                        battleNotifierData.battleData.privateBattle = parser.privateBattle;
                        battleNotifierData.battleData.proBattle = parser.proBattle;
                        battleNotifierData.battleData.range = new Nukoki(parser.max,parser.min);
                        battleNotifierData.battleData.remote = false;
                        battleNotifierData.battleData.serverNumber = 1;
                        battleNotifierData.userId = parser.id;
                        battleData.push(battleNotifierData);
                     }
                     rypyq.setRank(rankData);
                     fej.setUid(uidData);
                     keduh.setOnline(onlineData);
                     rowebatoz.setBattle(battleData);
                  }
                  else if(data.args[0] == "init_friends_list")
                  {
                     parser = JSON.parse(data.args[1]);
                     friends = parser.friends;
                     incoming = parser.incoming;
                     outcoming = parser.outcoming;
                     rankData = new Vector.<RankNotifierData>();
                     uidData = new Vector.<UidNotifierData>();
                     onlineData = new Vector.<OnlineNotifierData>();
                     battleData = new Vector.<BattleNotifierData>();
                     users = new Vector.<String>();
                     for each(u in friends)
                     {
                        rankNotifierData = new RankNotifierData();
                        rankNotifierData.userId = u.id;
                        rankNotifierData.rank = u.rank;
                        rankData.push(rankNotifierData);
                        uidNotifierData = new UidNotifierData();
                        uidNotifierData.userId = u.id;
                        uidNotifierData.uid = u.id;
                        uidData.push(uidNotifierData);
                        onlineNotifierData = new OnlineNotifierData();
                        onlineNotifierData.online = u.online;
                        onlineNotifierData.userId = u.id;
                        onlineNotifierData.serverNumber = 1;
                        onlineData.push(onlineNotifierData);
                        if(u.battleId != null)
                        {
                           battleNotifierData = new BattleNotifierData();
                           battleNotifierData.battleData = new BattleInfoData();
                           battleNotifierData.battleData.battleId = u.battleId;
                           battleNotifierData.battleData.mapName = u.mapName;
                           battleNotifierData.battleData.mode = this.muwih(u.mode);
                           battleNotifierData.battleData.privateBattle = u.privateBattle;
                           battleNotifierData.battleData.proBattle = u.proBattle;
                           battleNotifierData.battleData.range = new Nukoki(u.max,u.min);
                           battleNotifierData.battleData.remote = false;
                           battleNotifierData.battleData.serverNumber = 1;
                           battleNotifierData.userId = u.id;
                           battleData.push(battleNotifierData);
                        }
                        users.push(u.id);
                     }
                     this.lojifep.objectLoaded(new UserContainerCC(users));
                     users = new Vector.<String>();
                     for each(u in parser.new_accepted_friends)
                     {
                        rankNotifierData = new RankNotifierData();
                        rankNotifierData.userId = u.id;
                        rankNotifierData.rank = u.rank;
                        rankData.push(rankNotifierData);
                        uidNotifierData = new UidNotifierData();
                        uidNotifierData.userId = u.id;
                        uidNotifierData.uid = u.id;
                        uidData.push(uidNotifierData);
                        onlineNotifierData = new OnlineNotifierData();
                        onlineNotifierData.online = u.online;
                        onlineNotifierData.userId = u.id;
                        onlineNotifierData.serverNumber = 1;
                        onlineData.push(onlineNotifierData);
                        if(u.battleId != null)
                        {
                           battleNotifierData = new BattleNotifierData();
                           battleNotifierData.battleData = new BattleInfoData();
                           battleNotifierData.battleData.battleId = u.battleId;
                           battleNotifierData.battleData.mapName = u.mapName;
                           battleNotifierData.battleData.mode = this.muwih(u.mode);
                           battleNotifierData.battleData.privateBattle = u.privateBattle;
                           battleNotifierData.battleData.proBattle = u.proBattle;
                           battleNotifierData.battleData.range = new Nukoki(u.max,u.min);
                           battleNotifierData.battleData.remote = false;
                           battleNotifierData.battleData.serverNumber = 1;
                           battleNotifierData.userId = u.id;
                           battleData.push(battleNotifierData);
                        }
                        users.push(u.id);
                     }
                     this.gevanadiv.objectLoaded(new UserContainerCC(users));
                     users = new Vector.<String>();
                     for each(u in incoming)
                     {
                        rankNotifierData = new RankNotifierData();
                        rankNotifierData.userId = u.id;
                        rankNotifierData.rank = u.rank;
                        rankData.push(rankNotifierData);
                        uidNotifierData = new UidNotifierData();
                        uidNotifierData.userId = u.id;
                        uidNotifierData.uid = u.id;
                        uidData.push(uidNotifierData);
                        onlineNotifierData = new OnlineNotifierData();
                        onlineNotifierData.online = u.online;
                        onlineNotifierData.userId = u.id;
                        onlineNotifierData.serverNumber = 1;
                        onlineData.push(onlineNotifierData);
                        users.push(u.id);
                     }
                     incomingFriendsContainer = new UserContainerCC(users);
                     this.wed.objectLoaded(incomingFriendsContainer);
                     users = new Vector.<String>();
                     for each(u in parser.new_incoming_friends)
                     {
                        rankNotifierData = new RankNotifierData();
                        rankNotifierData.userId = u.id;
                        rankNotifierData.rank = u.rank;
                        rankData.push(rankNotifierData);
                        uidNotifierData = new UidNotifierData();
                        uidNotifierData.userId = u.id;
                        uidNotifierData.uid = u.id;
                        uidData.push(uidNotifierData);
                        onlineNotifierData = new OnlineNotifierData();
                        onlineNotifierData.online = u.online;
                        onlineNotifierData.userId = u.id;
                        onlineNotifierData.serverNumber = 1;
                        onlineData.push(onlineNotifierData);
                        users.push(u.id);
                     }
                     this.car.objectLoaded(new UserContainerCC(users));
                     users = new Vector.<String>();
                     for each(u in outcoming)
                     {
                        rankNotifierData = new RankNotifierData();
                        rankNotifierData.userId = u.id;
                        rankNotifierData.rank = u.rank;
                        rankData.push(rankNotifierData);
                        uidNotifierData = new UidNotifierData();
                        uidNotifierData.userId = u.id;
                        uidNotifierData.uid = u.id;
                        uidData.push(uidNotifierData);
                        onlineNotifierData = new OnlineNotifierData();
                        onlineNotifierData.online = u.online;
                        onlineNotifierData.userId = u.id;
                        onlineNotifierData.serverNumber = 1;
                        onlineData.push(onlineNotifierData);
                        users.push(u.id);
                     }
                     this.wyvu.objectLoaded(new UserContainerCC(users));
                  }
                  else if(data.args[0] == "friends_onUsersLoaded")
                  {
                     parser = JSON.parse(data.args[1]);
                     new_friends = parser.new_incoming_friends;
                     new_accepted_friends = parser.new_accepted_friends;
                     users = new Vector.<String>();
                     if(new_friends.length > 0)
                     {
                        for each(obj in new_friends)
                        {
                           users.push(obj.id);
                        }
                        this.car.objectLoaded(new UserContainerCC(users));
                     }
                     users = new Vector.<String>();
                     if(new_accepted_friends.length > 0)
                     {
                        for each(obj in new_accepted_friends)
                        {
                           users.push(obj.id);
                        }
                        this.gevanadiv.objectLoaded(new UserContainerCC(users));
                     }
                     this.lanune.onUsersLoaded();
                  }
                  else if(data.args[0] == "remove_new_accepted_friend")
                  {
                     this.gevanadiv.onRemoved(data.args[1]);
                  }
                  else if(data.args[0] == "remove_new_incoming_friend")
                  {
                     this.car.onRemoved(data.args[1]);
                  }
                  else if(data.args[0] == "friend_addToAccepted")
                  {
                     this.lojifep.onAdding(data.args[1]);
                     this.gevanadiv.onAdding(data.args[1]);
                     this.car.onRemoved(data.args[1]);
                  }
                  else if(data.args[0] == "friend_addToOutgoing")
                  {
                     this.wyvu.onAdding(data.args[1]);
                  }
                  else if(data.args[0] == "friend_addToIncoming")
                  {
                     this.wed.onAdding(data.args[1]);
                     this.car.onAdding(data.args[1]);
                  }
                  else if(data.args[0] == "friend_removeFromIncoming")
                  {
                     this.wed.onRemoved(data.args[1]);
                     this.car.onRemoved(data.args[1]);
                  }
                  else if(data.args[0] == "friend_removeFromOutgoing")
                  {
                     this.wyvu.onRemoved(data.args[1]);
                  }
                  else if(data.args[0] == "friend_removeFromAccepted")
                  {
                     this.lojifep.onRemoved(data.args[1]);
                     this.gevanadiv.onRemoved(data.args[1]);
                  }
                  else if(data.args[0] == "init_premium")
                  {
                     parser = JSON.parse(data.args[1]);
                     cc = new PremiumAccountAlertCC();
                     premiumCC = new PremiumNotifierCC();
                     premiumCC.lifeTimeInSeconds = parser.left_time;
                     cc.localRuntimeUser = true;
                     cc.needShowNotificationCompletionPremium = Boolean(parser.needShowNotificationCompletionPremium);
                     cc.needShowWelcomeAlert = Boolean(parser.needShowWelcomeAlert);
                     cc.reminderCompletionPremiumTime = parser.reminderCompletionPremiumTime;
                     cc.wasShowAlertForFirstPurchasePremium = Boolean(parser.wasShowAlertForFirstPurchasePremium);
                     cc.wasShowReminderCompletionPremium = Boolean(parser.wasShowReminderCompletionPremium);
                     this.cykasy.putInitParams(premiumCC);
                     this.cykasy.objectLoaded();
                     this.qyfary.objectLoaded(cc);
                  }
                  else if(data.args[0] == "notify_user_change_nickname")
                  {
                     uidData = new Vector.<UidNotifierData>();
                     parser = JSON.parse(data.args[1]);
                     uidObject = new UidNotifierData();
                     uidObject.userId = parser.userId;
                     uidObject.uid = parser.newUserId;
                     uidData.push(uidObject);
                     fej.setUid(uidData);
                  }
                  else if(data.args[0] == "notify_user_premium")
                  {
                     premiumData = new Vector.<PremiumNotifierData>();
                     parser = JSON.parse(data.args[1]);
                     premiumObject = new PremiumNotifierData();
                     premiumObject.userId = parser.userId;
                     premiumObject.premiumTimeLeftInSeconds = parser.premiumTimeLeftInSeconds;
                     premiumData.push(premiumObject);
                     this.cykasy.setPremiumTimeLeft(premiumData);
                  }
                  else if(data.args[0] == "notify_user_battle")
                  {
                     battleData = new Vector.<BattleNotifierData>();
                     parser = JSON.parse(data.args[1]);
                     battleObject = new BattleNotifierData();
                     battleObject.battleData = new BattleInfoData();
                     battleObject.userId = parser.userId;
                     battleObject.battleData.battleId = parser.battleId;
                     battleObject.battleData.mapName = parser.mapName;
                     battleObject.battleData.mode = this.muwih(parser.mode);
                     battleObject.battleData.privateBattle = parser.privateBattle;
                     battleObject.battleData.proBattle = parser.proBattle;
                     battleObject.battleData.range = new Nukoki(parser.maxRank,parser.minRank);
                     battleObject.battleData.remote = false;
                     battleObject.battleData.serverNumber = 1;
                     battleData.push(battleObject);
                     rowebatoz.setBattle(battleData);
                  }
                  else if(data.args[0] == "battle_not_found")
                  {
                     this.korope.battleNotFound();
                  }
                  else if(data.args[0] == "notify_user_leave_battle")
                  {
                     rowebatoz.leaveBattle(data.args[1]);
                  }
                  else if(data.args[0] == "notify_user_online")
                  {
                     onlineData = new Vector.<OnlineNotifierData>();
                     parser = JSON.parse(data.args[1]);
                     onlineObject = new OnlineNotifierData();
                     onlineObject.online = parser.online;
                     onlineObject.serverNumber = 1;
                     onlineObject.userId = parser.userId;
                     onlineData.push(onlineObject);
                     keduh.setOnline(onlineData);
                  }
                  else if(data.args[0] == "notify_user_rank")
                  {
                     rankData = new Vector.<RankNotifierData>();
                     parser = JSON.parse(data.args[1]);
                     rankObject = new RankNotifierData();
                     rankObject.rank = parser.rank;
                     rankObject.userId = parser.userId;
                     rankData.push(rankObject);
                     rypyq.setRank(rankData);
                  }
                  else if(data.args[0] == "open_shop_url")
                  {
                     navigateToURL(new URLRequest(data.args[1]));
                  }
                  else if(data.args[0] == "update_premium_time")
                  {
                     this.cykasy.updateTimeLeft(data.args[1]);
                  }
                  else if(data.args[0] == "activate_premium")
                  {
                     this.qyfary.showWelcomeAlert(data.args[1]);
                  }
                  else if(data.args[0] == "add_crystall")
                  {
                     this.userProperties.changeCrystal(int(data.args[1]));
                  }
                  else if(data.args[0] == "add_score")
                  {
                     this.userProperties.updateScore(int(data.args[1]));
                  }
                  else if(data.args[0] == "update_rating_and_place")
                  {
                     this.userProperties.updateRatingAndPlace(data.args[1],data.args[2]);
                  }
                  else if(data.args[0] == "update_rang")
                  {
                     this.userProperties.updateRank(int(data.args[1]),int(data.args[2]),int(data.args[3]),int(data.args[4]),int(data.args[5]));
                  }
                  else if(data.args[0] == "payment_successful")
                  {
                     this.rity.showDonationAlert(new Long(0,0),data.args[1],data.args[2],data.args[3],ImageResource(resourceRegistry.getResource(Long.getLong(0,data.args[4]))).data,data.args[5],data.args[6],data.args[7],data.args[8],data.args[9],data.args[10],data.args[11]);
                  }
                  else if(data.args[0] == "showNewPresentsAlert")
                  {
                     this.newPresents.showAlert();
                  }
                  else if(data.args[0] == "init_battle_select")
                  {
                     this.mivun(data.args[1]);
                     this.zironed.setPanelPartition(0);
                  }
                  else if(data.args[0] == "init_battle_create")
                  {
                     this.zyke(data.args[1]);
                  }
                  else if(data.args[0] == "add_battle")
                  {
                     parser = JSON.parse(data.args[1]);
                     this.penyqonul(parser);
                  }
                  else if(data.args[0] == "remove_battle")
                  {
                     battleGameObject = this.nesudomig.getObjectByName(data.args[1]);
                     if(battleGameObject != null)
                     {
                        Model.object = battleGameObject;
                        this.nesudomig.destroyObject(battleGameObject.id);
                        Model.popObject();
                     }
                  }
                  else if(data.args[0] == "start_battle")
                  {
                     this.zironed.hideAllBubbles(true);
                     if(BattleController(OSGi.getInstance().getService(IBattleController)) == null)
                     {
                        temp = new BattleController();
                        OSGi.getInstance().registerService(IBattleController,temp);
                     }
                     Network(OSGi.getInstance().getService(INetworker)).addEventListener(OSGi.getInstance().getService(IBattleController) as BattleController);
                  }
                  else if(data.args[0] == "show_battle_info")
                  {
                     this.fojuhy(data.args[1]);
                  }
                  else if(data.args[0] == "hide_battle_info")
                  {
                     battleInfoGameObject = this.zohimuj.getObjectByName(data.args[1]);
                     if(battleInfoGameObject != null)
                     {
                        Model.object = battleInfoGameObject;
                        this.zohimuj.destroyObject(battleInfoGameObject.id);
                        Model.popObject();
                     }
                  }
                  else if(data.args[0] == "fightFailedServerIsHalting")
                  {
                     battleGameObject = this.zohimuj.getObjectByName(data.args[1]);
                     Model.object = battleGameObject;
                     Kovobe(modelRegistry.getModelForObject(battleGameObject,Gigymo)).fightFailedServerIsHalting();
                     Model.popObject();
                  }
                  else if(data.args[0] == "removeUser")
                  {
                     battleGameObject = this.zohimuj.getObjectByName(data.args[1]);
                     if(battleGameObject != null)
                     {
                        Model.object = battleGameObject;
                        Kovobe(modelRegistry.getModelForObject(battleGameObject,Gigymo)).removeUser(data.args[2]);
                        Model.popObject();
                     }
                  }
                  else if(data.args[0] == "roundFinish")
                  {
                     battleGameObject = this.zohimuj.getObjectByName(data.args[1]);
                     if(battleGameObject != null)
                     {
                        Model.object = battleGameObject;
                        Kovobe(modelRegistry.getModelForObject(battleGameObject,Gigymo)).roundFinish();
                        Model.popObject();
                     }
                  }
                  else if(data.args[0] == "roundStart")
                  {
                     battleGameObject = this.zohimuj.getObjectByName(data.args[1]);
                     if(battleGameObject != null)
                     {
                        Model.object = battleGameObject;
                        Kovobe(modelRegistry.getModelForObject(battleGameObject,Gigymo)).roundStart();
                        Model.popObject();
                     }
                  }
                  else if(data.args[0] == "updateName")
                  {
                     battleGameObject = this.zohimuj.getObjectByName(data.args[1]);
                     if(battleGameObject != null)
                     {
                        Model.object = battleGameObject;
                        Kovobe(modelRegistry.getModelForObject(battleGameObject,Gigymo)).updateName(data.args[2]);
                        Model.popObject();
                     }
                  }
                  else if(data.args[0] == "updateUserSuspiciousState")
                  {
                     battleGameObject = this.zohimuj.getObjectByName(data.args[1]);
                     if(battleGameObject != null)
                     {
                        Model.object = battleGameObject;
                        Kovobe(modelRegistry.getModelForObject(battleGameObject,Gigymo)).updateUserSuspiciousState(data.args[2],data.args[3]);
                        Model.popObject();
                     }
                  }
                  else if(data.args[0] == "addUser")
                  {
                     parser = JSON.parse(data.args[1]);
                     battleGameObject = this.zohimuj.getObjectByName(parser.battleId);
                     Model.object = battleGameObject;
                     battleInfoUser = new BattleInfoUser();
                     battleInfoUser.kills = parser.kills;
                     battleInfoUser.score = parser.score;
                     battleInfoUser.suspicious = parser.suspicious;
                     battleInfoUser.user = parser.user;
                     BattleDmInfoModel(modelRegistry.getModel(Long.getLong(0,300090003))).addUser(battleInfoUser);
                     Model.popObject();
                  }
                  else if(data.args[0] == "addUserTeam")
                  {
                     parser = JSON.parse(data.args[1]);
                     battleGameObject = this.zohimuj.getObjectByName(parser.battleId);
                     Model.object = battleGameObject;
                     battleInfoUser = new BattleInfoUser();
                     battleInfoUser.kills = parser.kills;
                     battleInfoUser.score = parser.score;
                     battleInfoUser.suspicious = parser.suspicious;
                     battleInfoUser.user = parser.user;
                     BattleTeamInfoModel(modelRegistry.getModel(Long.getLong(0,300090027))).addUser(battleInfoUser,this.niwav(parser.type));
                     Model.popObject();
                  }
                  else if(data.args[0] == "equipmentNotMatchConstraints")
                  {
                     battleGameObject = this.zohimuj.getObjectByName(data.args[1]);
                     Model.object = battleGameObject;
                     BattleDmInfoModel(modelRegistry.getModel(Long.getLong(0,300090003))).equipmentNotMatchConstraints();
                     Model.popObject();
                  }
                  else if(data.args[0] == "equipmentNotMatchConstraintsTeam")
                  {
                     battleGameObject = this.zohimuj.getObjectByName(data.args[1]);
                     Model.object = battleGameObject;
                     BattleTeamInfoModel(modelRegistry.getModel(Long.getLong(0,300090027))).equipmentNotMatchConstraints();
                     Model.popObject();
                  }
                  else if(data.args[0] == "updateUserScore")
                  {
                     battleGameObject = this.zohimuj.getObjectByName(data.args[1]);
                     Model.object = battleGameObject;
                     BattleTeamInfoModel(modelRegistry.getModel(Long.getLong(0,300090027))).updateUserScore(data.args[2],data.args[3]);
                     Model.popObject();
                  }
                  else if(data.args[0] == "swapTeams")
                  {
                     battleGameObject = this.zohimuj.getObjectByName(data.args[1]);
                     Model.object = battleGameObject;
                     BattleTeamInfoModel(modelRegistry.getModel(Long.getLong(0,300090027))).swapTeams();
                     Model.popObject();
                  }
                  else if(data.args[0] == "updateTeamScore")
                  {
                     battleGameObject = this.zohimuj.getObjectByName(data.args[1]);
                     Model.object = battleGameObject;
                     BattleTeamInfoModel(modelRegistry.getModel(Long.getLong(0,300090027))).updateTeamScore(this.niwav(data.args[2]),data.args[3]);
                     Model.popObject();
                  }
                  else if(data.args[0] == "updateUserKills")
                  {
                     battleGameObject = this.zohimuj.getObjectByName(data.args[1]);
                     Model.object = battleGameObject;
                     BattleDmInfoModel(modelRegistry.getModel(Long.getLong(0,300090003))).updateUserKills(data.args[2],data.args[3]);
                     Model.popObject();
                  }
                  else if(data.args[0] == "server_halt")
                  {
                     PanelModel(OSGi.getInstance().getService(IPanel)).serverHalt(null,50,0,0,null);
                  }
                  else if(data.args[0] == "showSettings")
                  {
                     parser = JSON.parse(data.args[1]);
                     socialParams = new SocialNetworkPanelCC();
                     socialParams.socialNetworkParams = new Vector.<SocialNetworkPanelParams>();
                     socialNetworkPanelParams = new SocialNetworkPanelParams();
                     socialNetworkPanelParams.authorizationUrl = parser.authorizationUrl;
                     socialNetworkPanelParams.linkExists = parser.linkExists;
                     socialNetworkPanelParams.snId = parser.snId;
                     socialParams.socialNetworkParams.push(socialNetworkPanelParams);
                     socialParams.passwordCreated = parser.passwordCreated;
                     this.wutiz.objectLoaded(socialParams);
                     this.jopu.putInitParams(new Tonag(parser.notificationEnabled));
                     this.jopu.objectLoaded();
                     UserEmailAndPasswordModel(OSGi.getInstance().getService(PasswordService)).objectLoaded(parser.email,parser.isConfirmEmail);
                     this.tob.openSettings(Nuwyzogi.NONE);
                  }
                  else if(data.args[0] == "activateMessage")
                  {
                     UserEmailAndPasswordModel(OSGi.getInstance().getService(PasswordService)).activateMessage(data.args[1]);
                  }
                  else if(data.args[0] == "notifyPasswordIsSet")
                  {
                     UserEmailAndPasswordModel(OSGi.getInstance().getService(PasswordService)).notifyPasswordIsSet();
                  }
                  else if(data.args[0] == "notifyPasswordIsNotSet")
                  {
                     UserEmailAndPasswordModel(OSGi.getInstance().getService(PasswordService)).notifyPasswordIsNotSet();
                  }
                  else if(data.args[0] == "notifyCorrectPassword")
                  {
                     UserEmailAndPasswordModel(OSGi.getInstance().getService(PasswordService)).notifyCorrectPassword();
                  }
                  else if(data.args[0] == "notifyIncorrectPassword")
                  {
                     UserEmailAndPasswordModel(OSGi.getInstance().getService(PasswordService)).notifyIncorrectPassword();
                  }
                  else if(data.args[0] == "captchaUpdated")
                  {
                     bits = new Vector.<int>();
                     for each(bit in String(data.args[1]).split(","))
                     {
                        bits.push(parseInt(bit));
                     }
                     this.tob.captchaUpdated(CaptchaLocation.ACCOUNT_SETTINGS_FORM,bits);
                  }
                  else if(data.args[0] == "unlinkSuccess")
                  {
                     this.wutiz.unlinkSuccess(data.args[1]);
                  }
                  else if(data.args[0] == "linkCreated")
                  {
                     this.wutiz.linkCreated(data.args[1]);
                  }
                  else if(data.args[0] == "open_recovery_window")
                  {
                     PanelModel(OSGi.getInstance().getService(IPanel)).openRecoveryWindow(data.args[1]);
                  }
                  else if(data.args[0] == "hide_settings")
                  {
                     this.tob.mehyfaluq();
                  }
                  else if(data.args[0] == "show_news")
                  {
                     this.showNews(data.args[1]);
                  }
                  else if(data.args[0] == "show_achievements")
                  {
                     parser = JSON.parse(data.args[1]);
                     achievements = new Vector.<Jypofa>();
                     for each(achievementId in parser.ids)
                     {
                        achievements.push(this.jevizy(int(achievementId)));
                     }
                     this.zironed.putInitParams(new Tabaw(achievements));
                     this.zironed.setPanelPartition(1);
                     this.zironed.objectLoaded();
                  }
                  else if(data.args[0] == "complete_achievement")
                  {
                     achievement = this.jevizy(int(data.args[1]));
                     this.zironed.completeAchievement(achievement,data.args[2],0);
                  }
                  else if(data.args[0] == "show_bonuses")
                  {
                     this.difevu(data.args[1]);
                  }
                  else if(data.args[0] == "show_bonuses_present")
                  {
                     parser = JSON.parse(data.args[1]);
                     bonusModels = new Vector.<Long>();
                     bonusObject = new GameObject(Long.getLong(0,parser.image),gameTypeRegistry.createClass(Long.getLong(0,parser.image),bonusModels),"BonusObject",this.zumyqysof);
                     bonusModels.push(Long.getLong(0,300050005));
                     bonusModels.push(Long.getLong(0,300050006));
                     Model.object = bonusObject;
                     modelRegistry.getModel(bonusObject.gameClass.models[0]).putInitParams(new BonusImageCC(ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.image)))));
                     modelRegistry.getModel(bonusObject.gameClass.models[1]).putInitParams(new BonusInfoCC(parser.bottomText,null,parser.topText));
                     IObjectLoadListener(modelRegistry.getModel(bonusObject.gameClass.models[0])).objectLoadedPost();
                     Model.popObject();
                  }
                  else if(data.args[0] == "opened_items")
                  {
                     parser = JSON.parse(data.args[1]);
                     items = new Vector.<GarageItemInfo>();
                     for each(itemm in parser.items)
                     {
                        iteminfo = new GarageItemInfo();
                        iteminfo.category = this.buruwuf(itemm.itemViewCategory);
                        iteminfo.item = new GameObject(Long.getLong(0,itemm.preview),null,itemm.item,this.zumyqysof);
                        iteminfo.itemViewCategory = this.kam(itemm.category);
                        iteminfo.modificationIndex = itemm.modification;
                        iteminfo.name = itemm.name;
                        iteminfo.position = itemm.position;
                        iteminfo.preview = ImageResource(resourceRegistry.getResource(Long.getLong(0,itemm.preview)));
                        items.push(iteminfo);
                     }
                     this.kedorajyzu.showAvailableItems(items);
                  }
                  else if(data.args[0] == "show_payment")
                  {
                     PanelModel(OSGi.getInstance().getService(IPanel)).onShowPayment(JSON.parse(data.args[1]));
                  }
                  else if(data.args[0] == "unload_garage")
                  {
                     this.kisulize.objectUnloaded();
                     currentObjectsInGarageSpace = new Vector.<IGameObject>();
                     for each(object in this.zumyqysof.objects)
                     {
                        currentObjectsInGarageSpace.push(object);
                     }
                     for each(gameobj in currentObjectsInGarageSpace)
                     {
                        this.zumyqysof.destroyObject(gameobj.id);
                     }
                     this.zironed.hideAllBubbles(false);
                  }
                  else if(data.args[0] == "unload_battle_select")
                  {
                     currentObjectsInSpace = new Vector.<IGameObject>();
                     for each(object in this.nesudomig.objects)
                     {
                        currentObjectsInSpace.push(object);
                     }
                     currentObjectsInSpace.reverse();
                     for each(gameobj in currentObjectsInSpace)
                     {
                        this.nesudomig.destroyObject(gameobj.id);
                     }
                     currentObjectsInInfoSpace = new Vector.<IGameObject>();
                     for each(object in this.zohimuj.objects)
                     {
                        currentObjectsInInfoSpace.push(object);
                     }
                     for each(gameobj in currentObjectsInInfoSpace)
                     {
                        this.zohimuj.destroyObject(gameobj.id);
                     }
                     this.zironed.hideAllBubbles(false);
                  }
                  else if(data.args[0] == "change_layout_state")
                  {
                     LobbyLayoutNotifyModel(OSGi.getInstance().getService(ILobbyLayoutNotify)).beginLayoutSwitch(this.keqipusuh(data.args[1]));
                  }
                  else if(data.args[0] == "end_layout_switch")
                  {
                     LobbyLayoutNotifyModel(OSGi.getInstance().getService(ILobbyLayoutNotify)).endLayoutSwitch(this.keqipusuh(data.args[1]),this.keqipusuh(data.args[2]));
                  }
                  else if(data.args[0] == "show_rankup_supplies")
                  {
                     parser = JSON.parse(data.args[1]);
                     supplies = new Vector.<RankUpSupplyBonusInfo>();
                     for each(supply in parser.items)
                     {
                        supplyInfo = new RankUpSupplyBonusInfo();
                        supplyInfo.count = supply.count;
                        supplyInfo.text = supply.text;
                        supplyInfo.preview = ImageResource(resourceRegistry.getResource(Long.getLong(0,supply.preview)));
                        supplies.push(supplyInfo);
                     }
                     this.ritove.showRankUpSupplyBonusAlerts(supplies);
                  }
                  else if(data.args[0] == "unload_chat")
                  {
                     this.chatModel.objectUnloaded();
                  }
                  else if(data.args[0] == "setFilteredBattleName")
                  {
                     battleSelectObject = this.nesudomig.getObjectByName("BattleSelectObject");
                     Model.object = battleSelectObject;
                     BattleCreateModel(modelRegistry.getModel(Long.getLong(0,300090002))).setFilteredBattleName(data.args[1]);
                     Model.popObject();
                  }
                  else if(data.args[0] == "createFailedYouAreBanned")
                  {
                     battleSelectObject = this.nesudomig.getObjectByName("BattleSelectObject");
                     Model.object = battleSelectObject;
                     BattleCreateModel(modelRegistry.getModel(Long.getLong(0,300090002))).createFailedYouAreBanned();
                     Model.popObject();
                  }
                  else if(data.args[0] == "createFailedServerIsHalting")
                  {
                     battleSelectObject = this.nesudomig.getObjectByName("BattleSelectObject");
                     Model.object = battleSelectObject;
                     BattleCreateModel(modelRegistry.getModel(Long.getLong(0,300090002))).createFailedServerIsHalting();
                     Model.popObject();
                  }
                  else if(data.args[0] == "createFailedTooManyBattlesFromYou")
                  {
                     battleSelectObject = this.nesudomig.getObjectByName("BattleSelectObject");
                     Model.object = battleSelectObject;
                     BattleCreateModel(modelRegistry.getModel(Long.getLong(0,300090002))).createFailedTooManyBattlesFromYou();
                     Model.popObject();
                  }
                  else if(data.args[0] == "validateResult")
                  {
                     this.sepyce.validateResult(this.tifojokit(data.args[1]));
                  }
                  else if(data.args[0] == "showQuestWindow")
                  {
                     parser = JSON.parse(data.args[1]);
                     quests = new Vector.<Magyp>();
                     for each(quest in parser.quests)
                     {
                        dailyQuest = new Magyp();
                        prizes = new Vector.<Nokomojob>();
                        dailyQuest.canSkipForFree = quest.canSkipForFree;
                        dailyQuest.description = quest.description;
                        dailyQuest.finishCriteria = quest.finishCriteria;
                        dailyQuest.image = ImageResource(resourceRegistry.getResource(Long.getLong(0,quest.image)));
                        for each(prize in quest.prizes)
                        {
                           dailyQuestPrize = new Nokomojob();
                           dailyQuestPrize.count = prize.count;
                           dailyQuestPrize.name = prize.name;
                           prizes.push(dailyQuestPrize);
                        }
                        dailyQuest.prizes = prizes;
                        dailyQuest.progress = quest.progress;
                        dailyQuest.questId = Long.getLong(0,quest.questId);
                        dailyQuest.skipCost = quest.skipCost;
                        quests.push(dailyQuest);
                     }
                     weeklyQuestDescription = new Gipafili();
                     weeklyQuestDescription.currentQuestLevel = parser.weeklyQuestDescription.currentQuestLevel;
                     weeklyQuestDescription.currentQuestStreak = parser.weeklyQuestDescription.currentQuestStreak;
                     weeklyQuestDescription.doneForToday = parser.weeklyQuestDescription.doneForToday;
                     weeklyQuestDescription.questImage = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.weeklyQuestDescription.questImage)));
                     weeklyQuestDescription.rewardImage = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.weeklyQuestDescription.rewardImage)));
                     this.qihun.showQuestWindow(quests,weeklyQuestDescription);
                  }
                  else if(data.args[0] == "skipDailyQuest")
                  {
                     parser = JSON.parse(data.args[1]);
                     dailyQuest = new Magyp();
                     prizes = new Vector.<Nokomojob>();
                     dailyQuest.canSkipForFree = parser.quest.canSkipForFree;
                     dailyQuest.description = parser.quest.description;
                     dailyQuest.finishCriteria = parser.quest.finishCriteria;
                     dailyQuest.image = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.quest.image)));
                     for each(prize in parser.quest.prizes)
                     {
                        dailyQuestPrize = new Nokomojob();
                        dailyQuestPrize.count = prize.count;
                        dailyQuestPrize.name = prize.name;
                        prizes.push(dailyQuestPrize);
                     }
                     dailyQuest.prizes = prizes;
                     dailyQuest.progress = parser.quest.progress;
                     dailyQuest.questId = Long.getLong(0,parser.quest.questId);
                     dailyQuest.skipCost = parser.quest.skipCost;
                     this.qihun.skipDailyQuest(Long.getLong(0,parser.questId),dailyQuest);
                  }
                  else if(data.args[0] == "showQuestWindowWithoutDailyQuests")
                  {
                     parser = JSON.parse(data.args[1]);
                     weeklyQuestDescription = new Gipafili();
                     weeklyQuestDescription.currentQuestLevel = parser.weeklyQuestDescription.currentQuestLevel;
                     weeklyQuestDescription.currentQuestStreak = parser.weeklyQuestDescription.currentQuestStreak;
                     weeklyQuestDescription.doneForToday = parser.weeklyQuestDescription.doneForToday;
                     weeklyQuestDescription.questImage = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.weeklyQuestDescription.questImage)));
                     weeklyQuestDescription.rewardImage = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.weeklyQuestDescription.rewardImage)));
                     this.qihun.showQuestWindowWithoutDailyQuests(weeklyQuestDescription);
                  }
                  else if(data.args[0] == "takeDailyQuestPrize")
                  {
                     this.qihun.takeDailyQuestPrize(Long.getLong(0,data.args[1]));
                  }
                  else if(data.args[0] == "notifyDailyQuestCompleted")
                  {
                     this.jyvokic.notifyDailyQuestCompleted();
                  }
                  else if(data.args[0] == "notifyDailyQuestGenerated")
                  {
                     this.jyvokic.notifyDailyQuestGenerated();
                  }
                  else if(data.args[0] == "showWeeklyQuestReward")
                  {
                     parser = JSON.parse(data.args[1]);
                     weeklyQuestRewards = new Vector.<Cyfu>();
                     for each(reward in parser.rewards)
                     {
                        questReward = new Cyfu();
                        questReward.count = reward.count;
                        questReward.itemImage = ImageResource(resourceRegistry.getResource(Long.getLong(0,reward.itemImage)));
                        weeklyQuestRewards.push(questReward);
                     }
                     this.tifa.showWeeklyQuestReward(weeklyQuestRewards);
                  }
                  else if(data.args[0] == "activate_promocode_successfully")
                  {
                     PromoCodeActivateService(OSGi.getInstance().getService(IPromoCodeActivateService)).activatedSuccessfully();
                  }
                  else if(data.args[0] == "activate_promocode_failed")
                  {
                     PromoCodeActivateService(OSGi.getInstance().getService(IPromoCodeActivateService)).activatedFailed();
                  }
                  else if(data.args[0] == "update_rating")
                  {
                     this.updateRating(data.args[1],data.args[2],data.args[3]);
                  }
                  else if(data.args[0] == "init_referral_model")
                  {
                     _local_7 = ReferalsModel(modelRegistry.getModel(new ReferalsModel().id));
                     _local_7.putInitParams(new ReferrerPanelCC("test","https://playflashtanki.com"));
                     _local_7.objectLoadedPost();
                     this.networker.addListener(_local_7);
                  }
                  break;
               case Type.GARAGE:
                  if(data.args[0] == "init_garage_items")
                  {
                     this.cazeza(data.args[1],data.src);
                     this.zironed.setPanelPartition(1);
                  }
                  else if(data.args[0] == "init_market")
                  {
                     this.initMarket(data.args[1]);
                  }
                  else if(data.args[0] == "selectFirstItemInDepot")
                  {
                     this.kisulize.selectFirstItemInDepot();
                  }
                  else if(data.args[0] == "mount_item")
                  {
                     item3DModel = Item3DModel(modelRegistry.getModel(Long.getLong(0,300040012)));
                     Model.object = this.zumyqysof.getObjectByName(data.args[1]);
                     item3DModel.putInitParams(new Item3DCC(data.args[2] == "false" ? false : true));
                     item3DModel.objectLoaded();
                     Model.popObject();
                     mountedItems = new Vector.<IGameObject>();
                     mountedItems.push(this.zumyqysof.getObjectByName(data.args[1]));
                     if(data.args[2] != "false")
                     {
                        this.kisulize.initMounted(mountedItems);
                     }
                  }
                  else if(data.args[0] == "init_mounted_item")
                  {
                     item3DModel = Item3DModel(modelRegistry.getModel(Long.getLong(0,300040012)));
                     Model.object = this.zumyqysof.getObjectByName(data.args[1]);
                     item3DModel.putInitParams(new Item3DCC(data.args[2]));
                     item3DModel.objectLoaded();
                     Model.popObject();
                     mountedItems = new Vector.<IGameObject>();
                     mountedItems.push(this.zumyqysof.getObjectByName(data.args[1]));
                     this.kisulize.initMounted(mountedItems);
                  }
                  else if(data.args[0] == "select")
                  {
                     item = this.zumyqysof.getObjectByName(data.args[1]);
                     this.kisulize.select(item);
                  }
                  else if(data.args[0] == "showCategory")
                  {
                     this.kisulize.showCategory(this.kam(data.args[1]));
                  }
                  else if(data.args[0] == "openLootbox")
                  {
                     _local_1 = new Vector.<LootBoxReward>();
                     _local_2 = JSON.parse(data.args[1]);
                     for each(_local_3 in _local_2)
                     {
                        _local_4 = new LootBoxReward(this.getLootBoxCategory(_local_3.category),_local_3.count,ImageResource(resourceRegistry.getResource(Long.getLong(0,_local_3.preview))),_local_3.name);
                        _local_1.push(_local_4);
                     }
                     _local_5 = LootBoxModel(modelRegistry.getModel(new LootBoxModel().id));
                     if(_local_5 != null)
                     {
                        _local_6 = this.zumyqysof.getObject(Long.getLong(0,613847));
                        Model.object = _local_6;
                        _local_5.openSuccessful(_local_1);
                        Model.popObject();
                     }
                     trace("конты");
                  }
                  break;
               case Type.BATTLE_SELECT:
                  if(data.args[0] == "madePrivate")
                  {
                     battleGameObject = this.nesudomig.getObjectByName(data.args[1]);
                     if(battleGameObject != null)
                     {
                        Model.object = battleGameObject;
                        BattleItemModel(modelRegistry.getModel(Long.getLong(0,300090008))).madePrivate();
                        Model.popObject();
                     }
                  }
                  else if(data.args[0] == "updateName")
                  {
                     battleGameObject = this.nesudomig.getObjectByName(data.args[1]);
                     if(battleGameObject != null)
                     {
                        Model.object = battleGameObject;
                        BattleItemModel(modelRegistry.getModel(Long.getLong(0,300090008))).updateName(data.args[2]);
                        Model.popObject();
                     }
                  }
                  else if(data.args[0] == "updateSuspicious")
                  {
                     battleGameObject = this.nesudomig.getObjectByName(data.args[1]);
                     if(battleGameObject != null)
                     {
                        Model.object = battleGameObject;
                        BattleItemModel(modelRegistry.getModel(Long.getLong(0,300090008))).updateSuspicious(data.args[2]);
                        Model.popObject();
                     }
                  }
                  else if(data.args[0] == "releaseSlot")
                  {
                     battleGameObject = this.nesudomig.getObjectByName(data.args[1]);
                     if(battleGameObject != null)
                     {
                        Model.object = battleGameObject;
                        BattleDMItemModel(modelRegistry.getModel(Long.getLong(0,300090004))).onReleaseSlot(data.args[2]);
                        Model.popObject();
                     }
                  }
                  else if(data.args[0] == "reserveSlot")
                  {
                     battleGameObject = this.nesudomig.getObjectByName(data.args[1]);
                     if(battleGameObject != null)
                     {
                        Model.object = battleGameObject;
                        BattleDMItemModel(modelRegistry.getModel(Long.getLong(0,300090004))).onReserveSlot(data.args[2]);
                        Model.popObject();
                     }
                  }
                  else if(data.args[0] == "releaseSlotTeam")
                  {
                     battleGameObject = this.nesudomig.getObjectByName(data.args[1]);
                     if(battleGameObject != null)
                     {
                        Model.object = battleGameObject;
                        BattleTeamItemModel(modelRegistry.getModel(Long.getLong(0,300090028))).onReleaseSlot(data.args[2]);
                        Model.popObject();
                     }
                  }
                  else if(data.args[0] == "reserveSlotTeam")
                  {
                     battleGameObject = this.nesudomig.getObjectByName(data.args[1]);
                     if(battleGameObject != null)
                     {
                        Model.object = battleGameObject;
                        BattleTeamItemModel(modelRegistry.getModel(Long.getLong(0,300090028))).onReserveSlot(data.args[2],this.niwav(data.args[3]));
                        Model.popObject();
                     }
                  }
                  else if(data.args[0] == "swapTeams")
                  {
                     battleGameObject = this.nesudomig.getObjectByName(data.args[1]);
                     if(battleGameObject != null)
                     {
                        Model.object = battleGameObject;
                        BattleTeamItemModel(modelRegistry.getModel(Long.getLong(0,300090028))).swapTeams();
                        Model.popObject();
                     }
                  }
                  else if(data.args[0] == "select")
                  {
                     battleSelectObject = this.nesudomig.getObjectByName("BattleSelectObject");
                     Model.object = battleSelectObject;
                     BattleSelectModel(modelRegistry.getModel(Long.getLong(0,300090011))).select(data.args[1]);
                     Model.popObject();
                  }
            }
         }
         catch(e:Error)
         {
            Network(OSGi.getInstance().getService(INetworker)).send("lobby;error;" + "Lobby error " + e.getStackTrace());
            throw e;
         }
      }
      
      private function difevu(_arg_1:String) : void
      {
         var _local_7:* = undefined;
         var _local_8:GameObject = null;
         var _local_2:Object = JSON.parse(_arg_1);
         var _local_3:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _local_4:Vector.<Long> = new Vector.<Long>();
         _local_4.push(Long.getLong(0,300050006));
         _local_4.push(Long.getLong(0,300050007));
         _local_4.push(Long.getLong(0,300050008));
         var _local_5:GameClass = new GameClass(Long.getLong(0,502350235),_local_4);
         var _local_6:GameObject = new GameObject(Long.getLong(0,62386283),_local_5,"BonusModelObject",this.zumyqysof);
         for each(_local_7 in _local_2.items)
         {
            _local_8 = new GameObject(Long.getLong(Math.random(),Math.random()),_local_5,"BonusItem",this.zumyqysof);
            Model.object = _local_8;
            Model(modelRegistry.getModel(_local_4[1])).putInitParams(new BonusItemCC(_local_7.count,ImageResource(resourceRegistry.getResource(Long.getLong(0,_local_7.preview)))));
            Model.popObject();
            _local_3.push(_local_8);
         }
         Model.object = _local_6;
         Model(modelRegistry.getModel(_local_4[0])).putInitParams(new BonusInfoCC(_local_2.bottomText,ImageResource(resourceRegistry.getResource(Long.getLong(0,_local_2.image))),_local_2.topText));
         Model(modelRegistry.getModel(_local_4[2])).putInitParams(new BonusItemsShowingCC(_local_3));
         IObjectLoadListener(modelRegistry.getModel(_local_4[2])).objectLoaded();
         Model.popObject();
      }
      
      private function keqipusuh(_arg_1:String) : LayoutState
      {
         switch(_arg_1)
         {
            case "GARAGE":
               return LayoutState.GARAGE;
            case "BATTLE_SELECT":
               return LayoutState.BATTLE_SELECT;
            case "BATTLE":
               return LayoutState.BATTLE;
            default:
               return LayoutState.RELOAD_SPACE;
         }
      }
      
      private function jevizy(_arg_1:int) : Jypofa
      {
         switch(_arg_1)
         {
            case 0:
               return Jypofa.FIRST_PURCHASE;
            case 1:
               return Jypofa.FIRST_REFERRAL;
            case 2:
               return Jypofa.FIGHT_FIRST_BATTLE;
            case 3:
               return Jypofa.FIRST_DONATE;
            default:
               return null;
         }
      }
      
      private function bylega(_arg_1:String) : void
      {
         var _local_2:Object = null;
         var _local_3:ChatMessage = null;
         var news_item:* = undefined;
         var _local_4:Object = JSON.parse(_arg_1);
         var news:Vector.<NewsItemData> = new Vector.<NewsItemData>();
         var _local_5:Vector.<ChatMessage> = new Vector.<ChatMessage>([]);
         for each(_local_2 in _local_4.messages)
         {
            _local_3 = new ChatMessage();
            _local_3.sourceUserStatus = Boolean(_local_2.system) ? null : new UserStatus(this.dijolycy(_local_2.chatPermissions),_local_2.sourceUserIp,_local_2.rang,_local_2.name,_local_2.name,_local_2.sourceUserPremium);
            _local_3.system = _local_2.system;
            _local_3.targetUserStatus = Boolean(_local_2.addressed) ? new UserStatus(this.dijolycy(_local_2.chatPermissionsTo),_local_2.targetUserIp,_local_2.rangTo,_local_2.nameTo,_local_2.nameTo,_local_2.targetUserPremium) : null;
            _local_3.text = _local_2.message;
            _local_3.warning = _local_2.yellow;
            _local_5.push(_local_3);
         }
         for each(news_item in _local_4.news)
         {
            news.push(new NewsItemData(news_item.date,news_item.text,0,String(news_item.header),Long.getLong(0,news_item.id),String(news_item.image)));
         }
         this.chatModel.initNews(news);
         this.chatModel.showMessages(_local_5);
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
      
      private function fojuhy(_arg_1:String) : void
      {
         var _local_7:Zoti = null;
         var _local_8:* = undefined;
         var _local_9:BattleInfoUser = null;
         var _local_10:Wecy = null;
         var _local_11:* = undefined;
         var _local_12:* = undefined;
         var _local_13:BattleInfoUser = null;
         var _local_14:BattleInfoUser = null;
         var _local_2:Object = JSON.parse(_arg_1);
         var _local_3:IGameClass = gameTypeRegistry.getClass(Long.getLong(5823622,5812058));
         if(this.muwih(_local_2.battleMode) != Suvozimi.DM && this.muwih(_local_2.battleMode) != Suvozimi.JGR)
         {
            _local_3 = gameTypeRegistry.getClass(Long.getLong(58236223,58120559));
         }
         var _local_4:IGameObject = this.zohimuj.createObject(Long.getLong(this.kyqil++,this.kyqil++),_local_3,_local_2.itemId);
         var _local_5:Qaru = new Qaru();
         _local_5.battleMode = this.muwih(_local_2.battleMode);
         _local_5.itemId = _local_2.itemId;
         _local_5.fik = new Juva(_local_2.scoreLimit,_local_2.timeLimitInSec);
         _local_5.map = this.nesudomig.getObject(Long.getLong(_local_2.preview * 1000,_local_2.preview * 1000));
         _local_5.maxPeopleCount = _local_2.maxPeopleCount;
         _local_5.name = _local_2.name;
         _local_5.parkourMode = _local_2.parkourMode;
         _local_5.proBattle = _local_2.proBattle;
         var maxRank:int = int(_local_2.maxRank);
         if(maxRank > 31)
         {
            maxRank = 31;
         }
         _local_5.rankRange = new Nukoki(maxRank,_local_2.minRank);
         _local_5.roundStarted = _local_2.roundStarted;
         _local_5.spectator = _local_2.spectator;
         _local_5.timeLeftInSec = _local_2.timeLeftInSec;
         _local_5.userPaidNoSuppliesBattle = _local_2.userPaidNoSuppliesBattle;
         _local_5.withoutBonuses = _local_2.withoutBonuses;
         _local_5.withoutCrystals = _local_2.withoutCrystals;
         _local_5.withoutSupplies = _local_2.withoutSupplies;
         _local_5.bitoleho = true;
         _local_5.equipmentConstraintsMode = this.teqom(_local_2.equipmentConstraintsMode);
         _local_5.reArmor = _local_2.reArmorEnabled;
         var _local_6:Dosyfuso = new Dosyfuso();
         _local_6.proBattleEnterPrice = _local_2.proBattleEnterPrice;
         _local_6.timeLeftInSec = _local_2.proBattleTimeLeftInSec == -1 ? 0 : int(_local_2.proBattleTimeLeftInSec);
         Model.object = _local_4;
         Zuhidegod(modelRegistry.getModel(_local_4.gameClass.models[2])).putInitParams(_local_6);
         Zuhidegod(modelRegistry.getModel(_local_4.gameClass.models[2])).objectLoadedPost();
         Kovobe(modelRegistry.getModel(_local_4.gameClass.models[0])).putInitParams(_local_5);
         Kovobe(modelRegistry.getModel(_local_4.gameClass.models[0])).objectLoaded();
         if(this.muwih(_local_2.battleMode) == Suvozimi.DM || this.muwih(_local_2.battleMode) == Suvozimi.JGR)
         {
            _local_7 = new Zoti();
            _local_7.users = new Vector.<BattleInfoUser>();
            for each(_local_8 in _local_2.users)
            {
               _local_9 = new BattleInfoUser();
               _local_9.kills = _local_8.kills;
               _local_9.score = _local_8.score;
               _local_9.suspicious = _local_8.suspicious;
               _local_9.user = _local_8.user;
               _local_7.users.push(_local_9);
            }
            BattleDmInfoModel(modelRegistry.getModel(_local_4.gameClass.models[1])).putInitParams(_local_7);
            BattleDmInfoModel(modelRegistry.getModel(_local_4.gameClass.models[1])).objectLoadedPost();
         }
         else
         {
            _local_10 = new Wecy();
            _local_10.autoBalance = _local_2.autoBalance;
            _local_10.friendlyFire = _local_2.friendlyFire;
            _local_10.scoreBlue = _local_2.scoreBlue;
            _local_10.scoreRed = _local_2.scoreRed;
            _local_10.usersBlue = new Vector.<BattleInfoUser>();
            for each(_local_11 in _local_2.usersBlue)
            {
               _local_13 = new BattleInfoUser();
               _local_13.kills = _local_11.kills;
               _local_13.score = _local_11.score;
               _local_13.suspicious = _local_11.suspicious;
               _local_13.user = _local_11.user;
               _local_10.usersBlue.push(_local_13);
            }
            _local_10.usersRed = new Vector.<BattleInfoUser>();
            for each(_local_12 in _local_2.usersRed)
            {
               _local_14 = new BattleInfoUser();
               _local_14.kills = _local_12.kills;
               _local_14.score = _local_12.score;
               _local_14.suspicious = _local_12.suspicious;
               _local_14.user = _local_12.user;
               _local_10.usersRed.push(_local_14);
            }
            BattleTeamInfoModel(modelRegistry.getModel(_local_4.gameClass.models[1])).putInitParams(_local_10);
            BattleTeamInfoModel(modelRegistry.getModel(_local_4.gameClass.models[1])).objectLoadedPost();
         }
         Model.popObject();
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
      
      private function penyqonul(_arg_1:Object) : void
      {
         var _local_3:IGameObject = null;
         var _local_4:BattleItemCC = null;
         var _local_5:Homevobi = null;
         var _local_6:* = undefined;
         var _local_7:Donoqof = null;
         var _local_8:* = undefined;
         var _local_9:* = undefined;
         var _local_2:IGameClass = gameTypeRegistry.getClass(Long.getLong(5823623,5812059));
         if(this.muwih(_arg_1.battleMode) != Suvozimi.DM && this.muwih(_arg_1.battleMode) != Suvozimi.JGR)
         {
            _local_2 = gameTypeRegistry.getClass(Long.getLong(58236221,58120558));
         }
         if(_local_2 != null)
         {
            if(this.nesudomig.getObjectByName(_arg_1.battleId) != null)
            {
               this.nesudomig.destroyObject(this.nesudomig.getObjectByName(_arg_1.battleId).id);
            }
            _local_3 = this.nesudomig.createObject(Long.getLong(this.kyqil++ * 100,this.kyqil++ * 100),_local_2,_arg_1.battleId);
            _local_4 = new BattleItemCC();
            _local_4.battleId = _arg_1.battleId;
            _local_4.battleMode = this.muwih(_arg_1.battleMode);
            _local_4.map = this.nesudomig.getObject(Long.getLong(_arg_1.preview * 1000,_arg_1.preview * 1000));
            _local_4.maxPeople = _arg_1.maxPeople;
            _local_4.name = _arg_1.name;
            _local_4.privateBattle = _arg_1.privateBattle;
            _local_4.proBattle = _arg_1.proBattle;
            _local_4.rankRange = new Nukoki(_arg_1.maxRank,_arg_1.minRank);
            _local_4.suspicious = _arg_1.suspicious;
            _local_4.equipmentConstraintsMode = this.teqom(_arg_1.equipmentConstraintsMode);
            _local_4.parkourMode = _arg_1.parkourMode;
            _local_4.timeLeft = _arg_1.timeLeft;
            Model.object = _local_3;
            BattleItemModel(modelRegistry.getModel(_local_3.gameClass.models[0])).putInitParams(_local_4);
            if(this.muwih(_arg_1.battleMode) == Suvozimi.DM || this.muwih(_arg_1.battleMode) == Suvozimi.JGR)
            {
               _local_5 = new Homevobi();
               _local_5.users = new Vector.<String>();
               for each(_local_6 in _arg_1.users)
               {
                  _local_5.users.push(_local_6);
               }
               BattleDMItemModel(modelRegistry.getModel(_local_3.gameClass.models[1])).putInitParams(_local_5);
               BattleDMItemModel(modelRegistry.getModel(_local_3.gameClass.models[1])).objectLoaded();
            }
            else
            {
               _local_7 = new Donoqof();
               _local_7.usersBlue = new Vector.<String>();
               _local_7.usersRed = new Vector.<String>();
               for each(_local_8 in _arg_1.usersBlue)
               {
                  _local_7.usersBlue.push(_local_8);
               }
               for each(_local_9 in _arg_1.usersRed)
               {
                  _local_7.usersRed.push(_local_9);
               }
               BattleTeamItemModel(modelRegistry.getModel(_local_3.gameClass.models[1])).putInitParams(_local_7);
               BattleTeamItemModel(modelRegistry.getModel(_local_3.gameClass.models[1])).objectLoaded();
            }
            BattleItemModel(modelRegistry.getModel(_local_3.gameClass.models[0])).objectLoadedPost();
            this.mykafojid.push(_local_3);
         }
      }
      
      private function initMarket(_arg_1:String) : void
      {
         var _local_6:Object = null;
         var _local_7:Vector.<ItemGaragePropertyData> = null;
         var _local_8:Vector.<GaragePropertyData> = null;
         var _local_9:Vector.<PropertyData> = null;
         var _local_10:Vector.<KitItem> = null;
         var _local_21:Vector.<KitGiftItem> = null;
         var _local_22:* = undefined;
         var _local_11:Object = null;
         var _local_12:IGameObject = null;
         var _local_13:* = undefined;
         var _local_14:Vector.<PropertyData> = null;
         var _local_15:* = undefined;
         var _local_17:* = undefined;
         var _local_19:Object = null;
         var _local_2:Object = JSON.parse(_arg_1);
         var _local_3:Array = new Array();
         var _local_4:Vector.<Long> = new Vector.<Long>();
         _local_4.push(Long.getLong(800589377,840038407));
         _local_4.push(Long.getLong(1424296501,-807048170));
         _local_4.push(Long.getLong(492245786,-1837686060));
         _local_4.push(Long.getLong(916213531,-841295065));
         _local_4.push(Long.getLong(644770553,-155779331));
         _local_4.push(Long.getLong(580825858,-1941731225));
         _local_4.push(Long.getLong(0,300040017));
         _local_4.push(Long.getLong(0,300040029));
         _local_4.push(Long.getLong(0,300040004));
         _local_4.push(Long.getLong(1497301838,-1092921347));
         _local_4.push(Long.getLong(947299051,-358915161));
         _local_4.push(Long.getLong(0,300040023));
         _local_4.push(Long.getLong(687238537,2002147897));
         _local_4.push(Long.getLong(1896140971,-1323660734));
         _local_4.push(Long.getLong(1215266592,-1320571870));
         _local_4.push(Long.getLong(1870140649,1080360405));
         _local_4.push(Long.getLong(882584998,678334280));
         _local_4.push(Long.getLong(0,300040010));
         _local_4.push(Long.getLong(1891481944,-1293130596));
         _local_4.push(Long.getLong(888433053,2115284408));
         _local_4.push(Long.getLong(253893103,1551357114));
         _local_4.push(Long.getLong(0,300040005));
         _local_4.push(new LootBoxModel().id);
         _local_4.push(new AvailableSkinsItemModel().id);
         _local_4.push(new MountSkinItemModel().id);
         gameTypeRegistry.createClass(Long.getLong(15025,684360),_local_4);
         var _local_5:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _local_18:Vector.<Object> = null;
         var _local_20:MountedSkinCC = null;
         for each(_local_6 in _local_2.items)
         {
            _local_7 = new Vector.<ItemGaragePropertyData>();
            _local_8 = new Vector.<GaragePropertyData>();
            _local_9 = new Vector.<PropertyData>();
            _local_10 = new Vector.<KitItem>();
            _local_21 = new Vector.<KitGiftItem>();
            if(this.myvihyn(_local_6.type) == ItemCategoryEnum.KIT)
            {
               for each(_local_13 in _local_6.kit.kitItems)
               {
                  _local_10.push(new KitItem(_local_13.count,this.zumyqysof.getObjectByName(_local_13.id),false));
               }
               for each(_local_22 in _local_6.kit.giftItems)
               {
                  _local_21.push(new KitGiftItem(_local_22.count,this.zumyqysof.getObjectByName(_local_22.id)));
               }
            }
            for each(_local_11 in _local_6.properts)
            {
               _local_14 = new Vector.<PropertyData>();
               _local_7.push(new ItemGaragePropertyData(this.hiqomodu(_local_11.property),_local_11.value));
               if(_local_11.subproperties != null)
               {
                  for each(_local_15 in _local_11.subproperties)
                  {
                     _local_14.push(new PropertyData(_local_15.value,_local_15.value,this.vebidut(_local_15.property)));
                  }
               }
               else
               {
                  _local_14.push(new PropertyData(_local_11.value,_local_11.value,this.vebidut(_local_11.property)));
               }
               _local_8.push(new GaragePropertyData(new LinearParams(_local_11.value,_local_11.value),0,0,25,_local_14,this.hiqomodu(_local_11.property),0,0,new LinearParams(_local_11.value,_local_11.value)));
            }
            _local_12 = this.zumyqysof.createObject(Long.getLong(0,_local_6.previewResourceId),GameClass(gameTypeRegistry.getClass(Long.getLong(15025,684360))),_local_6.id + "_m" + (_local_6.modificationID == undefined ? "0" : _local_6.modificationID));
            Model.object = _local_12;
            modelRegistry.getModel(_local_12.gameClass.models[0]).putInitParams(new ItemModelCC(15000,_local_6.rank,_local_6.index,ImageResource(resourceRegistry.getResource(Long.getLong(0,_local_6.previewResourceId)))));
            modelRegistry.getModel(_local_12.gameClass.models[1]).putInitParams(new ItemViewCategoryCC(this.kam(_local_6.category)));
            modelRegistry.getModel(_local_12.gameClass.models[2]).putInitParams(new ItemCategoryCC(this.myvihyn(_local_6.type)));
            modelRegistry.getModel(_local_12.gameClass.models[3]).putInitParams(new DescriptionModelCC(_local_6.description,_local_6.name));
            modelRegistry.getModel(_local_12.gameClass.models[4]).putInitParams(new BuyableCC(true,_local_6.price));
            modelRegistry.getModel(_local_12.gameClass.models[5]).putInitParams(new ModificationCC(Long.getLong(0,_local_6.baseItemId),_local_6.modificationID == null ? -1 : int(_local_6.modificationID)));
            modelRegistry.getModel(_local_12.gameClass.models[6]).putInitParams(new ItemPropertiesCC(_local_7));
            modelRegistry.getModel(_local_12.gameClass.models[7]).putInitParams(new UpgradableParamsCC(null,_local_8));
            modelRegistry.getModel(_local_12.gameClass.models[8]).putInitParams(new CountableItemCC(this.myvihyn(_local_6.type) == ItemCategoryEnum.INVENTORY || this.myvihyn(_local_6.type) == ItemCategoryEnum.LOOT_BOX ? 0 : -1));
            modelRegistry.getModel(_local_12.gameClass.models[9]).putInitParams(new Object3DSCC(Long.getLong(0,_local_6.object3ds)));
            if(_local_6.animatedColoring != null)
            {
               modelRegistry.getModel(_local_12.gameClass.models[10]).putInitParams(new ColoringCC(MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_local_6.animatedColoring))),null));
            }
            else
            {
               modelRegistry.getModel(_local_12.gameClass.models[10]).putInitParams(new ColoringCC(null,ImageResource(resourceRegistry.getResource(Long.getLong(0,_local_6.coloring)))));
            }
            modelRegistry.getModel(_local_12.gameClass.models[11]).putInitParams(new TemporaryItemCC(_local_6.remainingTimeInSec,_local_6.remainingTimeInSec));
            modelRegistry.getModel(_local_12.gameClass.models[12]).putInitParams(new DiscountCC(_local_6.discount.percent,_local_6.discount.timeLeftInSeconds,_local_6.discount.timeToStartInSeconds));
            ObjectLoadPostListener(modelRegistry.getModel(_local_12.gameClass.models[12])).objectLoadedPost();
            if(this.myvihyn(_local_6.type) == ItemCategoryEnum.KIT)
            {
               modelRegistry.getModel(_local_12.gameClass.models[14]).putInitParams(new Tam(_local_6.kit.discountInPercent,ImageResource(resourceRegistry.getResource(Long.getLong(0,_local_6.kit.image))),_local_10,_local_21));
               modelRegistry.getModel(_local_12.gameClass.models[15]).putInitParams(new TimePeriodModelCC(true,_local_6.kit.isTimeless,_local_6.kit.timeLeftInSeconds,10));
               ObjectLoadListener(modelRegistry.getModel(_local_12.gameClass.models[15])).objectLoaded();
            }
            IObjectLoadListener(modelRegistry.getModel(_local_12.gameClass.models[8])).objectLoaded();
            if(_local_6.id == "lootbox")
            {
               modelRegistry.getModel(_local_12.gameClass.models[22]).putInitParams(new LootBoxModelCC());
               LootBoxModel(modelRegistry.getModel(_local_12.gameClass.models[22])).objectLoaded();
            }
            if(_local_6.id == "gold")
            {
               DroppableGoldItemModel(modelRegistry.getModel(new DroppableGoldItemModel().id)).putInitParams(new DroppableGoldItemCC(false));
               DroppableGoldItemModel(modelRegistry.getModel(new DroppableGoldItemModel().id)).objectLoaded();
            }
            if(_local_6.skins != null)
            {
               _local_18 = new Vector.<Object>();
               for each(_local_17 in _local_6.skins)
               {
                  _local_19 = new Object();
                  _local_19.previewResourceId = _local_17.previewResourceId;
                  _local_19.id = _local_17.id;
                  _local_19.name = _local_17.name;
                  _local_19.description = _local_17.description;
                  _local_18.push(_local_19);
                  if(Boolean(_local_17.isMounted))
                  {
                     _local_20 = new MountedSkinCC(_local_19);
                  }
               }
            }
            modelRegistry.getModel(_local_12.gameClass.models[23]).putInitParams(new AvailableSkinsCC(_local_18));
            modelRegistry.getModel(_local_12.gameClass.models[24]).putInitParams(_local_20);
            ObjectLoadPostListener(modelRegistry.getModel(_local_12.gameClass.models[7])).objectLoadedPost();
            _local_5.push(_local_12);
         }
         modelRegistry.getModel(Model.object.gameClass.models[21]).putInitParams(new Ruvetuki(_local_2.delayMountArmorInSec,_local_2.delayMountColorInSec,_local_2.delayMountWeaponInSec));
         ObjectLoadPostListener(modelRegistry.getModel(Model.object.gameClass.models[21])).objectLoadedPost();
         this.kisulize.initMarket(_local_5);
         this.kisulize.selectFirstItemInDepot();
      }
      
      private function hiqomodu(_arg_1:String) : ItemGarageProperty
      {
         var _local_2:ItemGarageProperty = null;
         for each(_local_2 in ItemGarageProperty.values)
         {
            if(_local_2.name.indexOf(_arg_1) >= 0)
            {
               return _local_2;
            }
         }
         return ItemGarageProperty.RICOCHET_RESISTANCE;
      }
      
      private function vebidut(_arg_1:String) : ItemProperty
      {
         var _local_2:ItemProperty = null;
         for each(_local_2 in ItemProperty.values)
         {
            if(_local_2.name == _arg_1)
            {
               return _local_2;
            }
         }
         return ItemProperty.RICOCHET_RESISTANCE;
      }
      
      private function showNews(_arg_1:String) : void
      {
         var _local_4:* = undefined;
         var _local_2:Object = JSON.parse(_arg_1);
         var _local_3:Vector.<NewsItemData> = new Vector.<NewsItemData>();
         for each(_local_4 in _local_2)
         {
            _local_3.push(new NewsItemData(_local_4.date,_local_4.text,0,String(_local_4.header),Long.getLong(0,_local_4.id),String(_local_4.image)));
         }
         this.koqyh.putInitParams(new NewsShowingCC(_local_3));
         this.koqyh.objectLoaded();
      }
      
      private function buruwuf(_arg_1:String) : ItemCategoryEnum
      {
         switch(_arg_1.toLowerCase())
         {
            case "weapon":
               return ItemCategoryEnum.WEAPON;
            case "paint":
               return ItemCategoryEnum.COLOR;
            case "inventory":
               return ItemCategoryEnum.INVENTORY;
            case "armor":
               return ItemCategoryEnum.ARMOR;
            case "plugin":
               return ItemCategoryEnum.PLUGIN;
            default:
               return null;
         }
      }
      
      private function cazeza(_arg_1:String, _arg_2:String = null) : void
      {
         var _local_8:Vector.<ItemGaragePropertyData> = null;
         var _local_9:Object = null;
         var _local_10:Vector.<GaragePropertyData> = null;
         var _local_11:Vector.<PropertyData> = null;
         var _local_12:Object = null;
         var _local_13:int = 0;
         var _local_14:IGameObject = null;
         var _local_15:Vector.<PropertyData> = null;
         var _local_16:* = undefined;
         var _local_17:* = undefined;
         var _local_19:Object = null;
         var _local_3:ModelRegistry = OSGi.getInstance().getService(ModelRegistry) as ModelRegistry;
         var _local_4:ResourceRegistry = OSGi.getInstance().getService(ResourceRegistry) as ResourceRegistry;
         var _local_5:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _local_6:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _local_7:Object = JSON.parse(_arg_1);
         var _local_18:Vector.<Object> = null;
         var _local_20:MountedSkinCC = null;
         _local_8 = new Vector.<ItemGaragePropertyData>();
         for each(_local_9 in _local_7.items)
         {
            _local_8 = new Vector.<ItemGaragePropertyData>();
            _local_10 = new Vector.<GaragePropertyData>();
            _local_11 = new Vector.<PropertyData>();
            for each(_local_12 in _local_9.properts)
            {
               _local_15 = new Vector.<PropertyData>();
               _local_8.push(new ItemGaragePropertyData(this.hiqomodu(_local_12.property),_local_12.value));
               if(_local_12.subproperties != null)
               {
                  for each(_local_16 in _local_12.subproperties)
                  {
                     _local_15.push(new PropertyData(_local_16.value,_local_16.value,this.vebidut(_local_16.property)));
                  }
               }
               else
               {
                  _local_15.push(new PropertyData(_local_12.value,_local_12.value,this.vebidut(_local_12.property)));
               }
               _local_10.push(new GaragePropertyData(new LinearParams(_local_12.value,_local_12.value),0,0,25,_local_15,this.hiqomodu(_local_12.property),0,0,new LinearParams(_local_12.value,_local_12.value)));
            }
            _local_13 = int(_local_9.modificationID);
            _local_14 = this.zumyqysof.createObject(Long.getLong(0,this.myvihyn(_local_9.type) == ItemCategoryEnum.GIVEN_PRESENT ? int(_local_9.present.date + _local_9.previewResourceId) : int(_local_9.previewResourceId)),GameClass(gameTypeRegistry.getClass(Long.getLong(15025,684360))),_local_9.id + "_m" + _local_13);
            Model.object = _local_14;
            _local_3.getModel(_local_14.gameClass.models[0]).putInitParams(new ItemModelCC(15000,_local_9.rank,_local_9.index,ImageResource(_local_4.getResource(Long.getLong(0,_local_9.previewResourceId)))));
            _local_3.getModel(_local_14.gameClass.models[1]).putInitParams(new ItemViewCategoryCC(this.kam(_local_9.category)));
            _local_3.getModel(_local_14.gameClass.models[2]).putInitParams(new ItemCategoryCC(this.myvihyn(_local_9.type)));
            _local_3.getModel(_local_14.gameClass.models[3]).putInitParams(new DescriptionModelCC(_local_9.description,_local_9.name));
            _local_3.getModel(_local_14.gameClass.models[4]).putInitParams(new BuyableCC(true,_local_9.price));
            _local_3.getModel(_local_14.gameClass.models[5]).putInitParams(new ModificationCC(Long.getLong(0,_local_9.baseItemId),_local_9.modificationID == null ? -1 : int(_local_9.modificationID)));
            _local_3.getModel(_local_14.gameClass.models[6]).putInitParams(new ItemPropertiesCC(_local_8));
            _local_3.getModel(_local_14.gameClass.models[7]).putInitParams(new UpgradableParamsCC(null,_local_10));
            _local_3.getModel(_local_14.gameClass.models[8]).putInitParams(new CountableItemCC(_local_9.count == null ? -1 : int(_local_9.count)));
            _local_3.getModel(_local_14.gameClass.models[9]).putInitParams(new Object3DSCC(Long.getLong(0,_local_9.object3ds)));
            if(_local_9.animatedColoring != null)
            {
               _local_3.getModel(_local_14.gameClass.models[10]).putInitParams(new ColoringCC(MultiframeImageResource(_local_4.getResource(Long.getLong(0,_local_9.animatedColoring))),null));
            }
            else
            {
               _local_3.getModel(_local_14.gameClass.models[10]).putInitParams(new ColoringCC(null,ImageResource(_local_4.getResource(Long.getLong(0,_local_9.coloring)))));
            }
            _local_3.getModel(_local_14.gameClass.models[11]).putInitParams(new TemporaryItemCC(0,_local_9.remainingTimeInSec));
            _local_3.getModel(_local_14.gameClass.models[12]).putInitParams(new DiscountCC(_local_9.discount.percent,_local_9.discount.timeLeftInSeconds,0));
            if(this.myvihyn(_local_9.type) == ItemCategoryEnum.GIVEN_PRESENT)
            {
               _local_3.getModel(_local_14.gameClass.models[20]).putInitParams(new PresentItemCC(_local_9.present.date,ImageResource(_local_4.getResource(Long.getLong(0,_local_9.present.image))),_local_9.present.presenter,_local_9.present.text,_local_9.present.presentId));
            }
            ObjectLoadPostListener(_local_3.getModel(_local_14.gameClass.models[12])).objectLoadedPost();
            IObjectLoadListener(_local_3.getModel(_local_14.gameClass.models[8])).objectLoaded();
            if(_local_9.id == "lootbox")
            {
               _local_3.getModel(_local_14.gameClass.models[22]).putInitParams(new LootBoxModelCC());
               LootBoxModel(_local_3.getModel(_local_14.gameClass.models[22])).objectLoaded();
            }
            if(_local_9.id == "gold")
            {
               DroppableGoldItemModel(_local_3.getModel(new DroppableGoldItemModel().id)).putInitParams(new DroppableGoldItemCC(false));
               DroppableGoldItemModel(_local_3.getModel(new DroppableGoldItemModel().id)).objectLoaded();
            }
            if(_local_9.skins != null)
            {
               _local_18 = new Vector.<Object>();
               for each(_local_17 in _local_9.skins)
               {
                  _local_19 = new Object();
                  _local_19.previewResourceId = _local_17.previewResourceId;
                  _local_19.id = _local_17.id;
                  _local_19.name = _local_17.name;
                  _local_19.description = _local_17.description;
                  _local_18.push(_local_19);
                  if(Boolean(_local_17.isMounted))
                  {
                     _local_20 = new MountedSkinCC(_local_19);
                  }
               }
            }
            _local_3.getModel(_local_14.gameClass.models[23]).putInitParams(new AvailableSkinsCC(_local_18));
            _local_3.getModel(_local_14.gameClass.models[24]).putInitParams(_local_20);
            IObjectLoadListener(_local_3.getModel(_local_14.gameClass.models[11])).objectLoaded();
            ObjectLoadPostListener(_local_3.getModel(_local_14.gameClass.models[7])).objectLoadedPost();
            Model.popObject();
            if(this.myvihyn(_local_9.type) == ItemCategoryEnum.GIVEN_PRESENT)
            {
               _local_6.push(_local_14);
            }
            else
            {
               _local_5.push(_local_14);
            }
         }
         this.kisulize.putInitParams(new GarageModelCC(Tanks3DSResource(_local_4.getResource(Long.getLong(0,170001)))));
         this.kisulize.objectLoaded();
         this.kisulize.initDepot(_local_5);
         this.kisulize.jezy(_local_6);
      }
      
      public function mivun(_arg_1:String) : void
      {
         var _local_4:* = undefined;
         var _local_2:Vector.<Long> = new Vector.<Long>();
         _local_2.push(Long.getLong(0,300090008));
         _local_2.push(Long.getLong(0,300090004));
         gameTypeRegistry.createClass(Long.getLong(5823623,5812059),_local_2);
         _local_2 = new Vector.<Long>();
         _local_2.push(Long.getLong(0,300090007));
         _local_2.push(Long.getLong(0,300090003));
         _local_2.push(Long.getLong(0,300090023));
         gameTypeRegistry.createClass(Long.getLong(5823622,5812058),_local_2);
         _local_2 = new Vector.<Long>();
         _local_2.push(Long.getLong(0,300090008));
         _local_2.push(Long.getLong(0,300090028));
         gameTypeRegistry.createClass(Long.getLong(58236221,58120558),_local_2);
         _local_2 = new Vector.<Long>();
         _local_2.push(Long.getLong(0,300090007));
         _local_2.push(Long.getLong(0,300090027));
         _local_2.push(Long.getLong(0,300090023));
         gameTypeRegistry.createClass(Long.getLong(58236223,58120559),_local_2);
         var _local_3:Object = JSON.parse(_arg_1);
         this.funije.objectLoadedPost();
         for each(_local_4 in _local_3.battles)
         {
            this.penyqonul(_local_4);
         }
         this.funije.battleItemsPacketJoinSuccess();
      }
      
      private function zyke(_arg_1:String) : void
      {
         var _local_8:* = undefined;
         var _local_9:BattleCreateCC = null;
         var _local_10:* = undefined;
         var _local_11:IGameObject = null;
         var _local_12:Pawaj = null;
         var _local_13:* = undefined;
         var _local_14:Fucumig = null;
         var _local_2:Object = JSON.parse(_arg_1);
         var _local_3:Vector.<Long> = new Vector.<Long>();
         _local_3.push(Long.getLong(0,300090002));
         _local_3.push(Long.getLong(0,300090011));
         var _local_4:Vector.<Long> = new Vector.<Long>();
         _local_4.push(Long.getLong(0,300090019));
         _local_4.push(Long.getLong(0,300090014));
         var _local_5:GameClass = gameTypeRegistry.createClass(Long.getLong(8238523,63486349),_local_4);
         var _local_6:IGameClass = gameTypeRegistry.createClass(Long.getLong(591359,5235923),_local_3);
         var _local_7:IGameObject = this.nesudomig.createObject(Long.getLong(53152835,6296493246),_local_6,"BattleSelectObject");
         for each(_local_8 in _local_2.maps)
         {
            _local_11 = this.nesudomig.createObject(Long.getLong(_local_8.preview * 1000,_local_8.preview * 1000),_local_5,_local_8.mapId + _local_8.theme);
            _local_12 = new Pawaj();
            _local_12.enabled = _local_8.enabled;
            _local_12.mapId = _local_8.mapId;
            _local_12.mapName = _local_8.mapName;
            _local_12.maxPeople = _local_8.maxPeople;
            _local_12.matchmakingMark = _local_8.matchmakingMark;
            _local_12.preview = ImageResource(resourceRegistry.getResource(Long.getLong(0,_local_8.preview)));
            _local_12.qikybiti = new Nukoki(_local_8.maxRank,_local_8.minRank);
            _local_12.supportedModes = new Vector.<Suvozimi>();
            for each(_local_13 in _local_8.supportedModes)
            {
               _local_12.supportedModes.push(this.muwih(_local_13));
            }
            _local_12.theme = this.rujer(_local_8.theme);
            _local_14 = new Fucumig();
            _local_14.clanLink = _local_8.clanLink;
            _local_14.clanName = _local_8.clanName;
            Model.object = _local_11;
            modelRegistry.getModel(_local_4[0]).putInitParams(_local_12);
            IObjectLoadListener(modelRegistry.getModel(_local_4[0])).objectLoaded();
            modelRegistry.getModel(_local_4[1]).putInitParams(_local_14);
            Model.popObject();
         }
         Model.object = _local_7;
         _local_9 = new BattleCreateCC();
         _local_9.battleCreationDisabled = _local_2.battleCreationDisabled;
         _local_9.battlesLimits = new Vector.<Juva>();
         for each(_local_10 in _local_2.battleLimits)
         {
            _local_9.battlesLimits.push(new Juva(_local_10.scoreLimit,_local_10.timeLimitInSec));
         }
         _local_9.maxRangeLength = _local_2.maxRangeLength;
         modelRegistry.getModel(_local_3[0]).putInitParams(_local_9);
         BattleCreateModel(modelRegistry.getModel(_local_3[0])).objectLoaded();
         BattleCreateModel(modelRegistry.getModel(_local_3[0])).objectLoadedPost();
      }
      
      private function muwih(_arg_1:String) : Suvozimi
      {
         switch(_arg_1)
         {
            case "DM":
               return Suvozimi.DM;
            case "TDM":
               return Suvozimi.TDM;
            case "CTF":
               return Suvozimi.CTF;
            case "CP":
               return Suvozimi.CP;
            case "JGR":
               return Suvozimi.JGR;
            default:
               return Suvozimi.DM;
         }
      }
      
      private function tifojokit(_arg_1:String) : ValidationStatus
      {
         switch(_arg_1)
         {
            case "CORRECT":
               return ValidationStatus.NOT_UNIQUE;
            default:
               return ValidationStatus.FORBIDDEN;
         }
      }
      
      private function rujer(_arg_1:String) : Bycyjoze
      {
         switch(_arg_1)
         {
            case "SUMMER":
               return Bycyjoze.SUMMER;
            case "WINTER":
               return Bycyjoze.WINTER;
            case "SPACE":
               return Bycyjoze.SPACE;
            case "SUMMER_DAY":
               return Bycyjoze.SUMMER_DAY;
            case "EVENING":
               return Bycyjoze.EVENING;
            case "HALLOWEEM":
               return Bycyjoze.HALLOWEEN;
            case "NEWYEAR":
               return Bycyjoze.NEWYEAR;
            case "SUMMER_NIGHT":
               return Bycyjoze.SUMMER_NIGHT;
            case "WINTER_DAY":
               return Bycyjoze.WINTER_DAY;
            default:
               return Bycyjoze.SUMMER;
         }
      }
      
      private function tisa(_arg_1:String) : BattleSuspicionLevel
      {
         switch(_arg_1)
         {
            case "high":
               return BattleSuspicionLevel.HIGH;
            case "low":
               return BattleSuspicionLevel.LOW;
            default:
               return BattleSuspicionLevel.NONE;
         }
      }
      
      private function getLootBoxCategory(_arg_1:String) : LootBoxCategory
      {
         switch(_arg_1)
         {
            case "COMMON":
               return LootBoxCategory.COMMON;
            case "UNCOMMON":
               return LootBoxCategory.UNCOMMON;
            case "RARE":
               return LootBoxCategory.RARE;
            case "EPIC":
               return LootBoxCategory.EPIC;
            case "LEGENDARY":
               return LootBoxCategory.LEGENDARY;
            case "EXOTIC":
               return LootBoxCategory.EXOTIC;
            default:
               return null;
         }
      }
      
      public function pur(_arg_1:String) : void
      {
         var _local_2:Object = JSON.parse(_arg_1);
         var _local_3:ChatMessage = new ChatMessage();
         _local_3.sourceUserStatus = Boolean(_local_2.yellow) ? null : new UserStatus(this.dijolycy(_local_2.chatPermissions),_local_2.sourceUserIp,_local_2.rang,_local_2.name,_local_2.name,_local_2.sourceUserPremium);
         _local_3.system = _local_2.system;
         _local_3.targetUserStatus = Boolean(_local_2.addressed) && !_local_2.yellow ? new UserStatus(this.dijolycy(_local_2.chatPermissionsTo),_local_2.targetUserIp,_local_2.rangTo,_local_2.nameTo,_local_2.nameTo,_local_2.targetUserPremium) : null;
         _local_3.text = _local_2.message;
         _local_3.warning = _local_2.yellow;
         this.chatModel.showMessages(Vector.<ChatMessage>([_local_3]));
      }
      
      public function hovomaluq(_arg_1:String, _arg_2:Boolean) : void
      {
         var _local_3:ChatMessage = new ChatMessage();
         _local_3.system = true;
         _local_3.text = _arg_1;
         _local_3.warning = _arg_2;
         this.chatModel.showMessages(Vector.<ChatMessage>([_local_3]));
      }
      
      public function initPanel(_arg_1:String) : void
      {
         var _local_2:PanelModel = PanelModel(OSGi.getInstance().getService(IPanel));
         var _local_3:Object = JSON.parse(_arg_1);
         var _local_4:UserPropertyCC = new UserPropertyCC();
         _local_4.crystals = _local_3.crystall;
         _local_4.currentRankScore = _local_3.currentRankScore;
         _local_4.daysFromLastVisit = 0;
         _local_4.daysFromRegistration = 0;
         _local_4.durationCrystalAbonement = _local_3.durationCrystalAbonement;
         _local_4.hasDoubleCrystal = _local_3.hasDoubleCrystal;
         _local_4.id = _local_3.name;
         _local_4.nextRankScore = _local_3.next_score;
         _local_4.rank = _local_3.rang;
         _local_4.score = _local_3.score;
         _local_4.uid = _local_3.name;
         _local_4.place = _local_3.place;
         _local_4.rating = _local_3.rating;
         _local_4.userProfileUrl = _local_3.userProfileUrl;
         _local_4.templateBattlePage = "www.vk.com";
         _local_4.serverNumber = 1;
         _local_4.gameHost = "ochko";
         this.userProperties.putInitParams(_local_4);
         _local_2.objectLoaded();
         this.userProperties.objectLoaded();
         this.userProperties.objectLoadedPost();
         _local_2.objectLoadedPost();
         this.qihun.objectLoadedPost();
         if(_local_3.clantag == null)
         {
            _local_2.clantag("");
         }
         else
         {
            _local_2.clantag(_local_3.clantag);
         }
      }
      
      public function updateRating(expRating:int, goldRating:int, cryRating:int) : void
      {
         var _local_2:PanelModel = PanelModel(OSGi.getInstance().getService(IPanel));
         _local_2.updateScoreRating(expRating);
         _local_2.updateGoldsTakenRating(goldRating);
         _local_2.updateCrystalsRating(cryRating);
      }
      
      public function rycuzo() : void
      {
         this.networker = OSGi.getInstance().getService(INetworker) as Network;
         this.networker.addEventListener(this);
         this.networker.addEventListener(new ClansController());
         this.networker.addListener(this.zelupado);
      }
      
      public function kam(_arg_1:String) : ItemViewCategoryEnum
      {
         switch(_arg_1.toLowerCase())
         {
            case "weapon":
               return ItemViewCategoryEnum.WEAPON;
            case "armor":
               return ItemViewCategoryEnum.ARMOR;
            case "resistance":
               return ItemViewCategoryEnum.RESISTANCE;
            case "paint":
               return ItemViewCategoryEnum.PAINT;
            case "inventory":
               return ItemViewCategoryEnum.INVENTORY;
            case "kit":
               return ItemViewCategoryEnum.KIT;
            case "special":
               return ItemViewCategoryEnum.SPECIAL;
            case "given_presents":
               return ItemViewCategoryEnum.GIVEN_PRESENTS;
            default:
               return null;
         }
      }
      
      public function myvihyn(_arg_1:int) : ItemCategoryEnum
      {
         switch(_arg_1)
         {
            case 2:
               return ItemCategoryEnum.ARMOR;
            case 1:
               return ItemCategoryEnum.WEAPON;
            case 3:
               return ItemCategoryEnum.COLOR;
            case 4:
               return ItemCategoryEnum.INVENTORY;
            case 5:
               return ItemCategoryEnum.PLUGIN;
            case 6:
               return ItemCategoryEnum.KIT;
            case 7:
               return ItemCategoryEnum.PRESENT;
            case 8:
               return ItemCategoryEnum.EMBLEM;
            case 9:
               return ItemCategoryEnum.GIVEN_PRESENT;
            case 10:
               return ItemCategoryEnum.RESISTANCE_MODULE;
            case 11:
               return ItemCategoryEnum.LOOT_BOX;
            default:
               return null;
         }
      }
   }
}

