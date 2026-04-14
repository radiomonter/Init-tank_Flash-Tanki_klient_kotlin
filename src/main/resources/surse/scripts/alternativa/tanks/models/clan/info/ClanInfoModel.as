package alternativa.tanks.models.clan.info
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.models.panel.create.ClanCreateService;
   import alternativa.tanks.models.service.ClanService;
   import alternativa.tanks.models.service.ClanServiceEvent;
   import alternativa.tanks.models.service.ClanServiceUpdateEvent;
   import flash.events.Event;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.clans.clan.clanflag.ClanFlag;
   import projects.tanks.client.clans.clan.info.ClanInfoCC;
   import projects.tanks.client.clans.clan.info.ClanInfoModelBase;
   import projects.tanks.client.clans.clan.info.IClanInfoModelBase;
   import projects.tanks.clients.flash.commons.services.datetime.DateFormatter;
   
   [ModelInfo]
   public class ClanInfoModel extends ClanInfoModelBase implements IClanInfoModelBase, IClanInfoModel, ObjectLoadListener, ObjectUnloadListener
   {
      
      [Inject]
      public static var clanService:ClanService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var createClanService:ClanCreateService;
      
      private var description:String;
      
      public function ClanInfoModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         clanService.addEventListener(ClanServiceUpdateEvent.UPDATE,getFunctionWrapper(this.onUpdateInfo));
         var _local_1:ClanInfoCC = getInitParam();
         var _local_2:Date = new Date(_local_1.createTime);
         clanService.clanMembers = _local_1.users.concat();
         clanService.name = _local_1.name;
         clanService.tag = _local_1.tag;
         clanService.minRankForRequest = _local_1.minRankForAddClan;
         clanService.creatorId = _local_1.creatorId;
         clanService.creationDate = DateFormatter.formatDateToLocalized(_local_2);
         clanService.isSelf = _local_1.self;
         putData(Boolean,_local_1.blocked);
         putData(String,_local_1.reasonForBlocking);
         clanService.isBlocked = _local_1.blocked;
         clanService.requestsEnabled = _local_1.incomingRequestEnabled;
         clanService.maxCharactersDescription = _local_1.maxCharactersDescription;
         this.description = _local_1.description;
         clanService.addEventListener(ClanServiceEvent.CLAN_BLOCK,getFunctionWrapper(this.onBlockClan));
         ClanInfoDelayed.getInstance().dispatchEvent(new Event(ClanInfoDelayed.EVENT_PREFIX + object.id.toString()));
      }
      
      private function onBlockClan(_arg_1:ClanServiceEvent) : void
      {
         putData(Boolean,true);
         putData(String,_arg_1.reasonBlock);
      }
      
      public function getDescription() : String
      {
         var _local_1:Object = getData(Boolean);
         if(Boolean(_local_1))
         {
            return String(getData(String));
         }
         if(this.description != null)
         {
            return this.description;
         }
         return "";
      }
      
      public function getCreatorId() : String
      {
         return getInitParam().creatorId;
      }
      
      public function getCreateTime() : String
      {
         return getInitParam().createTime;
      }
      
      public function getUsersCount() : int
      {
         return getInitParam().users.length;
      }
      
      private function onUpdateInfo(_arg_1:ClanServiceUpdateEvent) : void
      {
         this.description = _arg_1.description;
         server.updateDescription(_arg_1.description);
         server.changeFlag(_arg_1.flag.id);
         server.changeMinRankForAddClan(_arg_1.rankIndex);
         server.incomingRequestEnable(_arg_1.incomingRequestsEnabled);
      }
      
      public function objectUnloaded() : void
      {
         clanService.unloadMembers();
         clanService.isSelf = false;
         clanService.removeEventListener(ClanServiceUpdateEvent.UPDATE,getFunctionWrapper(this.onUpdateInfo));
         clanService.removeEventListener(ClanServiceEvent.CLAN_BLOCK,getFunctionWrapper(this.onBlockClan));
      }
      
      public function getClanName() : String
      {
         return getInitParam().name;
      }
      
      public function getClanTag() : String
      {
         return getInitParam().tag;
      }
      
      public function getClanFlag() : ClanFlag
      {
         var _local_2:ClanFlag = null;
         var _local_1:int = 0;
         while(_local_1 < createClanService.flags.length)
         {
            _local_2 = createClanService.flags[_local_1];
            if(getInitParam().flagId == _local_2.id)
            {
               return _local_2;
            }
            _local_1++;
         }
         return createClanService.defaultFlag;
      }
      
      public function incomingRequestEnabled() : Boolean
      {
         return getInitParam().incomingRequestEnabled;
      }
      
      public function getRankIndexForAddClan() : int
      {
         return getInitParam().minRankForAddClan;
      }
   }
}

