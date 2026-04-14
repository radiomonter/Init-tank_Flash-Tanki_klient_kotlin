package alternativa.tanks.models.service
{
   import alternativa.tanks.service.clan.ClanFriendsService;
   import flash.events.EventDispatcher;
   
   public class ClanFriendsServiceImpl extends EventDispatcher implements ClanFriendsService
   {
      
      private var _clanMembers:Vector.<String>;
      
      public function ClanFriendsServiceImpl()
      {
         super();
      }
      
      public function get clanMembers() : Vector.<String>
      {
         return this._clanMembers;
      }
      
      public function set clanMembers(_arg_1:Vector.<String>) : void
      {
         this._clanMembers = _arg_1;
      }
   }
}

