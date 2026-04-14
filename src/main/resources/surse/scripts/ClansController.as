package
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.notinclan.clanslist.ClansListEvent;
   import alternativa.tanks.models.foreignclan.ForeignClanModel;
   import alternativa.tanks.models.license.LicenseClanUserModel;
   import alternativa.tanks.models.panel.create.ClanCreateModel;
   import alternativa.tanks.models.panel.create.ClanCreateService;
   import alternativa.tanks.models.user.ClanUserLoaderModel;
   import alternativa.tanks.models.user.ClanUserService;
   import alternativa.types.Long;
   import fominskiy.networking.INetworkListener;
   import fominskiy.networking.commands.Command;
   import fominskiy.networking.commands.Type;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.GameTypeRegistry;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.registry.SpaceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import platform.client.fp10.core.type.impl.Space;
   import projects.tanks.client.clans.clan.clanflag.ClanFlag;
   import projects.tanks.client.clans.clan.clanmembersdata.UserData;
   import projects.tanks.client.clans.clan.permissions.ClanPermission;
   import projects.tanks.client.clans.panel.foreignclan.ForeignClanData;
   import projects.tanks.client.clans.user.ClanUserCC;
   import projects.tanks.client.clans.user.IClanUserModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanUserInfoService;
   
   public class ClansController implements INetworkListener
   {
      
      public static var resourceRegistry:ResourceRegistry = OSGi.getInstance().getService(ResourceRegistry) as ResourceRegistry;
      
      public static var spaceRegistry:SpaceRegistry = OSGi.getInstance().getService(SpaceRegistry) as SpaceRegistry;
      
      public static var gameTypeRegistry:GameTypeRegistry = OSGi.getInstance().getService(GameTypeRegistry) as GameTypeRegistry;
      
      public static var modelRegistry:ModelRegistry = OSGi.getInstance().getService(ModelRegistry) as ModelRegistry;
      
      private var space:ISpace;
      
      private var clanObject:IGameObject;
      
      public function ClansController()
      {
         super();
         this.space = new Space(Long.getLong(9253410,6243295),null,null,false);
         spaceRegistry.addSpace(this.space);
         var _local_1:Vector.<Long> = new Vector.<Long>();
         _local_1.push(Long.getLong(259670316,1522052296));
         this.clanObject = this.space.createObject(Long.getLong(0,635839),gameTypeRegistry.createClass(Long.getLong(0,410352),_local_1),"ClanObject");
      }
      
      public function onData(_arg_1:Command) : void
      {
         var _local_1:Vector.<ClanFlag> = null;
         var _local_2:Vector.<Long> = null;
         var _local_3:Object = null;
         var _local_4:ClanUserCC = null;
         var _local_5:ClanUserLoaderModel = null;
         var _local_6:Object = null;
         switch(_arg_1.type)
         {
            case Type.CLAN:
               if(_arg_1.args[0] == "init")
               {
                  _local_3 = JSON.parse(_arg_1.args[1]);
                  _local_4 = new ClanUserCC(_local_3.clan,_local_3.giveBonusesClan,_local_3.loadingInServiceSpace,_local_3.restrictionTimeJoinClanInSec,_local_3.showBuyLicenseButton,_local_3.showOtherClan);
                  ClanUserInfoService(OSGi.getInstance().getService(ClanUserInfoService)).clanMember = _local_3.clanMember;
                  _local_1 = new Vector.<ClanFlag>();
                  for each(_local_6 in _local_3.flags)
                  {
                     _local_1.push(new ClanFlag(ImageResource(resourceRegistry.getResource(Long.getLong(0,_local_6.image))),Long.getLong(0,_local_6.id),_local_6.lang));
                  }
                  ClanCreateService(OSGi.getInstance().getService(ClanCreateService)).flags = _local_1;
                  _local_2 = new Vector.<Long>();
                  _local_2.push(Long.getLong(259670316,1522052296));
                  _local_2.push(Long.getLong(205268203,-139952058));
                  _local_2.push(Long.getLong(1120804751,-1974844538));
                  _local_2.push(Long.getLong(471234096,-1683897946));
                  ClanUserService(OSGi.getInstance().getService(ClanUserService)).userObject = this.space.createObject(Long.getLong(0,31835),gameTypeRegistry.createClass(Long.getLong(0,23845),_local_2),"UserObject");
                  Model.object = this.clanObject;
                  modelRegistry.getModel(this.clanObject.gameClass.models[0]).putInitParams(_local_4);
                  ClanCreateModel(modelRegistry.getModel(new ClanCreateModel().id)).objectLoaded();
                  _local_5 = ClanUserLoaderModel(modelRegistry.getModel(Long.getLong(1420566941,-260091189)));
                  ObjectLoadPostListener(_local_5).objectLoadedPost();
               }
               else if(_arg_1.args[0] == "showNotInClan")
               {
                  _local_5 = ClanUserLoaderModel(modelRegistry.getModel(Long.getLong(1420566941,-260091189)));
                  _local_5.showWindow();
               }
               else if(_arg_1.args[0] == "clanExist")
               {
                  IClanUserModelBase(modelRegistry.getModel(Long.getLong(259670316,1522052296))).clanExist();
               }
               else if(_arg_1.args[0] == "clanNotExist")
               {
                  IClanUserModelBase(modelRegistry.getModel(Long.getLong(259670316,1522052296))).clanNotExist();
               }
               else if(_arg_1.args[0] == "clanTagNotExist")
               {
                  ClanCreateService(OSGi.getInstance().getService(ClanCreateService)).correctTag();
               }
               else if(_arg_1.args[0] == "clanTagExist")
               {
                  ClanCreateService(OSGi.getInstance().getService(ClanCreateService)).incorrectTag();
               }
               else if(_arg_1.args[0] == "clanNameNotExist")
               {
                  ClanCreateService(OSGi.getInstance().getService(ClanCreateService)).correctName();
               }
               else if(_arg_1.args[0] == "clanNameExist")
               {
                  ClanCreateService(OSGi.getInstance().getService(ClanCreateService)).incorrectName();
               }
               else if(_arg_1.args[0] == "showForeignClan")
               {
                  ForeignClanModel(modelRegistry.getModel(new ForeignClanModel().id)).showForeignClan(new ForeignClanData(false,Long.getLong(999,999),_arg_1.args[1],_arg_1.args[2],Long.getLong(0,1),false,999,true,1,_arg_1.args[3],"",false,false,_arg_1.args[4],Long.getLong(0,0),Vector.<UserData>([new UserData(1,1,1,Long.getLong(0,1),ClanPermission.VETERAN,1,"test")])));
               }
               else if(_arg_1.args[0] == "addClanLicense")
               {
                  LicenseClanUserModel(modelRegistry.getModel(new LicenseClanUserModel().id)).addClanLicense();
               }
               else if(_arg_1.args[0] == "removeClanLicense")
               {
                  LicenseClanUserModel(modelRegistry.getModel(new LicenseClanUserModel().id)).removeClanLicense();
               }
               else if(_arg_1.args[0] == "addInClan")
               {
                  ClansListEvent.getDispatcher().dispatchEvent(new ClansListEvent(ClansListEvent.INCOMING + ClansListEvent.ADD,_arg_1.args[1]));
               }
               return;
            default:
               return;
         }
      }
   }
}

