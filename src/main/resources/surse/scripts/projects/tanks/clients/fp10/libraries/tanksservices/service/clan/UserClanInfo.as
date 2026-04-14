package projects.tanks.clients.fp10.libraries.tanksservices.service.clan
{
   import projects.tanks.client.clans.clan.permissions.ClanAction;
   import projects.tanks.client.clans.notifier.ClanNotifierData;
   
   public class UserClanInfo
   {
      
      public var userId:String;
      
      public var isInClan:Boolean;
      
      public var clanId:String;
      
      public var clanName:String;
      
      public var clanTag:String;
      
      public var clanActions:Vector.<ClanAction>;
      
      public var clanUserIncoming:Vector.<String>;
      
      public var clanUserOutgoing:Vector.<String>;
      
      public var minRankForJoinClan:int;
      
      public function UserClanInfo(_arg_1:ClanNotifierData)
      {
         super();
         this.userId = _arg_1.userId;
         this.isInClan = _arg_1.clanMember;
         this.clanId = _arg_1.clanId;
         this.clanName = _arg_1.clanName;
         this.clanTag = _arg_1.clanTag;
         this.clanActions = _arg_1.clanAction;
         this.clanUserIncoming = _arg_1.clanIncoming;
         this.clanUserOutgoing = _arg_1.clanOutgoing;
         this.minRankForJoinClan = _arg_1.minRankForJoinClan;
      }
   }
}

