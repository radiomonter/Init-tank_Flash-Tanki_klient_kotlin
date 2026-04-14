package projects.tanks.clients.fp10.libraries.tanksservices.service.clan
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import projects.tanks.client.clans.clan.permissions.ClanAction;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class ClanUserInfoServiceImpl extends EventDispatcher implements ClanUserInfoService
   {
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private var userClanInfos:Dictionary = new Dictionary();
      
      private var updateClanButtonFunction:Function;
      
      private var _actions:Vector.<ClanAction>;
      
      private var _restrictionTime:int;
      
      private var _selfClan:Boolean;
      
      private var _clanMember:Boolean;
      
      private var _initRestrictionTimer:int;
      
      private var _giveBonusesClan:Boolean;
      
      public function ClanUserInfoServiceImpl()
      {
         super();
      }
      
      public function updateUserClanInfo(_arg_1:UserClanInfo) : void
      {
         this.userClanInfos[_arg_1.userId] = _arg_1;
      }
      
      public function userClanInfoByUserId(_arg_1:String) : UserClanInfo
      {
         return _arg_1 in this.userClanInfos ? this.userClanInfos[_arg_1] : null;
      }
      
      public function get updateFriendsClanButtonFunction() : Function
      {
         return this.updateClanButtonFunction;
      }
      
      public function set updateFriendsClanButtonFunction(_arg_1:Function) : void
      {
         this.updateClanButtonFunction = _arg_1;
      }
      
      public function hasAction(_arg_1:ClanAction) : Boolean
      {
         var _local_2:ClanAction = null;
         for each(_local_2 in this.actions)
         {
            if(_local_2.value == _arg_1.value)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get actions() : Vector.<ClanAction>
      {
         return this._actions;
      }
      
      public function set actions(_arg_1:Vector.<ClanAction>) : void
      {
         this._actions = _arg_1;
      }
      
      public function inSameClan(_arg_1:String) : Boolean
      {
         var _local_4:String = null;
         var _local_5:String = null;
         var _local_2:UserClanInfo = this.userClanInfoByUserId(_arg_1);
         var _local_3:UserClanInfo = this.userClanInfoByUserId(userPropertiesService.userId);
         if(!_local_3.isInClan)
         {
            return false;
         }
         if(_local_2 != null && _local_3 != null)
         {
            _local_4 = _local_2.clanId;
            _local_5 = _local_3.clanId;
            return _local_4 == _local_5;
         }
         return false;
      }
      
      public function get restrictionTime() : int
      {
         return this._restrictionTime - (getTimer() - this._initRestrictionTimer) / 1000;
      }
      
      public function set restrictionTime(_arg_1:int) : void
      {
         this._restrictionTime = _arg_1;
         this._initRestrictionTimer = getTimer();
         if(this._restrictionTime > 0)
         {
            setTimeout(this.scheduleRestrictionTime,this._restrictionTime * 1000);
         }
      }
      
      private function scheduleRestrictionTime() : void
      {
         dispatchEvent(new RestrictionJoinClanEvent(RestrictionJoinClanEvent.UPDATE));
      }
      
      public function get selfClan() : Boolean
      {
         return this._selfClan;
      }
      
      public function set selfClan(_arg_1:Boolean) : void
      {
         this._selfClan = _arg_1;
      }
      
      public function get clanMember() : Boolean
      {
         return this._clanMember;
      }
      
      public function set clanMember(_arg_1:Boolean) : void
      {
         this._clanMember = _arg_1;
      }
      
      public function get giveBonusesClan() : Boolean
      {
         return this._giveBonusesClan;
      }
      
      public function set giveBonusesClan(_arg_1:Boolean) : void
      {
         this._giveBonusesClan = _arg_1;
         dispatchEvent(new ClanUserInfoEvent(ClanUserInfoEvent.UPDATE_GIVE_BONUSES_CLAN));
      }
      
      public function onLeaveClan() : void
      {
         dispatchEvent(new ClanUserInfoEvent(ClanUserInfoEvent.ON_LEAVE_CLAN));
      }
      
      public function onJoinClan() : void
      {
         dispatchEvent(new ClanUserInfoEvent(ClanUserInfoEvent.ON_JOIN_CLAN));
      }
   }
}

