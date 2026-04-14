package alternativa.tanks.models.clan.clanfriends
{
   import alternativa.tanks.models.user.IClanUserModel;
   import alternativa.tanks.service.clan.ClanFriendsService;
   import alternativa.tanks.service.clan.ClanMembersListEvent;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.clans.clan.clanfriends.ClanFriendsModelBase;
   import projects.tanks.client.clans.clan.clanfriends.IClanFriendsModelBase;
   
   [ModelInfo]
   public class ClanFriendsModel extends ClanFriendsModelBase implements IClanFriendsModelBase, ObjectLoadListener, ObjectUnloadListener
   {
      
      [Inject]
      public static var clanFriendsService:ClanFriendsService;
      
      public function ClanFriendsModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         clanFriendsService.clanMembers = getInitParam().users.concat();
      }
      
      public function onUserAdd(_arg_1:String) : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         clanFriendsService.clanMembers.push(_arg_1);
         clanFriendsService.dispatchEvent(new ClanMembersListEvent(ClanMembersListEvent.ACCEPTED_USER,_arg_1));
      }
      
      public function onUserRemove(_arg_1:String) : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         var _local_2:int = clanFriendsService.clanMembers.indexOf(_arg_1);
         if(_local_2 >= 0)
         {
            clanFriendsService.clanMembers.splice(_local_2,1);
            clanFriendsService.dispatchEvent(new ClanMembersListEvent(ClanMembersListEvent.REMOVE_USER,_arg_1));
         }
      }
      
      public function userJoinClan(_arg_1:Vector.<String>) : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         clanFriendsService.clanMembers = _arg_1.concat();
      }
      
      public function objectUnloaded() : void
      {
         if(!this.isServiceSpace())
         {
            return;
         }
         clanFriendsService.clanMembers = null;
      }
      
      private function isServiceSpace() : Boolean
      {
         return IClanUserModel(object.adapt(IClanUserModel)).loadingInServiceSpace();
      }
   }
}

