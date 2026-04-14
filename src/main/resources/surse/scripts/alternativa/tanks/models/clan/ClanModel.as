package alternativa.tanks.models.clan
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.clanmanagement.ClanPermissionsManager;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.ISearchInput;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.ISourceData;
   import alternativa.tanks.models.service.ClanService;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.clans.clan.ClanModelBase;
   import projects.tanks.client.clans.clan.IClanModelBase;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanUserInfoService;
   
   [ModelInfo]
   public class ClanModel extends ClanModelBase implements IClanModelBase, IClanModel, ISourceData, ObjectUnloadListener, ObjectLoadPostListener
   {
      
      [Inject]
      public static var clanService:ClanService;
      
      [Inject]
      public static var clanUserInfoService:ClanUserInfoService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public static const USER_NAME_PATTERN:String = "%USERNAME%";
      
      private var _searchInput:ISearchInput;
      
      public function ClanModel()
      {
         super();
      }
      
      public function objectLoadedPost() : void
      {
         clanService.clanObject = object;
      }
      
      public function alreadyInAccepted(_arg_1:String) : void
      {
         var _local_2:String = null;
         if(this._searchInput != null)
         {
            _local_2 = localeService.getText(TanksLocale.TEXT_CLAN_PLAYER_IS_CLAN_MAMBER);
            _local_2 = _local_2.replace(USER_NAME_PATTERN,_arg_1);
            this._searchInput.onAlreadyInAccepted(_local_2);
         }
      }
      
      public function alreadyInClanIncoming(_arg_1:String, _arg_2:String) : void
      {
         var _local_3:String = null;
         if(this._searchInput != null)
         {
            _local_3 = localeService.getText(TanksLocale.TEXT_CLAN_PLAYER_IS_REQUEST_LIST);
            _local_3 = _local_3.replace(USER_NAME_PATTERN,_arg_1);
            this._searchInput.onAlreadyInIncoming(_arg_2,_local_3);
         }
      }
      
      public function alreadyInClanOutgoing(_arg_1:String) : void
      {
         var _local_2:String = null;
         if(this._searchInput != null)
         {
            _local_2 = localeService.getText(TanksLocale.TEXT_CLAN_PLAYER_IS_INVITE_LIST);
            _local_2 = _local_2.replace(USER_NAME_PATTERN,_arg_1);
            this._searchInput.onAlreadyInOutgoing(_local_2);
         }
      }
      
      public function alreadyInClan(_arg_1:String) : void
      {
         var _local_2:String = null;
         if(clanService.clanManagementPanel != null)
         {
            _local_2 = localeService.getText(TanksLocale.TEXT_CLAN_PLAYER_ALREADY_IN_CLAN);
            _local_2 = _local_2.replace(USER_NAME_PATTERN,_arg_1);
            this._searchInput.onAlreadyInClan(_local_2);
         }
      }
      
      public function alreadyInUserOutgoing(_arg_1:String, _arg_2:String) : void
      {
      }
      
      public function maxMembers() : void
      {
         clanService.maxMembers();
      }
      
      public function userLowRank() : void
      {
         var _local_1:String = localeService.getText(TanksLocale.TEXT_CLAN_PLAYER_RANK_TOO_LOW);
         this._searchInput.onUserLowRank(_local_1);
      }
      
      public function userExist() : void
      {
         if(this._searchInput != null)
         {
            this._searchInput.onUidExist();
         }
      }
      
      public function userNotExist() : void
      {
         if(this._searchInput != null)
         {
            this._searchInput.onUidNotExist();
         }
      }
      
      public function accept(_arg_1:String) : void
      {
         this.acceptRequest(_arg_1);
      }
      
      public function addByUid(_arg_1:String) : void
      {
         server.addInClanByUid(_arg_1);
      }
      
      public function addClanMember(_arg_1:String) : void
      {
         server.add(_arg_1);
      }
      
      public function excludeClanMember(_arg_1:String) : void
      {
         server.removeUserFromClan(_arg_1);
      }
      
      public function inviteByUid(_arg_1:String) : void
      {
         server.addInClanByUid(_arg_1);
      }
      
      public function revokeRequest(_arg_1:String) : void
      {
         server.revoke(_arg_1);
      }
      
      public function acceptRequest(_arg_1:String) : void
      {
         server.accept(_arg_1);
      }
      
      public function rejectRequest(_arg_1:String) : void
      {
         server.reject(_arg_1);
      }
      
      public function rejectAllRequests() : void
      {
         server.rejectAll();
      }
      
      public function checkUid(_arg_1:String) : void
      {
         server.checkUid(_arg_1);
      }
      
      public function leaveClan() : void
      {
         server.userLeavesClan();
      }
      
      public function objectUnloaded() : void
      {
         ClanPermissionsManager.removePositionListeners();
         clanService.objectUnloaded();
      }
      
      public function setSearchInput(_arg_1:ISearchInput) : void
      {
         this._searchInput = _arg_1;
      }
   }
}

