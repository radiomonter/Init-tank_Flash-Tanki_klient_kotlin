package alternativa.tanks.models.user
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.ISearchInput;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.ISourceData;
   import alternativa.tanks.models.service.ClanService;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.clans.user.ClanUserModelBase;
   import projects.tanks.client.clans.user.IClanUserModelBase;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   [ModelInfo]
   public class ClanUserModel extends ClanUserModelBase implements IClanUserModelBase, IClanUserModel, ObjectLoadListener, ObjectLoadPostListener, ISourceData
   {
      
      [Inject]
      public static var clanUserService:ClanUserService;
      
      [Inject]
      public static var clanService:ClanService;
      
      [Inject]
      public static var clanUserInfoService:ClanUserInfoService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const CLAN_NAME_PATTERN:String = "%CLANNAME%";
      
      private var _searchInput:ISearchInput;
      
      public function ClanUserModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         if(!getInitParam().loadingInServiceSpace)
         {
            return;
         }
         clanUserService.userObject = object;
         clanUserInfoService.restrictionTime = getInitParam().restrictionTimeJoinClanInSec;
         clanUserInfoService.clanMember = getInitParam().clan;
         clanUserInfoService.giveBonusesClan = getInitParam().giveBonusesClan;
         clanUserService.otherClan = getInitParam().showOtherClan;
         clanUserService.showBuyLicenseButton = getInitParam().showBuyLicenseButton;
      }
      
      public function loadingInServiceSpace() : Boolean
      {
         return getInitParam().loadingInServiceSpace;
      }
      
      public function objectLoadedPost() : void
      {
         clanUserInfoService.selfClan = !getInitParam().showOtherClan;
         if(!getInitParam().loadingInServiceSpace)
         {
            return;
         }
      }
      
      public function leftClan(_arg_1:int) : void
      {
         clanUserInfoService.clanMember = false;
         if(clanService.clanManagementPanel != null)
         {
            clanService.clanManagementPanel.destroy();
         }
         clanUserInfoService.restrictionTime = _arg_1;
      }
      
      public function alreadyInAccepted(_arg_1:String) : void
      {
      }
      
      public function rejectAll() : void
      {
         server.rejectAll();
      }
      
      public function revoke(_arg_1:IGameObject) : void
      {
         server.revoke(_arg_1);
      }
      
      public function reject(_arg_1:IGameObject) : void
      {
         server.reject(_arg_1);
      }
      
      public function addInClan(_arg_1:IGameObject) : void
      {
         server.add(_arg_1);
      }
      
      public function acceptRequest(_arg_1:IGameObject) : void
      {
         server.accept(_arg_1);
      }
      
      public function accept(_arg_1:String) : void
      {
      }
      
      public function addByUid(_arg_1:String) : void
      {
         server.addInClanByName(_arg_1);
      }
      
      public function checkUid(_arg_1:String) : void
      {
         server.checkClanName(_arg_1);
      }
      
      public function setSearchInput(_arg_1:ISearchInput) : void
      {
         this._searchInput = _arg_1;
      }
      
      public function clanExist() : void
      {
         this._searchInput.onUidExist();
      }
      
      public function clanNotExist() : void
      {
         this._searchInput.onUidNotExist();
      }
      
      public function userLowRank() : void
      {
         var _local_1:String = localeService.getText(TanksLocale.TEXT_CLAN_YOUR_RANK_TOO_LOW);
         this._searchInput.onUserLowRank(_local_1);
      }
      
      public function clanBlocked() : void
      {
         var _local_1:String = localeService.getText(TanksLocale.TEXT_CLAN_BLOCK);
         this._searchInput.clanBlocked(_local_1);
      }
      
      public function clanIncomingRequestDisabled() : void
      {
         var _local_1:String = localeService.getText(TanksLocale.TEXT_CLAN_DOES_NOT_ACDEPT_REQUEST);
         this._searchInput.incomingRequestDisabled(_local_1);
      }
      
      public function alreadyInIncoming(_arg_1:String, _arg_2:IGameObject) : void
      {
         var _local_3:String = localeService.getText(TanksLocale.TEXT_CLAN_IS_ALREADY_IN_INVITE_LIST);
         _local_3 = _local_3.replace(CLAN_NAME_PATTERN,_arg_1);
         this._searchInput.onAlreadyInIncoming(_arg_1,_local_3);
      }
      
      public function alreadyInOutgoing(_arg_1:String) : void
      {
         var _local_2:String = localeService.getText(TanksLocale.TEXT_CLAN_IS_ALREADY_IN_REQUEST_LIST);
         _local_2 = _local_2.replace(CLAN_NAME_PATTERN,_arg_1);
         this._searchInput.onAlreadyInOutgoing(_local_2);
      }
      
      public function acceptedIntoClan(_arg_1:IGameObject) : void
      {
      }
      
      public function creatorLeaveOfClanIfEmptyClan() : void
      {
      }
      
      public function alreadyInClan() : void
      {
         var _local_1:String = localeService.getText(TanksLocale.TEXT_CLAN_YOU_ALREADY_IN_CLAN);
         this._searchInput.onAlreadyInClan(_local_1);
      }
      
      public function alreadyInClanOutgoing(_arg_1:String, _arg_2:IGameObject) : void
      {
         var _local_3:String = localeService.getText(TanksLocale.TEXT_CLAN_IS_ALREADY_IN_REQUEST_LIST);
         _local_3 = _local_3.replace(CLAN_NAME_PATTERN,_arg_1);
         this._searchInput.onAlreadyInOutgoing(_local_3);
      }
      
      public function joinClan() : void
      {
         if(clanService.notInClanPanel != null)
         {
            clanService.notInClanPanel.destroy();
         }
         clanUserInfoService.clanMember = true;
      }
      
      public function removeClanBonuses() : void
      {
         clanUserInfoService.giveBonusesClan = false;
      }
      
      public function updateStatusBonusesClan(_arg_1:Boolean) : void
      {
         clanUserInfoService.giveBonusesClan = _arg_1;
      }
      
      public function showAlertFullClan() : void
      {
         clanService.notInClanPanel.showAlertFullClan();
      }
   }
}

