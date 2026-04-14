package alternativa.tanks.service.clan
{
   import flash.events.IEventDispatcher;
   
   public interface ClanFriendsService extends IEventDispatcher
   {
      
      function get clanMembers() : Vector.<String>;
      
      function set clanMembers(param1:Vector.<String>) : void;
   }
}

